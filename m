Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3C92775481
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 11:42:54 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id o13-v6so5447974wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 04:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w4afiNNkrRKQg18JVr5w6EoSeLV6Ho4+9766MSj+RjA=;
	b=M68lMAUrklsHXxvs9ovhr8UNTIyTwl7p0YOtd7EMcqquQSVDxW1rvZ7mV6ehzT4EXv
	rT1b+P1Yg8PgQ9px6ULMyztvf1TlvwgZlO2JrS/6UuG9XJkyRPi2QqIa11tT4PeBrpJ+
	qWb7Fx8xg24/Jf3cabQMts9M5vH0MtWlougv8NgKgMyXpBdHI5H8sZ7nIjWSH/hge0ck
	Z/3dPYFV11XqVFzsGThZLnipiIwAXBWQd5AKjvk4oJ0/saRHrRBvxiO3hbOAMcFwkD0p
	zIX8HxPrP7X/LUIykpcF7J5SBoiqoRSdwAi0vfoh57G8lY5tvnD3YXcKrWF6AJAsNFpV
	9eNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w4afiNNkrRKQg18JVr5w6EoSeLV6Ho4+9766MSj+RjA=;
	b=C4mvSFpZU4qN9BxvuYuuor/urGCqBGCzciKbc2kS3MbO8MuDJMSZ6bkAR6wztr0BO8
	bM0mBBsBHu87vLqSQz6gzG7fj6rWQJAtxXwALE2BXhw1lWLVF2oFC9LnlBO2GErIrrZj
	sDEXviCnRsopOx6/Gh6okp1s3n87QO+CNBYyS6HqCSlwon/N7cxVwCao3X1FAOzgSSS0
	tgMe5TjvUa3TgLptsPnTaflKQ0DfE5XZuIfveQpTD+UObQUjO80E3+lCDSOXoBeQGCkQ
	5JQCzNc97ulAJUpwGixaPO0qACiABTQhguuxQCx3vCwXS1lizqaUXhuuoReoV3ppC9UY
	Wzqw==
X-Gm-Message-State: APt69E0Sg4b/cbqjQa2dTgK44Zd8g+MCAkoJrKdiSuMPO25YNHcZGRgm
	7BOxG2F5n6bELCGrSuE9xLwMtPh0
X-Google-Smtp-Source: ADUXVKJmDrQ2N2/AVsmF1yX4ehXcvyfdZuWX/WxVfv1/YKI900obOkT2Fgnn7Ui4SYCrq/2sVBRx8g==
X-Received: by 2002:a1c:eacd:: with SMTP id
	g74-v6mr1359168wmi.103.1529494975246; 
	Wed, 20 Jun 2018 04:42:55 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e6-v6sm1276951wro.11.2018.06.20.04.42.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jun 2018 04:42:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 12:42:52 +0100
Message-Id: <20180620114252.20561-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH V2] maintainers: update Intel owners
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
X-List-Received-Date: Wed, 20 Jun 2018 11:42:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/maintainers.inc | 44 ++++++++++++++++----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2f2921b9364..d569e0a7ec3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -45,7 +45,7 @@ RECIPE_MAINTAINER_pn-apt = "Aníbal Limón <limon.anibal@gmail.com>"
 RECIPE_MAINTAINER_pn-apt-native = "Aníbal Limón <limon.anibal@gmail.com>"
 RECIPE_MAINTAINER_pn-argp-standalone = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-asciidoc = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER_pn-aspell = "Jose Lamego <jose.a.lamego@linux.intel.com>"
