Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.12570.1614607075956316501
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 05:57:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jhivucZ7;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: idadelm@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id u14so16257384wri.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 05:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/a6AhsDkXEc8XrqChIMTvNMmgDBkWCmu3LtMi3UCzuA=;
        b=jhivucZ7RnRfZSfS8om57x6YhM1BvN7pMtKGbqIInZXHJ47u8vz5YQlmQ7U7iZk3de
         ymk5Lr9emBEft1cStluWnmbkaHkk8+uXLD44U4zOxLQ65sMht7vpY92HLTT+tIpz9FMu
         /xEv7HaVYmQevtYbGpTCHRq6j6iLVrP92HVlPIKLbwWV6SEGg6XpDf1K/nIzaRTBApfy
         9WIO8LjprBKXDTyGiGK9y02jGgoKZ5xaVrABYzgE/yi/w6pR4dbRSkkCzWACrCZM9j7E
         4mpXp1uP5pED64+MHLqejSFMfJcsjCMDHqpJlukw3KbNAflvOhD+an5rgcySigNEABBm
         hD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/a6AhsDkXEc8XrqChIMTvNMmgDBkWCmu3LtMi3UCzuA=;
        b=O3C/czGl6Z4FX9M3srSEvE4P8woTUFCBpUMdgLkSQRdloSWuvkSb77SRnDduOr/+6I
         g2YMeDH6s93/rw5AviLKcKon2xjmiQuIbIlA6igQ3mwLUVlKjx+vfnXKMu0uLl+egQhg
         AtuHK1xorEoXG0bvc5xENKv1ZHnwJra2G7AzqYi7IR1vykPTRTTkuJ1J20z1gjhdN0rA
         JzUtJZmLXWh+RzRnLBzLNXVcVA54e1P25LACqpVUlNiDWcODNNBJ6821nXB94QMaPvD/
         pxyCuGzDhXIhqZJdIr0MflZt5xW99BVz0GkmYVuihSY+wgDffcvAxRNM9qNcC/yf7v7v
         TUKA==
X-Gm-Message-State: AOAM531lGoKzL9CrHZ4hri+/+MkjIKpN6byQN9EohZxFV7fRSESryX8Q
	Dqg/FVoVix+7vyK9C+ZYu/fWXhAIqGmrwA==
X-Google-Smtp-Source: ABdhPJzVYsJrx/0HMNeISrMvJR96Z9CY5LGXwlKXZW+nKTE2R6fdt8ZVvwnkto4jI1H9mYzA6+70rw==
X-Received: by 2002:adf:80e7:: with SMTP id 94mr16807656wrl.5.1614607074054;
        Mon, 01 Mar 2021 05:57:54 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from localhost.localdomain ([154.72.153.131])
        by smtp.gmail.com with ESMTPSA id d13sm17611472wro.23.2021.03.01.05.57.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 05:57:53 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] recipes-kernel: Add missing HOMEPAGE and DESCRIPTION for recipes.
