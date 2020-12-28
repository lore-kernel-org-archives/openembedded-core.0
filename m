Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.4069.1609193782726418328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FRe89S2P;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id t6so6271750plq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=LLa1BdZ4q/fo1cJWbp6ulOhwYJ+b4McfQEvE0pav7wU=;
        b=FRe89S2Pzts9DfoCSytSzbz8t58ctSHi2mzrCE5X53ydiptapr9/CRhRfyv81koZcI
         3ioc6NWi9b/OwK4e3cX/FAaJFt1T9qkdQGr6y4Z8d3kZMYAN2/BbZjkwVDUv1M01wyaL
         I6vH6DeLJu83ME8dO0ZNUQhABcre9xtiD4RM1mQDsuV1F73IhAQnGIR81cRYwpTWdZMm
         EyFLMmOVbrG5x7TDAY4xkoz4S0Cw1txsDXHLMCxKgDltBprxAKMWKrZeYVPg3Il0DeRT
         p1/HfM40ZEAVIxQvSBAEZ/BCZAW8rnM014qDtaRk3G5sLCX3VKBAXs30UxAvF32Gt8o6
         8yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=LLa1BdZ4q/fo1cJWbp6ulOhwYJ+b4McfQEvE0pav7wU=;
        b=hBUVrZFPSMIyAfQG2//lsZo91M8y5YAW3C96ntB/jCC3QuezJZ21rr7S4WkmFoPwgV
         K7ieukfE3ANDTJ1QRGIGLVf3ZqOMFVi7yk8qNuErtjuCPh0Zozv0QKmFPGf/Xkl9Zi/l
         mhbWf/meFKIO0OLP3pLjCOfg6avOz3uuHuTuIq4F8nyavhU2gAZd08g44AL4/u/IX3nK
         Iei3e0nk4ozhxpXH9PI8kFbEOhLyL2oHrQq3VDAzS4Ipdqjs4OYhr4C77Ck7rerF5Agv
         D7zoggkUuU4KhjYSnWlivGJQVT7XzfCFVK5HoTqfjISqzF2l0/X0Fz4QldBRv/eqhEJ3
         GbIA==
X-Gm-Message-State: AOAM533TXbZnEUyZygLs8Ia/WRg6he/ywAshoMVJjGAVMFe1DrYjPngr
	tZiWDEH4nMX6UzHc/QCR93fFJhOMFDPZUcdU/PM=
X-Google-Smtp-Source: ABdhPJybRu/FYT5J5Yoe+KEeyDGvt3+oJV1sQAAecDLUZ+j/gOCE0x/9ro/vA9JL/wvcGrg114XOxQ==
X-Received: by 2002:a17:902:ff12:b029:db:d7b7:c99d with SMTP id f18-20020a170902ff12b02900dbd7b7c99dmr46703811plj.14.1609193781930;
        Mon, 28 Dec 2020 14:16:21 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:21 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/17] linux-yocto/cfg: qemuarm64-gfx.cfg: add CONFIG_INPUT_UINPUT
Date: Mon, 28 Dec 2020 12:15:42 -1000
Message-Id: <a4ad49037420cdf16ceb5c4217605069ce4b619f.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609193554.git.steve@sakoman.com>
References: <cover.1609193554.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s):

    qemuarm64-gfx.cfg: add CONFIG_INPUT_UINPUT

    This will address libinput ptest failures:
    https://www.kernel.org/doc/html/latest/input/uinput.html
    https://wayland.freedesktop.org/libinput/doc/latest/test-suite.html

    qemux86_64 already has it enabled.

    Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5af1bda8006faf2afe4c5c17e7f8d276d6ec0790)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index bc415ca61c..fb5bff2371 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "65a53ac9134b9736ae67afc5fb02049f4908d8e3"
-SRCREV_meta ?= "e872ef155c596e4cc2f68405d85ab6f2b0303c28"
+SRCREV_meta ?= "104cf3e89371ac8971fef69f55a6c788c46ec65a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 67157b1685..01de087128 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "0c335c490cfe932664f2e40c791efa387f769df5"
 SRCREV_machine ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
-SRCREV_meta ?= "e872ef155c596e4cc2f68405d85ab6f2b0303c28"
+SRCREV_meta ?= "104cf3e89371ac8971fef69f55a6c788c46ec65a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 74cd709d74..b8aa937ca5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
 SRCREV_machine_qemux86-64 ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
 SRCREV_machine_qemumips64 ?= "0ba329b53891de44e4ef8d2ca8a948e1c6a5866c"
 SRCREV_machine ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
-SRCREV_meta ?= "e872ef155c596e4cc2f68405d85ab6f2b0303c28"
+SRCREV_meta ?= "104cf3e89371ac8971fef69f55a6c788c46ec65a"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.17.1

