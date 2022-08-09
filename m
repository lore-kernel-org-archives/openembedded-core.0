Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D04C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 03:43:05 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.7875.1660016581533510890
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 20:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BKO5/uLu;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id e23so7970461qts.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 20:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=ukBJbnitvXQfC/Bv6K016i2EzqrlBqsLQYtYsxovrEk=;
        b=BKO5/uLu+fxgehymjQEnK3pbyDVnCBduwOa21rzFRZcQFq70Do6er0c5PMMog3nwiO
         DW7fzSfobjbKNC3JyK0v58cMg1zfQvhWNFGEkZyllvhoDgFB5yYX9W1TZyHeZAMXesK4
         DWpy8+bAo/Xxuar9IIj+0YtVxmxKLTGWrpaDIqIIvR3qxJUKYpDWrwcvc0qupRDTVHxL
         N8kV1yxB/Qg2r2ss9Zqyxg1xtcZHxTef0oIVaogDzoTpLa+SQlVEQnVNC/IDlXB3YXUP
         Epvg8k1M0/yEV3Xi5XRTNwmPvc96RpFX7ypK+Cr5yz6wYFR7idWbJci8OheSQr9/bqkw
         Q71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ukBJbnitvXQfC/Bv6K016i2EzqrlBqsLQYtYsxovrEk=;
        b=qgIkH4rQMUG/NOhST+nowMgnzuUXRCJyUAuLcmxPqBt/7Nxz305mrkAwKe4eZGC375
         rzFr0igb66LOOTATpEz/kODr8IofqvPJGS86ZHyzJYv4Vp9kb053IPiF8yyxMH/K8NIx
         v8nnB8vlN03+2XkQUJw0YO162aZIrNjUdQdR9KmI32UGCgnvPYRLuAgFDaOYW220KqkL
         swjFGWydKD+4Zsea/+cnk15m2TSMCs0CAfJWcqGOnaT/rXy9aC+WxEV9QI2DKjrdtRrH
         zSetQqFYVcYLyUnbjXR5NO4dRgSjRJx+bZqJ9e7FEAxeHBvwM+S4fHMdQ6i3S76eSFKc
         lK8A==
X-Gm-Message-State: ACgBeo3x43HfkfB4UhFqqNe6joyKJEJfS7LLqJ869bGcOhj1t7gjgd+D
	KEysPwTGhHF7uJWNzG2s1yw=
X-Google-Smtp-Source: 
 AA6agR5DwMXVxJcR01gEVvJgqrw2E51lzpTwZGQy/nm2Hhm9RxV4pFYnhSX3+GLhZqiJEpGxTtwoMw==
X-Received: by 2002:ac8:5942:0:b0:31f:39f6:aba7 with SMTP id
 2-20020ac85942000000b0031f39f6aba7mr18286711qtz.295.1660016580429;
        Mon, 08 Aug 2022 20:43:00 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 br35-20020a05620a462300b006a6a4b43c01sm483898qkb.38.2022.08.08.20.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 20:42:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/5.19: cfg: update x32 configuration fragment
Date: Mon,  8 Aug 2022 23:42:57 -0400
Message-Id: <20220809034258.53200-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 03:43:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169127

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    00e2494f7e4 cfg/x32: rename X86_X32 X86_X32_ABI

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Apply this on top of my previous 5.19 patches to get the x32 tune
booting again.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.19.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index 54982bc200..94f900c91a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "e41cf2ea686c923a56b8fbc52ea998dc7193f099"
-SRCREV_meta ?= "eb7088accaa0347a5b627952e48bb8800ff15cf3"
+SRCREV_meta ?= "89fdc2046baff988519317cbe838386b6489779f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index 716e5aa652..ab6c0b7d90 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
-SRCREV_meta ?= "eb7088accaa0347a5b627952e48bb8800ff15cf3"
+SRCREV_meta ?= "89fdc2046baff988519317cbe838386b6489779f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index a1a2e72774..4debef5f2e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
 SRCREV_machine:qemux86-64 ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
 SRCREV_machine:qemumips64 ?= "a078f75cccc88d26763cab4762ed00418813f2cd"
 SRCREV_machine ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
-SRCREV_meta ?= "eb7088accaa0347a5b627952e48bb8800ff15cf3"
+SRCREV_meta ?= "89fdc2046baff988519317cbe838386b6489779f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


