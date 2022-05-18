Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29A2C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:58:55 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.3534.1652871532703452603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MD2ZXo6E;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id kq17so3054921ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7iPjvVBkxA680ag2bFZiQv0dtTJ8G47RSHlibrOxWUg=;
        b=MD2ZXo6EMlUt0iHUyl/U2CdrW2WpkyCH0aFOvOzYBfs1FD4LFo6GYfouRGsmbsebJr
         sb6/mbk+j+7KFZQ8qAdW2XqecleWMU0Rm6ZuppaFcQjbxzZAsgICpDhKgyGU3YcDVAIo
         NOexIJACBORaJZPCTw5GwHfYnOg7EhM+eALPM4I2p5QDJL506STmO/UKmS/QetaQkTrG
         8lsYOkPKq7SB/vB2xYkF3IbztFpC41ImFcI8PaHT2747Ikmay3X4o99TeF5Xb0Pe2uFB
         sT7jhVtuda60ce8XfQj5ZnGzV+QP28k5A1/Ba/PSJ4hgTSXt68eMiSMnsFSqWKHeIk2l
         VS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7iPjvVBkxA680ag2bFZiQv0dtTJ8G47RSHlibrOxWUg=;
        b=EzjYuBjA+pRAurTECflWitXPjxZL4kchMDhXUIFLenlh4jzBGGudhY5tNOwOoFie40
         nQueklo/HiGcE/jo4y4irN50Mmj6EWQbN1QTk/7Vpq1y90gX4XFac3iNQ+J0K7503GKI
         G1tt5WrkaZYmmyJIgAi+7o+5ZXl0loTcN2L85cOr5/CxeoyWBAAcl6MRg0uauDPaci7Q
         QFkv1Eo4b3nsjEDPuHPY3iEpWqRUH3yIZX3WToVt2AfChVklR7+m574CvysvZ4LjGIGe
         ra/EHlPpw5xzWfQeAWh4pZCHNCoxx1BkUGPZet5wJqGWL7Wl8o7FQseCcFp5kS7C0Ny+
         gOWQ==
X-Gm-Message-State: AOAM532ujLu5s9vi+TKMSBY9PbrlGvH9SgD6uJG0JaGJoGzGaSu0Hg54
	7LD1ISg7Pv3QF5UCEM6vdIlJciIgteM=
X-Google-Smtp-Source: 
 ABdhPJzBDKb0ksavR2s1PoOSWRl/SBXoAn6QaQneUoJWwffbA56kIrXdeWptwJPp6bHlN7kL/k0DAA==
X-Received: by 2002:a17:906:854b:b0:6f4:58a7:5a07 with SMTP id
 h11-20020a170906854b00b006f458a75a07mr23487642ejy.440.1652871530832;
        Wed, 18 May 2022 03:58:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:58:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/49] python3-setuptools: upgrade 59.5.0 -> 62.3.1
Date: Wed, 18 May 2022 12:57:57 +0200
Message-Id: <20220518105843.3299331-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:58:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165800

This was held by numpy rejecting setuptools >= 60.x,
however it got a workaround in recent point releases
and so the upgrade can proceed.

Drop 0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
as changed code completely removed upstream.

Replicate another distutils/sysconfig.py fix from python recipe via
0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch

Add a tomli build dependency to python3-setuptools-scm as new
setuptools exposes:

