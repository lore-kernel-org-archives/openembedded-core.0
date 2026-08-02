Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4E0C55172
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 02:10:18 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16891.1785636612166138399
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 19:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MXxLPa5j;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9034b6b7674so14305646d6.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 19:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785636611; x=1786241411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=838qkd/Mf2WKEgQ+wPTZG9iCzI5IeeXQVImQE7C1e7I=;
        b=MXxLPa5js1q87X2lIYQ8EJgn7PA45TtJuGpgfMpVF+viW9cYGn2okPjAnYakH4RiMP
         do8+m6n63ekLdycW9h3m9CqpQ9PopeHTkviHKOeQMqGcRcFpp/Pkpys9XkGklgBkpYZR
         zK1z+rbvVdUIZ+ne4FLbBuhRKT5OhgAohNfjYrud++Pui59GndEDV40H6gAidZlVP/tH
         NVyUW3SWQwAoPCS5cpS1MyBcJYT5r6cK0b4mBP6r6CyfJql+TQvfp5H164uBJ2hqCrqx
         1l4//FaaBR5tV81Lc07xQ5j9XTP0F3pt5GoJ1sOdk1Q61V4Jm2EdHR3xeeybGAvDGIEY
         OmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785636611; x=1786241411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=838qkd/Mf2WKEgQ+wPTZG9iCzI5IeeXQVImQE7C1e7I=;
        b=FHFJ55Op1wIC/zY3bGNXDeUmS+k2BeealgoVjbgmsafkjbd7LcXkovcueAXbbJ/GQM
         p8lTr8U/5EJGI9ZUubXc1l0yze6nZbD4KEvQse2QY1NIo41q2qN3akwg50pYaJITTMCf
         hrIXbVjCttNcb8cwAKCiZX0EDQSmPJ9QjN3boF7fk/ML3TkztGRqHQu3Yq25ZB1IM9Qi
         NE678TKJVVm6EcrpdGrOcfMTO/UFL1WgEiORSFgJxJxxgSTlqHIDah6bVEA4CNuHFUuN
         Mu73PbPAynxQBKa8/xHy6eeYLdZx0AvjRF10snnqGa+tluxeoOJQY/UCVvWZk5hehl5D
         xM+Q==
X-Gm-Message-State: AOJu0YyOTwuyHLDXQBR2EVASsccKwOWvXsSCOwv4dzdV5ar3oagUKp8f
	SPAYpPi+XCJA5lJcb1GeVVe6unFJ5X556RTlKVQC3e4jrkx5HENN4lvK9ojpTg==
X-Gm-Gg: AR+sD11CsIb35YEJYV9B4C9H0Hd2yqH0NMxKI4KKQY7Z8DgP6Zpz0mUSStAAIIFbKf6
	bKXqK24Lf/uymL9CZG1aC1SHnFRAuk5nGcDv5oFdO6AktHvojw6OytsPb4d4jbk+ZO5CO3+MjGI
	kwQogxWVfiEdFnwcFVbYlEpf4lpM8Ix1z4NZYaRCD7eYURUFPH6RkMeu8iSkvl3vtEIS1kG02ql
	+Djtne2Szv/UtH1TwiZztFXPMTeNqJd4iHwuesvT2zcgRedjbL930sA3Q9F7NIY6++gCUUIgN26
	OwzHMZO7hQ+Bnn+D8e8MY7z5ljD0h4R976/Y/Jpxu2i5K8KFmSYVinofXmKoc98MM+hvGfy2inG
	PApcnUcgcXxfKDQGPHYJ+729wVtyoVgxW90dWXScGdWm/+hUALck7Y0yoaDILgUstcwAfgR0pQx
	gPvAiaMi8qea/AgXPXn755HsZTVei3632ONU038VAar5Ku2ultrSPN8j3I4pfc/RQFVmsIncc/x
	3gkHD8XNRTuJOIZVfFcSI0eTuG+08c=
X-Received: by 2002:ad4:5965:0:b0:906:f225:c16f with SMTP id 6a1803df08f44-908495fbfa7mr123183486d6.19.1785636611050;
        Sat, 01 Aug 2026 19:10:11 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908434a26basm44733566d6.12.2026.08.01.19.10.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 19:10:10 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 2/6] image_types_wic, wic-tools: drop the obsolete cross-binutils dependency
Date: Sat,  1 Aug 2026 22:09:56 -0400
Message-ID: <20260802021000.2886095-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260802021000.2886095-1-twoerner@gmail.com>
References: <20260802021000.2886095-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 02:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242511

wic depends on virtual/cross-binutils because its EFI boot image plugin
once assembled unified kernel images and needed cross-objcopy for it.
That plugin no longer builds them: it refuses and points at
uki.bbclass, which declares virtual/cross-binutils itself.

No code wic runs invokes objcopy any more, so drop the dependency from
the two places still carrying it.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v6:
- new patch
---
 meta/classes-recipe/image_types_wic.bbclass | 2 --
 meta/recipes-core/meta/wic-tools.bb         | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index ea8c1c94ca2f..671577cc062b 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -120,8 +120,6 @@ do_image_wic[deptask] += "do_image_complete"
 
 WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
 WKS_FILE_DEPENDS_DEFAULT += "wic-native bmaptool-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
-# Unified kernel images need objcopy
-WKS_FILE_DEPENDS_DEFAULT += "virtual/cross-binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS:aarch64 = "grub-efi systemd-boot"
 WKS_FILE_DEPENDS_BOOTLOADERS:arm = "systemd-boot"
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index c6e3d1b419dc..a4b7669137dd 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -8,7 +8,6 @@ DEPENDS = "\
            mtools-native bmaptool-native grub-native cdrtools-native \
            btrfs-tools-native squashfs-tools-native pseudo-native \
            e2fsprogs-native util-linux-native tar-native erofs-utils-native \
-           virtual/cross-binutils \
            "
 DEPENDS:append:x86 = " syslinux-native"
 DEPENDS:append:x86-64 = " syslinux-native"
-- 
2.50.0.173.g8b6f19ccfc3a


