Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69166C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:28 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.4535.1661294179804728120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3c+vFLVV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id g18so15332982pju.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=wzCk7nqK+E2H1fvj69dPXx/w4ERWdtRmyjig7vydoiw=;
        b=3c+vFLVVW/eofW8fzZyQE18iIcSRALXcnGRPcgpAhh7wKyf1EpfE9oZGtDPkHgEP8M
         Mtw2cfGP/YC4pAKWr8T/iNBoMwXTAjwD/GuE7n4Or6Y9+I+Nsh8trJCzl0EEawNDvLdW
         21HooOefAUVpdHqb2T3OI0rX9NnQ7tcDbAIqrJzR5zgM1DWxXeV4DEny0ngah7xunwkd
         J0E+VxLCwEl7Cjs1xXxebNJ5eduJuE8EU1os42WveRP732ZGe5dLQn8Fsw2P2MLU4B5I
         0HNxTDjnZB2p0fD1yTjG6tFqVCEdTIyJQXK3psfkmdY/uAhEm1v2dggFDJ4saYWpoi2B
         MA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=wzCk7nqK+E2H1fvj69dPXx/w4ERWdtRmyjig7vydoiw=;
        b=Vlf/oeoA9R4VDNm06h4EW6zcU7RXZJQPgBQK3m0tm+47fwl5Mq9tk94JkgQ1MVdKlR
         vUnwma2jx1KzuuqiwN5e8mJkObeVzoSWB/Lv+JKdNPcF5pTcVdijPhjr67XmcusOOJ6X
         xxT3Ejuxza0hyaDC8qndLZkEDe3Lbe6RMkoSQPtJ7w6D/VzNGUh0inukI0nNBHreiWki
         A5dC5sQQkBXkXvQZr8dHlJaDG7SIYthYOHevb77t0IbezvQFbqQAjGDjsWXEfxHQwn6i
         TSwrQl/pS6DlHM9c4FDIxL7vH0dYEw94wcdcIkHLCjHGlgUGTNbgS+1bbG6vWX3tbg7B
         8iLQ==
X-Gm-Message-State: ACgBeo09Hcc/IgMYmCDS0/CP25tp+c43z5S4YbEjnfvQisdAizwN4LLh
	7DQZpiD0hinxFmhgMrZBarEEzjjEziUscmhA
X-Google-Smtp-Source: 
 AA6agR5+ON05llkQMpD86/KqlcPA/mfvipCyJcYaC3Uh6FjcnRIZqhfl6dDno/z5F/t+Rwcs5sIWSQ==
X-Received: by 2002:a17:90a:1c02:b0:1e0:df7:31f2 with SMTP id
 s2-20020a17090a1c0200b001e00df731f2mr5118182pjs.222.1661294178781;
        Tue, 23 Aug 2022 15:36:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/28] libcap: upgrade 2.64 -> 2.65
Date: Tue, 23 Aug 2022 12:35:26 -1000
Message-Id: 
 <70cd3c073512084fccb85b311911794ea895d3f2.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169746

From: Alexander Kanavin <alex.kanavin@gmail.com>

CHanges from 2.64:

- Fix syntax error in DEBUG build of protected code in setcap.c. (Bug reported by yixiangzhike.)
- Prevent bash from reading the wrong startup files when the capsh --user=xxx argument is used to invoke a shell as the user xxx. (Bug: 215926)
- Man page info for cap_get_pid() and cap_reset_ambient(). (Bug reports from nomonemo and Tinkerer One.)
- Improve documentation and help for the captree program.
- Updated go/Makefile comment about an unfixed Go runtime bug in go1.16 and go1.17 (resolved in go1.18+), and the deadlock behavior of the psx-fd test.
- Refresh the signatures on the two GPG keys morgan@ uses. The 4096 bit one is preferred, but the older one is also used for continuity reasons. This set of signatures should also be available from the various key servers out there.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c3b16a6d0d0d4246b44dec3b1818f435d32d04e5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch | 2 +-
 meta/recipes-support/libcap/{libcap_2.64.bb => libcap_2.65.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.64.bb => libcap_2.65.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
index 9884fb5641..3f4c7e57ae 100644
--- a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -1,4 +1,4 @@
-From fc60e000169618a4adced845b9462d36ced1efdd Mon Sep 17 00:00:00 2001
+From 1c234bc39446eb9b23896e85dd67b02976d46c3d Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Oct 2021 15:57:36 +0800
 Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
diff --git a/meta/recipes-support/libcap/libcap_2.64.bb b/meta/recipes-support/libcap/libcap_2.65.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.64.bb
rename to meta/recipes-support/libcap/libcap_2.65.bb
index 7690d3e9a5..8013d40769 100644
--- a/meta/recipes-support/libcap/libcap_2.64.bb
+++ b/meta/recipes-support/libcap/libcap_2.65.bb
@@ -20,7 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "c8465e1f0b068d5fc06199231135ccac7adb56d662b1de93589252e8cd071e13"
+SRC_URI[sha256sum] = "73e350020cc31fe15360879d19384ffa3395a825f065fcf6bda3a5cdf965bebd"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.25.1


