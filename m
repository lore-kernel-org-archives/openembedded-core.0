Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527C3C4332F
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:32 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.11377.1634657670968820670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DnWt2mq2;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id p21so12443096wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nqRBl/WC/9kOkz+PnbOYwb7iCvafmnlxYtZXtjw3+m4=;
        b=DnWt2mq2laOgpsaKbe0XFvi0DJ2ZG8vJbioNPPkLlmTse9NnDNsJ/QZarCa9igqU9J
         CcG4VQdQibaOPXcG/Kn+bHjfj35z5UK89FG1/vAlLfcuo4XE/D9ABPTFVh1IT2J8YPdA
         iZ/zYwszUkJ7uRrGp/zEaIEdgnBjam3Xb1EsXOkBDGyr2/jGCYG12AhchAN2dngi/8Lx
         yYs1JKs/5II71dnwwszIe1BojQH5hnAR7f8FgqA6Ss6jA2s33UaOY16n0ypRbONjaoB9
         nny6sMqzAPpaFr+Bl4jT6oZhpbxb7NRsZrXaThqCGV5fiFNQNelfyTX1IGiGBia+zehJ
         ksww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nqRBl/WC/9kOkz+PnbOYwb7iCvafmnlxYtZXtjw3+m4=;
        b=oM3n9mJ+a+QzyJFxgfdoElgwEBqOLeYhipXC+AvD1ZIq+TMWndsyOfMTGOwpulYZBC
         4EPFKwCSOnFRfz7SQVvAZq24cp46c3qHM2K9qzmLFCKfzjMAWWpiULshgTpbDoGMcQv5
         b/HRUj3oewadO7ThNoEbLHZTt+eVMMivOqjqXWLWz+G+Y/Xqswrwn6PWHP7vEd8REaMJ
         wXDDJq5DOK5Vj1bKAD+sWpMQBdqqek/LdW4UUj2lNd3gbxHEec9HRDmpM5B+xbN1fBQl
         ynUhcOsNC7kZyTMwnJ1PfGBDvt3GaRhHUJe0LnCjDS3hwAypy06idxFaEeZiiHhqaTq/
         rDXw==
X-Gm-Message-State: AOAM530+aC1Np9yQVdXlut1AZH5TE3A7gTj7SDvcxmnkNNKcpgO7eExC
	MIMVTXpT9TMeQGtQ0YA9nc4YdeoOC/8=
X-Google-Smtp-Source: 
 ABdhPJxYEWngYB/tlT4oMkzV1+jyoZWUZAupBX+x4WGrZ0IiEsp5UgOBl2L7ACsi8kauDYWOAlVpZA==
X-Received: by 2002:adf:bb41:: with SMTP id x1mr45171243wrg.346.1634657669609;
        Tue, 19 Oct 2021 08:34:29 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/65] meson: update 0.59.1 -> 0.59.2
Date: Tue, 19 Oct 2021 17:33:23 +0200
Message-Id: <20211019153419.3319802-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157128

Drop patch as upstream fixed the issue.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/meson/meson.inc         |  4 +-
 ...01-is_debianlike-always-return-False.patch | 26 ++++++++++++
 ...y-do-not-substitute-python-s-install.patch | 41 -------------------
 .../{meson_0.59.1.bb => meson_0.59.2.bb}      |  0
 ...on_0.59.1.bb => nativesdk-meson_0.59.2.bb} |  0
 5 files changed, 28 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-False.patch
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch
 rename meta/recipes-devtools/meson/{meson_0.59.1.bb => meson_0.59.2.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.59.1.bb => nativesdk-meson_0.59.2.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index c83ea406f0..174ebd9f31 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -11,11 +11,11 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
            file://disable-rpath-handling.patch \
-           file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
+           file://0001-is_debianlike-always-return-False.patch \
            "
-SRC_URI[sha256sum] = "db586a451650d46bbe10984a87b79d9bcdc1caebf38d8e189f8848f8d502356d"
+SRC_URI[sha256sum] = "13dee549a7ba758b7e33ce7719f28d1d337a98d10d378a4779ccc996f5a2fc49"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-False.patch b/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-False.patch
new file mode 100644
index 0000000000..83c4782a61
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-False.patch
@@ -0,0 +1,26 @@
+From 667b9ede638677fb37911306937ea62f05897581 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 18 Oct 2021 15:55:59 +0200
+Subject: [PATCH] is_debianlike(): always return False
+
+Otherwise, host contamination happens.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ mesonbuild/mesonlib/universal.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mesonbuild/mesonlib/universal.py b/mesonbuild/mesonlib/universal.py
+index d670d04..47d1b52 100644
+--- a/mesonbuild/mesonlib/universal.py
++++ b/mesonbuild/mesonlib/universal.py
+@@ -651,7 +651,7 @@ def is_cygwin() -> bool:
+ 
+ 
+ def is_debianlike() -> bool:
+-    return os.path.isfile('/etc/debian_version')
++    return False
+ 
+ 
+ def is_dragonflybsd() -> bool:
diff --git a/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch b/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch
deleted file mode 100644
index 231414fcb6..0000000000
--- a/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f8f67c8d5c3f374b1e30e2d40cb56a79f0544471 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 18 Apr 2019 17:36:11 +0200
-Subject: [PATCH] modules/python.py: do not substitute python's install prefix
- with meson's
-
-Not sure why this is being done, but it
-a) relies on Python's internal variable substitution which may break in the future
-b) shouldn't be necessary as Python's prefix ought to be correct in the first place
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- mesonbuild/modules/python.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
-index eda70ce..18edd15 100644
---- a/mesonbuild/modules/python.py
-+++ b/mesonbuild/modules/python.py
-@@ -251,7 +251,7 @@ INTROSPECT_COMMAND = '''import sysconfig
- import json
- import sys
- 
--install_paths = sysconfig.get_paths(scheme='posix_prefix', vars={'base': '', 'platbase': '', 'installed_base': ''})
-+install_paths = sysconfig.get_paths(scheme='posix_prefix')
- 
- def links_against_libpython():
-     from distutils.core import Distribution, Extension
-@@ -280,8 +280,8 @@ class PythonInstallation(ExternalProgramHolder):
-         self.variables = info['variables']
-         self.paths = info['paths']
-         install_paths = info['install_paths']
--        self.platlib_install_path = os.path.join(prefix, install_paths['platlib'][1:])
--        self.purelib_install_path = os.path.join(prefix, install_paths['purelib'][1:])
-+        self.platlib_install_path = install_paths['platlib']
-+        self.purelib_install_path = install_paths['purelib']
-         self.version = info['version']
-         self.platform = info['platform']
-         self.is_pypy = info['is_pypy']
diff --git a/meta/recipes-devtools/meson/meson_0.59.1.bb b/meta/recipes-devtools/meson/meson_0.59.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.59.1.bb
rename to meta/recipes-devtools/meson/meson_0.59.2.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.59.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.59.2.bb
-- 
2.20.1


