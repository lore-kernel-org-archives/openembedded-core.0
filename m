Received: from mail-pz0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPmze-0000pG-1q
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 05:46:14 +0200
Received: by dadv2 with SMTP id v2so964722dad.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 20:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=86Nrq+GDT64C4bN3f1VrcKPl9OU7Y+rHlN1r57dg+ks=;
	b=nMWi3awCc7cAQPffxerLZcem8G6WhmFBL0HUqiuMhA72yp/6akS9f7vHuNefmsOK5O
	pvR0pGI9sjQuWCGSuhBYsxQWOCk21PxCfmuHmAEnEU6TzXg7XhDpJfJHTB4EVHpuGpBQ
	tLQgkEotpSn2iSh99g7DUfcHBRekGHgBcIJIEEMx1wI2UkxVaYH5QjwwmR9107h4XZWD
	n+kIrDhJbOpX74XUPdmkawJQfjCMuIiiLYWC1a1u2wcrdNbC0xauHBR+CRIPn7rmjDCp
	G77NrqNEQPs/GNW/qctM/MtAFpMgEl2JYiwlUc8r+87/rmIcrngIf3Ra5nrU+8g74fox
	DHhQ==
Received: by 10.68.241.232 with SMTP id wl8mr3231995pbc.67.1336016188248;
	Wed, 02 May 2012 20:36:28 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nt8sm3883458pbb.12.2012.05.02.20.36.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 20:36:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 20:35:30 -0700
Message-Id: <e6ccd54276855728be4e18f3fab28136736963a1.1336015963.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1336015963.git.raj.khem@gmail.com>
References: <cover.1336015963.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] qemumachines: Enable xserver-xorg as default xserver
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
X-List-Received-Date: Thu, 03 May 2012 03:46:14 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/qemu.inc |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 421a149..e384879 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,7 +1,14 @@
 PCMCIA_MANAGER = "pcmciautils"
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive"
+PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-xlib"
 
+XSERVER ?= "xserver-xorg \
+            mesa-dri-driver-swrast \
+            xf86-input-evdev \
+            xf86-input-mouse \
+            xf86-video-fbdev \
+            xf86-input-keyboard"
+
 MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
 
 IMAGE_FSTYPES += "tar.bz2 ext3"
-- 
1.7.5.4



