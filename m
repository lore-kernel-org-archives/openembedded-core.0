Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E64C5472F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:09 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.71670.1724736246935379306
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hhNS2gy8;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a86933829dcso568966466b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736245; x=1725341045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xFddOL2mCJNLdeiAOkLVjEInuDlAp+yWV3fuF1jCfQ=;
        b=hhNS2gy8L7tp5U3BBag8OwYPldexSUNdKHmEoIkYQOdkher2i9bK1fJI909mBjlHxd
         wllzAR/qUA4VeJT6J1cfAayUhiSM6C5M9uVsHWV7G+sLjnKlXfYsWEmpIKZm2h/ol3aB
         QIXF3BJ0+Q+v1A0wAWI+tnzh5VggVqp3Ac3IJ1K54Y8DzjRyhwUgB8pFD+etvAjhArQX
         MFV+dbFsGMQsljCCDnwCcIa9xOnXscx2CalJ+/bkkQaO81Hc6K4aK4D0I00KPkaDdEgt
         95TJ9nIiKBsbUjnKiLaFLslbtuBb935e5Kp4AnTyy5v6KrMqetyJUMPYevn8kXk54w6i
         Pk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736245; x=1725341045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xFddOL2mCJNLdeiAOkLVjEInuDlAp+yWV3fuF1jCfQ=;
        b=gWxf52WuW3IyTcOSDBxGpCFLXXKLhm1uKhJP08rc4KgLV2L96un/DaAxGqkGPCskJ/
         is+0zX02Iuhphkiksz7slOmUw9w5m1HtqvlRgSamJl3DXjr0c2/wHcIjk9owaQGNUKAo
         X43Ps41/UdCFiPKL+P4YODuYRzyxKQB+bvsr03Kpa/+gHQ2UmUOEtYq8VcEHU1Cf2zkJ
         7Vme1tEBjwN4vCJhog8HM33EggDYxWJdbasdkaC3opqkznk+AXGE/kaFSA+apwSAbXX2
         mdZzemdZGpbzkf6hPgDqwB7zPV1Ri6pUwPqEjT52t/7KSfIlpBczxTYv9E5XW5T9SwOx
         wVdA==
X-Gm-Message-State: AOJu0Yz1/FvwH3z5rPWaf/GMtGo2bTkPVOMG4QMdjtGJOtoIeNxNxfeX
	S1XmTpMwfEwScdfHY20psxhyMoSAu3Eg12eIXyCiJ2mMGzJ5IjOtciT5jg==
X-Google-Smtp-Source: AGHT+IFtA2g9AanM14cznlJ+SO7ZrsGf/BQ/s1GDbw7Jleex174AqhLF5nERS78hcix8iaYfwtFBpw==
X-Received: by 2002:a17:907:e66a:b0:a77:e48d:bae with SMTP id a640c23a62f3a-a86a52bb767mr892673066b.28.1724736245047;
        Mon, 26 Aug 2024 22:24:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/34] python3-pip: 24.0 -> 24.2
Date: Tue, 27 Aug 2024 07:23:33 +0200
Message-Id: <20240827052354.1319810-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203789

From: Alexander Kanavin <alex@linutronix.de>

License-update: formatting, newly added trustore is under MIT.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-pip/no_shebang_mangling.patch   |  8 ++++----
 .../{python3-pip_24.0.bb => python3-pip_24.2.bb}   | 14 ++++----------
 2 files changed, 8 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_24.0.bb => python3-pip_24.2.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index 99fa14ee031..0481a78a88a 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From 2aa82aeb0783c5fa7777b32bfe1dd3da9ae8fc6e Mon Sep 17 00:00:00 2001
+From 41542c2bf85c1c79bb55e6549e8f844b3a1db208 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific config]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/pip/_vendor/distlib/scripts.py b/src/pip/_vendor/distlib/scripts.py
-index cfa45d2..313f499 100644
+index e16292b..a3a161d 100644
 --- a/src/pip/_vendor/distlib/scripts.py
 +++ b/src/pip/_vendor/distlib/scripts.py
