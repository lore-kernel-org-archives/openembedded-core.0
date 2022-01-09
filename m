Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCD2C433EF
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:27:56 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.23774.1641767275951772738
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PP9zMc2u;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id l10so23331664wrh.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WdyzQWrisC+GVcswflsasZsRy7zvAfiyx1iZP2PgFTA=;
        b=PP9zMc2uSOMjUfMirY1kyIdJ0H3KIrApiBCfJI1HRDD/Gp3V25jBct1nDeAmoAFQM/
         hg4sUIRLpFgOGIsJ/oh+wHffTbCFbuSStlRIwECEXYllb8yiJgDN5FNG5JqqhmHq0WZl
         DgHuWlG+CkqmIxG/WENjyX01pUzdySnjjELBtToVkC/lmT0sxj2Gv2ScfkSVlD+2cgxb
         Q6s+n2uOtjMVR2XreGpVPSsImH/NO/5A5QKov7XqGC0QGQRZeHnKjN06iQ6MQ4gGRjyN
         EansMB1UrIKbhp7lIpa9Bf/pquhQHc5JX9qobSw/LqK9cebnTOZCqoWPagjnf8d/vQTn
         Yo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WdyzQWrisC+GVcswflsasZsRy7zvAfiyx1iZP2PgFTA=;
        b=f98odkgGwTGJXIiMUQAbmcHhzDC5OGIy3g28DiS24Z8xsWKfdaAgfRwoJ+QwYuh8ah
         AsW2VyQ6uNvUGDHab76kYEdH+/+0gpq0ev3Lx/TKYSrWGJWdrx8BNtoYmuQ/PvEREzbY
         3JAsZxcCciN3UkzktCM7wNuTtB/6lYcF4Tx+qFbvlOT6VhDJm14pq/fQNXdJb1MzBb+b
         i+vGwSIM2w0LcflOC4G0nvH1eJ7gD2sfgXuqHQnz/iwMW6JSgFPKXRfxDNvxJBB+12D9
         ZrUc6zObW9TNYNnd1LqNR/kpDExMHbzgDvzEPUXOCS09301A6xWfFwWs2vXl95hL7Cwm
         oOKQ==
X-Gm-Message-State: AOAM533OmQnjKSKiUvH5EkTHOzL8DLFFzogDE5EHlJ7tCdvp+WznJF3t
	lrpQ+RwrcHfHu2svB37X3fSx+r/yoPo=
X-Google-Smtp-Source: 
 ABdhPJzuPeEA/DwRcvnTG1qXOVA2YkKW8Z7fvLvt69CwrYK1cG/28PdmiHHa2zkjovbkGfDDIWUUaw==
X-Received: by 2002:adf:f789:: with SMTP id q9mr120175wrp.200.1641767274431;
        Sun, 09 Jan 2022 14:27:54 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l6sm6804319wry.18.2022.01.09.14.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:27:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/14] python3-numpy: update 1.21.4 -> 1.22.0
