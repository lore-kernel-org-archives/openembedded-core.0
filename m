Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02BAC43219
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:11 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.16777.1667744267612979638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fLveRNDZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id gw22so8359132pjb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePPwi9DyD+TBUV9BhrfJzRmnAUCDXYhpsGt7bF/NLtE=;
        b=fLveRNDZtcn5PCdbWk8QCNYRfRCztcZZ6iwkNAOKVdzoPKC1JXVMra4Bwqqbqy/sTu
         5M9UH+kU+GPtGS6JMIW7NnWfgO3+/nTjFnrdj/j5vE4bPPYynhVYqBryp4Pm0XqWcIT1
         WiFngGcLH0ENqKjpbuJq8MwNhRmuM44VJKwj/7gGVd+JwsSzHu3bXxenzZqcbMezUWI4
         tmvJzAayRXU6HWB9TcOb+ntutQiHhjiFVUZpjz3YIQVCeLGfaeBR2QXmqXO4Wx3wcOGC
         3IPh9X/PsJYR2v/agmpfTxWuwCkpOvJf/r2WLh5RpyTPG3W9RGXRroJjyhEzNY54BJM1
         qRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePPwi9DyD+TBUV9BhrfJzRmnAUCDXYhpsGt7bF/NLtE=;
        b=WC2D6dxnF4QRlcyErW8HroRcHfT85Zp8q0DfSwjpkCBIxdNSP4QrTjGUMs04fzjfnk
         l674k4oZRks9mS3PRUu07jFawQ7UTRWzdpiKxFNQBR1psIcjINZL9ju8eh5IANimMBCr
         zGqHL43T1plaIL/mYDziJXbs7HS/u/02QsNYyMyyr4G1gL9ItRsVJ4njo2tOG22RYYXw
         EX/3XVd7Z7h1D9Xpx+7dY2sHTX08SlvwX2o8gU0+VEfcksoJ2gJkoLWVC02Zt5xh1Jdb
         GEymzUG13zhXovBmxg7EmmVPeHXVWeulFGC2Q9yw5TUuSLRgytL81p+zzEjOdqVqItGx
         SOzQ==
X-Gm-Message-State: ANoB5pnF91QFjhA5jjhRbDQtFGsba+ylGQQTltDXlXknyhXpp7unF+ql
	cpd8AZ3c+cJ5Xnfg03FLzqf3dejZ6EgGU66d
X-Google-Smtp-Source: AA0mqf4d7zoCD7esDXO+cXNUgzhygsPiyUkFznBgZ9RABwfTfJuDXHNYWypLfbyucmWrWuZDEqesEQ==
X-Received: by 2002:a17:902:b10d:b0:188:7ffa:4680 with SMTP id q13-20020a170902b10d00b001887ffa4680mr1185579plr.156.1667744286932;
        Sun, 06 Nov 2022 06:18:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 18/34] linux-firmware: package amdgpu firmware
Date: Sun,  6 Nov 2022 04:17:01 -1000
Message-Id: <bb907ecbc0f513b83163db0985ae9ab3486389f4.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172786

From: Vincent Davis Jr <vince@underview.tech>

Add packages for the firmware required by amdgpu kernel driver.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0d7aa21f120a756d1a4fc4ae0be3527b54a58247)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20220913.bb        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
index eea9251a84..8f921e2d0e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
@@ -228,6 +228,7 @@ do_install() {
 PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-mt7601u-license ${PN}-mt7601u \
              ${PN}-radeon-license ${PN}-radeon \
+             ${PN}-amdgpu-license ${PN}-amdgpu \
              ${PN}-marvell-license ${PN}-pcie8897 ${PN}-pcie8997 \
              ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 \
              ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
@@ -429,6 +430,17 @@ FILES:${PN}-radeon = " \
 
 RDEPENDS:${PN}-radeon += "${PN}-radeon-license"
 
+# For amdgpu
+LICENSE:${PN}-amdgpu = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-license = "Firmware-amdgpu"
+
+FILES:${PN}-amdgpu-license = "${nonarch_base_libdir}/firmware/LICENSE.amdgpu"
+FILES:${PN}-amdgpu = " \
+  ${nonarch_base_libdir}/firmware/amdgpu \
+"
+
+RDEPENDS:${PN}-amdgpu += "${PN}-amdgpu-license"
+
 # For lontium
 LICENSE:${PN}-lt9611uxc = "Firmware-Lontium"
 
-- 
2.25.1


