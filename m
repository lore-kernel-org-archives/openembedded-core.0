Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 62E62739CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 19:58:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 12 Mar 2015 12:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,390,1422950400"; d="scan'208";a="540125342"
Received: from urpatil-mobl2.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.75.29])
	by orsmga003.jf.intel.com with ESMTP; 12 Mar 2015 12:57:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2015 12:58:17 -0700
Message-Id: <1426190297-17376-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] unzip: Add ALTERNATIVE configuration
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
X-List-Received-Date: Thu, 12 Mar 2015 19:58:19 -0000

Since busybox also provides the unzip command use the update-alternatives
mechanism to address this.

[YOCTO #7446]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/unzip/unzip_6.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 33c20f8..e203c06 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -35,4 +35,11 @@ do_install() {
 	rmdir ${D}${prefix}/man/
 }
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN} = "unzip"
+ALTERNATIVE_LINK_NAME[unzip] = "${bindir}/unzip"
+
 BBCLASSEXTEND = "native"
-- 
2.1.0


