Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CA1C4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:17:41 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.16486.1667744256080889945
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fjVy4X6i;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id j12so8920319plj.5
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KajuL30hsAoaOkFZK76V8+HXA6IbOPtP8ITpn2R70q4=;
        b=fjVy4X6ib3EiIsSMZrtpWRa7Ri9avbUBGnZOlc5BUeXkcuH4/0FkBy8TmWETews8A+
         qHE3cHxlqu9pxX25wcENqOROgU/06epaqeL8BpMId1huZNnetAE6BlueET4dyFYbroh2
         fcZnXepP0PTkOoXpmwfayY6RLOLt1kjhq+PygdaNhBNmHy/JuBDUwAW7TvqMniV4Gpro
         Y4O280DsaduKWISv9bbeht6/o19vFXDYNXDeXBdhDQntmqi6v+I7/6ykGT/7zwAy2HH1
         K+2doyFnIn8xZbkauVxrCv023TAV+MQEmu9oEDhm2lC6ZcMgnGl2jvKBhlOy30G3r7Q6
         s9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KajuL30hsAoaOkFZK76V8+HXA6IbOPtP8ITpn2R70q4=;
        b=bEqJvP2lpk/IygNcIj1etjTyh0qKEuZOnJ+VkDmk73q7/PJoyNQJ4eJb9kdx5OqY30
         AACWNlJ+J5EzmysqYO4Jx5EQRLFY2Z0ucoN/SwU864SUEXj87fkrgKngG8nUjLugn8lH
         EKLqEpG9m1zu2cOZeAfkef4+D9Y4DDGgyQkRxKjns6FGecnFZQk68vQ2dKDNL2/v6ttu
         aoDHiM/moNd15DucApMotaqs1O0OXcH1K66V2tmqcK/0iiXJLPrL/ZrEmc5mFuf6FN+I
         2QjrsefvmAd3jQzdxEqyMAtKOIEZ0xucIqbm516dq0kSqwuDvycHB/2VP/cyEqc5VDIK
         sGMQ==
X-Gm-Message-State: ACrzQf1SwUx7NvslR1pF6DnuyAgu7RDZPGNOAHnd66l5hCegN8VG4ZOi
	0ZjYoCppLAXa/uIl0fPqrDHR+kW/NdnmYEtd
X-Google-Smtp-Source: AMsMyM7+uz0qbdzVwY8U4Elkc/djJVv9KOVV7EL+WVNGv39sTNRy623+iqaguwkPCT4lCdGitUimAg==
X-Received: by 2002:a17:90b:4f43:b0:214:21d4:503e with SMTP id pj3-20020a17090b4f4300b0021421d4503emr26864163pjb.235.1667744254985;
        Sun, 06 Nov 2022 06:17:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.17.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:17:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 02/34] libcap: upgrade 2.65 -> 2.66
Date: Sun,  6 Nov 2022 04:16:45 -1000
Message-Id: <21f57b4341d8520c1e7319b2b9a0616af61e0f68.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172770

From: wangmy <wangmy@fujitsu.com>

RELEASE NOTES FOR 2.66

Fix documentation typos in cap_from_text.3 (Bug: 216514 reported by Paulo Andrade.)

Some getpcaps code clean up and a fix for PID argument parsing from Jakub Wilk.

Slightly more robust Makefiles to address an error with make -j48 test observed by Tomasz Kłoczko.

Include a simple Go program, captrace, to trace kernel capability validation checks

This program can be used to figure out what capabilities a program needs to operate.

captrace (a wrapper for bpftrace) uses BPF kprobes to monitor the kernel for capability checks and whether or not they succeed for the system, a specific PID or a program's direct execution.

Trim down the default file capabilities for contrib/sucap/su to those actually needed and set USER and HOME environment variables so bash doesn't complain about a sourcing error.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9040e612084a561b1766bb86c9c002b811eea4c9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch | 2 +-
 meta/recipes-support/libcap/{libcap_2.65.bb => libcap_2.66.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.65.bb => libcap_2.66.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
index 3f4c7e57ae..8bd2050ea5 100644
--- a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -1,4 +1,4 @@
-From 1c234bc39446eb9b23896e85dd67b02976d46c3d Mon Sep 17 00:00:00 2001
+From a3196f3a06e7bbfde30d143c92a4325be323b3d0 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Oct 2021 15:57:36 +0800
 Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
diff --git a/meta/recipes-support/libcap/libcap_2.65.bb b/meta/recipes-support/libcap/libcap_2.66.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.65.bb
rename to meta/recipes-support/libcap/libcap_2.66.bb
index 8013d40769..c50e9d8cc7 100644
--- a/meta/recipes-support/libcap/libcap_2.65.bb
+++ b/meta/recipes-support/libcap/libcap_2.66.bb
@@ -20,7 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "73e350020cc31fe15360879d19384ffa3395a825f065fcf6bda3a5cdf965bebd"
+SRC_URI[sha256sum] = "15c40ededb3003d70a283fe587a36b7d19c8b3b554e33f86129c059a4bb466b2"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.25.1