Date: Sun,  9 Jan 2022 23:27:24 +0100
Message-Id: <20220109222732.2252416-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220109222732.2252416-1-alex@linutronix.de>
References: <20220109222732.2252416-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:27:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160309

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-numpy-core-Define-RISCV-32-support.patch | 40 ++++++++-----------
 ...y-core-setup.py-disable-svml-for-now.patch | 29 ++++++++++++++
 ...umpy_1.21.5.bb => python3-numpy_1.22.0.bb} |  5 ++-
 3 files changed, 49 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-numpy/0001-numpy-core-setup.py-disable-svml-for-now.patch
 rename meta/recipes-devtools/python/{python3-numpy_1.21.5.bb => python3-numpy_1.22.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
index b60ca1d216..676bdbb3af 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
@@ -1,4 +1,4 @@
-From dbcf296f84e5cef6a3ff0f1c469a4508f1e0fb15 Mon Sep 17 00:00:00 2001
+From eb6d6579150bf4684603ce377c51e90ad3bb8109 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Nov 2020 15:32:39 -0800
 Subject: [PATCH] numpy/core: Define RISCV-32 support
@@ -8,39 +8,33 @@ Helps compile on riscv32
 Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- numpy/core/include/numpy/npy_cpu.h    | 9 +++++++--
+ numpy/core/include/numpy/npy_cpu.h    | 3 +++
  numpy/core/include/numpy/npy_endian.h | 1 +
- 2 files changed, 8 insertions(+), 2 deletions(-)
+ 2 files changed, 4 insertions(+)
 
 diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
-index 4dbf9d84e..bc41a7eda 100644
+index 78d229e..04be511 100644
 --- a/numpy/core/include/numpy/npy_cpu.h
 +++ b/numpy/core/include/numpy/npy_cpu.h
-@@ -18,6 +18,7 @@
-  *              NPY_CPU_ARCEL
+@@ -19,6 +19,7 @@
   *              NPY_CPU_ARCEB
   *              NPY_CPU_RISCV64
+  *              NPY_CPU_LOONGARCH
 + *              NPY_CPU_RISCV32
   *              NPY_CPU_WASM
   */
- #ifndef _NPY_CPUARCH_H_
-@@ -100,8 +101,12 @@
-     #define NPY_CPU_ARCEL
- #elif defined(__arc__) && defined(__BIG_ENDIAN__)
+ #ifndef NUMPY_CORE_INCLUDE_NUMPY_NPY_CPU_H_
+@@ -104,6 +105,8 @@
      #define NPY_CPU_ARCEB
--#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 64
--    #define NPY_CPU_RISCV64
-+#elif defined(__riscv)
-+    #if __riscv_xlen == 64
-+	#define NPY_CPU_RISCV64
-+    #elif __riscv_xlen == 32
-+	#define NPY_CPU_RISCV32
-+    #endif
+ #elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 64
+     #define NPY_CPU_RISCV64
++#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 32
++    #define NPY_CPU_RISCV32
+ #elif defined(__loongarch__)
+     #define NPY_CPU_LOONGARCH
  #elif defined(__EMSCRIPTEN__)
-     /* __EMSCRIPTEN__ is defined by emscripten: an LLVM-to-Web compiler */
-     #define NPY_CPU_WASM
 diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/include/numpy/npy_endian.h
-index aa367a002..d59484573 100644
+index 5e58a7f..0926212 100644
 --- a/numpy/core/include/numpy/npy_endian.h
 +++ b/numpy/core/include/numpy/npy_endian.h
 @@ -49,6 +49,7 @@
@@ -48,9 +42,9 @@ index aa367a002..d59484573 100644
              || defined(NPY_CPU_ARCEL)         \
              || defined(NPY_CPU_RISCV64)       \
 +            || defined(NPY_CPU_RISCV32)       \
+             || defined(NPY_CPU_LOONGARCH)     \
              || defined(NPY_CPU_WASM)
          #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
-     #elif defined(NPY_CPU_PPC)                \
 -- 
-2.29.2
+2.20.1
 
diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-setup.py-disable-svml-for-now.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-setup.py-disable-svml-for-now.patch
new file mode 100644
index 0000000000..66e322116a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-setup.py-disable-svml-for-now.patch
@@ -0,0 +1,29 @@
+From 0f0601e79f9ce7614d157284523e6cd8af2259d5 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 5 Jan 2022 12:12:47 +0100
+Subject: [PATCH] numpy/core/setup.py: disable svml for now
+
+The check really doesn't work in cross compiling,
+as it is using host python to see what arch we're
+building on. Issue reported upstream:
+https://github.com/numpy/numpy/issues/20736
+
+Upstream-Status: Inappropriate [needs upstream fix]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ numpy/core/setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/numpy/core/setup.py b/numpy/core/setup.py
+index a5f423d..945f2dd 100644
+--- a/numpy/core/setup.py
++++ b/numpy/core/setup.py
+@@ -70,7 +70,7 @@ def can_link_svml():
+     """
+     machine = platform.machine()
+     system = platform.system()
+-    return "x86_64" in machine and system == "Linux"
++    return False
+ 
+ def check_svml_submodule(svmlpath):
+     if not os.path.exists(svmlpath + "/README.md"):
diff --git a/meta/recipes-devtools/python/python3-numpy_1.21.5.bb b/meta/recipes-devtools/python/python3-numpy_1.22.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-numpy_1.21.5.bb
rename to meta/recipes-devtools/python/python3-numpy_1.22.0.bb
index bdf99b492b..556e2dd5c9 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.21.5.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.22.0.bb
@@ -11,8 +11,9 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
-"
-SRC_URI[sha256sum] = "1a7ee0ffb35dc7489aebe5185a483f4c43b0d2cf784c3c9940f975a7dde56506"
+           file://0001-numpy-core-setup.py-disable-svml-for-now.patch \
+           "
+SRC_URI[sha256sum] = "f2be14ba396780a6f662b8ba1a24466c9cf18a6a386174f614668e58387a13d7"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.20.1


