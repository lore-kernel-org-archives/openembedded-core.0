Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063A9CCA489
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:05 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.51614.1658306698678729601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DDE2kNCZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ss3so31735798ejc.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HQajUdJABr8NBpQBfrNes8TD1yPipjVBhvN4pSQypYg=;
        b=DDE2kNCZ3GNj6+tWR8BEqZkbdcfSxGTO1AJOVqlKZc4xAhQEdSuUmBz3s2JP0GSRMr
         M5NgIJ8DpmHK1ALpqbY5aFyrsBqtc1PXAesYh2XAUs+nZjUpG4DxhLM7CWc+9s/ZNO87
         09T5/FfQ08iVDXb3p80h+Y8SFcujF1TAqmcWpyQ0fR+Yjk3GjnPZC2Z1uPaqup1R6pDO
         Ga2xgC7OQ8mmabZHZv/ZKnFPNwdI5WKyyXSiwApIUNBLRtQOSq9J3EFgzupBFBIsIaKX
         dvmpjt/grdoYnWGab2CeWZd4OEeB7kgktZh/i+J9OItbiI6XaBOv5+KkKUlElTQfiy6o
         nnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HQajUdJABr8NBpQBfrNes8TD1yPipjVBhvN4pSQypYg=;
        b=IyL38c5k3l7dJmAlWIOltYh3vwQsNuotOqC0e/LZ1MRggiUXl8XeEFzrkbNC8AU0p2
         b1qAPpebH6ZZHhm9DO6art2FLcO6CanT7b7NUE+FjACXEKWoMu6C3ZD7H6Yt5I1/fgKh
         bfeeVW2PhBz5QiSfuzBabZ6QywwruLXPmLOEMeSC1h4fZjq1ENXtIe6Ul4suDlNRQmA7
         hBUo5YqpHyy8mnhGGFDzMg4m/ClEstbuIxKMyDqu9xtqsdi3CgQyMEKVcpw32IWBaZkz
         k38skHlMZc50pY5JVvg6TtPufpNUJ3BNQhki4v0WYb6+SORjuCXLyiz6APds3C9Krlz7
         RQtg==
X-Gm-Message-State: AJIora+bt88MA7ghCAe2ShMZ4xm/NCAvckfLX5uBWf1tI51SIVtQqnan
	HiwCUqkcu34AJhAliN2En87T+XIGDF0=
X-Google-Smtp-Source: 
 AGRyM1tqU1BSQbOlEe7UwxPzK4XmjRza49YBOkn41lS2XKg0xtFOzSCzsvIf3bhcrv7RdmoLD/ichg==
X-Received: by 2002:a17:907:69b0:b0:72b:8e7b:6c2c with SMTP id
 ra48-20020a17090769b000b0072b8e7b6c2cmr34683573ejc.61.1658306697248;
        Wed, 20 Jul 2022 01:44:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:44:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/51] xev: update 1.2.4 -> 1.2.5
Date: Wed, 20 Jul 2022 10:43:59 +0200
Message-Id: <20220720084442.2940187-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168302

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/xorg-app/{xev_1.2.4.bb => xev_1.2.5.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xev_1.2.4.bb => xev_1.2.5.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.4.bb b/meta/recipes-graphics/xorg-app/xev_1.2.5.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-app/xev_1.2.4.bb
rename to meta/recipes-graphics/xorg-app/xev_1.2.5.bb
index 9407fa65f1..0e3def6eee 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.4.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.5.bb
@@ -14,4 +14,6 @@ DEPENDS += "libxrandr xorgproto"
 
 SRC_URI += "file://diet-x11.patch"
 
-SRC_URI[sha256sum] = "d700e08bfe751ed2dbf802baa204b056d0e49348b6eb3c6f9cb035d8ae4885e2"
+SRC_URI[sha256sum] = "c9461a4389714e0f33974f9e75934bdc38d836a0f059b8dc089c7cbf2ce36ec1"
+
+SRC_URI_EXT = "xz"
-- 
2.30.2