+RECIPE_MAINTAINER_pn-aspell = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-assimp = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-at = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-at-spi2-atk = "Maxin B. John <maxin.john@intel.com>"
@@ -59,11 +59,11 @@ RECIPE_MAINTAINER_pn-automake = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-avahi-ui = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-babeltrace = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-base-files = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
-RECIPE_MAINTAINER_pn-base-passwd = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
+RECIPE_MAINTAINER_pn-base-files = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-base-passwd = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-bash = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-bash-completion = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-bc = "Jose Lamego <jose.a.lamego@linux.intel.com>"
+RECIPE_MAINTAINER_pn-bc = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-bdwgc = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-bind = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-binutils = "Khem Raj <raj.khem@gmail.com>"
@@ -75,13 +75,13 @@ RECIPE_MAINTAINER_pn-bjam-native = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-blktool = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-blktrace = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-bluez5 = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-bmap-tools = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
+RECIPE_MAINTAINER_pn-bmap-tools = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-boost = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-bootchart2 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-bsd-headers = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-btrfs-tools = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-build-appliance-image = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER_pn-build-compare = "Randy Witt <randy.e.witt@linux.intel.com>"
+RECIPE_MAINTAINER_pn-build-compare = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 RECIPE_MAINTAINER_pn-build-sysroots = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
@@ -156,7 +156,7 @@ RECIPE_MAINTAINER_pn-enchant = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-encodings = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ethtool = "Changhyeok Bae <changhyeok.bae@lge.com>"
-RECIPE_MAINTAINER_pn-eudev = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
+RECIPE_MAINTAINER_pn-eudev = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-expat = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-expect = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ffmpeg = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -261,13 +261,13 @@ RECIPE_MAINTAINER_pn-ifupdown = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-init-ifupdown = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-initramfs-boot = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-initramfs-framework = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
-RECIPE_MAINTAINER_pn-initramfs-live-boot = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
-RECIPE_MAINTAINER_pn-initramfs-live-boot-tiny = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
-RECIPE_MAINTAINER_pn-initramfs-live-install = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
-RECIPE_MAINTAINER_pn-initramfs-live-install-efi = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
-RECIPE_MAINTAINER_pn-initramfs-live-install-efi-testfs = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
-RECIPE_MAINTAINER_pn-initramfs-live-install-testfs = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
-RECIPE_MAINTAINER_pn-initscripts = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-live-boot = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-live-boot-tiny = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-live-install = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-live-install-efi = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-live-install-efi-testfs = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-live-install-testfs = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-initscripts = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-intltool = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-iproute2 = "Changhyeok Bae <changhyeok.bae@lge.com>"
 RECIPE_MAINTAINER_pn-iptables = "Changhyeok Bae <changhyeok.bae@lge.com>"
@@ -304,7 +304,7 @@ RECIPE_MAINTAINER_pn-libcap-ng = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libcgroup = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libcomps = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-libconvert-asn1-perl = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-libconvert-asn1-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libcroco = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libdaemon = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libdmx = "Armin Kuster <akuster808@gmail.com>"
@@ -443,7 +443,7 @@ RECIPE_MAINTAINER_pn-llvm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-lrzsz = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-lsb = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER_pn-lsbinitscripts = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
+RECIPE_MAINTAINER_pn-lsbinitscripts = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-lsbtest = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-lsof = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-ltp = "Yi Zhao <yi.zhao@windriver.com>"
@@ -659,11 +659,11 @@ RECIPE_MAINTAINER_pn-systemd-serialgetty = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-systemctl-native = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemtap = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-systemtap-uprobes = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-sysvinit = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
-RECIPE_MAINTAINER_pn-sysvinit-inittab = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
+RECIPE_MAINTAINER_pn-sysvinit = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-sysvinit-inittab = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-taglib = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-tar = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-tcf-agent = "Randy Witt <randy.e.witt@linux.intel.com>"
+RECIPE_MAINTAINER_pn-tcf-agent = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-tcl = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-tcp-wrappers = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-testexport-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
@@ -681,11 +681,11 @@ RECIPE_MAINTAINER_pn-u-boot-fw-utils = "Marek Vasut <marek.vasut@gmail.com>"
 RECIPE_MAINTAINER_pn-u-boot-mkimage = "Marek Vasut <marek.vasut@gmail.com>"
 RECIPE_MAINTAINER_pn-ubootchart = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-udev-extraconf = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-unfs3 = "Randy Witt <randy.e.witt@linux.intel.com>"
+RECIPE_MAINTAINER_pn-unfs3 = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-unifdef = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-uninative-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-unzip = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-update-rc.d = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
+RECIPE_MAINTAINER_pn-update-rc.d = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-usbinit = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-usbutils = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-util-linux = "Chen Qi <Qi.Chen@windriver.com>"
@@ -707,7 +707,7 @@ RECIPE_MAINTAINER_pn-weston = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-weston-init = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-which = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-wic-tools = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
+RECIPE_MAINTAINER_pn-wic-tools = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-wpa-supplicant = "Changhyeok Bae <changhyeok.bae@lge.com>"
 RECIPE_MAINTAINER_pn-x11-common = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-x11perf = "Armin Kuster <akuster808@gmail.com>"
-- 
2.11.0


