Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DB4C0015E
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:47 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.17593.1687961621637223992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=bwdlRfCT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-66767d628e2so3483058b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961621; x=1690553621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFcWXrm1Kj8HUdOaVOTzH1o4MMTOgogtIsdPBBSzwJo=;
        b=bwdlRfCTXtgSG8FiyyId55bVsWUjJC5CBe7TFgeKTOau7C/bxQX6TmqIEtWPq1aN6v
         Gwf9KNh/wzcRiHC1wMNknZGStPseDDAwNQymQ0CuogiOXcxzCMRuaZfIggh4QWzNVFFj
         m6fFCde+S1GvwTbMWXglxxvscZryYCD3oU4hzsA4ubKvLxhaWuVL39YijRbkae2vAZUl
         Pr/Q4Hwvx5ivpyCFeXtxFY79hUHD1N+4bA+snHGsMIYIBgfQ487TsNivaQT0tGzosOBV
         AkKjygRtPoL6MD93mL0SBfeOvCIR55uDhUEG0+N3vGZmZzZIz5jldFjapny1TS8HcORo
         Vkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961621; x=1690553621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFcWXrm1Kj8HUdOaVOTzH1o4MMTOgogtIsdPBBSzwJo=;
        b=i2xP1nO231SNfS/nt5mFhXHQGZJhV9yvEg7uu97DfE3x3sQbtCUNOkpsaj/pSUhU42
         qI0yWZJA/EWBgsnV4fyzShElMVpdHxv8R1c3+sLNLfPFksmHecVW3ZcAAGJI4EES4NrY
         aS3kPjMLCWGJXI9hbPAhkHdEzK0G4Y9jccLMXGhw1MA64yNfFVRUp/qgvsC2G4m/4LyZ
         SdWH3gZuoCXPLQ8jmGTqxNeonP8e21egrjk3Ra/Vxqp0ObM+yRo2YjZj/rvElM3+4ygX
         DYSzX5qjh9qtZ0PxiUe9FZjotaJ+OmSDLBcw0XLSAR9Rvee3SUAkC//eRNVfIDwH+5tJ
         v/dA==
X-Gm-Message-State: AC+VfDwQI3a+Hv0Q2hnOr8/IAk7p/vytWPMuQbgXXzzfHbhdbtqXXOJ4
	3HPDy5nma4vb9Ur7Yvx4fm8LL83TKcIfyVilUE0zTg==
X-Google-Smtp-Source: ACHHUZ46zS2SzROplWb7JryJNJ1YDz240ecZfmaEN9OMnpHugjB/0JMQAwonD9TWje1zNMCvvpzAwA==
X-Received: by 2002:a17:90a:1a07:b0:262:b229:7e45 with SMTP id 7-20020a17090a1a0700b00262b2297e45mr9084372pjk.11.1687961620712;
        Wed, 28 Jun 2023 07:13:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/29] maintainers.inc: unassign Pascal Bach from cmake entry
Date: Wed, 28 Jun 2023 04:12:48 -1000
Message-Id: <826fb858ebf1f8e9e2741b9046fd5c04638ff056.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183578

From: Alexander Kanavin <alex.kanavin@gmail.com>

This was confirmed via private email.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c30e9f1972a3e1d4099f39fd6d0dfb37acb73ce1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 78f85a6c79..36f1fc6073 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -95,8 +95,8 @@ RECIPE_MAINTAINER:pn-cantarell-fonts = "Alexander Kanavin <alex.kanavin@gmail.co
 RECIPE_MAINTAINER:pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-chrpath = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-cmake = "Pascal Bach <pascal.bach@siemens.com>"
-RECIPE_MAINTAINER:pn-cmake-native = "Pascal Bach <pascal.bach@siemens.com>"
+RECIPE_MAINTAINER:pn-cmake = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-cmake-native = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-connman = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-connman-conf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-connman-gnome = "Ross Burton <ross.burton@arm.com>"
-- 
2.34.1