Date: Mon,  1 Mar 2021 14:57:35 +0100
Message-Id: <20210301135738.12541-3-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301135738.12541-1-idadelm@gmail.com>
References: <20210301135738.12541-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: [YOCTO #13471]

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/recipes-kernel/blktrace/blktrace_git.bb                 | 5 +++++
 meta/recipes-kernel/cryptodev/cryptodev.inc                  | 5 +++++
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb      | 4 ++++
 .../recipes-kernel/linux-firmware/linux-firmware_20201022.bb | 3 +++
 .../recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 1 +
 meta/recipes-kernel/linux/linux-yocto.inc                    | 1 +
 meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb            | 1 +
 meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb              | 1 +
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 1 +
 meta/recipes-kernel/systemtap/systemtap_git.bb               | 3 +++
 meta/recipes-kernel/systemtap/systemtap_git.inc              | 5 +++++
 11 files changed, 30 insertions(+)

diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 6903053b5b..7ccc022b93 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -1,4 +1,9 @@
 SUMMARY = "Generates traces of I/O traffic on block devices"
+DESCRIPTION = "blktrace is a block layer IO tracing mechanism which provides \
+detailed information about request queue operations up to user space. There \
+are three major components: a kernel component, a utility to record the i/o \
+trace information for the kernel to user space, and utilities to analyse and \
+view the trace information."
 HOMEPAGE = "http://brick.kernel.dk/snaps/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index c050eda49e..8c19b8e836 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -1,4 +1,9 @@
 HOMEPAGE = "http://cryptodev-linux.org/"
+DESCRIPTION = "Cryptodev-linux is a device that allows access to Linux kernel \
+cryptographic drivers; thus allowing of userspace applications to take advantage \
+of hardware accelerators. Cryptodev-linux is implemented as a standalone \
+module that requires no dependencies other than a stock linux kernel. Its \
+API is compatible with OpenBSD's cryptodev userspace API (/dev/crypto)."
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index ea33732a3e..33b1d2401b 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Tools for managing Yocto Project style branched kernels"
+DESCRIPTION = "Powerful set of tools or managing Yocto Linux kernel sources \
+and configuration data. You can use these tools to make a single configuration \
+change, apply multiple patches, or work with your own kernel sources."
+HOMEPAGE = "https://www.yoctoproject.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249624278c3e343e501"
 
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
index 93b9d5308a..0f71afa9e3 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Firmware files for use with Linux kernel"
+DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
+that contains firmware binary blobs necessary for partial or full functionality \
+of certain hardware devices."
 SECTION = "kernel"
 
 LICENSE = "\
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 3bceac40cc..7ec94024c3 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -1,4 +1,5 @@
 SUMMARY = "Sanitized set of kernel headers for the C library's use"
+DESCRIPTION = "Designed to maintain an Application Programming Interface (API) stable version of the Linux headers"
 SECTION = "devel"
 LICENSE = "GPLv2"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index bd37006f88..a85280990b 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -1,6 +1,7 @@
 SUMMARY = "Linux kernel"
 SECTION = "kernel"
 LICENSE = "GPLv2"
+HOMEPAGE = "https://www.yoctoproject.org/"
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb
index ca79e27df6..7975daf363 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb
@@ -1,6 +1,7 @@
 SECTION = "devel"
 SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
 DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
+HOMEPAGE = "https://lttng.org/"
 LICENSE = "LGPLv2.1 & GPLv2 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
 
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
index 0787e04d19..9618a86650 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
@@ -3,6 +3,7 @@ SUMMARY = "Linux Trace Toolkit Control"
 DESCRIPTION = "The Linux trace toolkit is a suite of tools designed \
 to extract program execution details from the Linux operating system \
 and interpret them."
+HOMEPAGE = "https://github.com/lttng/lttng-tools"
 
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=40ef17463fbd6f377db3c47b1cbaded8 \
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 1ab248fed5..b58fa9a603 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Build tools needed by external modules"
+HOMEPAGE = "https://www.yoctoproject.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 923d64b975..c4a6eef59a 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Script-directed dynamic tracing and performance analysis tool for Linux"
+DESCRIPTION = "It provides free software infrastructure to simplify the \
+gathering of information about the running Linux system. This assists \
+diagnosis of a performance or functional problem."
 HOMEPAGE = "https://sourceware.org/systemtap/"
 
 require systemtap_git.inc
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 56fa51d61e..2eec9a6b03 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,3 +1,8 @@
+SUMMARY = "Script-directed dynamic tracing and performance analysis tool for Linux"
+DESCRIPTION = "It provides free software infrastructure to simplify the \
+gathering of information about the running Linux system. This assists \
+diagnosis of a performance or functional problem."
+HOMEPAGE = "https://sourceware.org/systemtap/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRCREV = "82b8e1a07a31bf37ed05d6ebc5162b054c0be9fd"
-- 
2.25.1

