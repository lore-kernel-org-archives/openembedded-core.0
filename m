Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web08.2533.1615661444679958179
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:50:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HKyaZebX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.51, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f51.google.com with SMTP id a17so5177105oto.5
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oDi0LwtQHdlLAsqAyRy5lBkqWYKJHIrVKr9TVMd3wGo=;
        b=HKyaZebXEQpPZVpawv8vmj9ZVLZeJ20bS7bbQ1uuOM3DcE9nxGi71C2WSt8LigIHE+
         43EtS0irV1oONJgxqmnfbrh10kFUE+DVBtgrmraBVQ7UeA8ALrT/EuNE7tT+nw/GgkL3
         bQHAIdqhpTVXPkFAXdqFRXRl6/Iqr0rkLOLkeaqF9wal0nh3Z5qrz+8qxrRtjxvVwuyA
         d0Cn995BiTh4P6sJwX5/PMoBKWn6qdhjnaL8VysWeK7PLiL8iFJKYafJctllpa1Sic+X
         2zDNW603Ul8zCxnVa2zaNHcSItODOjGGE6KFenIV+wQP7kRjCu0f72tONVi5mMevMORi
         zc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oDi0LwtQHdlLAsqAyRy5lBkqWYKJHIrVKr9TVMd3wGo=;
        b=jaG/SuF1i/hFsziWeJpXBCaNPG89/kENYzmG65MBhkB2v/s+Awn96bG4l5mx99CFJs
         yRf/VPr88BitkZjUFymNNlWxEdZDTs01ObvZyQ2zvvOovXMSGqRG7pQQzojy/6te9UFj
         UDsKAVaz0XfgbywWv0bnbLX2S/C2teFeD6nUEeeo4qivCUEyMxelWKEhHSruPBNwzdRw
         gglMOYmcqPlszzrK3nsRWylmM2enB3ZVL1ImzDr3JUXBZB1G7O1D+1nhXDoUwVdlXpB0
         WArhmTEknFbxXJfaaA0MagDJc3+0juMAQMX7eqWETg3OgBOtJyXW5/x7RSaTjGH0+sK9
         aHVQ==
X-Gm-Message-State: AOAM530y9I8OrQ4yVWelNxE5s+nssL0LCH+b07tI8j+R52pwXlcCp++I
	6u6oMa7FSPI0P0Wvil2+VEUMgV0d9hj/RMz8
X-Google-Smtp-Source: ABdhPJz7TVmvcwm/iE7UMDnGtbNyEUDuA8cnmKwznJDwj+DgMR/yEI5szskQSFnMQZvHIfMXvTasxg==
X-Received: by 2002:a05:6830:1b68:: with SMTP id d8mr7836438ote.235.1615661443464;
        Sat, 13 Mar 2021 10:50:43 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.50.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:50:43 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/38] recipes-kernel: Add missing HOMEPAGE and DESCRIPTION for recipes.
Date: Sat, 13 Mar 2021 08:48:59 -1000
Message-Id: <245d5fe05c102ff3551d8c5e59d836255a38a8a8.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Meh Mbeh Ida Delphine <idadelm@gmail.com>

Fixes: [YOCTO #13471]

Signed-off-by: Ida Delphine <idadelm@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 16409694f19e4d3b7bdc10a7f71c67938ce5f3ff)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/blktrace/blktrace_git.bb                 | 5 +++++
 meta/recipes-kernel/cryptodev/cryptodev.inc                  | 5 +++++
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb      | 4 ++++
 .../recipes-kernel/linux-firmware/linux-firmware_20210208.bb | 3 +++
 .../recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 1 +
 meta/recipes-kernel/linux/linux-yocto.inc                    | 1 +
 meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb            | 1 +
 meta/recipes-kernel/lttng/lttng-tools_2.11.5.bb              | 1 +
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 1 +
 meta/recipes-kernel/systemtap/systemtap_git.bb               | 3 +++
 10 files changed, 25 insertions(+)

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
index f99f8bc9f0..cf9b9b7207 100644
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
index 4f1af731d6..3f76af424b 100644
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
 
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
index 59ce4d5124..0013e24580 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Firmware files for use with Linux kernel"
+DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
+that contains firmware binary blobs necessary for partial or full functionality \
+of certain hardware devices."
 SECTION = "kernel"
 
 LICENSE = "\
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 4ad74a27e9..b59f57b139 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -1,4 +1,5 @@
 SUMMARY = "Sanitized set of kernel headers for the C library's use"
+DESCRIPTION = "Designed to maintain an Application Programming Interface (API) stable version of the Linux headers"
 SECTION = "devel"
 LICENSE = "GPLv2"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 91df9c1cd5..0a4d528aab 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -1,6 +1,7 @@
 SUMMARY = "Linux kernel"
 SECTION = "kernel"
 LICENSE = "GPLv2"
+HOMEPAGE = "https://www.yoctoproject.org/"
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
index 26c247e169..3fdc8094e9 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
@@ -1,6 +1,7 @@
 SECTION = "devel"
 SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
 DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
+HOMEPAGE = "https://lttng.org/"
 LICENSE = "LGPLv2.1 & GPLv2 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
 
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.11.5.bb b/meta/recipes-kernel/lttng/lttng-tools_2.11.5.bb
index a969fffd62..e830475d0d 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.11.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.11.5.bb
@@ -3,6 +3,7 @@ SUMMARY = "Linux Trace Toolkit Control"
 DESCRIPTION = "The Linux trace toolkit is a suite of tools designed \
 to extract program execution details from the Linux operating system \
 and interpret them."
+HOMEPAGE = "https://github.com/lttng/lttng-tools"
 
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index c7edb20ee4..87b7d240f5 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Build tools needed by external modules"
+HOMEPAGE = "https://www.yoctoproject.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 1c9f2aed16..bdd8fb83b0 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Script-directed dynamic tracing and performance analysis tool for Linux"
+DESCRIPTION = "It provides free software infrastructure to simplify the \
+gathering of information about the running Linux system. This assists \
+diagnosis of a performance or functional problem."
 HOMEPAGE = "https://sourceware.org/systemtap/"
 
 require systemtap_git.inc
-- 
2.25.1

