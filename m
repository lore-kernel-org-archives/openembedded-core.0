Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1208.1794944084470510035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 11:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=oit1y+9L;
 spf=pass (domain: baylibre.com, ip: 209.85.221.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ee27c9eec0so40103e0c.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 11:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794944083; x=1795548883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PV6Td7tWj4V7oDrpa7IO+h1+74yB4W4Lme40nL5S9Po=;
        b=oit1y+9LvWiqL7z46YG3DxA9wvjn0QnVSnABu1yCA/Bn0UYGSwwKv4KmzoD3c8dgcn
         WGJb7gj7Ag5kVvkuwGg54tC8HDz8gT81h4ZGeK6vTCIxuWzbdecbuzEfiAZ/A60NdYRZ
         /tchGytXInvU6t+d+HFTCMhdC0o6H9ULT2/XOBOwISUqa/a5Ck706To06ioUnuzlOGtu
         kl/KzYqyRGzRhH+yB8h0RO12feuupol+KnNegZlIsQW1SArpgvqQtwAB8A948Wd/V1ie
         TEjFDj82iuBMQ4+ckQCbZCY7tTUBSWDbpD1lvvX6bahKOSbswziyY8vg8WvyNzRh/MCX
         /NQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944083; x=1795548883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PV6Td7tWj4V7oDrpa7IO+h1+74yB4W4Lme40nL5S9Po=;
        b=NFn/CnuK3pNxX9QtDQEzVxpXOpJSG3BRx3rv0HXqrrjLWi8e365lv84txKur24p8S2
         pvqAavCNGVnXSYa4/9AMbxJZm5d/iRR9s7FXeFMJy8AUjHremrw5KjswtLjwcxatolwc
         lay2m5Ut853AcSgrVGyZ9/5JMvrN2dQfW07s2Bdd6Lhjc4CMNa66QJT5gChll+jCu5DZ
         fZDdW4Ecng29q0NfF9cpXFs7vLZeFt0MJ5A+WuSSxRvAxmUWJ4moI9EqxcXLIpYO2xFg
         5UmDbZLjFHDNIqvMIZL7Bt6QX1n+IJvizSCeTIG9fzbMAXtWBidicsHFPH1zRHH6F7aZ
         dZMQ==
X-Gm-Message-State: APuU4Z8GDohvI8bYe9vgbHGH7oka3iTkJrz+3Jv/eY6Wpt0CLmQBxBX3
	d/WfhWWqDc63U+LaxnUIkeMW2AW2b3nqM3lozmV5uNJxg2T+DB+AV8Ydcjt5QXmL3usmfK+Tz8Y
	Gh+bU
X-Gm-Gg: AYBFou3n39RF8XkbebQAWlPMkbm5PvftrxICZ2KWBBQ6XgZnoAMZM/Sl2pRzRlP8f6c
	8dTwFymVESdHwzWMs2H0X6gY9h038yblOJLTF7kFd6LO/1++hofuppYg0RYOqw3M7y9qQJ+6/hQ
	epaaTquHf0drBhsRNFT+XRF/NcDv5uVg+n78CuQMT67ugsao4f6XJrY9QaAgBJ/rNYIS19HWhOO
	juXuKdcYzKi/VBM3etCwsNupkVIWOaWrv/0Of9lW/+pRUvCM6vcnm2gVnvkWQIXue67IhduFxP+
	BdwTA1sNwcIxRE4JBLv4n7Po0S0NcjvK9A6yGO65mriSePpKklahTPiiNsl/cggPMnYqoqQvtPh
	W1iW88f5vyXRIp45s9IH1k1MAtacPmDndbkNLnWE0A/BRetP/zmLUCFrkaGV6FD5mabOV5OXQPV
	cszn0R1WiuoKrP0XWULfFgLLEMnXjyyVw4e9/r5ki1nCqiCMvEpRRyXBIbGOAxtD8XEB9WenpNI
	qfX11o0FYfo/JAjwBF0ZXvF5gYOmy3c2/Dn//TJ/xgrXNGQ/dq5Gl8RsW4XACxnl33eqC6r5Irq
	gI/bYzQqGqJi3AkQgthPz0KSV0oPiYrzxrUkfh2cH9SPIkeKpofbXEzM0n0aQOl41vcOy1jWf/f
	9X0/d
X-Received: by 2002:a05:6122:8b10:b0:5c9:a60d:3279 with SMTP id 71dfb90a1353d-5ee6471a415mr393752e0c.13.1794944083281;
        Tue, 17 Nov 2026 11:34:43 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.cgocable.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee64eaf281sm257643e0c.12.2026.11.17.11.34.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:34:41 -0800 (PST)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] lib/oe/tune.py: fix typo in abbreviation example
Date: Tue, 17 Nov 2026 14:34:38 -0500
Message-ID: <20261117193439.3120583-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 20:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250488
Content-Type: text/plain; charset="utf-8"

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/oe/tune.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/tune.py b/meta/lib/oe/tune.py
index 7fda19430d..0ec7ad5073 100644
--- a/meta/lib/oe/tune.py
+++ b/meta/lib/oe/tune.py
@@ -8,7 +8,7 @@
 #
 # Automatically translate a RISC-V ISA string to TUNE_FEATURES
 #
-# Abbreviations, such as rv32g -> rv32imaffd_zicsr_zifencei are supported.
+# Abbreviations, such as rv32g -> rv32imafd_zicsr_zifencei are supported.
 #
 # Profiles, such as rva22u64, are NOT supported, you must use ISA strings.
 #
-- 
2.56.0

