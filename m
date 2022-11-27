Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43645C46467
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:33 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.92064.1669557391900057919
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=sLOIX/K/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id k7so7848547pll.6
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZC/XHtv65sAZlY/7ANDKSGiBEESvdAkwsblaKRYjuDg=;
        b=sLOIX/K/S/m88X166BVf9zdPr2x4prPVcoLxrzzzR05y4xp4c54cI5fDeXWGzKZCSo
         6QvzM+Bx/pY10pl4AhCRKO+p3Pwb/UYOY2IMUHf1D6v5vs5CrQpKQJMdHUb6N9v1+Hf3
         vx95UaW2zctBkOS3Oj97xIkHBkYnSC1KhBRGnVyGmChzlye0iPz2mJ9eNoY/nMk7D4w0
         M3bjxROWGOr75ZXM1ReSo7sySpwt8xQu562rVyTgxV3F3XLCr3UXU881vAcQEQ/fQRPu
         L+qFEMN8K4mzldRhd5IvU4VwTnSFe4AmAfRb2+Zwzo9ex+iA7ekvrNgnQWGZXA0cTMm+
         35Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZC/XHtv65sAZlY/7ANDKSGiBEESvdAkwsblaKRYjuDg=;
        b=o+tucqLMmlrfiBdPajb2dRnxDb7aHFpRL86+6gRiPQczzMq0lxB5lmwhtMmLQ5PBKV
         500UYWkb05kja0xvD2SgfudGgwYNcq03x4kVqfDhbaO1qQvfSkxOtFQwO47CgGpjCEfS
         YPL8EfZ2U5Ts+7VEU8Jzn5HdDjsE+NFf4TXT1zu2aD40qD5kZUXIscUijo7DMgGsF8fO
         dmyungA3L3y4tVnaFxWKPeMTpAckwh2LSPicQ2OnknzuXcdVPFSp29rV0mVPRf3Ll4YN
         Fydhmmi1fTPF2IFh6FH1avU0LgCUgUSGTDxjRzRCmSmK5er9keh/rOpXXG+OshAU/lvZ
         N6Fg==
X-Gm-Message-State: ANoB5plBDl5aPLucmzysTq4mBmehoETkkAGhdEXe1Yj+vNPhZRgNViwM
	bcD71oGhzkhaPDudiV+FWB57nU/xmvPca9yxhys=
X-Google-Smtp-Source: AA0mqf7tuWCUtfQLyWYYOaBqMNDiPMAVUieUxNKwDZc6nTVfecjXU00RK9mA53udLBDg08E6dQi3Ow==
X-Received: by 2002:a17:902:ead1:b0:187:31da:a260 with SMTP id p17-20020a170902ead100b0018731daa260mr26900809pld.64.1669557390883;
        Sun, 27 Nov 2022 05:56:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.56.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:56:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 30/31] meta-selftest/staticids: add render group for systemd
Date: Sun, 27 Nov 2022 03:55:16 -1000
Message-Id: <ba1db7f9189526b02e3d75d375ece53953c2e942.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173875

From: Peter Marko <peter.marko@siemens.com>

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5b761270267063afb0462d1ebf99cabe32ff4e0a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/files/static-group | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index b2e0e2f870..b13dde3218 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -23,3 +23,4 @@ _apt:x:523:
 weston-launch:x:524:
 weston:x:525:
 wayland:x:526:
+render:x:527:
-- 
2.25.1


