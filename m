Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web10.5669.1602813976337819632
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 19:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rN18psTB;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id u3so550973pjr.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 19:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h6DvzqkDO1ABUePVzzNkOtc+LqF/L1w8D1NndhfG6IY=;
        b=rN18psTBeXXm7fuV5rJIlAu7i2bN4vR2H4FIKO4SdSXYPm5renD5UcdPyiFGJ56mVO
         xd3XuvNEwy53gq+3Pn09+uG/bYo8OOY+KUIbXowoSB7GpjufqTTC/Bd7k2Yc1yZmIQyw
         7BM7s9wmzqcjn0wde/dP46tiFdBiqg2weAZDrsIgiStzZyrafgA33HvR++Kj4kVe1d1/
         D3BUrT1R4DLcNnoxHds9YDC6LCo/NrwJsyD3jvKts6cQyVoRByH7PT00Tb+gGmmOt8Px
         T2An7iR/la7u3d4s+JU5UYhjTWM7JBtjXN0i6yxkzO4HmPymlWZpRYXtzPUBMfME2wnA
         3KhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h6DvzqkDO1ABUePVzzNkOtc+LqF/L1w8D1NndhfG6IY=;
        b=cijLGSgrGj5J7p4DpwDyH7xCSw33yagiKFy3jMaCl6aksAx8PJfA8CRQCa9NLl7KyF
         1ZW6HAuDLaOKZtR2WjJv1bsxxjrvv7xiv5NGVP4RWoE2Zg4fBpVXAarTrMQW7mHYaUqX
         PbIJ0Ja83xEM7hiLPGj2PqidVyyQGDO+/m2l3WePunLhQ8eZr6I5z2LnXIOQGgYSfL3p
         oZMFEVUGppdnE8ERw+OGNSAvwJxt9DmolvPRpnxIPFpTCPetTTuMgAq3XH29Jeabyzq4
         QcCwTeNcpFygrmwF2ni+l1LYTG2TL5/JlST3O6uNLBuxCwmLLFnSwSSjARKFuf0nNhsv
         yCvg==
X-Gm-Message-State: AOAM533MLuS6MTrBIdu4SpmjTNY1GwETypOdXX1vZ2XK2SorwJcufDiC
	pQl3UgurfFhO+9SSIZYkZHbApNf+D1qU7Q==
X-Google-Smtp-Source: ABdhPJyUuWjUCOde/8HWNE5AoJjamBhpmUgitIlMaWjwbpG7MPWBjAgitTTzNPByCCl4LtGu5o2CVQ==
X-Received: by 2002:a17:902:b789:b029:d3:f9aa:7f27 with SMTP id e9-20020a170902b789b02900d3f9aa7f27mr1484004pls.47.1602813975144;
        Thu, 15 Oct 2020 19:06:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id d2sm688342pjx.4.2020.10.15.19.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 19:06:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] recipes: Use GPL-2.0-only instead of GPL-2.0 for LIC_FILES_CHKSUM
Date: Thu, 15 Oct 2020 19:06:12 -0700
Message-Id: <20201016020612.273587-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/connman/connman-conf.bb            | 2 +-
 meta/recipes-core/busybox/busybox-inittab_1.32.0.bb          | 2 +-
 meta/recipes-core/systemd/systemd-serialgetty.bb             | 2 +-
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb       | 2 +-
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

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