-@@ -144,6 +144,8 @@ class ScriptMaker(object):
+@@ -162,6 +162,8 @@ class ScriptMaker(object):
          See also: http://www.in-ulm.de/~mascheck/various/shebang/#length
                    https://hg.mozilla.org/mozilla-central/file/tip/mach
          """
@@ -25,7 +25,7 @@ index cfa45d2..313f499 100644
          if os.name != 'posix':
              simple_shebang = True
          else:
-@@ -362,7 +364,7 @@ class ScriptMaker(object):
+@@ -380,7 +382,7 @@ class ScriptMaker(object):
                  return
  
              match = FIRST_LINE_RE.match(first_line.replace(b'\r\n', b'\n'))
diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/recipes-devtools/python/python3-pip_24.2.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-pip_24.0.bb
rename to meta/recipes-devtools/python/python3-pip_24.2.bb
index be4a29500a5..1f8aeb35fc8 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.2.bb
@@ -4,36 +4,30 @@ SECTION = "devel/python"
 LICENSE = "MIT & Apache-2.0 & MPL-2.0 & LGPL-2.1-only & BSD-3-Clause & PSF-2.0 & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
                     file://src/pip/_vendor/cachecontrol/LICENSE.txt;md5=6572692148079ebbbd800be4b9f36c6d \
-                    file://src/pip/_vendor/certifi/LICENSE;md5=3c2b7404369c587c3559afb604fce2f2 \
-                    file://src/pip/_vendor/chardet/LICENSE;md5=4fbd65380cdd255951079008b364516c \
-                    file://src/pip/_vendor/colorama/LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26 \
+                    file://src/pip/_vendor/certifi/LICENSE;md5=11618cb6a975948679286b1211bd573c \
                     file://src/pip/_vendor/distlib/LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc \
                     file://src/pip/_vendor/distro/LICENSE;md5=d2794c0df5b907fdace235a619d80314 \
-                    file://src/pip/_vendor/idna/LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1 \
+                    file://src/pip/_vendor/idna/LICENSE.md;md5=204c0612e40a4dd46012a78d02c80fb1 \
                     file://src/pip/_vendor/msgpack/COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751 \
                     file://src/pip/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
-                    file://src/pip/_vendor/packaging/LICENSE.APACHE;md5=2ee41112a44fe7014dce33e26468ba93 \
                     file://src/pip/_vendor/pkg_resources/LICENSE;md5=141643e11c48898150daa83802dbc65f \
                     file://src/pip/_vendor/platformdirs/LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a \
                     file://src/pip/_vendor/pygments/LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592 \
-                    file://src/pip/_vendor/pyparsing/LICENSE;md5=657a566233888513e1f07ba13e2f47f1 \
                     file://src/pip/_vendor/pyproject_hooks/LICENSE;md5=aad69c93f605003e3342b174d9b0708c \
                     file://src/pip/_vendor/requests/LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
                     file://src/pip/_vendor/resolvelib/LICENSE;md5=78e1c0248051c32a38a7f820c30bd7a5 \
                     file://src/pip/_vendor/rich/LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303 \
-                    file://src/pip/_vendor/six.LICENSE;md5=43cfc9e4ac0e377acfb9b76f56b8415d \
-                    file://src/pip/_vendor/tenacity/LICENSE;md5=175792518e4ac015ab6696d16c4f607e \
                     file://src/pip/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
+                    file://src/pip/_vendor/truststore/LICENSE;md5=74420fc3965c4558a4a1529e63c2867f \
                     file://src/pip/_vendor/typing_extensions.LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2 \
                     file://src/pip/_vendor/urllib3/LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c \
-                    file://src/pip/_vendor/webencodings/LICENSE;md5=81fb24cd7823cce23b69f721993dce4d \
                     "
 
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b301b718fe6f593aba2"
+SRC_URI[sha256sum] = "5b5e490b5e9cb275c879595064adce9ebd31b854e3e803740b72f9ccf34a45b8"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.39.2


