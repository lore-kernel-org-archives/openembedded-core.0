Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D22C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:34 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.4790.1642588892495607899
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lfRaqX4J;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso6765637wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cKbXN//9zXkQde5kegeGu366Bw+WXkAmYTwKKJA4DhA=;
        b=lfRaqX4J0zZLFHQZ+NpjSveCOOgSrnFYbURj3z3f6w2N8mAhW8XhbaGNMrHUiTxF9y
         Sq+TLz0Ei4cIZNLR3z0trWp7ftgBgDCd0d4sPWyY3oXMqyY8JW9ipZo2nTPSOpvSalNm
         ZlJQx+2aVzBlpnooFTU6gK/n/SjnbwEusbL8jL2l7meszSBf2m7fsaxDl7GEu6Qrn29L
         Z0h7/C9yjF42tcJtA3EXT3PHpNvdKqKyYcG1HZ8WjVkozWHoKJj6WzEFvww8tzTFn74A
         DswaxNFppL7lDDTbZ1esN7Ofufj0Bm/g+beQNdSBsTG0ZUNm+CbBLncthrk2svRmFPoj
         k0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cKbXN//9zXkQde5kegeGu366Bw+WXkAmYTwKKJA4DhA=;
        b=ZfKrCHrzCvMkB+vco/C1JIeWQn/ZA7+y9B4ZdfBx/jd2DwAiOfggbFfRWT4sZDCAwn
         aviqkiqCS4WJHO0itePfRO6NWOAU3Mp/H0Hl3cmzBSE7nCxmc3F0v7nmCu1oD4F96r5j
         MCcNMmadSIDSuieRLK/NkMb78adCh3Gmb3FRI+7fN5mlYhiykOU7QbG3dHZVQH0SJDfg
         E4943SiWoPfwsSo/N3wMzynaLmytHSDkW6yoIrvV9ad/o4CZDe7SzIpCJsYUXezzXwCg
         O3kx+L5T7P7kS+rHzuRAeKVhyLiL+YA7tP9sp1CfYLshdppPG0EcDeLDEe03RnNX672Z
         8aVQ==
X-Gm-Message-State: AOAM532MTiYnYMJGthPXzV6sV9tTzCTSj4DZSa2rjxJZ81biCHIahHf8
	5aA+SinWKRY0wEzvkuiE9evoBtHQjVw=
X-Google-Smtp-Source: 
 ABdhPJzUyWQQm1rs6MC1TLYPJq5aI9m5xhH5TC5KwrDW4+7U0sEgX8OyYmnYxE/ufEabc8BKgX7ieA==
X-Received: by 2002:adf:e291:: with SMTP id
 v17mr27549531wri.479.1642588890675;
        Wed, 19 Jan 2022 02:41:30 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Ross Burton <ross.burton@arm.com>,
	Christian Heimes <christian@python.org>
