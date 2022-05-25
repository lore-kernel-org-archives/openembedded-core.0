Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8C8C433FE
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:46 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.7512.1653489045272559097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=m9/JOFhi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id i18so1785589pfk.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GOKFpJfGpVb0D8zOa2xO4guyQePTR7l4qBIyyR3Vr4A=;
        b=m9/JOFhiwQUxg8175jr1ql+LL3D+6O32DRxX749O9DtxJBRs9s1Ur3NzbOredwQTa8
         43++FF9MjwyPBBzdF7dvTd+GKWW8cy6DfsO1qg2jlI94EQOynBFO+hltsKR3lSUSE5tQ
         bWCrOTbRo/nAeGHFS6q+VwZWjX2MkO/eKH9bWbvmGhNkZmr7TST324MWf7BjAHqbs6tg
         2NHr/HrsTGPVIVG9vFwNAVgnp2vzQ+yw9wOttGE4tcCFNJVqhsocEYaOZLK+pYXdL8x0
         g1ga141Hjb3jGXdnuyLssXr3sto8BaTnNMLoFcIffGNEmvbgWu4tDt/t4d4SqIjXXp7e
         4L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GOKFpJfGpVb0D8zOa2xO4guyQePTR7l4qBIyyR3Vr4A=;
        b=q3h1iMHJ5IogeVLCQyd5BmL2bUBw5x9XUBrrBfN5Q5QMgUEp4hlM1k92CrisDWEjxB
         /qZFK1unp6nRO0QdrJp43TBOOa/v4mr7HPNSkO0s/W90x7BFadIhjKUZPwaI/uYhL6Zw
         r+v/XOEIIROWX79RLSzdFsPxPeX5t17OwVWJmb/rCbc8CjEFgPn0cd92VNmJ2SOcPr4U
         b8MrM5nupEq810Jw/ujWjtBMX57I1/iPgIM3qgu/DXn0lSgx5M29vmRheDPSGKBygkU0
         ad4dhQsshGCpiXXmvTmDS+cEPdTAagrkF0jKy4FIRoebcm0v/aKt6VWvDhbHMB7ibKgz
         +9Eg==
X-Gm-Message-State: AOAM532PVuQdU43MeZiyTnRkivILERMMSjZOik4u+kcnsxROe9H3aegI
	xqSmmHlVOCXd2nV7J9HQ8VLX69glAKp7B62E
X-Google-Smtp-Source: 
 ABdhPJx5CRhRjN53eVXiuBWkxRy+1yLU436x6u1zTXeYQyN9pnfHlNzIgjHNt1rB9bjVByWkmMZxNA==
X-Received: by 2002:a05:6a00:230d:b0:4f6:ec4f:35ff with SMTP id
 h13-20020a056a00230d00b004f6ec4f35ffmr33888095pfh.53.1653489044043;
        Wed, 25 May 2022 07:30:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/19] mobile-broadband-provider-info: upgrade
 20220315 -> 20220511
Date: Wed, 25 May 2022 04:29:45 -1000
Message-Id: 
 <bbfce5f1c2ec4cb22efdffb1be41d147f4fe1467.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166143

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f14c8094e7a049ac1b04c45b76855d0503559932)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 781b9216c5..e6f216e5cb 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,8 +5,8 @@ SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
-SRCREV = "4cbb44a9fe26aa6f0b28beb79f9488b37c097b5e"
-PV = "20220315"
+SRCREV = "3d5c8d0f7e0264768a2c000d0fd4b4d4a991e041"
+PV = "20220511"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
-- 
2.25.1


