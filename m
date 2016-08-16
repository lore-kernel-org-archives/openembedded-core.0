Return-Path: <henry.bruce@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2F2B773163
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 00:25:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Aug 2016 17:25:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,527,1464678000"; d="scan'208";a="1036102709"
Received: from hbruce-desk3.jf.intel.com ([10.7.198.166])
	by orsmga002.jf.intel.com with ESMTP; 15 Aug 2016 17:25:17 -0700
From: Henry Bruce <henry.bruce@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2016 17:25:15 -0700
Message-Id: <1471307115-15540-1-git-send-email-henry.bruce@intel.com>
X-Mailer: git-send-email 2.4.11
Subject: [krogoth][PATCH v2] npm: npm.bbclass now adds nodejs to RDEPENDS
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
X-List-Received-Date: Tue, 16 Aug 2016 00:25:21 -0000

We expect that any package that uses the npm bbclass
will have a runtime dependency on node.js

Signed-off-by: Henry Bruce <henry.bruce@intel.com>
---
 meta/classes/npm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 95be751..55c7c3e 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -1,4 +1,5 @@
 DEPENDS_prepend = "nodejs-native "
+RDEPENDS_${PN}_prepend = "nodejs "
 S = "${WORKDIR}/npmpkg"
 
 NPM_INSTALLDIR = "${D}${libdir}/node_modules/${PN}"
-- 
2.4.11


