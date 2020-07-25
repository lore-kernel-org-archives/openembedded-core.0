Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.7001.1595670870690911280
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2020 02:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=Huipn0nK;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.195, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f195.google.com with SMTP id h19so12347249ljg.13
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2020 02:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hIK56QDXGDndvrPWKmi/eyXEnVw/c1qO90/1xr3nvpY=;
        b=Huipn0nKPI5Urt8pzGY5LOL2+GLZ4YOTyefYBR2zfY45uAtoGCFJ6EYscaYoPzREVW
         /Rr/oBDbFeEXGP+7Rl5QTIjMLe+W6l+Uqn0Ql8KZbNG+M9E8Qst3ide1yTytKx69Nq0W
         tkpJbpt47iRSyhFfmgjrQh2CThfcZ/5P72UXGnqJMHGGGd1nI/lA6IXiQx/3j4LAKNLR
         jchYuXEZXgu6X9F+a4Pd3NR1eQrTHRUYs5Dp5n23ZRdWyhM3Q3iF0XfevsG/PqOrAdd7
         O1pskYt2Ugy4qtS1/l9X6uB5m+6yeM+7oiwoymjsnTv6ARI5fzfmwR/lLn4jwfqmgNIt
         lRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hIK56QDXGDndvrPWKmi/eyXEnVw/c1qO90/1xr3nvpY=;
        b=VbOi2TzLYMIIONViJiMj9jIBX8QZmRhrPiRkTCDvGdUBkASjzKwBp2WHnSTvZuSDpR
         JocnJqlARZakfd8Z9zGLarJjwo1G+KNtOzIXlS9U8m+GgtkVLSNPaic0CuPP3z9epZcO
         /H4ZEfBzkwHSSDw/UM4w4YUSu8GcQlfJJwHfwjze9fusPGkr9IRJMZKGo/dlWElfh5/r
         f4qSiWojj/bVyuQFhzzbpt+IZu1Pmaiu2NXcEwRpx40yp9EeX+NCHOsdsyWzoqNkuSrx
         zZqQJQip1+CXawhXAog3DdPBGdafayLhK88pjnZBuxEdYxxUGJRdNdD6XVKfsVXLTGLv
         l8WA==
X-Gm-Message-State: AOAM532n9aeREDRaqRdGEuB9GCWBb3hlkR6XTJ7voPE2psA4q1d2unPF
	q0yrpRjRfqwzcA+DaU+8tn7lXdH1sbg=
X-Google-Smtp-Source: ABdhPJwbBBPZ3tJGs1GuH9fQD/CEuEaDldCZdMZkQ3pnmIbywDbPq3xsa82K4cEXeGWKNecLG0Q2Ag==
X-Received: by 2002:a2e:b042:: with SMTP id d2mr6271233ljl.252.1595670867469;
        Sat, 25 Jul 2020 02:54:27 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id u5sm1148802lfr.3.2020.07.25.02.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 02:54:26 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-setuptools: update to 49.2.0
Date: Sat, 25 Jul 2020 11:54:23 +0200
Message-Id: <20200725095423.1915531-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rebased patch and got rid of the .inc file as Python 2 is not supported
anymore.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...nally-do-not-fetch-code-by-easy_install.patch | 16 +++++++++-------
 .../python/python3-setuptools_47.3.1.bb          |  6 ------
 ...tuptools.inc => python3-setuptools_49.2.0.bb} |  9 +++++++--
 3 files changed, 16 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools_47.3.1.bb
 rename meta/recipes-devtools/python/{python-setuptools.inc => python3-setuptools_49.2.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 201e3570d6..86c9363d65 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 234c3da52da09b28db5b2c4d33ebe9c800c461ac Mon Sep 17 00:00:00 2001
+From 768e1f2f14c9f1b3f9bd0e017c3f6183b45616e8 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -9,16 +9,15 @@ internet by easy_install.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  setuptools/command/easy_install.py | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 5a9576f..f5961cb 100644
+index bcbd4f58..6455afda 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -656,6 +656,11 @@ class easy_install(Command):
+@@ -653,6 +653,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and rmtree(rmtree_safe(tmpdir))
  
      def easy_install(self, spec, deps=False):
@@ -27,6 +26,9 @@ index 5a9576f..f5961cb 100644
 +                      "Please add its native recipe to DEPENDS." % spec)
 +            return None
 +
-         if not self.editable:
-             self.install_site_py()
- 
+         with self._tmpdir() as tmpdir:
+             if not isinstance(spec, Requirement):
+                 if URL_SCHEME(spec):
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_47.3.1.bb b/meta/recipes-devtools/python/python3-setuptools_47.3.1.bb
deleted file mode 100644
index 0dc1ed8622..0000000000
--- a/meta/recipes-devtools/python/python3-setuptools_47.3.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require python-setuptools.inc
-inherit setuptools3
-
-do_install_append() {
-    mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
-}
diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python3-setuptools_49.2.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python-setuptools.inc
rename to meta/recipes-devtools/python/python3-setuptools_49.2.0.bb
index ecf1205752..41ba6ea159 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python3-setuptools_49.2.0.bb
@@ -6,13 +6,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=1;endline=19;md5=9a33897f1bca1160d7
 
 PYPI_PACKAGE_EXT = "zip"
 
-inherit pypi
+inherit pypi setuptools3
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "843037738d1e34e8b326b5e061f474aca6ef9d7ece41329afbc8aac6195a3920"
+SRC_URI[sha256sum] = "afe9e81fee0270d3f60d52608549cc8ec4c46dada8c95640c1a00160f577acf2"
 
 DEPENDS += "${PYTHON_PN}"
 
@@ -36,10 +36,15 @@ RDEPENDS_${PN} = "\
   ${PYTHON_PN}-unittest \
   ${PYTHON_PN}-xml \
 "
+
 do_install_prepend() {
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
 }
 
+do_install_append() {
+    mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
+}
+
 BBCLASSEXTEND = "native nativesdk"
 
 # The pkg-resources module can be used by itself, without the package downloader
-- 
2.25.1