Subject: [PATCH 08/39] python3: update 3.10.1 -> 3.10.2
Date: Wed, 19 Jan 2022 11:40:46 +0100
Message-Id: <20220119104117.2120127-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160699

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-search-system-for-headers-libraries.patch |  2 +-
 ...-use-prefix-value-from-build-configu.patch |  2 +-
 ...-detection-of-mips-architecture-for-.patch |  9 ++-
 ...enSSL-version-check-for-3.0.1-GH-301.patch | 60 -------------------
 ...fig-append-STAGING_LIBDIR-python-sys.patch |  2 +-
 ...tutils-prefix-is-inside-staging-area.patch |  2 +-
 .../{python3_3.10.1.bb => python3_3.10.2.bb}  |  5 +-
 7 files changed, 10 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-bpo-46114-Fix-OpenSSL-version-check-for-3.0.1-GH-301.patch
 rename meta/recipes-devtools/python/{python3_3.10.1.bb => python3_3.10.2.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index 27a5992880..5485020eb4 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From df1a5e4bc6c8523eaa33daa2a90707fe6c6bddb6 Mon Sep 17 00:00:00 2001
+From b6ead2d17ceafed47e598b6f50f3ff669deec5ab Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index ad384231a5..a9240b3c8a 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From 2d4bde19e0df7244e1cd17c4f4a255d488cb3e56 Mon Sep 17 00:00:00 2001
+From 01d209277e145072e478d8b9acfea3638ee16cdc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 10 Sep 2021 12:28:31 +0200
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
index fc2241b5b9..6ab335a405 100644
--- a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
+++ b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
@@ -1,4 +1,4 @@
-From 7cfa712eecf02edaefaf0e51f3c8a31933b88db1 Mon Sep 17 00:00:00 2001
+From bb409432f03dd8256865292e382ad16613737829 Mon Sep 17 00:00:00 2001
 From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
 Date: Fri, 31 May 2019 15:34:34 +0200
 Subject: [PATCH] bpo-36852: proper detection of mips architecture for soft
@@ -14,13 +14,12 @@ to do this in a more autoconf/autotools manner.
 Upstream-Status: Submitted [https://github.com/python/cpython/pull/13196]
 Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
 
-
 ---
  configure.ac | 175 +++++++--------------------------------------------
  1 file changed, 21 insertions(+), 154 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 299786b..d0db062 100644
+index 4230ef2..ee08b1b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -718,160 +718,27 @@ then
@@ -203,5 +202,5 @@ index 299786b..d0db062 100644
 +	;;
 +esac	
  
- if test x$PLATFORM_TRIPLET != xdarwin; then
-   MULTIARCH=$($CC --print-multiarch 2>/dev/null)
+ AC_MSG_CHECKING([for multiarch])
+ AS_CASE([$ac_sys_system],
diff --git a/meta/recipes-devtools/python/python3/0001-bpo-46114-Fix-OpenSSL-version-check-for-3.0.1-GH-301.patch b/meta/recipes-devtools/python/python3/0001-bpo-46114-Fix-OpenSSL-version-check-for-3.0.1-GH-301.patch
deleted file mode 100644
index 6f4ceae188..0000000000
--- a/meta/recipes-devtools/python/python3/0001-bpo-46114-Fix-OpenSSL-version-check-for-3.0.1-GH-301.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 251d2eadc7f5b4042245709f41c38169a284e146 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Fri, 17 Dec 2021 07:38:11 -0800
-Subject: [PATCH] bpo-46114: Fix OpenSSL version check for 3.0.1 (GH-30170)
-
-(cherry picked from commit 2985feac4e02d590bb78bcce9e30864be53280ac)
-
-Co-authored-by: Christian Heimes <christian@python.org>
----
- .github/workflows/build.yml                                 | 2 +-
- Lib/test/test_ssl.py                                        | 6 +++++-
- .../next/Tests/2021-12-17-14-46-19.bpo-46114.9iyZ_9.rst     | 1 +
- Tools/ssl/multissltests.py                                  | 2 +-
- 4 files changed, 8 insertions(+), 3 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Tests/2021-12-17-14-46-19.bpo-46114.9iyZ_9.rst
-
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index a485f7d4c3..873db6403d 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -539,7 +539,11 @@ def test_openssl_version(self):
-         self.assertLessEqual(status, 15)
- 
-         libressl_ver = f"LibreSSL {major:d}"
--        openssl_ver = f"OpenSSL {major:d}.{minor:d}.{fix:d}"
-+        if major >= 3:
-+            # 3.x uses 0xMNN00PP0L
-+            openssl_ver = f"OpenSSL {major:d}.{minor:d}.{patch:d}"
-+        else:
-+            openssl_ver = f"OpenSSL {major:d}.{minor:d}.{fix:d}"
-         self.assertTrue(
-             s.startswith((openssl_ver, libressl_ver)),
-             (s, t, hex(n))
-diff --git a/Misc/NEWS.d/next/Tests/2021-12-17-14-46-19.bpo-46114.9iyZ_9.rst b/Misc/NEWS.d/next/Tests/2021-12-17-14-46-19.bpo-46114.9iyZ_9.rst
-new file mode 100644
-index 0000000000..6878cea032
---- /dev/null
-+++ b/Misc/NEWS.d/next/Tests/2021-12-17-14-46-19.bpo-46114.9iyZ_9.rst
-@@ -0,0 +1 @@
-+Fix test case for OpenSSL 3.0.1 version. OpenSSL 3.0 uses ``0xMNN00PP0L``.
-diff --git a/Tools/ssl/multissltests.py b/Tools/ssl/multissltests.py
-index ba2663e9a3..8fe5b5d0c2 100755
---- a/Tools/ssl/multissltests.py
-+++ b/Tools/ssl/multissltests.py
-@@ -48,7 +48,7 @@
- 
- OPENSSL_RECENT_VERSIONS = [
-     "1.1.1l",
--    "3.0.0"
-+    "3.0.1"
- ]
- 
- LIBRESSL_OLD_VERSIONS = [
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
index 1a1e3e960c..3c62c2acb8 100644
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
@@ -1,4 +1,4 @@
-From 8a91a3047222ac533c2ca00b6d27cf6f992e6b11 Mon Sep 17 00:00:00 2001
+From 78dd1def953e18e7cda0325bb26d27c051bb6890 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 31 Jan 2019 16:46:30 +0100
 Subject: [PATCH] distutils/sysconfig: append
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index bb2984cc71..de4c6c4e19 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 99cfdb5f3debd38f50b73a7713161f8b56ce842e Mon Sep 17 00:00:00 2001
+From 33b5a31df6050110f4481a24f5a0a0bf7fe80096 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3_3.10.1.bb b/meta/recipes-devtools/python/python3_3.10.2.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.10.1.bb
rename to meta/recipes-devtools/python/python3_3.10.2.bb
index d6ac431185..9c67461493 100644
--- a/meta/recipes-devtools/python/python3_3.10.1.bb
+++ b/meta/recipes-devtools/python/python3_3.10.2.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python is a programming language that lets you work more quickly
 LICENSE = "PSFv2"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3dd7bed622743ef9b77169b3736f7990"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4b8801e752a2c70ac41a5f9aa243f766"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -32,7 +32,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://makerace.patch \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch \
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
-           file://0001-bpo-46114-Fix-OpenSSL-version-check-for-3.0.1-GH-301.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -41,7 +40,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "a7f1265b6e1a5de1ec5c3ec7019ab53413469934758311e9d240c46e5ae6e177"
+SRC_URI[sha256sum] = "17de3ac7da9f2519aa9d64378c603a73a0e9ad58dffa8812e45160c086de64c7"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.20.1


