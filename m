Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57944C4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:09 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.9634.1633945268492836399
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ku92Fq9K;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id k7so53983722wrd.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LdxNBKQ8EoOMiURRfQ3RJWFPbw93MkwqWzdCxSfZT8o=;
        b=Ku92Fq9Kp5RY7tzNuGM33htusgBjphs2HBwc6L7346b+FHt02T4hFv1gXcQfkAmn8n
         77IWq2zpxakepnQ2d+f7Oebp3ZqdqSt6lzhuRTIOSra/GS3Cn3IK65h3qerI5zKOIgJ3
         6PrRp8U+Ds2mnawxeZFaI+zlJ17itAJOKhhKSzxqa1RBv5hTJotkNktmmVpEZZFccO1K
         mztuUrEKG1+OmGCOoUS2lDOx2ne98yt+gvKlb2Bo/BT4KaulBBN+07CcxSHehtJ1za4y
         C8MY4Tw4Xze1aKnWmKcFU7NqC0BXMDlh8wiStkUtvqh4kAYeRbRqse24Jo2yF0WwNYTb
         JU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LdxNBKQ8EoOMiURRfQ3RJWFPbw93MkwqWzdCxSfZT8o=;
        b=FtxBkBJqje83qIheu6OWYtJxa1XOPgNFKEnsDIdzakUdm0Mx+H0QNi2pD4/k47IHrD
         ediCGFgnIZ1phvA6Uog2Rya1+D7Vz/+amz9RLGTTHfnkEzZZnNi8KdZHnQGIiAQ7ad2P
         areXJkO1OnPQYUvBChvlFLc8U4FmDaru0e+udqFf9xrpe+Ha1a0QtKvWSqaGg33n/YlF
         tsHQf2Jbwmn5hokRpQK6Iwfx+D04Nc92fz/HdcClikg9Zq1fE++BbtLlOoLINhaMhv1b
         ui+VV8452oI+Li4+Lkwk9oNlvNHjgJpLfBrwtgVzdw4MpCxEWHyKfDT/unI2u3r3kyeR
         0sZQ==
X-Gm-Message-State: AOAM531YKzdcdQQwNCOv6MxyYQQOLJzDwdQKPX5oBcOlZ0ZF69TjUUST
	kcUFolS85FhaiifEmZNgcxsspyVhNIs=
X-Google-Smtp-Source: 
 ABdhPJxGUNPrHfnD2E4rUiIdElNjCEJsGOlUYxS9r6hzGzchN5Hx7RTGUzzt8HdQ+/9920czvvYcLg==
X-Received: by 2002:a05:600c:2157:: with SMTP id
 v23mr20252673wml.120.1633945266963;
        Mon, 11 Oct 2021 02:41:06 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/25] python3: update 3.9.6 -> 3.10.0
Date: Mon, 11 Oct 2021 11:40:40 +0200
Message-Id: <20211011094059.4184654-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156819

native and target 0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch
replaced by native-only 0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
which is more reboust against upstream changes, and keeps target code unmodified.

This however necessitated adding 0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
to avoid hardcoding 'lib' on target builds as libdir.

Drop chunk from 0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch as
upstream now uses sysconfig directly inside distutils.

Add 0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch and
0001-multiprocessing-disable-a-failing-test.patch to address ptest failures.

License-Update: copyright years, case corrections.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/python3-dir.bbclass              |  2 +-
 ...-search-system-for-headers-libraries.patch |  6 +--
 ...e-stdin-I-O-errors-same-way-as-maste.patch | 49 +++++++++++++++++++
 ...-use-libdir-values-from-configuratio.patch | 35 -------------
 ...-use-prefix-value-from-build-configu.patch | 34 +++++++++++++
 ...fig-append-STAGING_LIBDIR-python-sys.patch | 24 ++-------
 ...ssing-libraries-to-Extension-for-mul.patch | 15 +++---
 ...g.py-use-platlibdir-also-for-purelib.patch | 30 ++++++++++++
 ...tutils-prefix-is-inside-staging-area.patch | 14 +++---
 .../python/python3/makerace.patch             | 25 +++++++---
 .../{python3_3.9.6.bb => python3_3.10.0.bb}   | 10 ++--
 11 files changed, 160 insertions(+), 84 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
 rename meta/recipes-devtools/python/{python3_3.9.6.bb => python3_3.10.0.bb} (97%)

diff --git a/meta/classes/python3-dir.bbclass b/meta/classes/python3-dir.bbclass
index f51f971fc55..ff03e584d4c 100644
--- a/meta/classes/python3-dir.bbclass
+++ b/meta/classes/python3-dir.bbclass
@@ -1,4 +1,4 @@
-PYTHON_BASEVERSION = "3.9"
+PYTHON_BASEVERSION = "3.10"
 PYTHON_ABI = ""
 PYTHON_DIR = "python${PYTHON_BASEVERSION}"
 PYTHON_PN = "python3"
diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index a94fa0a5a97..46179ba1d18 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From 9da913bf5f39c6fe737219af7419170574d6fbfb Mon Sep 17 00:00:00 2001
+From cebb772d718a8f798ed5ae311a6e3e61534bea95 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
@@ -11,10 +11,10 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index a0bf9ea..da099bf 100644
+index 95e3e11..32a4d42 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -674,8 +674,8 @@ class PyBuildExt(build_ext):
+@@ -840,8 +840,8 @@ class PyBuildExt(build_ext):
              add_dir_to_list(self.compiler.include_dirs,
                              sysconfig.get_config_var("INCLUDEDIR"))
  
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
new file mode 100644
index 00000000000..d6aa9501a70
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
@@ -0,0 +1,49 @@
+From d8521ee967937184eadc59fff1a30740ad181a98 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 16 Sep 2021 16:35:37 +0200
+Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as master I/O
+ errors
+
+reading stdin can throw the same I/O errors as reading from master fd does,
+e.g. when running under Yocto's test harness:
+======================================================================
+ERROR: test_spawn_doesnt_hang (test.test_pty.PtyTest)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/lib/python3.10/test/test_pty.py", line 316, in test_spawn_doesnt_hang
+    pty.spawn([sys.executable, '-c', 'print("hi there")'])
+  File "/usr/lib/python3.10/pty.py", line 181, in spawn
+    _copy(master_fd, master_read, stdin_read)
+  File "/usr/lib/python3.10/pty.py", line 157, in _copy
+    data = stdin_read(STDIN_FILENO)
+  File "/usr/lib/python3.10/pty.py", line 132, in _read
+    return os.read(fd, 1024)
+OSError: [Errno 5] Input/output error
+
+So let's treat both channels the same.
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/28388]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Lib/pty.py | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Lib/pty.py b/Lib/pty.py
+index 8d8ce40df5..35439c6b96 100644
+--- a/Lib/pty.py
++++ b/Lib/pty.py
+@@ -154,7 +154,10 @@ def _copy(master_fd, master_read=_read, stdin_read=_read):
+                 os.write(STDOUT_FILENO, data)
+ 
+         if STDIN_FILENO in rfds:
+-            data = stdin_read(STDIN_FILENO)
++            try:
++                data = stdin_read(STDIN_FILENO)
++            except OSError:
++                data = b""
+             if not data:
+                 fds.remove(STDIN_FILENO)
+             else:
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch
deleted file mode 100644
index 1490cdbb18a..00000000000
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From deeedd1b8799294ab276ab7dbbfdb59c1dacc9a2 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 22 Oct 2020 13:10:34 +0200
-Subject: [PATCH] Lib/sysconfig.py: use libdir values from configuration file
-
-This allows correctly substituting them for target installs using
-native python.
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Lib/sysconfig.py | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index bf04ac5..ed0462b 100644
---- a/Lib/sysconfig.py
-+++ b/Lib/sysconfig.py
-@@ -20,10 +20,10 @@ __all__ = [
- 
- _INSTALL_SCHEMES = {
-     'posix_prefix': {
--        'stdlib': '{installed_base}/{platlibdir}/python{py_version_short}',
--        'platstdlib': '{platbase}/{platlibdir}/python{py_version_short}',
--        'purelib': '{base}/lib/python{py_version_short}/site-packages',
--        'platlib': '{platbase}/{platlibdir}/python{py_version_short}/site-packages',
-+        'stdlib': '{LIBDEST}',
-+        'platstdlib': '{LIBDEST}',
-+        'purelib': '{LIBDEST}/site-packages',
-+        'platlib': '{LIBDEST}/site-packages',
-         'include':
-             '{installed_base}/include/python{py_version_short}{abiflags}',
-         'platinclude':
--- 
-2.24.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
new file mode 100644
index 00000000000..b72c709130b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -0,0 +1,34 @@
+From aceaa16e25a8ab6a00f906c340843999635c8e23 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 10 Sep 2021 12:28:31 +0200
+Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
+ file
+
+This allows correctly substituting them for target installs using
+native python.
+
+Upstream-Status: Inappropriate [oe-core cross builds]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Lib/sysconfig.py | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
+index 95b48f6..84f6427 100644
+--- a/Lib/sysconfig.py
++++ b/Lib/sysconfig.py
+@@ -613,6 +613,11 @@ def get_config_vars(*args):
+             _init_non_posix(_CONFIG_VARS)
+         if os.name == 'posix':
+             _init_posix(_CONFIG_VARS)
++        _CONFIG_VARS['installed_base'] = _CONFIG_VARS['prefix']
++        _CONFIG_VARS['base'] = _CONFIG_VARS['prefix']
++        _CONFIG_VARS['installed_platbase'] = _CONFIG_VARS['prefix']
++        _CONFIG_VARS['platbase'] = _CONFIG_VARS['prefix']
++        _CONFIG_VARS['platlibdir'] = _CONFIG_VARS['PLATLIBDIR']
+         # For backward compatibility, see issue19555
+         SO = _CONFIG_VARS.get('EXT_SUFFIX')
+         if SO is not None:
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
index b982691b365..b323ed4dd0a 100644
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
@@ -1,4 +1,4 @@
-From e65bfe22c858872b08366aff49119d4145a77f40 Mon Sep 17 00:00:00 2001
+From 3a98c2eab187289dc8c55e36738c2c0f4216d906 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 31 Jan 2019 16:46:30 +0100
 Subject: [PATCH] distutils/sysconfig: append
@@ -10,28 +10,14 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- Lib/distutils/sysconfig.py | 2 ++
- Lib/sysconfig.py           | 2 ++
- 2 files changed, 4 insertions(+)
+ Lib/sysconfig.py | 2 ++
+ 1 file changed, 2 insertions(+)
 
-diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index b51629e..2df348c 100644
---- a/Lib/distutils/sysconfig.py
-+++ b/Lib/distutils/sysconfig.py
-@@ -438,6 +438,8 @@ def _init_posix():
-         platform=sys.platform,
-         multiarch=getattr(sys.implementation, '_multiarch', ''),
-     ))
-+    if 'STAGING_LIBDIR' in os.environ:
-+        sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfigdata')
-     _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
-     build_time_vars = _temp.build_time_vars
-     global _config_vars
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index b2d790b..405273c 100644
+index a78c0b1..f5c5efe 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
-@@ -419,6 +419,8 @@ def _init_posix(vars):
+@@ -474,6 +474,8 @@ def _init_posix(vars):
      """Initialize the module as appropriate for POSIX systems."""
      # _sysconfigdata is generated at build time, see _generate_posix_vars()
      name = _get_sysconfigdata_name()
diff --git a/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch b/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
index ea0af02e720..374433c68e5 100644
--- a/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
+++ b/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
@@ -1,4 +1,4 @@
-From 7019ba184b828ed7253750cf409fc5760ef90a54 Mon Sep 17 00:00:00 2001
+From bad7e6a625436402a01d03021fb9ccd58bc9930f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 9 Jan 2020 17:44:05 +0100
 Subject: [PATCH] setup.py: pass missing libraries to Extension for
@@ -50,20 +50,21 @@ Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  setup.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index ec3f2a4..b0f1541 100644
+index d92face..f42bcbb 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1671,7 +1671,7 @@ class PyBuildExt(build_ext):
-                                    libraries=libs,
-                                    include_dirs=["Modules/_multiprocessing"]))
- 
+@@ -1836,7 +1836,7 @@ class PyBuildExt(build_ext):
+             if (sysconfig.get_config_var('HAVE_SEM_OPEN') and not
+                 sysconfig.get_config_var('POSIX_SEMAPHORES_NOT_ENABLED')):
+                 multiprocessing_srcs.append('_multiprocessing/semaphore.c')
 -        self.add(Extension('_multiprocessing', multiprocessing_srcs,
 +        self.add(Extension('_multiprocessing', multiprocessing_srcs, libraries=['pthread'],
                             include_dirs=["Modules/_multiprocessing"]))
  
-     def detect_uuid(self):
+         if (not MS_WINDOWS and
diff --git a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
new file mode 100644
index 00000000000..2b5a7d308cb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
@@ -0,0 +1,30 @@
+From 93346d1a2f5d4f7085391bc7c1230d85ebe00606 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sun, 12 Sep 2021 21:44:36 +0200
+Subject: [PATCH] sysconfig.py: use platlibdir also for purelib
+
+This is needed in multilib configurations where hardcoding 'lib'
+is not correct.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Lib/sysconfig.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
+index b70d392..c418acd 100644
+--- a/Lib/sysconfig.py
++++ b/Lib/sysconfig.py
+@@ -27,7 +27,7 @@ _INSTALL_SCHEMES = {
+     'posix_prefix': {
+         'stdlib': '{installed_base}/{platlibdir}/python{py_version_short}',
+         'platstdlib': '{platbase}/{platlibdir}/python{py_version_short}',
+-        'purelib': '{base}/lib/python{py_version_short}/site-packages',
++        'purelib': '{base}/{platlibdir}/python{py_version_short}/site-packages',
+         'platlib': '{platbase}/{platlibdir}/python{py_version_short}/site-packages',
+         'include':
+             '{installed_base}/include/python{py_version_short}{abiflags}',
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index 5a39cf89331..cc64e3ecf7b 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,7 +1,7 @@
-From c52fa7948ef109db1132fdc1aee0b68f8d767b4e Mon Sep 17 00:00:00 2001
+From f6411021856bafedd784748ec33494151e783b51 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
-Subject: [PATCH 1/2] python3: Add target and native recipes
+Subject: [PATCH] python3: Add target and native recipes
 
 Upstream-Status: Inappropriate [embedded specific]
 
@@ -17,10 +17,10 @@ Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
  1 file changed, 11 insertions(+), 3 deletions(-)
 
 diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 4774e12..ccf7d58 100644
+index 3414a76..361d3a1 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
-@@ -95,7 +95,9 @@ def get_python_inc(plat_specific=0, prefix=None):
+@@ -277,7 +277,9 @@ def get_python_inc(plat_specific=0, prefix=None):
      If 'prefix' is supplied, use it instead of sys.base_prefix or
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
@@ -31,7 +31,7 @@ index 4774e12..ccf7d58 100644
          prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
      if os.name == "posix":
          if python_build:
-@@ -138,7 +140,13 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+@@ -320,7 +322,13 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
      If 'prefix' is supplied, use it instead of sys.base_prefix or
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
@@ -46,7 +46,7 @@ index 4774e12..ccf7d58 100644
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
          else:
-@@ -152,7 +160,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+@@ -334,7 +342,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
          else:
              # Pure Python
              libdir = "lib"
@@ -56,5 +56,5 @@ index 4774e12..ccf7d58 100644
          if standard_lib:
              return libpython
 -- 
-2.24.0
+2.20.1
 
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index 96744cb5570..b150c1cb38e 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,3 +1,8 @@
+From 8b8583fb4f2bb3421e31ef06d17c04deec431c7e Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 13 Jul 2021 23:19:29 +0100
+Subject: [PATCH] python3: Fix make race
+
 libainstall installs python-config.py but the .pyc cache files are generated
 by the libinstall target. This means some builds may not generate the pyc files
 for python-config.py depending on the order things happen in. This means builds
@@ -8,14 +13,18 @@ Add a dependency to avoid the race.
 Upstream-Status: Pending
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Index: Python-3.9.6/Makefile.pre.in
-===================================================================
---- Python-3.9.6.orig/Makefile.pre.in
-+++ Python-3.9.6/Makefile.pre.in
-@@ -1486,7 +1486,7 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter
- 		venv venv/scripts venv/scripts/common venv/scripts/posix \
- 		curses pydoc_data \
- 		zoneinfo
+---
+ Makefile.pre.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 69d47a2..c471b60 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1528,7 +1528,7 @@ TESTSUBDIRS=	ctypes/test \
+ 		unittest/test unittest/test/testmock
+ 
+ TEST_MODULES=@TEST_MODULES@
 -libinstall:	build_all $(srcdir)/Modules/xxmodule.c
 +libinstall:	build_all $(srcdir)/Modules/xxmodule.c libainstall
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
diff --git a/meta/recipes-devtools/python/python3_3.9.6.bb b/meta/recipes-devtools/python/python3_3.10.0.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3_3.9.6.bb
rename to meta/recipes-devtools/python/python3_3.10.0.bb
index 8a638b142b5..2e850710b68 100644
--- a/meta/recipes-devtools/python/python3_3.9.6.bb
+++ b/meta/recipes-devtools/python/python3_3.10.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python is a programming language that lets you work more quickly
 LICENSE = "PSFv2"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c22d2438294c784731bf9dd224a467b7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3dd7bed622743ef9b77169b3736f7990"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -28,18 +28,20 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
-           file://0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch \
            file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch \
            file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch \
            file://makerace.patch \
+           file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch \
+           file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
            "
 
 SRC_URI:append:class-native = " \
+           file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "397920af33efc5b97f2e0b57e91923512ef89fc5b3c1d21dbfc8c4828ce0108a"
+SRC_URI[sha256sum] = "5a99f8e7a6a11a7b98b4e75e0d1303d3832cada5534068f69c7b6222a7b1b002"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -55,7 +57,7 @@ CVE_CHECK_WHITELIST += "CVE-2019-18348"
 # This is windows only issue.
 CVE_CHECK_WHITELIST += "CVE-2020-15523"
 
-PYTHON_MAJMIN = "3.9"
+PYTHON_MAJMIN = "3.10"
 
 S = "${WORKDIR}/Python-${PV}"
 
-- 
2.20.1


