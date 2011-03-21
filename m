Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q1bcS-0007vG-6e
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 10:41:48 +0100
Received: by wwb17 with SMTP id 17so6308189wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 02:39:59 -0700 (PDT)
Received: by 10.216.190.40 with SMTP id d40mr3849473wen.34.1300700399741;
	Mon, 21 Mar 2011 02:39:59 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n52sm2497935wer.0.2011.03.21.02.39.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Mar 2011 02:39:59 -0700 (PDT)
From: koen@dominion.thruhere.net
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2011 10:38:40 +0100
Message-Id: <1300700320-25880-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1300700320-25880-1-git-send-email-koen@dominion.thruhere.net>
References: <1300700320-25880-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/2] qemu: enabling the alsa driver needs alsa in DEPENDS, add it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Mar 2011 09:41:48 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

This fixes:

| + /OE/tentacle/build/tmp-angstrom_2010_x/work/x86_64-linux/qemu-native-0.13.0-r1/qemu-0.13.0/configure --prefix=/OE/tentacle/build/tmp-angstrom_2010_x/sysroots/x86_64-linux/usr --target-list=arm-linux-user,arm-softmmu,i386-linux-user,i386-softmmu,x86_64-linux-user,x86_64-softmmu,mips-linux-user,mips-softmmu,ppc-linux-user,ppc-softmmu,mipsel-linux-user --disable-werror --disable-vnc-tls --enable-kvm --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370
|
| Error: alsa check failed
| Make sure to have the alsa libs and headers installed.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-devtools/qemu/qemu.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2c6b114..f41b49c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
-DEPENDS = "zlib"
+DEPENDS = "zlib alsa-lib"
 
 EXTRA_OECONF = "--target-list=arm-linux-user,arm-softmmu,i386-linux-user,i386-softmmu,x86_64-linux-user,x86_64-softmmu,mips-linux-user,mips-softmmu,ppc-linux-user,ppc-softmmu,mipsel-linux-user --disable-werror --disable-vnc-tls --enable-kvm --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370"
 #EXTRA_OECONF += "--disable-sdl"
-- 
1.6.6.1



