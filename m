Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.4112.1609193787297843409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MaGjx3VB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id x18so6258094pln.6
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7zoQftGdQBzevZqRiCc9zxRyWUYi9SRoEY3rRTuLgPo=;
        b=MaGjx3VBgq9qDFYmTk9lRBoakQrSOOjWF8s6bDypxDEFvMtcFUrKnDA7qqTKfCS383
         /XugCs1VvMndyhE3qDme6UJirXE1CN1kDXAK+qNhldl/K/GEbsdXSIaNzgTZL9IYxLt9
         bKP//5xOPi2QOdguPo8o6J1h23T/QcdIJZi/io7IFRpOfGjpQVGidGYFD2BsdTmJ7NZX
         /YIQwN59DuW1BzuBy28Y/KJ7KZ0sa1hDuUQZXbBAJ/U7UNhvwP0CVu7gD9EhLUWQsMoz
         CTK67dP/P5HMUzXbkiOhaw9ED8pSrG7SIYNnme0/8sPSDewDpEPot139vcsWkUqRhQuL
         bHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7zoQftGdQBzevZqRiCc9zxRyWUYi9SRoEY3rRTuLgPo=;
        b=PBlS8p3fIvzVC+qPdAkC60jcO38Vogwnzvymo7JYvAaSLSV/fOT01yKavhWOJxfAoi
         r7M79ztkAmEbSyi156ibE/JRysM78h4Kb/TsKYq0TrBnHZgCJGhOso+HQFe1wTm9S9E1
         YN6UPD1btdBb3Hw3ybF9fh63/rNWd3oJEaV7QTTJHGWdX88bjGaFPV3X9+qv5jjgU28L
         PUvbgDVFlPzNWWCNc8pCSBDLYB7NUFCEnV0kJ10wsSMv4d0tQYUoYlwDBtkQZKN+SIUO
         2QjGabIxIafktvsa6g9MjAHw+C1SilYiA74plhe9b2JnOIrXnSJoWEAVrS0j0R83U+rj
         sMlg==
X-Gm-Message-State: AOAM533qYXbbe10gvwaJPKwIsS/fYiY7J8b7wN12mSpaXFv2St8q/1Z2
	/eyqQl3mqdUKPf+751nYe8hxwQA9M5KiB142HQM=
X-Google-Smtp-Source: ABdhPJyFdvXQYDf32/z36oHYlmMe2AwaHBNy0D+krXcRJcMRqdg43UitRTi4xRfEDyFMHzswf9Skkg==
X-Received: by 2002:a17:90a:fb0d:: with SMTP id it13mr939514pjb.176.1609193786499;
        Mon, 28 Dec 2020 14:16:26 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:25 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/17] linux-yocto/5.4/cfg: fix -tiny warnings
Date: Mon, 28 Dec 2020 12:15:44 -1000
Message-Id: <cae70d2d020494182b6941c03d62bcbc679b7391.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609193554.git.steve@sakoman.com>
References: <cover.1609193554.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to fixup warnings when -tiny is
build with the latest kern-tools:

    b721178c41a drm: change CONFIG_DRM_KMS_HELPER to =m
    d9ac6174eaf tiny: enable CONFIG_FW_LOADER on a per-BSP basis
    a135c720bc7 i915: adust helper to 'm'

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9227facf178e7bc56cce2522cd63ffd18dd900aa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 758ab8bfb5..fae1eaa90f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "7bc8ae3fc04fdc06192d39d725cb18d4c0b78d9f"
-SRCREV_meta ?= "cd9826707f887241a661ea886cfa19f8d282438c"
+SRCREV_meta ?= "b721178c41a2bffd19cc9be9e33af23b7a4affd9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index b06db10f9f..2c7ce3621f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "2b6db4fbe53a1986c0249bc663d8ce7d99cbf19c"
 SRCREV_machine ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
-SRCREV_meta ?= "cd9826707f887241a661ea886cfa19f8d282438c"
+SRCREV_meta ?= "b721178c41a2bffd19cc9be9e33af23b7a4affd9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 880d9c9b99..7b729064ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
 SRCREV_machine_qemux86-64 ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
 SRCREV_machine_qemumips64 ?= "75c7340de480587c3a6650b46be7b1a2f71501a9"
 SRCREV_machine ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
-SRCREV_meta ?= "cd9826707f887241a661ea886cfa19f8d282438c"
+SRCREV_meta ?= "b721178c41a2bffd19cc9be9e33af23b7a4affd9"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.17.1

