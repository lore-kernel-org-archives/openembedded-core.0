Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.10335.1619186454420721258
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YF3LQVfc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id m6-20020a17090a8586b02901507e1acf0fso1313102pjn.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 07:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=d2uOJyIPuKjqakUTjWSkGhPwri1L2tg+ex6BO6QJWqc=;
        b=YF3LQVfcVuyfZeUqMoVuBrNiz9J2Kzpa114k1IqFh6m0Huzpkrqw+Qnv2X4CayhYCE
         GE7uU5cGi8V4UcBdhjogAhrfO8RP2kPHwXrPjntJNOzZqNiHjzohPG844VAI8W0DBP1G
         TjfvbC1X6jREyokoaXeGWijvNQF3yC3Cow6FaLmeTjTblMrYdB3chVPHYbhqbhCWpyQe
         84qD4xHGGgVM/31NKOimKJYX4taIUMsNONXzBGY+mlWra+VwktTOl4kKaY4elYnH87g6
         2UPA7CqYxJXNXUc/XD7p876Nk4NZJCl/sX01LAjR7Kgt16SkAJkqAU5yZa/kLNmf1Jex
         5ZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d2uOJyIPuKjqakUTjWSkGhPwri1L2tg+ex6BO6QJWqc=;
        b=m+b0faHQRfQa6/B5RfrZXCIRrFpPF9ycZwYCnyD8y6IhgeQdsP7AakyrI9eykwub/l
         CiL6WGjhYYfHyK6B+xPuyrYqvCniN2RqJ3fKBfZLZc0IGA//1kZK+D4fcp1whHpPIctx
         dffUY4SdNSFtuZQzcqLfKnJvp+qcEiXErYfjq08rJvMNWWUkAjF78bgPscLoliBtePRY
         +blIzV/psujZweM3GDhwzX6hEHtkyDNVuFdQOe/lLTpni6nug3t8eJyzL3ztAUii8XHe
         xvV5W+0Lts+44Z17a9I7GKpea9QwUEs9FpF0SFBOlYn6oZNBCQang+rv7EQH0vr3jRNW
         vr1g==
X-Gm-Message-State: AOAM530SWrnwpHcEnxt4XirKxwHrzhZ+271ngLwLC2jdC+TGAmlsojsg
	WJQxRFlTUnPGfd8ofp4PJ7JQL6TEjsFFk66RSDA=
X-Google-Smtp-Source: ABdhPJx84S2KCjUDsYviBWDZ/LRoE42+HGvwqMb7y6uMVFr+QXpiLDVvtiYta+ZFlSVWUnRnj/ucNA==
X-Received: by 2002:a17:90b:1b0d:: with SMTP id nu13mr5775632pjb.149.1619186453511;
        Fri, 23 Apr 2021 07:00:53 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.07.00.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:00:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/19] linux-yocto/5.4: fix arm defconfig warnings
Date: Fri, 23 Apr 2021 03:59:01 -1000
Message-Id: <2cc9e06807026b86038db88c2175c626feadc0be.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

A recent fix to the kern-tools promoted some previously unseen
issues to warnings. This commit fixes them by tagging some BT
options as non-hardware so they won't generate warnings if they
don't appear in the final .config. These are sub BT options and
shouldn't warn when/if their controlling option is disabled by
a fragment.

    d7fd0213b75 base: exclude some BT options as non-hardware

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a86c8251905baf5bf4714f3db01cdfae02383839)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 8ae1e91cad..309f753c38 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "324e77d816cf6434507ab29140beb24044009efa"
-SRCREV_meta ?= "5017570a130f142365dfdcd043d84143fdd6e255"
+SRCREV_meta ?= "d7fd0213b75ce9b6206f63dbdd435ab326598642"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index f07375c761..1edc632de7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "8463db325b93f0669446f68c19334cfe11ffb9c2"
 SRCREV_machine ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
-SRCREV_meta ?= "5017570a130f142365dfdcd043d84143fdd6e255"
+SRCREV_meta ?= "d7fd0213b75ce9b6206f63dbdd435ab326598642"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 85ac0a651b..e907d363df 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
 SRCREV_machine_qemux86-64 ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
 SRCREV_machine_qemumips64 ?= "996fe040c8d8d01a9af6be42dae3844d127471bf"
 SRCREV_machine ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
-SRCREV_meta ?= "5017570a130f142365dfdcd043d84143fdd6e255"
+SRCREV_meta ?= "d7fd0213b75ce9b6206f63dbdd435ab326598642"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.25.1

