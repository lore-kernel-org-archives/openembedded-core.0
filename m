Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31042.1795560776557309517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=mwqc3MEo;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49a92144733so2502864f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560775; x=1796165575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W9xBG8vivGwOxHo8gxUhCuqg88dlwjlKchblVdgt/Vg=;
        b=mwqc3MEokYp8b+Xuq1MtvSpqSIpf92T5Inkyf8Lg9MYewwiAMEUlGgRE/lPeruFCQw
         BinXIzBEy7kNCQGtmfjRjGuaz4tgHETUQ0C8ROZBvzuSooUzW2knd52dIB04KinIDxlz
         pjsm5NzDt2ECuE3mbyLE6tB3Yyne/tOels6JKssb9fLvgtGq0BdEJNBTXfR9cpIKykxd
         WB1X1HjS0sypvR2YBUkWDHQd35QrvGW7RCckY4y8AyGdkHdstydVG8yhW0ldxZEFMjRV
         WwCBT5D0IM31HUB5ZkmL4rJ4CJYqUnZyNQdrWYrd/Si/Ej0AqN94WI1OsRdJEx4Bkntt
         RwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560775; x=1796165575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W9xBG8vivGwOxHo8gxUhCuqg88dlwjlKchblVdgt/Vg=;
        b=dT97ff2eHpCEz+SzE5geSKQj67M75e5pSpcAxd9zMrCkzjICZc1oPv5p21x9MFOIdg
         gVzpQjsHhN90AHbpOTHWHNgpCk1iJy5zACtBUcxoUp/Y9Byleqfdg8ZBT6pBkQ/r71CD
         T54tXy3vyRIi1hZO/seTpxiQ6VPxvGRngYTb4e7mrs4Ytsgxox/8Uq7PVBOmR2LLRF/E
         pMoRab2n+8hyke0mwF7GpM4B9n5CggdxmwfiPuAvv9fBlsmtlKQdZNYyzidwGYzFi48N
         Tuij6g6YBVP86ISJHEoYV6KHmBeBcD9YpvTiNjkHOMR53OJ6UMBhUrJ2fOAdp8c3aNCm
         3N0A==
X-Gm-Message-State: APuU4Z+EwGEGOj9Y2PwXFaMHZi07ZWYGo6EFLQPaH9/PfzWQ3nYPBrrv
	oiuramkYiWbjLxGX3VFZlCf4DeR2wNRswvb7qm8RSvOjXiUxba6eO8jtBSmiMKiI+51IYSoCKt2
	YP1bcZKQ=
X-Gm-Gg: AZFdTZcu1w/oyHsRET4bbh9pQjaRYfObDLHcUaiPFUrKEU/9rT/7lN4cMIrbrgX4hrJ
	G4L+OEcKgiHMmIR58c567O3LkxPLRi3KbucYHAl0JOmdU8STXUgMnR0EisXim2GnYEfH7LdS2fA
	ec5IE+me/nEPMSe/9w0aBeYG0df3kUi3glzashpjkMJJHIr+rIgVfKUalweupVv6KDrVgWnBNi1
	gdG9uAXc06a32oFde/5s4GT8wxa0RdpcRrzhm25mFR50yhNceg2xP73UO8MzEruzNut20zepoPb
	Ri6fTs4P5bKVHvP/R8B6cO71If7wMW05fT3BYo7zyX21BUN48GISV5k2wiOTx+gAp7UI3bR27ZP
	MZQNgN0UgTkijVnYHgEMKOZ7Eb9xa5JqsRvbj3t+is0zuWXTj8QGeVFI85J2g82vvoc1fVfeTkO
	JqfxvxyJp5EUxBbOoxKdJCmqnxX/zX2e7v24k+zB0D1wlTvgOryQHFV8cz0Ro6VC1cd/bulYNnu
	EOwSIvsAz1qg9S2JEUmxm+UQGPYicz2w7lVLkEgvLUaGs5QRHNmEqEyv+/0H0h4zGWSTSN5MOfx
	R3HxIwBMbQbWMsPNAQKlhnZ7sbs4dwRBuBVrXircR7Rl58Bwrrx/Lq9occPus0+CXkIp1cA4YS0
	vW+5dC1G4Wluxi78JSp0YTXi3oeW0
X-Received: by 2002:a05:6000:1865:b0:4b8:75e5:301d with SMTP id ffacd0b85a97d-4b875e5306amr4350953f8f.0.1795560774809;
        Tue, 24 Nov 2026 14:52:54 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:54 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 21/21] python3-certifi: correct license to MPL-2.0
Date: Tue, 24 Nov 2026 23:52:38 +0100
Message-ID: <1dc4b90903b014a610c753ce0cc65b343a17796b.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560372.git.yoann.congal@smile.fr>
References: <cover.1795560372.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251123
Content-Type: text/plain; charset="utf-8"

From: Anders Heimer <anders.heimer@est.tech>

Correct the LICENSE variable to match upstreams MPL 2.0.
The LICENSE file and checksum remain the same.

License-Update: Change declared license from ISC to MPL 2.0

Reviewed-by: Henrik Nilsson <henrik.b.nilsson@est.tech>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b270958cab94f1fa117b5eee36157cf5b14d3cf)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-certifi_2026.10.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
index 0a3ad7dac51..e71d34d5310 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
@@ -4,7 +4,7 @@ Python code. This is useful for verifying HTTP requests, for example.  This is t
 which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
 HOMEPAGE = "http://certifi.io/"
 
-LICENSE = "ISC"
+LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
 SRC_URI[sha256sum] = "035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae"
