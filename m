Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BF5C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 15:18:08 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.12332.1651763883867013209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 08:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZNNE7WEO;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id i27so9344972ejd.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 08:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o8oNPAISlXpL3C2BgswleDXAizNs5qvnvoR+jHrVmSI=;
        b=ZNNE7WEO3BOX/3SRchcZ9JaRu0Cxygq+W+samfkxnGzyWrwoaGhv5nyyiXPVLTxtMt
         7WNGICFGBYAiNnzV3fo/IVCojpACAht5qjjmNpGoPjLOfgt8K/Cb8FbhP7YAufT7Pl66
         94s5Fa9/ZDH4164kbVyZl3828K8Wc88f5KlkIJX60UMWQWoJO9+QnopovUM3x/Ksb9F2
         hylciRJFtAet6wwYqpcMIKUSyiZ/aI16YG+mJ78c7rPvnK46QNW1lALQ+ll7SEq91CbE
         AlMq3XcBHr8x6WySV0WktOxMDwsC1gjIvOP4aOT24xRmIc4UqOda0G4lXjFb59geLsN5
         JWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o8oNPAISlXpL3C2BgswleDXAizNs5qvnvoR+jHrVmSI=;
        b=ZWrRd32Ry0eDjR40oV47uMYvv8zAV4If2AVS57kAR4rN1s9urFsyZRGZbcyw75w6eV
         IkkvZV6zFKWq3+irJhL/juvge5VDx/uJ7P873hg2IK/OvRE/ab3ho1tudOUl0ahX9L9k
         Wcm27kBNoMQ18Jzf2JtU+C/TmXs0qcHbnP6rX39Cp4RxUDULmJgiNpEGKyxp0QRYxfXk
         ljhmmWSq7Yu7Jqla0UPU1uCXltHBTcEYI5cs02Rb+YoEQFy9QXFMztt8qhjE35drG5lc
         N/gTEQ7ony/lmHzNrTdJr2ss7F7JOUfxRgr0uwxk7dCWbBn+YjOYNGpJNxErbaC8wWw3
         SD1w==
X-Gm-Message-State: AOAM531yb/x/QdqL5KZ4TKYwcNndAVeqwkJTxrE9EdfsD1xJ0TcPBump
	O30sQ+tEUIFNIxPsvE2SHvyiWQZ2LIM=
X-Google-Smtp-Source: 
 ABdhPJw1aC4ZriSgZO6m8oAV5ILgzFZ7cTrct0glA5KbFm1dEfpCZo9aOxoGm9laSxLIpJHJx1Trag==
X-Received: by 2002:a17:907:100e:b0:6f3:8efd:107b with SMTP id
 ox14-20020a170907100e00b006f38efd107bmr26010442ejb.745.1651763882221;
        Thu, 05 May 2022 08:18:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 hz11-20020a1709072ceb00b006f3ef214ddfsm847777ejc.69.2022.05.05.08.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 08:18:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] python3-setuptools: upgrade 59.5.0 -> 62.1.0
Date: Thu,  5 May 2022 17:17:56 +0200
Message-Id: <20220505151757.2099433-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 15:18:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165301

From: Alexander Kanavin <alex.kanavin@gmail.com>

This was held by numpy rejecting setuptools >= 60.x,
however they added a workaround in recent point releases
and so the upgrade can proceed.

Drop 0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
as changed code completely removed upstream.

Add a tomli build dependency to python3-setuptools-scm as new
setuptools exposes:

|   File "/srv/work/alex/poky/build-64-alt/tmp/work/x86_64-linux/python3-setuptools-scm-native/6.4.2-r0/setuptools_scm-6.4.2/src/setuptools_scm/config.py", line 59, in _lazy_tomli_load
|     from tomli import loads
| ModuleNotFoundError: No module named 'tomli'

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ly-do-not-fetch-code-by-easy_install.patch |  6 ++--
 .../python/python3-setuptools-scm_6.4.2.bb    |  2 ++
 ...nfig-append-STAGING_LIBDIR-python-sy.patch | 35 -------------------
 ...59.5.0.bb => python3-setuptools_62.1.0.bb} |  7 ++--
 4 files changed, 7 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
 rename meta/recipes-devtools/python/{python3-setuptools_59.5.0.bb => python3-setuptools_62.1.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 5e2ee454da..5bbf14fd38 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From da88c57fe03e4474ba20325edacf519e80c1d7a8 Mon Sep 17 00:00:00 2001
+From d26d10b6142ac08fe1b878ebc8c2c93c9b6803ed Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_62.1.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_62.1.0.bb
index f2810e18d3..420c73d45f 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_62.1.0.bb
@@ -8,12 +8,9 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI += "\
-    file://0001-change-shebang-to-python3.patch \
-    file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
-"
+SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb77573f6e2fa4fad0"
+SRC_URI[sha256sum] = "47c7b0c0f8fc10eec4cf1e71c6fdadf8decaa74ffa087e68cd1c20db7ad6a592"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.30.2


