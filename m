Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 042086161F
	for <openembedded-core@openembedded.org>;
	Fri, 21 Feb 2020 02:54:06 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id j7so248467plt.1
	for <openembedded-core@openembedded.org>;
	Thu, 20 Feb 2020 18:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hb1YP4Ww4aYxh6cH36O/5k70Y0P7rH0U6X71ZUmfpa4=;
	b=W4KsyRx32cixR473yLdAM5m6nUAS5v4XL0y1GsHB8GjU+AwTmIWtXiUjfl27/UDp6x
	dyuEjw8zq2ZDs5g1sf785zErrTVrM/dBa1BTm0PUS2yIRFChUanGXfbf6hhwOKiKGlYe
	GvboWUuEcuJpbThZz3BmCYCpuelO1BFnZLCPjB3rxvMv4cZmu51bLSmx9XSj5TnLyAcL
	PZh8etzaFlqP/nevOVLzfF36xg2aePWKdjOhChRseHsAMlKOTgnSRWpiHnBGInnpX6am
	5+nwB/fJTwoZs8/2qbqH43+77JLLDeWEIhCPbMGhPrz9CO7HcbFn7MKyIWyz9zLGbNcr
	9tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hb1YP4Ww4aYxh6cH36O/5k70Y0P7rH0U6X71ZUmfpa4=;
	b=P5z3W3iS2a6SlYGaQCWPMTEwc7lQikAp4mIMa4rBxynBU3A+NKgcdfpoDjc64X9AuA
	40u1GBJ0c0UL+JL90BO12gLy8kp7hm5HuNlwGYrpGcqu7RPBSObN2mtTuKbjDr0UQxGS
	7N2R7En1F+VninqeEXWmlYk97ULrtKUUIcPbG83ubIeoxEfSpGXCyqFcBJPkjckWcXhX
	R6Dh/6eO2gNzPNS1xxYtorCW5H8oGKnGSp3vkh7z4xpqZ7FTav5DZTgVSx/i5rGC1X2v
	zOaoQx3xkW+5GYFvc9ISNjF8kZVurqKL+fr5HDRQbMj6kVQ2gJunQH/qo//4kJQoVRLj
	I4fA==
X-Gm-Message-State: APjAAAXR5VLC3LRMsDcL8iAPMs6/HkWhz6D/7+7YkQg+4l9SVafvDRnO
	nXE7KhwQN7TruPSxz7PVHTSdwTJM
X-Google-Smtp-Source: APXvYqwcLNjiT1wncgKuLf1d6amoqQ8JS36uzdkdgvw/ZYD25zoQiX+qDrwy+0Mv8Mfmls6KIKWN8w==
X-Received: by 2002:a17:902:aa49:: with SMTP id
	c9mr35216691plr.145.1582253647842; 
	Thu, 20 Feb 2020 18:54:07 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:88be:17f0:935c:9e35])
	by smtp.gmail.com with ESMTPSA id
	y10sm925320pfq.110.2020.02.20.18.54.07
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 18:54:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 20 Feb 2020 18:53:30 -0800
Message-Id: <1c16c37e907f4712f40aa70d62c6a526e5228195.1582253544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1582253544.git.akuster808@gmail.com>
References: <cover.1582253544.git.akuster808@gmail.com>
Subject: [warrior 11/14] linux-firmware: bump to 20190618
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Feb 2020 02:54:07 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4cbb7392c729a2436c26308c2320fdae5c450d7a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{linux-firmware_git.bb => linux-firmware_20190618.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_git.bb => linux-firmware_20190618.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
index 8b6ad96dba..acaca955be 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
@@ -92,7 +92,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
                     file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
                     file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
-                    file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
+                    file://LICENCE.Marvell;md5=28b6ed8bd04ba105af6e4dcd6e997772 \
                     file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2 \
                     file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261 \
                     file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
@@ -123,7 +123,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=b6e44adf71bc37e5f26ebfe5a08b5490 \
+                    file://WHENCE;md5=55814698bbae7c7dd40c9fbde91af0a8 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -190,9 +190,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "711d3297bac870af42088a467459a0634c1970ca"
-PE = "1"
-PV = "0.0+git${SRCPV}"
+SRCREV = "0731d06eadc7d9c52e58f354727101813b8da6ea"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
 
-- 
2.17.1


