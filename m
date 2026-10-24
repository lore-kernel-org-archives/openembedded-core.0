Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8871.1792858238596239690
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 09:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ic2MPacc;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3550c917fd3so2695704eec.0
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 09:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792858238; x=1793463038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4m2G7nvyEK1Th0xSnEKvkfUxAz95wKkdWyuTagZEVCE=;
        b=Ic2MPacc0BZaBO/OWbpGNZq8wjoNzkW7j1gAkgqsyES/9bn9ktEtwqyUe7QHRvr6TQ
         6spx8+eFZ8OIwEs0OCXh71IPnJ2cEC9qHx3gNcA+MH5yyOrZbjXuOGvUHGlelqVQOeh7
         xwFsQL8NN+slyp4tfNE/uZzLDFFKeC2pQ9vk9MCzBmDLMT89vhqbOmS8Qx4B+YevKU9V
         n7TcNpC0rpX+6cWpBpJFS7/Qo+natBS44kIaJl4lN0xFZUpiDqI9qxY23QsqWr3hC1M7
         +QogW4ipRgO83n7/JcGaCJgCglaAqUdPDF2dhAL0oMGG7QxeE9ZQNVQ+562D0hGT/5+V
         UD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858238; x=1793463038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4m2G7nvyEK1Th0xSnEKvkfUxAz95wKkdWyuTagZEVCE=;
        b=JnruCSIVIxSxo6F7fMndJ6+OASlEQtcFnJxfEzhFpox2QvbsWMoiHeUYD/lpYPUdhR
         mUnIX7hLsUwCiQ0DWs096KIp/AVU7LK9FF4A+CmYkIpeUDwbnAbJR8ZkIDUyr482wWVF
         cRwiK4LZwWxhROYeO/e9C2w1VL/XdzoAbYyxg/zcg3gR9kA7DmbrqsbfqG2ZlCWfhYOi
         LD+Hb4eD1nzzHxCMyJz0psKwk6g5xjj9icO+kHa/0dEgxcjp9VAo7DUj59tpwa3B37FH
         wTBBEVnoL7JJcgR6DNBKMI5jqPEDkbsgZHLgp2devNwcLKO9ld+KiTSJG198olMEelQn
         an6A==
X-Gm-Message-State: AFq9FYIRNq52IJ04zWX5YOoRMGkrWoFvDdFe4TAqtGgaEf7eBPqDaK8l
	GfvBaPuTjYEjDb75nqin2QqELeQ03rRBH0U05kqWEYz1fRaSe4PzQiTOc/N6bWy1ris=
X-Gm-Gg: AYBFou09a//zYk4K/t2VSV3zO+0x2jij2ik3lYM8Ec4i2uI21jXA+2jhfc/s6Wf9s8c
	Z1rAPn4YInZD/nYSL4ZJXQyArvq+eIlkA7WuK6PBAV6vd67BnBEei/9Z/xMZaAHFbVfZnWk5fOX
	zhMUNG8xLzg+EhyFlDKjHGPeuORPmM8LTMjupDRs430y/7aDNxMlMfpIvowdQ83NH0hir7FccKO
	YhqSgSPrTkPN0GJ1p66p4rPNw9+RB6aIQ6yFYSBzJVZAg8LB+R/+Y/yvMsstiTFYr7gIUmX+ACZ
	q2C2bv9mtmPVo6L5Ygb/6bbXvrCVet6dmQF3tAVXwN7KyMG2OqAxppC++4zExK29j0MJ4Vfy0dG
	1usH306UkvOPzjvo2B/WRFJqNtt1Fiz3yGllbqdIeFgZv5U5MpyHPAzWu+Vr8luMz8nibidjqry
	U5htYthj5+C/baJs8FmkpcAVCEZH2W104io4s+eauLyWtFRJVzMhzGhaeUydcXGGDB7/3oJ5NiN
	FfdWlOphqtEKkRx2wALqzehq75L7PeJ6xUca2eOHajZ2ui3gFGJ7TeK14CEvp1DhmU6BZ9dkmXY
	m+F2BXsSw9g+wDPIRyZfkhdhZ9hWirPPBLBPGHdT9RxtKyJoAvNTdJwc3xcSw0JMGGBTdYbHTDD
	HDYFmzu7AF8idor1sjit7eye8X9UHhAVpnAyeu9f5TCZE0xQS7OktEcqPPPA9NuB7pslQMcKWUL
	NkwhsBUiGpVYEEcHsUX+sY058Wx5kHlx4paT8m991Sfd6cvwX7mhR7Wl95WzF4HZmZT4QbfncWO
	iv3831I+7VW7khQZ+DldQ==
X-Received: by 2002:a05:7300:d10a:b0:360:c266:cdd8 with SMTP id 5a478bee46e88-369e847ef8bmr3339434eec.24.1792858237811;
        Sat, 24 Oct 2026 09:10:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee71f5sm10400190eec.28.2026.10.24.09.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:10:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 2/3] pulseaudio: Drop x11 requirement for consolekit RDEPENDS
Date: Sat, 24 Oct 2026 09:10:32 -0700
Message-ID: <20261024161033.4140130-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261024161033.4140130-1-raj.khem@gmail.com>
References: <20261024161033.4140130-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 16:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248595
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

ConsoleKit2 no longer requires X11, so pulseaudio-module-console-kit
can pull in consolekit on any sysvinit distro.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index c7690d0e18..28b8826946 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -274,8 +274,7 @@ RDEPENDS:pulseaudio-server = " \
 RDEPENDS:pulseaudio-server += "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
 
 # pulseaudio-module-console-kit is built whenever dbus is enabled by PACKAGECONFIG
-# but consolekit depends on libx11 and is available only for DISTRO with x11 in DISTRO_FEATURES
-RDEPENDS:pulseaudio-module-console-kit =+ "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit x11', 'consolekit', '', d)}"
+RDEPENDS:pulseaudio-module-console-kit =+ "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'consolekit', '', d)}"
 RDEPENDS:pulseaudio-misc += "pulseaudio-module-cli-protocol-unix"
 
 FILES:${PN}-module-alsa-card += "${datadir}/pulseaudio/alsa-mixer"
