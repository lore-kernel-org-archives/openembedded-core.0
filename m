Return-Path: <sgw@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 88B977199E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 22:17:43 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 19 Apr 2017 15:17:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,222,1488873600"; d="scan'208";a="89914506"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.100.124])
	by orsmga005.jf.intel.com with ESMTP; 19 Apr 2017 15:17:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 19 Apr 2017 15:17:42 -0700
Message-Id: <1492640262-18359-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] sstate: Ensure PACKAGE_EXTRA_ARCHS are part of SSTATE_ARCHS
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
X-List-Received-Date: Wed, 19 Apr 2017 22:17:45 -0000

Since BSPs also define package archs that are included in PACKAGE_EXTRA_ARCHS
we should also enure they are accounted for in SSTATE_ARCH.

This helps with the license manifest issue in some cases.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/sstate.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index e50a385..614c3a0 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -45,6 +45,7 @@ SSTATE_ARCHS = " \
     ${SDK_ARCH}_${PACKAGE_ARCH} \
     allarch \
     ${PACKAGE_ARCH} \
+    ${PACKAGE_EXTRA_ARCHS} \
     ${MACHINE}"
 
 SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
-- 
2.7.4


