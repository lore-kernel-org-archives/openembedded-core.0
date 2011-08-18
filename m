Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9i0-0006dG-K7
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:01:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980346"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:56:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:41 -0700
Message-Id: <34f9f57ae5781d7cb2086a54e6cd96f33dc14aa2.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/32] curl: Use BPN instead of PN for style like lib${PN}
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
1.7.6



