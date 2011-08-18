Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9i0-0006oq-Tx
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:01:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980349"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:56:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:42 -0700
Message-Id: <275b1e9c0d1899c3ba30d1c05124efa3e218c238.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 23/32] ea-acl: Use BPN instead of PN for style like lib${PN}
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
X-List-Received-Date: Thu, 18 Aug 2011 21:01:01 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

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
1.7.6



