Return-Path: <henry.bruce@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2E66FFE8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 22:15:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 10 Aug 2016 15:15:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,502,1464678000"; d="scan'208";a="863330591"
Received: from hbruce-desk3.jf.intel.com ([10.7.198.166])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2016 15:15:45 -0700
From: Henry Bruce <henry.bruce@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2016 15:15:41 -0700
Message-Id: <1470867341-12828-1-git-send-email-henry.bruce@intel.com>
X-Mailer: git-send-email 2.4.11
Subject: [PATCH] npm: npm.bbclass now adds nodejs to RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Aug 2016 22:15:44 -0000

We expect that any package that uses the npm bbclass
will have a runtime dependency on node.js

Signed-off-by: Henry Bruce <henry.bruce@intel.com>
---
 meta/classes/npm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 95be751..541fd3b 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -1,4 +1,5 @@
 DEPENDS_prepend = "nodejs-native "
+RDEPENDS_${PN}_prepend += "nodejs "
 S = "${WORKDIR}/npmpkg"
 
 NPM_INSTALLDIR = "${D}${libdir}/node_modules/${PN}"
-- 
2.4.11


