Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086C4C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:21:15 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.8356.1662560445113510708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=c/iU1bti;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id fv3so8597896pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=ju31NVRh00hUomPemkXaZN5Q4dlD15WJQyk+Ldkxp7E=;
        b=c/iU1btiEDgX4duD6DBQ7Vioe+XPcasfbb7qu8vrGC5UaynW45UNyK60oBPp4BuOTq
         Zep1DmaU2aptTu+EQz7IU38dwb53JFG5sC3S0Xxfnxtp0KAK9ChfDqBkFxWQMxA7TBJZ
         chL2kNEYPhiCNm7O+8Um0XZ47xan9xTErrPhyviMW6af41n1gqjKvTUnXwQInUTZQepT
         7cvHOWlghbgFDZH+gN633UKS/1PtNFxUVoj3I5jq5L/E0IU+HIZctDgy2fe2Swtef7ho
         AZvL57xu1wYukepruV1BPcAyPgG6PCaJBmMnoS8180Yj7zsYA7bJDEwqlkfAcLmNRSF4
         3GBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ju31NVRh00hUomPemkXaZN5Q4dlD15WJQyk+Ldkxp7E=;
        b=Nyu78s4jRFLOnLDjPHsf6VTcQL91VFqBTA/uhCOCz0saZKgQ5NB7wH4gVWMvXG2L5a
         Hc6wBwCHv3N2zwHRb4/HUetWWro8F25hKMoCl66UE/tL/8kC0ajbT/YObe94q+Gfoyut
         l4G7cxirm05KCkBGj1GrKZ9vVOlunW6+eZCsY6zLfPM42+00sGzzMDDbRLa2Gl4yPjGT
         h6EeEDiW2+80OCl7CqumhCdYRKqUs2OnIWSWdBdlChhIrf06zOSraSslCMj/fCwm7fXZ
         XWVnXsfhuknx0tzRoP3kB6NrVWcunc1yM2++qE9PssiCI7K0MM1GGHqEXknZqK6kwWFb
         lT1Q==
X-Gm-Message-State: ACgBeo1Puq72bV1fIm46h3Dd5B4cs4HbcmIqGsXk9SaCOvooTR+Sjz+v
	jjGkE6er6o6/st3fjyJimdDgU7S9tuw9R6d0
X-Google-Smtp-Source: 
 AA6agR6gG2iS1e1aZ+2taHOUc805IZeIflPaHx1yDPqzh7LjtYLU8Za4knZ20WtNRLesI8W3JvViOw==
X-Received: by 2002:a17:90b:4f91:b0:1cd:3a73:3a5d with SMTP id
 qe17-20020a17090b4f9100b001cd3a733a5dmr4304342pjb.98.1662560473467;
        Wed, 07 Sep 2022 07:21:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.21.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:21:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/24] pseudo: Update to include recent upstream
 minor fixes
Date: Wed,  7 Sep 2022 04:20:17 -1000
Message-Id: 
 <fa5e99a57093877cb2332826ac8e9dae21d30b74.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:21:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170411

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pull in some minor fixes:

 pseudo_util: Silence symlink errors and fix resolution bug
 ports/linux: Remove build dependency on libattr
 Minor build fixes
 pseudo_util: Fix resolving relative paths from "/"

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c57d0c57d00cdef622dab3bf783a10d52f8d9ffb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index e7ef6a730c..c34580b4ff 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "2b4b88eb513335b0ece55fe51854693d9b20de35"
+SRCREV = "c9670c27ff67ab899007ce749254b16091577e55"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1


