Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web09.7106.1616377341645972196
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VuiUxcSX;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id y18so9098914qky.11
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Mar 2021 18:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BQprIQZz2YIXf9asyy1VAkYilo2W/w+Zl89uTUEFTBU=;
        b=VuiUxcSX8+oFQV30VA1hxlQ952WrEksxJ3abEAtU010RdKAU/GRGF70S+UaXRQzl3y
         ZCxRluKLQIKKOz/Pviw2SUlpxTCgwRu9fCihkDmKY2k1GhjIcbo+HJMt6Y07J2xaO6c0
         6+2iQHzW/OEv/tq51wWQo5d/a7dwuaF4+a3SYzGc6zBewvm2+wQ61lrMNH+Rmrlrq3oa
         k//LP9c1R7tLYT3Bid0Sr/0ZhxGVFLyuQNNDi3GJHhf9gGixj/TQXtL2PYC8qHCMzNcQ
         5tAlZ2hWW0TMaqzAqhV+P0vqUNo8Utb/lCPInMx0xan/oRI5Kh67tIDwrwdSvvt8scaH
         iLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BQprIQZz2YIXf9asyy1VAkYilo2W/w+Zl89uTUEFTBU=;
        b=BVHJEXHHM1xNy/XExg/8+59OXwjEgu/ws5z3uMre04bZ6NE1bo5MiLGmsG4PPdZgw1
         LqvVxTznp4FbqtccG65O87XDyxwH5BJKRn7WiIHtmkTP8VJZ/aH/amjA7/MfDfDjMbe/
         sEDX8Fv4DvTaeOmNKNTkVLdg+ZR/DQRVzTplVoAL7T5fnNCF685eQmrtQGeTKl+AfvGS
         oLi8XyiKmAGXIID2Cr6oUOfOdWlcoJ+2PKSgmgp81aRsAoU8fc0+FvEyA8lcNpekgoBs
         Rl6HvZiSX68tLUwcJFfxp3P33fdbPqfBOfJ3HaoGkpRwN7eG4ANzArJ8LUjpwpt7uTzo
         NbnA==
X-Gm-Message-State: AOAM533zftCSu05T5lEWx+I0/v22RkYJQiooAcst1RimJpFTIY/6V7Kq
	PJTVZM/5soB5uF9HGnjzh7o=
X-Google-Smtp-Source: ABdhPJzvBpE9+M+sye68rh8dztzXIv50KlPT5hsImkIGuOSvTHZvTovjjYPujqR8sNoatFAaLSYDGg==
X-Received: by 2002:a37:a81:: with SMTP id 123mr8816060qkk.144.1616377340689;
        Sun, 21 Mar 2021 18:42:20 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id f9sm8237686qto.46.2021.03.21.18.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 18:42:20 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: raj.khem@gmail.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.10: cfg: fix ppc64 configuration warnings
Date: Sun, 21 Mar 2021 21:42:18 -0400
Message-Id: <20210322014218.32809-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Recent tweaks to the kern tools triggered some warnings that were
previously hidden.

With these two commits, ppc64 has a clean audit:

    c0cfc016a51 qemuppc64: fix 5.10 configuration warnings
    489c76aa9fb qemu-ppc64.cfg: Do not set CONFIG_POWER4

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 7b5d69843b..094fc41705 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "09e60e61f3a0716c1d715024db69ed493b374352"
-SRCREV_meta ?= "f5babefa399359d7a5f880342c03ced78dbd48d2"
+SRCREV_meta ?= "c0cfc016a512f4b2922e15e43e3d4b421cdceb97"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index a903a7ad45..c55d02ab65 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "828298476280f149282db7209dd18c8bd0f46657"
 SRCREV_machine ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
-SRCREV_meta ?= "f5babefa399359d7a5f880342c03ced78dbd48d2"
+SRCREV_meta ?= "c0cfc016a512f4b2922e15e43e3d4b421cdceb97"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 9c122832f4..ae4eea0096 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
 SRCREV_machine_qemux86-64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
 SRCREV_machine_qemumips64 ?= "c19b50af1e3680ff6050a0cce8dcd888accafd9b"
 SRCREV_machine ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
-SRCREV_meta ?= "f5babefa399359d7a5f880342c03ced78dbd48d2"
+SRCREV_meta ?= "c0cfc016a512f4b2922e15e43e3d4b421cdceb97"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

