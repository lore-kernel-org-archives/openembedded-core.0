Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id C8D9561521
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 16:01:08 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id j7so6903999plt.1
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 08:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hb1YP4Ww4aYxh6cH36O/5k70Y0P7rH0U6X71ZUmfpa4=;
	b=BmwI8QbF+dzvXjtaW0PLJpYmzZOAG48LamJ7lxHsv3F2kyUU1QgTWv7FMX+/6/bFXz
	gmZH8+ZvM3o+UnN4XWC2wVIZ/5exPjpZ76KdCYoSlRnVBlt+M0qadUF3/bk/fpcw93Ht
	0bMYYGjMbWynruDtT+Kz0voi5cEjDCjhSjaCSyFrgWQyJ6uijtgkBJLwdslJPtjcPHfs
	OuyhmfxfBR62CcQVzWG+N4CImXX7DIVYFFJzWGnSgluYTLedDF3uIVwCMGv98uwyjU36
	gq8cPeUXa7WowmzVHp0WKGHRQKsjfhcDFP2yeuUga3oieJ4VWJOu30YiXlUeTfHETqQH
	CinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hb1YP4Ww4aYxh6cH36O/5k70Y0P7rH0U6X71ZUmfpa4=;
	b=dgCZU+xKftgwzvMPgs+DDk+VCCpcU1kyf4R47sIAs7y2j/nU72dS4DUiGLhkbgawGe
	QJxN7L2qQnegf3GidMwKCfNPGyG+UIrPXT4Aur5E9uyFL91ekyNoHnH9qC+bq6In1OnC
	uOP8sVk0ooLD49kUC1Yd/fxQ4tZ3+gewXpQvrr5k53plOMtrMEpQQ+76Fx7UMzvht7Z0
	cGGCC2nicruV6RrqOuoEzDgEE3yPF/j8cHqGL0HreMzXOU9DqrMc8wHUAQNEAiF5wJQu
	h/GZ/uVUITUigqgsqI6tHg1dJx0d+ZlYcGQpn1Y3l6gVXypT0pZkSugn5D3krvLoXohf
	zAgg==
X-Gm-Message-State: APjAAAUNwO4G4D9RA5PXctCtLc4LD+PSgZ1VxsFOQtL2eZEKy5S4iimG
	c/Wx5exsXHQNo+z4RswLgmy/3USA
X-Google-Smtp-Source: APXvYqzz9q7euAqF0zTLKFnDoqjm2Z63jS1NKrukz3OU+6yRl5IG7ojfcRz42Cpt75sP4uHFWBIv5w==
X-Received: by 2002:a17:902:bd88:: with SMTP id
	q8mr15796703pls.13.1581955268449; 
	Mon, 17 Feb 2020 08:01:08 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:9144:9b3e:b52:fa29])
	by smtp.gmail.com with ESMTPSA id
	a22sm928041pfk.108.2020.02.17.08.01.07
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:01:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 17 Feb 2020 08:00:49 -0800
Message-Id: <1c16c37e907f4712f40aa70d62c6a526e5228195.1581955142.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581955142.git.akuster808@gmail.com>
References: <cover.1581955142.git.akuster808@gmail.com>
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
X-List-Received-Date: Mon, 17 Feb 2020 16:01:09 -0000

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


