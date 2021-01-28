Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.2013.1611875762895485064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 15:16:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 41C5C406B9
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 23:16:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kjuqmdp1fHkT
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2021 23:16:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2B78E406B5
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 23:16:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D0CC41743CA;
	Thu, 28 Jan 2021 18:16:01 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] maintainers: update own email address
Date: Thu, 28 Jan 2021 18:16:01 -0500
Message-Id: <1611875761-26476-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/conf/distro/include/maintainers.inc | 42 ++++++++++++++++----------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b0ddfb8..75af9e4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -85,8 +85,8 @@ RECIPE_MAINTAINER_pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.o
 RECIPE_MAINTAINER_pn-buildtools-extended-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-busybox = "Andrej Valek <andrej.valek@siemens.com>"
-RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-bzip2 = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denis@denix.org>"
+RECIPE_MAINTAINER_pn-bzip2 = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-ca-certificates = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-cairo = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-cantarell-fonts = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -122,7 +122,7 @@ RECIPE_MAINTAINER_pn-core-image-sato-dev = "Richard Purdie <richard.purdie@linux
 RECIPE_MAINTAINER_pn-core-image-sato-ptest-fast = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-core-image-sato-sdk-ptest = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-coreutils = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-cpio = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-cpio = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-cracklib = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-createrepo-c = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-cronie = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -232,7 +232,7 @@ RECIPE_MAINTAINER_pn-gobject-introspection = "Alexander Kanavin <alex.kanavin@gm
 RECIPE_MAINTAINER_pn-gperf = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gpgme = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-gptfdisk = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-grep = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-grep = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-groff = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-grub = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-grub-bootconf = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -253,9 +253,9 @@ RECIPE_MAINTAINER_pn-gstreamer1.0-rtsp-server = "Anuj Mittal <anuj.mittal@intel.
 RECIPE_MAINTAINER_pn-gstreamer1.0-vaapi = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-gtk+3 = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-gtk-doc = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-gzip = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-gzip = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-harfbuzz = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-hdparm = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-hdparm = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-help2man = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-hicolor-icon-theme = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-hwlatdetect = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -461,10 +461,10 @@ RECIPE_MAINTAINER_pn-ltp = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-lttng-modules = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-lttng-tools = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-lttng-ust = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER_pn-lz4 = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-lzo = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-lzip = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-lzop = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-lz4 = "Denys Dmytriyenko <denis@denix.org>"
+RECIPE_MAINTAINER_pn-lzo = "Denys Dmytriyenko <denis@denix.org>"
+RECIPE_MAINTAINER_pn-lzip = "Denys Dmytriyenko <denis@denix.org>"
+RECIPE_MAINTAINER_pn-lzop = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-m4 = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-m4-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-make = "Robert Yang <liezhi.yang@windriver.com>"
@@ -508,7 +508,7 @@ RECIPE_MAINTAINER_pn-mpeg2dec = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-mpfr = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-mpg123 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-msmtp = "Wang Mingyu <wangmy@cn.fujitsu.com>"
-RECIPE_MAINTAINER_pn-mtd-utils = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-mtd-utils = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-mtdev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-mtools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-musl = "Khem Raj <raj.khem@gmail.com>"
@@ -553,7 +553,7 @@ RECIPE_MAINTAINER_pn-pango = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-parted = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-patch = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-patchelf = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER_pn-pbzip2 = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-pbzip2 = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-pciutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-pcmanfm = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-perf = "Bruce Ashfield <bruce.ashfield@gmail.com>"
@@ -714,7 +714,7 @@ RECIPE_MAINTAINER_pn-udev-extraconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-unfs3 = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-unifdef = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-uninative-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER_pn-unzip = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-unzip = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-update-rc.d = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-usbinit = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-usbutils = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -735,12 +735,12 @@ RECIPE_MAINTAINER_pn-vulkan-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-waffle = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-watchdog = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-watchdog-config = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-wayland = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-wayland-protocols = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-wayland-utils = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-wayland = "Denys Dmytriyenko <denis@denix.org>"
+RECIPE_MAINTAINER_pn-wayland-protocols = "Denys Dmytriyenko <denis@denix.org>"
+RECIPE_MAINTAINER_pn-wayland-utils = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-webkitgtk = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-weston = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-weston-init = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-weston = "Denys Dmytriyenko <denis@denix.org>"
+RECIPE_MAINTAINER_pn-weston-init = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-which = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-wic-tools = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -794,7 +794,7 @@ RECIPE_MAINTAINER_pn-xtrans = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xuser-account = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xvinfo = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xwininfo = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-zlib = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denis@denix.org>"
+RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denis@denix.org>"
+RECIPE_MAINTAINER_pn-zlib = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-zstd = "Alexander Kanavin <alex.kanavin@gmail.com>"
-- 
2.7.4

