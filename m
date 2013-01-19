Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TwhSu-0007e1-Ix
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 00:04:45 +0100
Received: from mail-la0-f71.google.com ([209.85.215.71])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 19 Jan 2013 14:49:16 -0800
Received: by mail-la0-f71.google.com with SMTP id fn20so5896439lab.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 14:49:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=PjRoJpL/44wGUvO/81ymlH9vcPX7jgJjFyp3Sswsh5E=;
	b=A8ZLZvM/nfCroDLhk9NK3+GHrPJ4DbaGpNSg2FMutZwVagXMBsPFeKM9utsx/picex
	jEKyTERtBwxBORinHYYVTiG9slimc4NaQRJw9GwSHV6AvKKJ6FXPQDsAIu0We6bgADfc
	X2lwW5G70tRyCREWb49zIdUpsUJhe1vkAVXWMcL/hBhMZxOmT4t58vGweFl0EsjmsL7u
	ulODIhVge07iFceIKfZ42tUpDfkVTPTCvhuj7PSf9WlUqcnJs5ur/Gn8N8uC+VS1l6XN
	qzaUVCbvB/G0UxuLvW2qvFlrZmQPlY1ZmQVMegjNu+gP1jUX7YyMtsGehbkoFbhmIIG8
	uKlg==
X-Received: by 10.194.240.233 with SMTP id wd9mr20053225wjc.54.1358635754028; 
	Sat, 19 Jan 2013 14:49:14 -0800 (PST)
X-Received: by 10.194.240.233 with SMTP id wd9mr20053220wjc.54.1358635753867; 
	Sat, 19 Jan 2013 14:49:13 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p2sm10967931wic.7.2013.01.19.14.49.12
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 14:49:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 22:47:04 +0000
Message-Id: <807c839e2a2d9236e4b5a1425d6ca47e200aaebc.1358635193.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm6og9BfEwbPDor2ahG4CyRq6+SO86NIwvZTOsNcAMuiSp7jL3LLPVkpdw0M+2/mpn1peiFP2tj6dV4CGAUyIJblcZJmSuLrLZo6nfjG+RScD5OUGGdaD6ocpeSQNRrcda5qwpvcbmL9fVMw9q+BKAnIgTeEJKzUfbB8sYeR7VHtWS8NWd8U1cSpShorxy5pM/ws0RZ
Subject: [PATCH 01/10] default-distrovars: Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Jan 2013 23:04:45 -0000

From: Radu Moisan <radu.moisan@intel.com>

This is a more generic way to set the init manager since we
plan to support other init managers as well.
I will use this variable as a switch to turn on/off any
init scheme that we might support in the future.
By default we use sysvinit.

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-distrovars.inc           |    3 ++-
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 9002fd6..f073547 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -19,7 +19,8 @@ DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-b
 					libc-posix-wchar-io"
 DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
 DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
-DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g x11 ${DISTRO_FEATURES_LIBC}"
+DISTRO_FEATURES_INITMAN ?= "sysvinit"
+DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g x11 ${DISTRO_FEATURES_LIBC} ${DISTRO_FEATURES_INITMAN}"
 
 IMAGE_FEATURES ?= ""
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 16ad4e3..94e9e32 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -26,7 +26,7 @@ RCONFLICTS_${PN} = "task-core-boot"
 # Distro can override the following VIRTUAL-RUNTIME providers:
 VIRTUAL-RUNTIME_dev_manager ?= "udev"
 VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
-VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
+VIRTUAL-RUNTIME_init_manager ?= "${DISTRO_FEATURES_INITMAN}"
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
-- 
1.7.10.4



