Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.30.1613667410868260785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 08:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I9bZ6mD3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id m1so4587106wml.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 08:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vYETMWa5jBq4WH0d96Nr9ILbkj3IAw9qN7mNIrZsots=;
        b=I9bZ6mD34w+wUawB2oddatNZXFAeKgmfOvfqot3PXubf43pg7bCfdWuEVdb7YeondO
         EOdVDpf0yIxGu3z2cXPxclms8r8To5kCA27i4kO5+lQbZk2KVfLdkj4bdE0UNQyhBE3H
         8F23cunszQbKCcIIpdhZxPkxfm/vsjAH3lSlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vYETMWa5jBq4WH0d96Nr9ILbkj3IAw9qN7mNIrZsots=;
        b=GVnpV3Z0ObB8ILw72p/EMmQvCSvQWU6hqjUdPDW3yGzmvbn1dkecNu4Bn2FwuAw4YN
         5XLUSAyBM2PciRymwU6FqFgEfiKLuWwuo88hH1+WPolgqI+JQBiMxWyeWm1VSNl8iaaU
         tC5KwaLK+ZTRsjr8NdUrgIMo2bURsvrdGxFfb7HTM3WgZrqSYL28TMaFXRpCCi3zcWak
         L3HdOPZu/F1QtxUHiWG/+qXkp1ftYKVy4MYQDh6xAK1Fh3A3W1fo9I1VhLFPjnf6NApX
         Xhm6aD7RlPH6qEipFsQEhu5SHYwAEfokwKw5ED5EtOvFiP9MA8xwnJlcYCqTV9iHcmqJ
         p/vA==
X-Gm-Message-State: AOAM532GLEAjjO6WLEWohIK2cjYcdflil/74ymB5Akj/ZIhoFnWiHHYz
	62SA5RwYILS7Hba3ucUJOYmynBKy9uefrw==
X-Google-Smtp-Source: ABdhPJxjhKIuGNLM7KTvpDrdAs9n3NWoPS23YhR8W+5A/R4W8Jo0nidW804uqCt+HrDgpuYMh+nCvA==
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr4323817wmk.70.1613667408757;
        Thu, 18 Feb 2021 08:56:48 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7504:d16b:192:2652])
        by smtp.gmail.com with ESMTPSA id b13sm9290328wrs.35.2021.02.18.08.56.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 08:56:48 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/11] recipes: Update common-licenses references to match new names
Date: Thu, 18 Feb 2021 16:56:37 +0000
Message-Id: <20210218165646.2109894-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
References: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The licenses were renamed to match their SPDX names, fix the
references in LIC_FILES_CHKSUM in OE-Core.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/devicetree.bbclass                              | 2 +-
 meta/recipes-connectivity/connman/connman-conf.bb            | 2 +-
 meta/recipes-core/busybox/busybox-inittab_1.32.0.bb          | 2 +-
 meta/recipes-core/glibc/glibc-collateral.inc                 | 4 ++--
 meta/recipes-core/systemd/systemd-serialgetty.bb             | 2 +-
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb       | 2 +-
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbclass
index c772ab2ab93..ece883accf9 100644
--- a/meta/classes/devicetree.bbclass
+++ b/meta/classes/devicetree.bbclass
@@ -18,7 +18,7 @@ SECTION ?= "bsp"
 # device trees built with them are at least GPLv2 (and in some cases dual
 # licensed). Default to GPLv2 if the recipe does not specify a license.
 LICENSE ?= "GPLv2"
-LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "dtc-native"
diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index 9a519ec866e..85fee09258d 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -2,7 +2,7 @@ SUMMARY = "Connman config to setup wired interface on qemu machines"
 DESCRIPTION = "This is the ConnMan configuration to set up a Wired \
 network interface for a qemu machine."
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 inherit systemd
 
diff --git a/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
index 8d0f419f4de..3804f4f7b2d 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "inittab configuration for BusyBox"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 SRC_URI = "file://inittab"
 
diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
index 52880791a72..4f81f07da77 100644
--- a/meta/recipes-core/glibc/glibc-collateral.inc
+++ b/meta/recipes-core/glibc/glibc-collateral.inc
@@ -1,7 +1,7 @@
 require glibc-common.inc
 
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
-                     file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6 \
+                     file://${COMMON_LICENSE_DIR}/LGPL-2.1-only;md5=1a6d268fd218675ffea8be556788b780"
 
 deltask do_fetch
 deltask do_unpack
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index d142b30f7e1..34defeb3b12 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Serial terminal support for systemd"
 HOMEPAGE = "https://www.freedesktop.org/wiki/Software/systemd/"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 PR = "r5"
 
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 8781492d472..d95d1a63f5c 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Inittab configuration for SysVinit"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 PR = "r10"
 
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 1ab248fed5c..8a02bc7f48d 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Build tools needed by external modules"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 inherit kernel-arch
 inherit pkgconfig
-- 
2.27.0

