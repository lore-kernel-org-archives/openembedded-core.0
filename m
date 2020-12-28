Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.4111.1609193777910803504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=U2pEHbGh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id q4so6255418plr.7
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BDEbCA4D+G1IlPiqo6l8N0xR/Wl5eJQP0II37axb+/s=;
        b=U2pEHbGhig/n/PraLCZAjlwLHxB2F3Anmo78KvtjOSSazE65KAYQJYSZPu9H1+o2K/
         6mXbx5fmP0RQ3vEaQgG+AEGPDi+a5q8zB8unVMgK8gipa6fG7S0ox00sfhBf+YLyfr1n
         ANc6rMnTfc7GzNXer2KLBQTR9YN9ir+VpiHbovsknrAoob3ShVRiCAsl2uI2xoC8L6a1
         qrBaIDZ5z+fkzJI08Xyk0kiM7GDQemPvdwCzKfhnoMouDoPEtY+WaasrneiVW/UAFnj5
         5xy5HPhRTIpQHbJOI/UP29xpbQq94h9e6Ll4QhNadX8keAdLTairA/Qp7nG0dDVrTa7w
         uXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BDEbCA4D+G1IlPiqo6l8N0xR/Wl5eJQP0II37axb+/s=;
        b=Q8I7yxyIh/GUOp92ZhbJODPjnbXmOeyrbmtvtgjdo32f6GATO4QI4QwDlLTOLTJYFX
         bGwk075rJqXdtSJ3UmJJ3JqSSQHLnkKQNw6RhI4AmWsVRdmpYkWUg+7/TPdYCt7pOv5X
         FXSWifQHsndSCVkEFCOId6jlk65w8GUXOxhRXWnu3Mr5s597he6YP59nZW5tz76w1PUB
         fufdwYVemtJBf3sdYdbLv+3X4eIlqoP+veC0063ci2iHKHYLGcwd/xo4hMuXwIch44MJ
         7uuin0kUmcvbMjvleLLeGjr/hHxmpUaN6M3um546vj2M8Ud3E37pDcs1bnsqxVyGUPI2
         xcJA==
X-Gm-Message-State: AOAM532omQFM7H0QVzSkpAiWhP7Tlz0rIWq8+wiKQPLiJEczHiJ2s3H8
	snyc0psmWnfh3j6Jd8YLkGs/KUS6t1/f/A9utHU=
X-Google-Smtp-Source: ABdhPJwdj0Rc5zVfYUsRUJdp9pUfXrKeogSMHshVTJFEMaII4gIFhMGmHBO6/xuXDPGc0/jwMHSXeg==
X-Received: by 2002:a17:902:ee0b:b029:dc:1aa4:1123 with SMTP id z11-20020a170902ee0bb02900dc1aa41123mr46528243plb.18.1609193777108;
        Mon, 28 Dec 2020 14:16:17 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:16 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/17] linux-yocto/cfg: qemuppc: set CONFIG_SCSI to '=y'
Date: Mon, 28 Dec 2020 12:15:40 -1000
Message-Id: <bc548e9e7a6573a3840206a5fa1d07144ebd648e.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609193554.git.steve@sakoman.com>
References: <cover.1609193554.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following configuration commit(s):

    72a1fe336d7 qemuppc: configure the CONFIG_SCSI to '=y'

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d21c81b04142a48539b3262318860f2719c11ca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 446650e823..d637a35cce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "1ab0814d41526c27888888188d884884c8b4a52d"
-SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
+SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 33ca5856a3..3b462d5872 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "9a4d015ce467549f5f587a5001cd333ea7182aa2"
 SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
-SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
+SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 3334c02a95..73e5b65e8d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
 SRCREV_machine_qemux86-64 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
 SRCREV_machine_qemumips64 ?= "f8d0d215cf1a02a1e2915b8d57fb8f9f29e5dc49"
 SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
-SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
+SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.17.1

