Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBACC54EE9
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:24 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.51627.1661624779406155162
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=J0boRoz4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 202so4211697pgc.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=2ueEkX4gMgbDtTo9grDTWUHrFWiPnHCnCXn8RimbVEM=;
        b=J0boRoz4bGKdnsOhttbpd5uBcgBzaEKecjO8Nekz8ZX51qkS9cVgJWbT9ApUm/j/GF
         iNoRUm0+5/4/y2H+/zby/CI26LZjFnYxmu+IDsITyrnzFBkVI5d4L8hWGb6T9fwfjDwO
         CicVCgBFBSAKpJB7oNgwp6125oP3x7Ky5mHQ2hov2Pa3TEG5ClgXqhM5ISUgTq+CborD
         MQEtrZ5tCBtLP4Zk1hHO8hlgEuaaLGRB3l3L8G33ujugaydQdmum0shEn438kZLe0uOf
         0J/u7JM/L/Aj7omMyGZImYXXDnYKg7csGegAseUX8jK4FpDbXsJA9hr1zN7rvUdcaZ5O
         QB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=2ueEkX4gMgbDtTo9grDTWUHrFWiPnHCnCXn8RimbVEM=;
        b=TdK1Rh5dBQnaqGTZ3G1Vbr9jy/x29L8+TSBjWLqvqkdMj7M3fC9WYYn6YexIEcdEbG
         wZVfbHqQ5QhbQvPCky2rSmeEsOTDqSFSw+63oH5SUPwAEtJ9RFTHGDbnXKs5CytYBAuP
         VDFekiDqj8iUx6YvLozOqY/GJYahQfdF3J5AVCWrKFGWzsCSczQUeU0TogKdgv0HZQ3O
         pity4LyTobIvtVKU6CVxL3ougr2E/lwwVdtQw7VLaP/9C9fGAQf1T9XYw0h4BQJmmfnS
         7uUBF8TusTU/nw81deJkk18cVtB7i0nsRCCexPBHdGZizJg5HdLyHjXXs9DmZJbZCuwO
         rbQA==
X-Gm-Message-State: ACgBeo3iYbCyX10bYeDtzS+GuQ6loSiZ3UFCbHuOGFGTZzVJVJFt6jzT
	fgkrBnoRW8X7gHLMTDxSxLEaA2sG1et+psDb
X-Google-Smtp-Source: 
 AA6agR5s2u4tKZVzk8eideRBOwkffJR7sU01B+6P157zZ4Vt+kFWsUTDlPlsXpxBEJqxPs1rwCQw2w==
X-Received: by 2002:aa7:8881:0:b0:537:cc74:d197 with SMTP id
 z1-20020aa78881000000b00537cc74d197mr7561913pfe.19.1661624778453;
        Sat, 27 Aug 2022 11:26:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/24] epiphany: upgrade 42.3 -> 42.4
Date: Sat, 27 Aug 2022 08:25:31 -1000
Message-Id: 
 <4d0d5a8ae3d48fc23a126b74faeb7e16f582bbe6.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169948

From: Alexander Kanavin <alex.kanavin@gmail.com>

Release notes:

Fix crashes and misbehavior when importing bookmarks (#1800)
Fix desktop notification priority (!1179)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit de741b26b23406e30d064685be1254b0d6caed84)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../epiphany/{epiphany_42.3.bb => epiphany_42.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_42.3.bb => epiphany_42.4.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_42.3.bb b/meta/recipes-gnome/epiphany/epiphany_42.4.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_42.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_42.4.bb
index f9d60ff2a9..9efd2800da 100644
--- a/meta/recipes-gnome/epiphany/epiphany_42.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_42.4.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "7316d3c6500e825d8e57293fa58047c56727bee16cd6b6ac804ffe5d9b229560"
+SRC_URI[archive.sha256sum] = "370938ad2920eeb28bc2435944776b7ba55a0e2ede65836f79818cfb7e8f0860"
 
 PACKAGECONFIG_SOUP ?= "soup2"
 PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
-- 
2.25.1


