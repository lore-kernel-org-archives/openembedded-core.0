Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 1800961A02
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 16:33:56 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id 3080A60044;
	Thu,  5 Mar 2020 17:33:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1583426035;
	bh=pn7skleBZyLrrslDbKwKnExor7HAOu8lTiH2hwcSF4E=;
	h=From:To:Cc:Subject:Date:From;
	b=dV1tASD7c/K/EOBq8Fo4XQEbaZEG8hsqpXQriEXKN/s771yC0ycyI2yAvPn54JZVq
	okpLmzR2/ewpnJWgBxFL42a38m0YCkA3BSNX5+hkCPGeNPD009FEYIh1bsbDzBX2Cx
	zr+GuI3G1Fw9Ep/5aVi+lmuVBbY/mLwRNTHy15QZpUfpUQV1jur/aSoOHhXyk3Bkj8
	Uemlf+q/kHdZt7eYx8UZuztjqb3/SyMEikY44f2WMVegOR5A7dhHShX8UlYqRifcq7
	aAzJ7fYMo7696hyF4GjH2nZRSIJZqdZ4N3NFjKesI/0sU801MbwJVKisCPFNpudDEI
	T5dDU7OSe7w9A==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Mar 2020 17:33:53 +0100
Message-Id: <1583426033-30063-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] curl: upgrade 7.68.0 -> 7.69.0
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
X-List-Received-Date: Thu, 05 Mar 2020 16:33:57 -0000

Bugfix release. For details, see full changelog

 - https://curl.haxx.se/changes.html#7_69_0

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-support/curl/{curl_7.68.0.bb => curl_7.69.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.68.0.bb => curl_7.69.0.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.68.0.bb b/meta/recipes-support/curl/curl_7.69.0.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.68.0.bb
rename to meta/recipes-support/curl/curl_7.69.0.bb
index 0a1547c..cf4f4bc 100644
--- a/meta/recipes-support/curl/curl_7.68.0.bb
+++ b/meta/recipes-support/curl/curl_7.69.0.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[md5sum] = "40d6784bd1a86e079d63cc668ba9bd8f"
-SRC_URI[sha256sum] = "207f54917dd6a2dc733065ccf18d61bb5bebeaceb5df49cd9445483e8623eeb9"
+SRC_URI[md5sum] = "04eb86d1138c2ff3dbfd497f7de85daa"
+SRC_URI[sha256sum] = "668d451108a7316cff040b23c79bc766e7ed84122074e44f662b8982f2e76739"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4


