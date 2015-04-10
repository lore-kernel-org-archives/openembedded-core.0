Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AC98973D20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 09:30:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3A9UAlf002968
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 02:30:11 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 02:30:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Apr 2015 02:30:00 -0700
Message-ID: <5637de2ec91e9bc26ded9b765f0c32402a77997e.1428656126.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428656126.git.liezhi.yang@windriver.com>
References: <cover.1428656126.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/15] curl: remove extra dev and staticdev from PACKAGES
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
X-List-Received-Date: Fri, 10 Apr 2015 09:30:10 -0000
Content-Type: text/plain

There should be only one dev and dbg package.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/curl/curl_7.40.0.bb |   11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.40.0.bb b/meta/recipes-support/curl/curl_7.40.0.bb
index 4cde9c6..bd5bf96 100644
--- a/meta/recipes-support/curl/curl_7.40.0.bb
+++ b/meta/recipes-support/curl/curl_7.40.0.bb
@@ -42,18 +42,9 @@ do_install_append() {
 	oe_multilib_header curl/curlbuild.h
 }
 
-PACKAGES =+ "lib${BPN} lib${BPN}-dev lib${BPN}-staticdev lib${BPN}-doc"
+PACKAGES =+ "lib${BPN}"
 
 FILES_lib${BPN} = "${libdir}/lib*.so.*"
 RRECOMMENDS_lib${BPN} += "ca-certificates"
-FILES_lib${BPN}-dev = "${includedir} \
-                      ${libdir}/lib*.so \
-                      ${libdir}/lib*.la \
-                      ${libdir}/pkgconfig \
-                      ${datadir}/aclocal \
-                      ${bindir}/*-config"
-FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
-FILES_lib${BPN}-doc = "${mandir}/man3 \
-                      ${mandir}/man1/curl-config.1"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.9.5