|   File "/srv/work/alex/poky/build-64-alt/tmp/work/x86_64-linux/python3-setuptools-scm-native/6.4.2-r0/setuptools_scm-6.4.2/src/setuptools_scm/config.py", line 59, in _lazy_tomli_load
|     from tomli import loads
| ModuleNotFoundError: No module named 'tomli'

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ly-do-not-fetch-code-by-easy_install.patch |  6 +-
 .../python/python3-setuptools-scm_6.4.2.bb    |  2 +
 ...nfig-append-STAGING_LIBDIR-python-sy.patch | 35 -----------
 ...nfig.py-make-it-possible-to-substite.patch | 60 +++++++++++++++++++
 ...59.5.0.bb => python3-setuptools_62.3.1.bb} |  8 +--
 5 files changed, 68 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
 rename meta/recipes-devtools/python/{python3-setuptools_59.5.0.bb => python3-setuptools_62.3.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 5e2ee454da..a2b7a519af 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From da88c57fe03e4474ba20325edacf519e80c1d7a8 Mon Sep 17 00:00:00 2001
+From d1b4fa4a99774878035a0f664ec0d9686e7f0c89 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index fc848d0..c04a5de 100644
+index 444d3b3..61e445a 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -642,6 +642,11 @@ class easy_install(Command):
+@@ -648,6 +648,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and rmtree(tmpdir)
  
      def easy_install(self, spec, deps=False):
diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
index e09c598bf5..9aaae071d3 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
@@ -11,6 +11,8 @@ inherit pypi python_setuptools_build_meta
 
 UPSTREAM_CHECK_REGEX = "setuptools_scm-(?P<pver>.*)\.tar"
 
+DEPENDS += "python3-tomli-native"
+
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-packaging \
     ${PYTHON_PN}-pyparsing \
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
deleted file mode 100644
index 3150187951..0000000000
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1ff575308248b183639c8cb14afee7c8572bd2b8 Mon Sep 17 00:00:00 2001
-From: Tim Orling <timothy.t.orling@intel.com>
-Date: Wed, 20 Oct 2021 17:38:10 +0000
-Subject: [PATCH] _distutils/sysconfig: append
- STAGING_LIBDIR/python-sysconfigdata to sys.path
-
-When python modules set SETUPTOOLS_USE_DISTULS='local', this uses the
-vendored _distutils in setuptools rather than distutils in the Standard
-Library. This is needed so that target configuration can be used with
-python3-setuptools-native.
-
-Based on python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
-from Alex Kanavin <alex.kanavin@gmail.com>
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
-
----
- setuptools/_distutils/sysconfig.py | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index d36d94f..616eb91 100644
---- a/setuptools/_distutils/sysconfig.py
-+++ b/setuptools/_distutils/sysconfig.py
-@@ -484,6 +484,8 @@ def _init_posix():
-             multiarch=getattr(sys.implementation, '_multiarch', ''),
-         ),
-     )
-+    if 'STAGING_LIBDIR' in os.environ:
-+        sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfigdata')
-     try:
-         _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
-     except ImportError:
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
new file mode 100644
index 0000000000..c1b3dd6a30
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -0,0 +1,60 @@
+From 41f78746cbe88d263400ee948abef5b3f89cce29 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 11 May 2022 21:41:14 +0200
+Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
+ prefix to target sysroot
+
+This is done by probing STAGING_INCDIR/STAGING_LIBDIRenv vars:
+not the most elegant solution, but distutils/sysconfig has been
+tweaked to do this for many, many year, and so it's easiest
+to replicate here as well, the original is
+meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+
+I'm not sure exactly why setuptools now needs a copy, and what
+would happen to this module in light of distutils deprecation.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ setuptools/_distutils/sysconfig.py | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
+index 55a42e1..ead63b9 100644
+--- a/setuptools/_distutils/sysconfig.py
++++ b/setuptools/_distutils/sysconfig.py
+@@ -102,7 +102,9 @@ def get_python_inc(plat_specific=0, prefix=None):
+     If 'prefix' is supplied, use it instead of sys.base_prefix or
+     sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
+     """
+-    if prefix is None:
++    if prefix is None and os.environ.get('STAGING_INCDIR', ""):
++        prefix = os.environ['STAGING_INCDIR'].rstrip('include')
++    elif prefix is None:
+         prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
+     if os.name == "posix":
+         if IS_PYPY and sys.version_info < (3, 8):
+@@ -167,7 +169,13 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+ 
+     early_prefix = prefix
+ 
+-    if prefix is None:
++    if os.environ.get('STAGING_LIBDIR', ""):
++        lib_basename = os.environ['STAGING_LIBDIR'].split('/')[-1]
++    else:
++        lib_basename = "lib"
++    if prefix is None and os.environ.get('STAGING_LIBDIR', ""):
++        prefix = os.environ['STAGING_LIBDIR'].rstrip(lib_basename)
++    elif prefix is None:
+         if standard_lib:
+             prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
+         else:
+@@ -182,7 +190,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+             # Pure Python
+             libdir = "lib"
+         implementation = 'pypy' if IS_PYPY else 'python'
+-        libpython = os.path.join(prefix, libdir,
++        libpython = os.path.join(prefix, lib_basename,
+                                  implementation + get_python_version())
+         return _posix_lib(standard_lib, libpython, early_prefix, prefix)
+     elif os.name == "nt":
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_62.3.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_62.3.1.bb
index f2810e18d3..c9367c180f 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_62.3.1.bb
@@ -8,12 +8,10 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI += "\
-    file://0001-change-shebang-to-python3.patch \
-    file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
-"
+SRC_URI += "file://0001-change-shebang-to-python3.patch \
+            file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb77573f6e2fa4fad0"
+SRC_URI[sha256sum] = "28c79c24d83c42a5e6d6cc711e5e9a6c1b89326229feaa5807fc277040658600"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.30.2


