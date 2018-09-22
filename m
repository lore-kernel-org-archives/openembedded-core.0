Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0B1027470D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 14:58:48 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id r191-v6so872155lff.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 07:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=RsFOEaRGcrtrbDTdj+Rkgtd3WBx1lM/8UABGEqrmCmo=;
	b=dQKC09EH2mSMnksO5p3tN7vqFOBWwMYZmh90vstedZIFPndru33o45VhaHesUTQUMK
	F7rrkqxjDtLOjwrfcw+zxVqnyP79O/Jsf/4erIvjoNPd66ar20XP3FQApD7KbQvypVjZ
	lwmHIe9X1wYjIYUgyRnmCKU/0zRHJSAhZZcXouagK1ORe1plso+rEVBtf+1gTlB57/my
	17CTpQxZsJpBTP3vfbisMpSx5DRIVAzpjnS1NEG+Q914IZG2ZIucGhmWZ+8e/1rB62FW
	TJNuEOL9Z6c15v7N17NBnRjROOgCDWUSp5SecwEhJyM/Y3xXsY78AIqp+pITW3a7KITX
	Rg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RsFOEaRGcrtrbDTdj+Rkgtd3WBx1lM/8UABGEqrmCmo=;
	b=SNOwftAxpB/lkEE7VOH8SWeXUh/CMRYWXdFqlwUQKfCWBbQ6dqyKVP6U7qTeRCXxqY
	VN+9dAM7vg722ryEJjiSAoGscci2DoqdqgLTbIuS3t2zAvsWzqfCasx7mmhd88lX/Auw
	csJ18Y3hhPZ+Ulk2N2JIHKuEvxcRLhN+EAdC1jtM2sE0x09CLfS1iIxb0u3WAsqA0PuR
	r7sa5FaY6jJOiZyT9cVdF4NO6mqV46eVm657foRxv9VZ+tYI/JnCjw8Vp1stv7QS9cY2
	MT1M2cLNB2FU1hvnwuTWFknMheNGgrP7m6QF5MHHqaIBI6xvOpEzpnlksekQXks4e8Fa
	HmcQ==
X-Gm-Message-State: APzg51AMwvpdKvSZLar4z/6RAyA5UQWAG+F9rQaf07gG6eE86cjlrAwz
	cd0BAcE3td54U1IOEqOuX9BEy3Mu1qc=
X-Google-Smtp-Source: ANB0VdbYE37lCPsvMxguqxATjc4vukNKL9GSjM7/bn6HCMirCi7D/W2ZFoerrxLhrXJtnzBJMOSoDg==
X-Received: by 2002:a19:1346:: with SMTP id
	j67-v6mr1624408lfi.93.1537628328625; 
	Sat, 22 Sep 2018 07:58:48 -0700 (PDT)
Received: from scout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	n62-v6sm629116ljb.59.2018.09.22.07.58.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Sep 2018 07:58:47 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2018 16:58:40 +0200
Message-Id: <20180922145840.112880-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [PATCH] curl: update to 7.61.1
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
X-List-Received-Date: Sat, 22 Sep 2018 14:58:49 -0000

Contains fix for CVE-2018-14618, therefore the patch is removed.

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 .../curl/curl/CVE-2018-14618.patch            | 37 -------------------
 .../curl/{curl_7.61.0.bb => curl_7.61.1.bb}   |  5 +--
 2 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2018-14618.patch
 rename meta/recipes-support/curl/{curl_7.61.0.bb => curl_7.61.1.bb} (94%)

diff --git a/meta/recipes-support/curl/curl/CVE-2018-14618.patch b/meta/recipes-support/curl/curl/CVE-2018-14618.patch
deleted file mode 100644
index db07b436d3..0000000000
--- a/meta/recipes-support/curl/curl/CVE-2018-14618.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 57d299a499155d4b327e341c6024e293b0418243 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 13 Aug 2018 10:35:52 +0200
-Subject: [PATCH] Curl_ntlm_core_mk_nt_hash: return error on too long password
-
-... since it would cause an integer overflow if longer than (max size_t
-/ 2).
-
-This is CVE-2018-14618
-
-Bug: https://curl.haxx.se/docs/CVE-2018-14618.html
-Closes #2756
-Reported-by: Zhaoyang Wu
-
-CVE: CVE-2018-14618
-Upstream-Status: Backport
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- lib/curl_ntlm_core.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/lib/curl_ntlm_core.c b/lib/curl_ntlm_core.c
-index e27cab353c..922e85a926 100644
---- a/lib/curl_ntlm_core.c
-+++ b/lib/curl_ntlm_core.c
-@@ -557,8 +557,11 @@ CURLcode Curl_ntlm_core_mk_nt_hash(struct Curl_easy *data,
-                                    unsigned char *ntbuffer /* 21 bytes */)
- {
-   size_t len = strlen(password);
--  unsigned char *pw = len ? malloc(len * 2) : strdup("");
-+  unsigned char *pw;
-   CURLcode result;
-+  if(len > SIZE_T_MAX/2) /* avoid integer overflow */
-+    return CURLE_OUT_OF_MEMORY;
-+  pw = len ? malloc(len * 2) : strdup("");
-   if(!pw)
-     return CURLE_OUT_OF_MEMORY;
diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.1.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.61.0.bb
rename to meta/recipes-support/curl/curl_7.61.1.bb
index 4f408d2aaa..c224b3ec1c 100644
--- a/meta/recipes-support/curl/curl_7.61.0.bb
+++ b/meta/recipes-support/curl/curl_7.61.1.bb
@@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e66
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
-           file://CVE-2018-14618.patch \
 "
 
-SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
-SRC_URI[sha256sum] = "5f6f336921cf5b84de56afbd08dfb70adeef2303751ffb3e570c936c6d656c9c"
+SRC_URI[md5sum] = "593432e5ff863474d8d880f74b705d6d"
+SRC_URI[sha256sum] = "a308377dbc9a16b2e994abd55455e5f9edca4e31666f8f8fcfe7a1a4aea419b9"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.17.1


