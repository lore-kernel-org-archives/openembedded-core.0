Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80ECFC25B0E
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:45 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.50699.1660877018260547942
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zEq8cRjH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id e19so2196063pju.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=6xpfFpxmFKd9Ft4+2jwLGWyjmppeLBRaI9OWxSngNFw=;
        b=zEq8cRjHo+YZJarGpUjzVWx6M7FTsgjGaWh7uhEMH1awFfrEj3jXBXielT+njVT31W
         JQ+iVSgovUbbqzxC54+3elqZXZPGHaihzGqr7Br1RMkvdoLNBIRBuX0C9UN/fV76xQE3
         9m5YWXX4eul6WHzkwc7qIGuPFVVEPVUlOdlVPRDCQPHF36f9tED3J7RBZCF6uYDrf5Gj
         qZa280zS7Pke95jVR50nW5VAGhF6EeZypWCqrz1COWlQuPpYslztUz6NfUPQ6gChvgrT
         UBhOpt4fgutHvPQHp4Qpm8EOc6dcSmekiSgvan/NA1uIw11m2UYAlRFPcBl6qj7oPn6h
         PDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=6xpfFpxmFKd9Ft4+2jwLGWyjmppeLBRaI9OWxSngNFw=;
        b=pOtUtjNauC8PCL+PxhFuvLM0rbAEoCgi7j3F6q5+3W6c2yo6DzBpioGBDueAJ9MNr0
         8fjpx/toHkvBIATQQVuPfzXEXqtILZPsLqIv74D5TcTiVEhdftOSnblI8pqeOU/OrDNK
         oR5jD+kWLGEEI1RtRB+a5loICnVFf2Wx2bXbgfz40eu/vzlIf6gzYpgVWdO2gSxlSwGV
         GiVRAvHp3DZEXrKADKJmW43Mo3wMpm5uoAyyP7MENvA1RoTrxO+B6BpSojUCDkJ7bOls
         OLT8kOfIOBZ4f6yp+HCFcvbLh39h4CLASdnF02lVUAEElR8yhMyCvQWCQkn1DuUzycHz
         cz4g==
X-Gm-Message-State: ACgBeo3l+TZJKMPnJbyvxJ4C4+KsN80kfLVW2ShXt3B6nzHTYErowgdt
	xkX9B+NfJ4SVW1nfHinNLCIww9GFUnEebCPV
X-Google-Smtp-Source: 
 AA6agR47iBtttMJzRnqNJFe/hjdjXLCEOcymAE45yViSPE2tJg9U5s0rws8oEWuNHDhwx4PzQ137Aw==
X-Received: by 2002:a17:90a:ee88:b0:1fa:aac3:6fb7 with SMTP id
 i8-20020a17090aee8800b001faaac36fb7mr5956212pjz.62.1660877017395;
        Thu, 18 Aug 2022 19:43:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/26] runqemu: Add missing space on default
 display option
Date: Thu, 18 Aug 2022 16:42:36 -1000
Message-Id: 
 <fcb55a198eddf4110fd4baf67614a7598441d952.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169557

From: Mark Hatle <mark.hatle@kernel.crashing.org>

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee9428611fc38bc711b5b3e12cf0d3257b1b5680)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 6e1f073ed2..24c4a40b50 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1375,7 +1375,7 @@ class BaseConfig(object):
             elif "-display sdl" in output:
                 self.sdl = True
             else:
-                self.qemu_opt += '-display none'
+                self.qemu_opt += ' -display none'
 
         if self.sdl == True or self.gtk == True or self.egl_headless == True:
 
-- 
2.25.1


