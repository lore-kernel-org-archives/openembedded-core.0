Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtcyX-0007Da-Ju
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:39 +0100
Received: by mail-wy0-f175.google.com with SMTP id 38so2800543wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:13 -0800 (PST)
Received: by 10.227.178.143 with SMTP id bm15mr2445104wbb.142.1298799011971;
	Sun, 27 Feb 2011 01:30:11 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w25sm2268168wbd.23.2011.02.27.01.30.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:11 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:46 +0100
Message-Id: <a6af907826f77763d362c88db588b9e4cbac5894.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 35/50] linux-yocto: update to 2.6.37.2
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
X-List-Received-Date: Sun, 27 Feb 2011 09:36:55 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Fixes [BUGID: 773]

This consolidated SRCREV update addresses the following items:

  - updates to 2.6.37.2
  - updates the routerstation pro configuration for USB mass storage
  - merges the PERF no scripting patch into the kernel tree

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../conf/distro/include/poky-default-revisions.inc |   26 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_git.bb       |    3 +-
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/meta/conf/distro/include/poky-default-revisions.inc b/meta/conf/distro/include/poky-default-revisions.inc
index 5321c5a..5e9c39f 100644
--- a/meta/conf/distro/include/poky-default-revisions.inc
+++ b/meta/conf/distro/include/poky-default-revisions.inc
@@ -98,19 +98,19 @@ SRCREV_machine_pn-linux-yocto-stable_beagleboard ?= "ef7f944e773950d4016b7643f9e
 SRCREV_machine_pn-linux-yocto-stable ?= "72ca49ab08b8eb475cec82a10049503602325791"
 SRCREV_meta_pn-linux-yocto-stable ?= "e1f85a470934a0cf6abde5d95533e74501822c6b"
 # development SRCREVs
-SRCREV_machine_pn-linux-yocto_qemuarm ?= "ff1a1f83d771b32f5b44f6b12572cfb15420b446"
-SRCREV_machine_pn-linux-yocto_qemumips ?= "6c6ab18c84f42e15cc1fdcb9012c287beecdb0b5"
-SRCREV_machine_pn-linux-yocto_qemuppc ?= "094132cc9d22ab3edc092bb9c7ee0e5fa309e318"
-SRCREV_machine_pn-linux-yocto_qemux86 ?= "91a9dc10dad9d29f07f59b2489b744325d2580a0"
-SRCREV_machine_pn-linux-yocto_qemux86-64 ?= "929567ec621cf99e0932d8ede34f756e25d4c751"
-SRCREV_machine_pn-linux-yocto_emenlow ?= "c6299ae5bece8e3a6e1bc2c236862ae004629aae"
-SRCREV_machine_pn-linux-yocto_atom-pc ?= "929567ec621cf99e0932d8ede34f756e25d4c751"
-SRCREV_machine_pn-linux-yocto_routerstationpro ?= "b557fff9c7f864ea2a9c81ac80ec176bba3d78ef"
-SRCREV_machine_pn-linux-yocto_mpc8315e-rdb ?= "8f0124a21f5563b0c51c8426f4430ac222bd463d"
-SRCREV_machine_pn-linux-yocto_beagleboard ?= "929567ec621cf99e0932d8ede34f756e25d4c751"
-SRCREV_machine_pn-linux-yocto ?= "929567ec621cf99e0932d8ede34f756e25d4c751"
-SRCREV_meta_pn-linux-yocto ?= "94772ea4f51267a6a9aaffd106035d47dfef1354"
-SRCREV_pn-linux-libc-headers-yocto ??= "929567ec621cf99e0932d8ede34f756e25d4c751"
+SRCREV_machine_pn-linux-yocto_qemuarm ?= "dd15f43fe3d4820ce112501c1a790c9bc12cfd0b"
+SRCREV_machine_pn-linux-yocto_qemumips ?= "76f30ca447fd0f06e76d0cb4935b016a1440e23e"
+SRCREV_machine_pn-linux-yocto_qemuppc ?= "b318cc6df4a439dc2b547f8eb841ff1ede69419b"
+SRCREV_machine_pn-linux-yocto_qemux86 ?= "37e8651b5df243aca2388867212c06338159df4e"
+SRCREV_machine_pn-linux-yocto_qemux86-64 ?= "2b412826bbeb4a16abe2ea74f2456ab880c6e3c1"
+SRCREV_machine_pn-linux-yocto_emenlow ?= "db6fc8c0d3d7f3e474e6c6b95138123911311942"
+SRCREV_machine_pn-linux-yocto_atom-pc ?= "2b412826bbeb4a16abe2ea74f2456ab880c6e3c1"
+SRCREV_machine_pn-linux-yocto_routerstationpro ?= "17dedeb17887eb398743b04615302b61bd95ffdd"
+SRCREV_machine_pn-linux-yocto_mpc8315e-rdb ?= "6117f19403ccd5c288ce553def432925296a28b7"
+SRCREV_machine_pn-linux-yocto_beagleboard ?= "2b412826bbeb4a16abe2ea74f2456ab880c6e3c1"
+SRCREV_machine_pn-linux-yocto ?= "2b412826bbeb4a16abe2ea74f2456ab880c6e3c1"
+SRCREV_meta_pn-linux-yocto ?= "e2737075b79e4fc682e41051cf1c0bc47a47d502"
+SRCREV_pn-linux-libc-headers-yocto ??= "2b412826bbeb4a16abe2ea74f2456ab880c6e3c1"
 SRCREV_pn-matchbox-config-gtk ??= "3ed74dfb7c57be088a5ab36e446c0ccde9fa1028"
 SRCREV_pn-matchbox-desktop-sato ??= "76"
 SRCREV_pn-matchbox-desktop ??= "af7ed6775487380be73160aa0298bf6019765fad"
diff --git a/meta/recipes-kernel/linux/linux-yocto_git.bb b/meta/recipes-kernel/linux/linux-yocto_git.bb
index 9a3c666..38fbba3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_git.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_git.bb
@@ -21,8 +21,7 @@ PR = "r16"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 SRCREV_FORMAT = "meta_machine"
 
-SRC_URI = "git://git.pokylinux.org/linux-yocto-2.6.37;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta \
-           file://tools-perf-no-scripting.patch"
+SRC_URI = "git://git.pokylinux.org/linux-yocto-2.6.37;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64|mpc8315e-rdb|routerstationpro|beagleboard)"
 
-- 
1.6.6.1



