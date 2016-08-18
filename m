Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DDBD876A51
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 06:15:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7I6Fm5i012600
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 23:15:48 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 17 Aug 2016 23:15:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2016 23:15:40 -0700
Message-ID: <56688deea0039f27979175a1fe92ac07d78dafe6.1471500427.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1471500427.git.liezhi.yang@windriver.com>
References: <cover.1471500427.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] arch-x86.inc: set vars for runqemu
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
X-List-Received-Date: Thu, 18 Aug 2016 06:15:48 -0000
Content-Type: text/plain

These vars will be used by qemuboot.class, all the x86 and x86-64 bsps
can be boot by runqemu in theory, so add the settings to arch-x86.inc.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/include/x86/arch-x86.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/conf/machine/include/x86/arch-x86.inc b/meta/conf/machine/include/x86/arch-x86.inc
index e51d595..283b525 100644
--- a/meta/conf/machine/include/x86/arch-x86.inc
+++ b/meta/conf/machine/include/x86/arch-x86.inc
@@ -51,3 +51,18 @@ TUNE_FEATURES_tune-x86-64-x32 = "mx32"
 BASE_LIB_tune-x86-64-x32 = "libx32"
 TUNE_PKGARCH_tune-x86-64-x32 = "x86_64_x32"
 PACKAGE_EXTRA_ARCHS_tune-x86-64-x32 = "${TUNE_PKGARCH_tune-x86-64-x32}"
+
+# For runqemu
+IMAGE_CLASSES += "qemuboot"
+QB_SYSTEM_NAME_x86 = "qemu-system-i386"
+QB_CPU_x86 = "-cpu qemu32"
+QB_CPU_KVM_x86 = "-cpu kvm32"
+
+QB_SYSTEM_NAME_x86-64 = "qemu-system-x86_64"
+QB_CPU_x86-64 = "-cpu core2duo"
+QB_CPU_KVM_x86-64 = "-cpu kvm64"
+
+QB_AUDIO_DRV = "alsa"
+QB_AUDIO_OPT = "-soundhw ac97,es1370"
+QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1"
+QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet"
-- 
2.9.0


