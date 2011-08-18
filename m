Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qtyer-0000It-Ie
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 11:13:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Aug 2011 02:08:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="38976214"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 18 Aug 2011 02:08:20 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 17:08:58 +0800
Message-Id: <f66103526b95933672cd3a293333cd86b8152777.1313658393.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1313658393.git.dongxiao.xu@intel.com>
References: <cover.1313658393.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1313658393.git.dongxiao.xu@intel.com>
References: <cover.1313658393.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/5] ea-acl: Use BPN instead of PN for style like lib${PN}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Aug 2011 09:13:01 -0000

When supporting multilib, ${PN} will be extended with MLPREFIX. However
if a package name contains ${PN} with styles like lib${PN}, such
extension will cause error. Use BPN in this case.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-support/attr/ea-acl.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 4e79421..2ef1389 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -18,9 +18,9 @@ do_install () {
 
 PACKAGES =+ "lib${BPN} lib${BPN}-dev lib${BPN}-doc"
 
-FILES_lib${PN} = "${base_libdir}/lib*.so.*"
+FILES_lib${BPN} = "${base_libdir}/lib*.so.*"
 
-FILES_lib${PN}-dev = "${includedir} \
+FILES_lib${BPN}-dev = "${includedir} \
                       ${libdir}/lib*.so \
                       ${libdir}/lib*.a \
                       ${libdir}/lib*.la \
@@ -28,7 +28,7 @@ FILES_lib${PN}-dev = "${includedir} \
                       ${base_libdir}/lib*.a \
                       ${base_libdir}/lib*.la"
 
-FILES_lib${PN}-doc = "${mandir}/man2 \
+FILES_lib${BPN}-doc = "${mandir}/man2 \
                       ${mandir}/man3"
 
 BBCLASSEXTEND = "native"
-- 
1.7.1



