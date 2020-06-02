Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.51645.1591056807692767344
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 17:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BbeDYJNW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 185so4227585pgb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 17:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=kE1BwNsCC7dytOK9sMLjOftWOL4rMc5nm33yPoikb2A=;
        b=BbeDYJNWTnSR0P9By9KqB3Hw5lzCMBENslOIjC7fiKHQb06NrNc8PumNkCKvNVV1Q8
         MxTeevIsngZc6JHrJMmBo6xy2LPNXFA5VymxQzzT3N3b8PqBD0jRTrgBk+EOwjDGv6Fb
         p6bqUKpNlDmL7bReWS+qqIdvA7FYI8qHGb323QqSN/TnXk9GYER32Jypoy7E2qHI7/1K
         +emuQk3dhkVAlfI0SIZkCdJlHvlhQIZqET7gzgAf0n3o7Q6yHjgtTBbFV8qR5144a+ak
         q5c+uh0p93cbjbPS90MB7IxxiqpQ1qRN1vKGIGTzG6vuG2CrhW0T96DvFEEEkHQAMzku
         AHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=kE1BwNsCC7dytOK9sMLjOftWOL4rMc5nm33yPoikb2A=;
        b=aO4ywCi3I9lQNlEm/nsAhk/QRqIr/bGjFdJbR/RjE7Rt4f8JVuwyzE0Cm4Ralytq2S
         t7AWuuVdkf9UhpBMt5Q9ymz5p2J3661Do92Q3hqud894LUxwJDQeer9XijAAt0v5cIje
         S0MXK8p9JKZWiGRZCP/CC0H3wk2ROiBKDkQKyMIPtWAL2m3Jibr63XSGfM/h3yXMo3Wm
         tXSmi//aoh6IUcH4xw9h+g1Zckmy3a+FVLjtir0NXDWvrW8UQ0yvwoicwm9MgrQBWJbI
         YUzE0TdNBto7x/fBxy0ECyu0c4xRHJGTpzaliajMF3W8jrEH+SHSz+u79OCcpku2CFM2
         hypA==
X-Gm-Message-State: AOAM533+3T+NuJDiJlMAZ5SWXm8tIgh4OjdFIqGJ8ZNTdGIr3UQyk6XR
	0HlKIZyEZZCoKIx1xy1MUzNvWVXA+1s=
X-Google-Smtp-Source: ABdhPJzeB/NQTXDbx9dIJu55wtKcBnzZvFGdu9e/AiRwnXshNG92/WnefPmu0Fr34ry6Z4X+bUzEHA==
X-Received: by 2002:aa7:9118:: with SMTP id 24mr7975803pfh.56.1591056806679;
        Mon, 01 Jun 2020 17:13:26 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c195sm442699pfc.203.2020.06.01.17.13.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 17:13:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/8] linux-yocto: gather reproducibility configs into a fragment
Date: Mon,  1 Jun 2020 14:12:45 -1000
Message-Id: <864cc7b3c349c94e34e3129053c2b22c8946c73d.1591056239.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591056239.git.steve@sakoman.com>
References: <cover.1591056239.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the meta SRCREV to pickup the following fix:

    commit 9e68afb48b16a447dcd3996ffa350f3e79e44257 (HEAD -> master)
    Author: Bruce Ashfield <bruce.ashfield@gmail.com>
    Date:   Thu May 28 11:22:22 2020 -0400

        features: add reproducibility fragement

        Creating an initial feature fragment that can be included when a
        reproducible kernel build is desired. This is currently only one
        option, but will have more in the future.

        Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eaa34c96b60e703c96495e60650adc6d149603f1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index e6366ee36d..a78d333e31 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3d70f110c590b38219843a3a0815a232fd542cec"
-SRCREV_meta ?= "6d128007a79cdbecb66c5d8d186c0bbc41496526"
+SRCREV_meta ?= "d62979d9e2d30640c777438bebb40d98e03c331a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 4a37c758b2..db2e82efe4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "80606f0432a35225e7bff188a890b836018bae61"
 SRCREV_machine ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
-SRCREV_meta ?= "6d128007a79cdbecb66c5d8d186c0bbc41496526"
+SRCREV_meta ?= "d62979d9e2d30640c777438bebb40d98e03c331a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 2bba72df77..6c991558ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
 SRCREV_machine_qemux86-64 ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
 SRCREV_machine_qemumips64 ?= "2da40cf3f065512eea3729172f8e3f0cf1857160"
 SRCREV_machine ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
-SRCREV_meta ?= "6d128007a79cdbecb66c5d8d186c0bbc41496526"
+SRCREV_meta ?= "d62979d9e2d30640c777438bebb40d98e03c331a"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.17.1

