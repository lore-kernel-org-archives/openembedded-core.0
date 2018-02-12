Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 75C9F60053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:32:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 00:32:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,501,1511856000"; d="scan'208";a="26929026"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga003.jf.intel.com with ESMTP; 12 Feb 2018 00:32:23 -0800
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 16:27:05 +0800
Message-Id: <1518424026-25060-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] maintainers.inc: change ownership
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
X-List-Received-Date: Mon, 12 Feb 2018 08:32:23 -0000

Taking ownership on recipes related to boot and base setup.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/conf/distro/include/maintainers.inc | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2500d19..33a9d55 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -59,8 +59,8 @@ RECIPE_MAINTAINER_pn-automake = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-avahi-ui = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-babeltrace = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-base-files = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-base-passwd = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-base-files = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
+RECIPE_MAINTAINER_pn-base-passwd = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
 RECIPE_MAINTAINER_pn-bash = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-bash-completion = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-bc = "Jose Lamego <jose.a.lamego@linux.intel.com>"
@@ -272,12 +272,13 @@ RECIPE_MAINTAINER_pn-ifupdown = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-init-ifupdown = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-initramfs-boot = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-initramfs-framework = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
-RECIPE_MAINTAINER_pn-initramfs-live-boot = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-initramfs-live-install = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-initramfs-live-install-efi = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-initramfs-live-install-efi-testfs = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-initramfs-live-install-testfs = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-initscripts = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-live-boot = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-live-boot-tiny = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-live-install = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-live-install-efi = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-live-install-efi-testfs = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-live-install-testfs = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
+RECIPE_MAINTAINER_pn-initscripts = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
 RECIPE_MAINTAINER_pn-inputproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-intltool = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-iproute2 = "Changhyeok Bae <changhyeok.bae@lge.com>"
@@ -463,7 +464,7 @@ RECIPE_MAINTAINER_pn-llvm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-lrzsz = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-lsb = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER_pn-lsbinitscripts = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-lsbinitscripts = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
 RECIPE_MAINTAINER_pn-lsbtest = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-lsof = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-ltp = "Yi Zhao <yi.zhao@windriver.com>"
@@ -687,8 +688,8 @@ RECIPE_MAINTAINER_pn-systemd-serialgetty = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-systemctl-native = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemtap = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-systemtap-uprobes = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-sysvinit = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-sysvinit-inittab = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-sysvinit = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
+RECIPE_MAINTAINER_pn-sysvinit-inittab = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
 RECIPE_MAINTAINER_pn-taglib = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-tar = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-tcf-agent = "Randy Witt <randy.e.witt@linux.intel.com>"
@@ -716,7 +717,7 @@ RECIPE_MAINTAINER_pn-unfs3 = "Randy Witt <randy.e.witt@linux.intel.com>"
 RECIPE_MAINTAINER_pn-unifdef = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-uninative-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-unzip = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-update-rc.d = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-update-rc.d = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
 RECIPE_MAINTAINER_pn-usbinit = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-usbutils = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-util-linux = "Chen Qi <Qi.Chen@windriver.com>"
-- 
2.7.4


