Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 37F5E760AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 05:58:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B5wjKG026233
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 21:58:45 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.246) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 21:58:44 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jan 2016 13:58:43 +0800
Message-ID: <2523177d0da5233c60da6a6aa99f74631a9277b7.1452491844.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452491844.git.Qi.Chen@windriver.com>
References: <cover.1452491844.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] curl: upgrade to 7.46
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
X-List-Received-Date: Mon, 11 Jan 2016 05:58:44 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/curl/{curl_7.45.0.bb => curl_7.46.0.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.45.0.bb => curl_7.46.0.bb} (92%)

diff --git a/meta/recipes-support/curl/curl_7.45.0.bb b/meta/recipes-support/curl/curl_7.46.0.bb
similarity index 92%
rename from meta/recipes-support/curl/curl_7.45.0.bb
rename to meta/recipes-support/curl/curl_7.46.0.bb
index a7ed778..8b109ba 100644
--- a/meta/recipes-support/curl/curl_7.45.0.bb
+++ b/meta/recipes-support/curl/curl_7.46.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "62c1a352b28558f25ba6209214beadc8"
-SRC_URI[sha256sum] = "65154e66b9f8a442b57c436904639507b4ac37ec13d6f8a48248f1b4012b98ea"
+SRC_URI[md5sum] = "9979f989a2a9930d10f1b3deeabc2148"
+SRC_URI[sha256sum] = "b7d726cdd8ed4b6db0fa1b474a3c59ebbbe4dcd4c61ac5e7ade0e0270d3195ad"
 
 inherit autotools pkgconfig binconfig multilib_header
 
@@ -55,4 +55,6 @@ PACKAGES =+ "lib${BPN}"
 FILES_lib${BPN} = "${libdir}/lib*.so.*"
 RRECOMMENDS_lib${BPN} += "ca-certificates"
 
+FILES_${PN}-dev += "${datadir}/zsh"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


