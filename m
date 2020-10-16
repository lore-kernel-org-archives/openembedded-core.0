Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.7795.1602822832671591384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 21:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OXGa/s/f;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id az3so671131pjb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 21:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Q06C6q5aFioaHpYm79C4c3WjYb7yBwQL4vMjY3kLww=;
        b=OXGa/s/f+O4UECbP1F/e+U4JiSwH2p+dPlT6ELEQ7tkkE2EkKUOeKhT/loaT9KZHOC
         /PZWYw9VQvU/t9Ek6OOXUyPA876Y5hQhkqRBM4gqSShAFOkzcmOVx6netrzTObPTgC/b
         AZGrc7aKA5Brdo8N/b30elj7KK5mcBKc5Fe90Du81QIfxZItrEBpi8ExfGA6qYmfFfw0
         emNlrx+c89DXTIJ7NYzvyRKJMZXsQ7hctUleOOeH+zMLz1ctx/lr2YuAwe6t9VyiYcSq
         0lkRq9V4ulGAP7XRWvznen2q0X5si2O0gR6EGT2I/Tam56pDmMYVipxUewhYapH13/48
         rJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Q06C6q5aFioaHpYm79C4c3WjYb7yBwQL4vMjY3kLww=;
        b=CEdJK6Rh5isDctD2wNOT3s5kTlFC/4BwVhXqXpi1L15AwkD9en6VZ1eIgZ9eDX4UgN
         /rHXWNYLsLPwKyjSIIY0CXM01osa+/m8OoRWVG0AkFyrPSK4kZZ7rUcUdNyDsolBO4Y/
         3j1O+qTOumbVGhiS98k66m7uQoGBau9ElKg5/u0gzckO1P+zA8wnBCx15Oc1TD9wtgC6
         XTufkOCCVpIUXSnpNITzjk12EBi843RWQZ9r4pmA2q2WfpzksAonZYhsS0iRit83y2KG
         aXOnJK99ZFLgEg3FFObGPv7Y7EBHGg3+w7YM1jSs53/H4AW/0nIEFzJQaLi+C3q7/cK/
         vTvw==
X-Gm-Message-State: AOAM533OlpdeEYz+i07LT+OP8IRzygaV9XFcQeD9D+U9CwqkGXz7oO3F
	d1LSkHujLFJ/pCumZZVkQ9jepErsoajgxA==
X-Google-Smtp-Source: ABdhPJxPZCtA4VxaTpYQJLd+C7SmiP6pXcYhJmxEW3dFPxKmQBF5//n+rLolIV6cXRFaO4hilFYKHg==
X-Received: by 2002:a17:90a:b293:: with SMTP id c19mr2163226pjr.122.1602822831617;
        Thu, 15 Oct 2020 21:33:51 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id t9sm974464pgp.90.2020.10.15.21.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 21:33:51 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] recipes: Use GPL-2.0-only instead of GPL-2.0 for LIC_FILES_CHKSUM
Date: Thu, 15 Oct 2020 21:33:41 -0700
Message-Id: <20201016043341.635385-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add devicetree.bbclass and glibc-collateral.inc

 meta/classes/devicetree.bbclass                              | 2 +-
 meta/recipes-connectivity/connman/connman-conf.bb            | 2 +-
 meta/recipes-core/busybox/busybox-inittab_1.32.0.bb          | 2 +-
 meta/recipes-core/glibc/glibc-collateral.inc                 | 4 ++--
 meta/recipes-core/systemd/systemd-serialgetty.bb             | 2 +-
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb       | 2 +-
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbclass
index c772ab2ab9..ece883accf 100644
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
index 9a519ec866..85fee09258 100644
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
index 61fb8cbad1..2129acd8d3 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "inittab configuration for BusyBox"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 SRC_URI = "file://inittab"
 
diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
index 52880791a7..4f81f07da7 100644
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
index 0cc0dc8c79..9a63c9f0a8 100644
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
index 8781492d47..d95d1a63f5 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Inittab configuration for SysVinit"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 PR = "r10"
 
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 1ab248fed5..8a02bc7f48 100644
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
2.28.0

