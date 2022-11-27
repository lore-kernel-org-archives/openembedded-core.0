Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434A4C47088
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:13 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.92049.1669557361761849325
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:56:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=kue9ztaI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so3669186pjm.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPOnO1FfISBXbUDAJ+IoLb1CN10Psf2/InEhTnxQDq4=;
        b=kue9ztaIxwFqJIr8w4UCulfCuekzbPhnqjCl/8O5fwp337k85l6lbSdxW3uqneyCPG
         9IhJGqeOePjnXcY4JZD03wmeqKqZ8qwhunqAu42DBv/OPoU0y2ZSyViZ1VhbWZ4EZyho
         LDdiggb5gT5RBau5TSZm2FlhRwvBhR6ojih8Z1c/Qq/rfUpYSzCIvM2m4GFMBxkmz0eJ
         V90ut+bDlW41NC4Y8tyAunyo4qZcqpTlxRusq80i7wwxe+l7r4RPoksVUEHSrejFMWli
         g0L3Reg0vAqk/enoXqUttjS2qIScUybcbcBCn+F8v817rT3K+0j54ZqaRlXZWjoysF01
         kEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPOnO1FfISBXbUDAJ+IoLb1CN10Psf2/InEhTnxQDq4=;
        b=1Bb5SlE6faHipKuuXw6QpKwtZK4vQltOkqFw+mx3FUNrhSLFyB6FOLuXkLOAS9G+5g
         ENg2ctG8SIaZnGrrAtsHdfd/GlN4WEQu3E23Id9lCWGpZiIWdklw3QqXlkPxHmXnX1kA
         +m8mI8iErQRlXTqjvBQe4a3pee3gt+OQUqvy30+Ss2P8aTp5nikMpdi10xn1jdkMEFFc
         6mLxc30XgK/nvpPH/ixcL68kJVHz9kXnmjlaAK/iDbZlHLJ+zEQyV92/bpyWH8lV06wa
         bqZsww+lEn283gGT42K8HzCHvN/bd8zK1bYCMdG8t3jtCRTdcqceMPVv/uXCuuHARFc0
         oxQw==
X-Gm-Message-State: ANoB5pk5azoJHfnWtJLh8NhJBH342EItNx1WoR4wX1iVIbk4PVjnO9tT
	hwmJlvw2o4wGcAP5xY5eZZeUKIZ/vec07Vgoxso=
X-Google-Smtp-Source: AA0mqf51kTBNIq+QXbzbOS5jKJSu0ep9Lq1S/Qn6ixspDGRqVagawbiBGbb07y84bmAqt5MZi4LlZQ==
X-Received: by 2002:a17:90a:b706:b0:212:e75b:1602 with SMTP id l6-20020a17090ab70600b00212e75b1602mr49234254pjr.139.1669557364548;
        Sun, 27 Nov 2022 05:56:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.56.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:56:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/31] mobile-broadband-provider-info: upgrade 20220725 -> 20221107
Date: Sun, 27 Nov 2022 03:55:03 -1000
Message-Id: <d9c986703568e115df7ce87b548879d1d732116f.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173862

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


