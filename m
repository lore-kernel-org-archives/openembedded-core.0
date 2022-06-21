Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D41CCA47E
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:16:56 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.48352.1655842612433487191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bWoMXnv2;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id h23so29787086ejj.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9XAwPOedvybPPVgluX96gN27ZGYixRLwW9Gj46X5Gkc=;
        b=bWoMXnv2BGlDttSdzCSCHPzjjzWA15YNe2zxn6fpSeahgPwN+13tNKLUEOMeFxj426
         beXGWvUXKeMGiyhDLWXOPUn03AXTSlfpFaexaGHlkjHkQs2lz9sjHGHd7jENZuOWvypa
         osSg/prSbt0522xRa81Of0Mp6QxY7qX1Hk5HIioR/qWSxNILTRMz9xu0Nwqw+8Tf2TPL
         5vwc7kjsh0ZemEHgUGIqFQDQOpV0sZi3WU/kE8sAFzx+AE5CeAzvxmn7dUv77xEr574H
         xmthvuCZPA3vc4mUCgjArB0SEs4/Kykoar3vhj9h5mw3mG/92iVgkTrjF0N/EqLyv40n
         4IGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9XAwPOedvybPPVgluX96gN27ZGYixRLwW9Gj46X5Gkc=;
        b=LQYICUMTsCQZ1Gxa4Lb8962jd8lqFDWnhwQLjt4QVafwskLS+7ApQTEfZ1LPz4+QW1
         //7i2rk01TI4sj8Nbo+GWsXnZ99BJYG94BTzu7iy1Z/k8ZI+YjMxGoRE5G8M41qcJ97o
         AolTT/k1d0s/z9X7SVrC+uDFVoqPrJaxdSH+l+E1AKvmgNWMPDEc6EjDtfDZn5f8IkJh
         2Q3+Fl7/NPk4CctuUJq459yjnrAf+5XTY1EOHbaKjVpzmPNAzhWk267bI0bgrkEqNgK4
         xMRAzpvwi3dO/j7sKI8eEiOGBD2bCFsoWUf+2XeuflCYV+mxW6xIh//3N2cWSK10JaOp
         iBIQ==
X-Gm-Message-State: AJIora9BkgBpvzDmLo1xrwep4mBMp7VH47gkIQkVNgXRj/Jd29jcW6bN
	7t/Lsa6CI6hsy0jduhZu24v2+/mm/o3Mkg==
X-Google-Smtp-Source: 
 AGRyM1vgSA+xKcF/VePMms4pnrEnetTW7i5kwm/kFFwr6c4NoUcIF4qIgkfDrMF5Tc+X8hIbWQYlgA==
X-Received: by 2002:a17:906:9b86:b0:6fe:d37f:b29d with SMTP id
 dd6-20020a1709069b8600b006fed37fb29dmr27511522ejc.327.1655842610920;
        Tue, 21 Jun 2022 13:16:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a056402238800b0043590660f16sm3420890eda.35.2022.06.21.13.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:16:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/18] python3-setuptools: update 62.3.2 -> 62.5.0
Date: Tue, 21 Jun 2022 22:16:24 +0200
Message-Id: <20220621201637.1378306-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621201637.1378306-1-alex@linutronix.de>
References: <20220621201637.1378306-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 20:16:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167173

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ly-do-not-fetch-code-by-easy_install.patch |  2 +-
 ...nfig.py-make-it-possible-to-substite.patch | 35 +++++++++----------
 ...62.3.2.bb => python3-setuptools_62.5.0.bb} |  2 +-
 3 files changed, 19 insertions(+), 20 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_62.3.2.bb => python3-setuptools_62.5.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index b28865291c..6d4a9ff0a2 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From d03595e69cc532e27c0d3d535f08107349669d3d Mon Sep 17 00:00:00 2001
+From 5dfa8a8e0b1ad4712a8b8309c8663b7b598ba2a8 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index c1b3dd6a30..e1960b8d9f 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From 41f78746cbe88d263400ee948abef5b3f89cce29 Mon Sep 17 00:00:00 2001
+From 3fd8fcd33d2b0f3ac2fc043eac8641ab4432967d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -15,26 +15,25 @@ would happen to this module in light of distutils deprecation.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
- setuptools/_distutils/sysconfig.py | 14 +++++++++++---
- 1 file changed, 11 insertions(+), 3 deletions(-)
+ setuptools/_distutils/sysconfig.py | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index 55a42e1..ead63b9 100644
+index e41d51e..c17a79a 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
-@@ -102,7 +102,9 @@ def get_python_inc(plat_specific=0, prefix=None):
-     If 'prefix' is supplied, use it instead of sys.base_prefix or
+@@ -119,6 +119,8 @@ def get_python_inc(plat_specific=0, prefix=None):
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
--    if prefix is None:
-+    if prefix is None and os.environ.get('STAGING_INCDIR', ""):
-+        prefix = os.environ['STAGING_INCDIR'].rstrip('include')
-+    elif prefix is None:
-         prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
-     if os.name == "posix":
-         if IS_PYPY and sys.version_info < (3, 8):
-@@ -167,7 +169,13 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+     default_prefix = BASE_EXEC_PREFIX if plat_specific else BASE_PREFIX
++    if os.environ.get('STAGING_INCDIR', ""):
++        default_prefix = os.environ['STAGING_INCDIR'].rstrip('include')
+     resolved_prefix = prefix if prefix is not None else default_prefix
+     try:
+         getter = globals()[f'_get_python_inc_{os.name}']
+@@ -221,7 +223,13 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
  
      early_prefix = prefix
  
@@ -49,12 +48,12 @@ index 55a42e1..ead63b9 100644
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
          else:
-@@ -182,7 +190,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+@@ -236,7 +244,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
              # Pure Python
              libdir = "lib"
          implementation = 'pypy' if IS_PYPY else 'python'
--        libpython = os.path.join(prefix, libdir,
-+        libpython = os.path.join(prefix, lib_basename,
-                                  implementation + get_python_version())
+-        libpython = os.path.join(prefix, libdir, implementation + get_python_version())
++        libpython = os.path.join(prefix, lib_basename, implementation + get_python_version())
          return _posix_lib(standard_lib, libpython, early_prefix, prefix)
      elif os.name == "nt":
+         if standard_lib:
diff --git a/meta/recipes-devtools/python/python3-setuptools_62.3.2.bb b/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_62.3.2.bb
rename to meta/recipes-devtools/python/python3-setuptools_62.5.0.bb
index 406a4bd4e7..b3286d5dab 100644
--- a/meta/recipes-devtools/python/python3-setuptools_62.3.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "a43bdedf853c670e5fed28e5623403bad2f73cf02f9a2774e91def6bda8265a7"
+SRC_URI[sha256sum] = "a4c782ac58fcc9e3a86e5e1a4c74cf9d24bf21e4f1562043309022e1bb76951c"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.30.2


