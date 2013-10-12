Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5080F6CF35
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2013 10:17:53 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id q8so4198291lbi.39
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2013 03:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ENLygKpWkz+xWUcE9Q1NUy7HIctNQlKPBayl4ICGk94=;
	b=RRQ1U8MMgOur3zQZ+s4kLxT2xFGzcOaV3oB4QhqwjEcALiMArWtr4Vs72B/KCYSP3I
	5Q2eG6Fxxm5tv3zOX/sr3jjkPQZDV9tSPZ+r7YfWvuu/Pdn9ryYNVSsNxP8Qczt1Ogdg
	VYIH6AJMEz/DEVwRum+chWBPE2lJb6o1KVgW/j81XVo2WTW9+UOPdw9uF6FTSM9MPaKV
	1yfVtrIE8pjEL5HXrrVZXA/JLR+H6GzZlKrkTLDFNiBvjpSnTwWZfEIcBY19JGh/YSu4
	GHscFW2CQKmQFGke7/sXiIDgB62nJiJ8Re1Qh8ssUumchPUuVkIdlUFhiIydcsiz8dL8
	XJVg==
X-Gm-Message-State: ALoCoQm8xPg3zmoSN99ih4emLe6tYPftMM5rtrR6HNNtMxNbMhpp1VbmyDt5WBPGO42k6ot5wb/r
X-Received: by 10.152.2.233 with SMTP id 9mr69915lax.38.1381573074441;
	Sat, 12 Oct 2013 03:17:54 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id u20sm36428468lbh.7.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 12 Oct 2013 03:17:53 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Oct 2013 13:17:42 +0300
Message-Id: <1381573062-29065-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 1/1] openssl: add Aarch64 bie-endian support
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
X-List-Received-Date: Sat, 12 Oct 2013 10:17:55 -0000

Signed-off-by: Victor Kamensky <victor.kamensky@linaro.org>
Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../openssl/openssl-1.0.1e/configure-targets.patch         | 14 ++++++--------
 meta/recipes-connectivity/openssl/openssl_1.0.1e.bb        |  2 +-
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/configure-targets.patch
index 8c638b4..d73b60d 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.1e/configure-targets.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/configure-targets.patch
@@ -2,16 +2,13 @@ Upstream-Status: Inappropriate [embedded specific]
 
 The number of colons are important :)
 
-
 ---
- Configure |   17 +++++++++++++++++
- 1 file changed, 17 insertions(+)
+ Configure |   18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
 
-Index: openssl-1.0.1e/Configure
-===================================================================
---- openssl-1.0.1e.orig/Configure
-+++ openssl-1.0.1e/Configure
-@@ -403,6 +403,23 @@ my %table=(
+--- a/Configure
++++ b/Configure
+@@ -403,6 +403,24 @@ my %table=(
  "linux-alpha-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
  "linux-alpha+bwx-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
  
@@ -23,6 +20,7 @@ Index: openssl-1.0.1e/Configure
 +"linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-aarch64","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O2 -pipe -g -feliminate-unused-debug-types -Wall -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-aarch64_be","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wa,--noexecstack -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +
 +"linux-avr32","$ENV{'CC'}:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).",
 +
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index ac27dba..3494847 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
-- 
1.8.1.2


