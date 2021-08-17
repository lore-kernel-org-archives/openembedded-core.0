Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.40936.1629214057256699399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 08:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jTRnxlgO;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id t3so23429961qkg.11
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 08:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ItZgsTeXcsNvbQOKYgKBsOJnMUIjLnohlbCxNEBzDhQ=;
        b=jTRnxlgOc6c+R5jbvODC6sHpZcXwbhXh2+qnGrLNrTGQGUhu00YIWg5Dz8L/ZG5eUl
         A5jEXrov9oQe4b81qF1ta77Eud7rF7n/xGK53PueER9CU8zxf38QiMxpa+4EkIBbzZOB
         +nrblxSF6ZXF8ja6k559qsTS2eDXH7Ul9ba6ZPUzKAn3YCtlc3HZ+lLjjQLbZNFJVJ3O
         mzfG+QgNndKExdivMCUq5GXCsJdlou6RsTOtQ97qDN3yrHdc8dpwb95dHBWAhXJKey35
         EPYB88Ym2znyAeSNXzwzDjw8deeq5uLyGrUOfGAVkyaNVsIuWPbonyI/ISielH7VcEYU
         0aJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ItZgsTeXcsNvbQOKYgKBsOJnMUIjLnohlbCxNEBzDhQ=;
        b=JFM5Ix8ThQFRlfk6VEAFLNvMPXd33i0yJaWRyp0hIhrjQvq/KNqEx9s3ocMM8/kazQ
         ia+BELcgK/v+SkcS/k9gXzT5bmotoXOtKQgTyNAet1UZ0vRXlsN9u0bsjwaonDpTfmBE
         mzsnM4HC7oyNn36/5lYFFd5Bmcm8N73+YPWAmkel6UuowBFsr5hcE13/+0mXFFijpSZP
         c5qsB+IoztqiKtxvlzY/SSOP1he3AgJD1mbU81Y1vTZLfeaX25bH7q1YILmjlWchzB+C
         d5OUSkmZY9aKSJ/VWKCLsqagIXc4vm5crR6ziTDL7O4S2UXzoLVAysACMI+YJ1cuj0pm
         BpDA==
X-Gm-Message-State: AOAM532nB+F5+EE09QCM+Qk/ZBVaXt01+AKS9wi+Ymk05nu3XxVdh2nh
	34l8nIrR0XxikNFH8kxTK/+OI6lO89olMw==
X-Google-Smtp-Source: ABdhPJzfAtZt0zUvrn2zV19xBDSQWAud5iZDEzXrfpFqqUmWG+d+yiHAO+96EdPy7h1hPWoD+E00oA==
X-Received: by 2002:a05:620a:69b:: with SMTP id f27mr4388711qkh.414.1629214056387;
        Tue, 17 Aug 2021 08:27:36 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id h6sm1175744qtb.44.2021.08.17.08.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 08:27:35 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] lttng-modules: update to 2.13.0
Date: Tue, 17 Aug 2021 11:27:30 -0400
Message-Id: <91f494738fb9c63499fae982fb7b09cb29c3afed.1629213685.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1629213685.git.bruce.ashfield@gmail.com>
References: <cover.1629213685.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating to 2.13.0, so we can pick up the latest -stable and
support for 5.14+ kernels.

We refresh one patch for new context, and update the LICENSE
checksum due to commit 2df37e95fa4303 [Cleanup: Move headers from
toplevel to include/lttng/]. which impacted the LICENSE file (but
licensing is the same).

MODULES_MODULE_SYMVERS_LOCATION must also be specified in this
release, as the lttng build has moved the module target to a
'src' subdirectory.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...fail-if-CONFIG_TRACEPOINTS-is-not-en.patch | 32 ++++++-------------
 ...ules_2.12.6.bb => lttng-modules_2.13.0.bb} |  6 ++--
 2 files changed, 14 insertions(+), 24 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.12.6.bb => lttng-modules_2.13.0.bb} (88%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch b/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch
index e411242272..a852834344 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch
@@ -13,37 +13,25 @@ available, allowing it to be kept being pulled by default.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+[bva: modified for lttng-modules 2.13+ context]
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
 ---
  Makefile | 9 +++++----
  1 file changed, 5 insertions(+), 4 deletions(-)
 
-diff --git a/Makefile b/Makefile
-index 8602649..75550cc 100644
---- a/Makefile
-+++ b/Makefile
-@@ -8,10 +8,7 @@ ifneq ($(KERNELRELEASE),)
-   # and defines the modules to be built.
+Index: lttng-modules-2.13.0/Makefile
+===================================================================
+--- lttng-modules-2.13.0.orig/Makefile
++++ lttng-modules-2.13.0/Makefile
+@@ -7,6 +7,11 @@
  
-   ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
--    ifeq ($(CONFIG_TRACEPOINTS),)
--      $(error The option CONFIG_TRACEPOINTS needs to be enabled in your kernel configuration)
--    endif # CONFIG_TRACEPOINTS
--  endif # ifdef CONFIG_LOCALVERSION
-+    ifneq ($(CONFIG_TRACEPOINTS),)
- 
-   TOP_LTTNG_MODULES_DIR := $(shell dirname $(lastword $(MAKEFILE_LIST)))
- 
-@@ -94,6 +91,10 @@ ifneq ($(KERNELRELEASE),)
-   obj-$(CONFIG_LTTNG) += lib/
-   obj-$(CONFIG_LTTNG) += tests/
+ obj-$(CONFIG_LTTNG) += src/
  
-+    else
++  ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
++    ifneq ($(CONFIG_TRACEPOINTS),)
 +      $(warning The option CONFIG_TRACEPOINTS needs to be enabled in your kernel configuration)
 +    endif # CONFIG_TRACEPOINTS
 +  endif # ifdef CONFIG_LOCALVERSION
  else # KERNELRELEASE
  
  # This part of the Makefile is used when the 'make' command is runned in the
--- 
-2.1.4
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb
similarity index 88%
rename from meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb
index c46faaee58..b95d7ecaaf 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
 DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
 HOMEPAGE = "https://lttng.org/"
 LICENSE = "LGPLv2.1 & GPLv2 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0464cff101a009c403cd2ed65d01d4c4"
 
 inherit module
 
@@ -13,12 +13,14 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            "
 
-SRC_URI[sha256sum] = "95ac2a2cf92d85d23ffbdaca6a1ec0d7c167211d1e0fb850ab90004a3f475eaa"
+SRC_URI[sha256sum] = "5ebf2b3cd128b3a1c8afaea1e98d5a6f7f0676fd524fcf72361c34d9dc603356"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
 EXTRA_OEMAKE += "KERNELDIR='${STAGING_KERNEL_DIR}'"
 
+MODULES_MODULE_SYMVERS_LOCATION = "src"
+
 do_install:append() {
 	# Delete empty directories to avoid QA failures if no modules were built
 	find ${D}/${nonarch_base_libdir} -depth -type d -empty -exec rmdir {} \;
-- 
2.19.1

