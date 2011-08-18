Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qtyh0-0000Sy-RI
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 11:15:15 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 18 Aug 2011 02:08:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,244,1312182000"; 
   d="scan'208";a="8464499"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Aug 2011 02:08:19 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 17:08:57 +0800
Message-Id: <748d50ef19a040761727fb553d4addbc18af3d95.1313658393.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1313658393.git.dongxiao.xu@intel.com>
References: <cover.1313658393.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1313658393.git.dongxiao.xu@intel.com>
References: <cover.1313658393.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/5] curl: Use BPN instead of PN for style like lib${PN}
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
X-List-Received-Date: Thu, 18 Aug 2011 09:15:15 -0000

When supporting multilib, ${PN} will be extended with MLPREFIX. However
if a package name contains ${PN} with styles like lib${PN}, such
extension will cause error. Use BPN in this case.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-support/curl/curl_7.21.7.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.21.7.bb b/meta/recipes-support/curl/curl_7.21.7.bb
index 28344e2..2ec4402 100644
--- a/meta/recipes-support/curl/curl_7.21.7.bb
+++ b/meta/recipes-support/curl/curl_7.21.7.bb
@@ -45,9 +45,9 @@ PACKAGE_ARCH_${PN}-certs = "all"
 
 FILES_${PN}-doc = "${mandir}/man1/curl.1"
 
-FILES_lib${PN} = "${libdir}/lib*.so.*"
-RRECOMMENDS_lib${PN} += "${PN}-certs"
-FILES_lib${PN}-dev = "${includedir} \
+FILES_lib${BPN} = "${libdir}/lib*.so.*"
+RRECOMMENDS_lib${BPN} += "${PN}-certs"
+FILES_lib${BPN}-dev = "${includedir} \
                       ${libdir}/lib*.so \
                       ${libdir}/lib*.a \
                       ${libdir}/lib*.la \
@@ -55,7 +55,7 @@ FILES_lib${PN}-dev = "${includedir} \
                       ${datadir}/aclocal \
                       ${bindir}/*-config"
 
-FILES_lib${PN}-doc = "${mandir}/man3 \
+FILES_lib${BPN}-doc = "${mandir}/man3 \
                       ${mandir}/man1/curl-config.1"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.1



