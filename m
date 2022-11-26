Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABABC4321E
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:46 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.70838.1669472143845474597
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vlUY3Cwf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id w23so6285610ply.12
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPOnO1FfISBXbUDAJ+IoLb1CN10Psf2/InEhTnxQDq4=;
        b=vlUY3CwfDaq67VQUGlzh/3Oq74NukU4QMtb4xigsSLsQvrkiWtGrr5W9djdmzobTtq
         opl0S2opmhxiMcqnH8n3abwGAO9SFprQzCR2USln7tdG1yWGKEUxvrW4TF0Bx0liatJC
         jA0MNhCfRWRGqoutXJzPEzZXuPg8a+58hNj/FMtlHY+OkaAh+Yr43IIlofem+UKXidMh
         +NwAn3UeiDnuMCHlWyYdQuBi+oWdnu4LCmDzzhPMPNNAMFR07sKXCg/RD2XPJ5wZUgSR
         TMlUB6uGhnFIzBhbYUfQcYR0rwDxzwjFhSYVtav61n2J4OYa7EEr9Ak3DmBNVsObpcSn
         WWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPOnO1FfISBXbUDAJ+IoLb1CN10Psf2/InEhTnxQDq4=;
        b=btGF9ezNnN97HmDVfB7Ds04pU4q1pNjirz+6wJuGEil5DRNjIRqTWqtPVxCRDZM/Iu
         +cs2O6vlDJJEVUyb9y/KNdflzY3Cucq0mE3Iyzpk3nE1jqbR7fl7XoIXCc9z+kuHlX59
         ZR+ihif7vpwlUHSC4h0UJUAPUZ+ztWCeSL+czHBXuqVQdWOset13S+YakkU/LPk+aZDd
         pn1Z7eUa0YepiuSbZvkIfBvXQPFRgc+Zac9rRxVL4+r55QanCAYVxdtRsGYzqbGlThFX
         T6MXL9tOcyTOWmzwxnWvT5DliYTBPvQ+MBmil45AsU4gOWkvUGVFmSPWtR31oax6+YnO
         UmOA==
X-Gm-Message-State: ANoB5pk27YCVpOOy6MnWV+59xV8E+HfabYgnTBDjAPv5044n7+/uHX8H
	1isuZRtu/Kj8+GyqlxklyYloiCbwky0I0FaMOmk=
X-Google-Smtp-Source: AA0mqf7UIECTDHWFQkbmDsfqDRzmsAi8UrDZ+1tKlBLLzANKuJlg7M657uDZYceewk4SCDomYJwW+Q==
X-Received: by 2002:a17:903:26c7:b0:186:e01d:8f2f with SMTP id jg7-20020a17090326c700b00186e01d8f2fmr22688017plb.40.1669472142782;
        Sat, 26 Nov 2022 06:15:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 17/37] mobile-broadband-provider-info: upgrade 20220725 -> 20221107
Date: Sat, 26 Nov 2022 04:14:21 -1000
Message-Id: <a18233b4318553a0255075c320ddfb5c33eca827.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173810

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7e12fa1e6250fc358ba159a6b626458d871f7ccf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 2cc92b7b47..e802bcee18 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,8 +5,8 @@ SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
-SRCREV = "fe19892a8168bf19d81e3bc4ee319bf7f9f058f5"
-PV = "20220725"
+SRCREV = "22a5de3ef637990ce03141f786fbdb327e9c5a3f"
+PV = "20221107"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
-- 
2.25.1


