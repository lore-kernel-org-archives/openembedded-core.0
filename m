Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FC0C678D9
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.20189.1672605968540741872
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Q2wMvD3Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101856f15a630-22e2891f-20ef-4932-9308-d0592bdbe697-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ly4If95tMu2haFZFbK3lMn2Qj5ovJ20vHPFyDZyT0ik=;
	b=Q2wMvD3ZuL16KIZj+Y339Mp0J7iUTsXPt37DtS3u3ghLxRuTu5fV2I8MmYY5nAdh
	sDicnABjkG2Xa0cfn6HNoMOA6oKtALnrJlBt6LVRFKGu44xq/QQoblj7eDhtg0YzDUA
	ZBcSJkJUnh9RkIr7f06X3vWGEG7beK0A/4sqPRdY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ly4If95tMu2haFZFbK3lMn2Qj5ovJ20vHPFyDZyT0ik=;
	b=N0NGFwex1aYBiooAvlEebenrcVkD1UJOtF+Z21vi5AoHHzU7uW5L5iVIJGbMTY9k
	l4XQjJgS9WX+sh/QfdgPhxi+enL6Bug32LYOsIht2gvZRC7dJDtmg3oQbOSX0oDvoKl
	lyO9KNyV9udGn6ryh1yiGPXXBwiAPFMDTv01y8Ic=
Content-Type: multipart/mixed; boundary="===============0055336224242322741=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.8.3 SUCCEEDED
Message-ID: <010101856f15a630-22e2891f-20ef-4932-9308-d0592bdbe697-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175288

--===============0055336224242322741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtk4* to *4.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.8.2-4.8.3.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0055336224242322741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gtk4/gtk4-locale-ab: PKGSIZE changed from 6251 to 17003 (+172%)
packages/core2-32-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.800.2", added "/usr/lib/libgtk-4.so.1.800.3"
packages/core2-32-poky-linux/gtk4: PACKAGES: added "gtk4-locale-ie"
Changes to packages/core2-32-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.800.2 to libgtk-4.so.1.800.3
  /usr/lib/libgtk-4.so.1.800.2 moved to /usr/lib/libgtk-4.so.1.800.3

--===============0055336224242322741==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.8.2-4.8.3.patch"

RnJvbSBhODU3ODlhNDI1YzI3MDBlNTRiMTZhOTYxM2M0MjExMjkxMWIxN2EwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxMzoyNDoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGd0
azQ6IHVwZ3JhZGUgNC44LjIgLT4gNC44LjMKCi0tLQogbWV0YS9yZWNpcGVzLWdub21lL2d0aysv
e2d0azRfNC44LjIuYmIgPT4gZ3RrNF80LjguMy5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUv
Z3RrKy97Z3RrNF80LjguMi5iYiA9PiBndGs0XzQuOC4zLmJifSAoOTglKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC44LjIuYmIgYi9tZXRhL3JlY2lwZXMtZ25v
bWUvZ3RrKy9ndGs0XzQuOC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC44LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1nbm9tZS9ndGsrL2d0azRfNC44LjMuYmIKaW5kZXggZmUxOGZhMmZmZC4uNzQ3NTI5YTZiZCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrNF80LjguMi5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuOC4zLmJiCkBAIC0zNyw3ICszNyw3IEBAIE1B
Sl9WRVIgPSAiJHtAb2UudXRpbHMudHJpbV92ZXJzaW9uKCIke1BWfSIsIDIpfSIKIFVQU1RSRUFN
X0NIRUNLX1JFR0VYID0gImd0ay0oP1A8cHZlcj5cZCtcLihcZCpbMDI0NjhdKSsoXC5cZCspKylc
LnRhci54eiIKIAogU1JDX1VSSSA9ICJodHRwOi8vZnRwLmdub21lLm9yZy9wdWIvZ25vbWUvc291
cmNlcy9ndGsvJHtNQUpfVkVSfS9ndGstJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjg1YjdhMTYwYjZlMDJlYWZhNGU3ZDM4ZjA0NmY4NzIwZmFiNTM3ZDNmZTczYzAxYzg2NDMz
M2E5ODNhNjkyYTkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjM2MmY5NjhkMDg1YjRkM2Q5MzQw
ZDRkMzhjNzA2Mzc3ZGVkOWQ1Mzc0ZTY5NGEyYjZiN2U2MjkyZTNjYmE3NCIKIAogUyA9ICIke1dP
UktESVJ9L2d0ay0ke1BWfSIKIAotLSAKMi4zNy4zCgo=

--===============0055336224242322741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f8c9980e27de19462748aa70c6dde34b1b70cded"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 162 Local 14 Mirrors 0 Missed 148 Current 661 (8% match, 82% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 673 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 787 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gobject-introspection/1.72.0-r0/temp/log.do_packagedata_setscene.2156043
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 822 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package_setscene)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1456 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1510 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_fetch)
NOTE: Running task 1511 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 1512 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
NOTE: Running task 1538 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_fetch)
NOTE: Running task 1612 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: Running task 1657 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1720 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 1770 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_write_config)
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1771 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: Running task 1778 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_write_config)
NOTE: Running task 1785 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_fetch)
NOTE: Running task 1786 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_fetch: Started
NOTE: Running task 1787 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_unpack)
NOTE: Running task 1788 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: Running task 1789 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: Running task 1790 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: Running task 1791 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1792 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_unpack)
NOTE: Running task 1808 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1815 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 1821 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: Running task 1895 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1918 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_fetch: Started
NOTE: Running task 1946 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1947 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: Running task 1956 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_write_config)
NOTE: Running task 1957 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1976 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe pango-1.50.11-r0: task do_unpack: Started
NOTE: Running task 1987 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: Running task 1988 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1989 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: Running task 2011 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 2015 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: Running task 2020 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2021 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe iso-codes-4.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2046 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2048 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_write_config: Started
NOTE: Running task 2049 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: Running task 2079 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: Running task 2086 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 2099 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: Running task 2100 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: Running task 2119 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 2120 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: Running task 2121 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: Running task 2122 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 2130 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2131 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2158 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2159 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_fetch)
NOTE: Running task 2160 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2161 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 2230 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_fetch)
NOTE: Running task 2231 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_fetch)
NOTE: Running task 2232 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2233 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2234 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_fetch)
NOTE: Running task 2248 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 2250 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_write_config: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2251 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 2252 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: Running task 2253 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: Running task 2254 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: Running task 2255 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: Running task 2256 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: Running task 2257 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: Running task 2267 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_fetch)
NOTE: Running task 2280 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: Running task 2281 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_write_config)
NOTE: Running task 2343 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_write_config)
NOTE: Running task 2344 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: Running task 2360 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: Running task 2373 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_write_config)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 2383 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: Running task 2400 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2401 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_fetch: Started
NOTE: Running task 2402 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 2403 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe tiff-4.4.0-r0: task do_fetch: Started
NOTE: Running task 2404 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: Running task 2405 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2406 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 2407 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_unpack)
NOTE: Running task 2408 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2409 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_fetch: Succeeded
NOTE: Running task 2410 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running task 2411 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2412 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2413 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Started
NOTE: Running task 2414 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 2415 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2416 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: Running task 2417 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2418 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 2419 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe gtk4-4.8.3-r0: task do_fetch: Started
NOTE: Running task 2420 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_unpack)
NOTE: Running task 2421 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_unpack)
NOTE: Running task 2422 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 2423 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2424 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_unpack)
NOTE: Running task 2425 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 2426 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2427 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk4-4.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: Running task 2428 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_unpack)
NOTE: Running task 2429 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_write_config: Started
NOTE: Running task 2430 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 2431 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: Running task 2432 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Started
NOTE: Running task 2443 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 2444 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_patch)
NOTE: Running task 2445 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2446 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2452 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_write_config)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_unpack: Started
NOTE: Running task 2499 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2501 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: Running task 2502 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2503 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2504 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2505 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: Running task 2506 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: Running task 2507 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_unpack: Started
NOTE: Running task 2508 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: Running task 2509 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2510 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe tiff-4.4.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2511 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: Running task 2512 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.8.3-r0: task do_unpack: Started
NOTE: Running task 2513 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 2520 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_patch: Started
NOTE: Running task 2543 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe gtk4-4.8.3-r0: task do_write_config: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2560 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2561 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: Running task 2572 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 2574 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe gtk4-4.8.3-r0: task do_write_config: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: Running task 2580 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2581 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2582 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: Running task 2583 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2584 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe pango-1.50.11-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: Running task 2585 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2586 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2587 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2588 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2589 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2590 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2591 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2592 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2593 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2594 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_patch)
NOTE: Running task 2595 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 2596 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 2597 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2598 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_patch)
NOTE: Running task 2599 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2600 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2601 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2602 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2603 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2604 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2605 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2606 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2607 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2608 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2609 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 2610 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 2611 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_patch: Started
NOTE: Running task 2612 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: Running task 2613 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_unpack: Succeeded
NOTE: Running task 2614 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 2615 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2616 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: Running task 2617 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2618 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: Running task 2619 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_patch: Succeeded
NOTE: Running task 2620 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: Running task 2621 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2622 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_configure)
NOTE: Running task 2623 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2624 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2625 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2636 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gi-docgen-2022.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2637 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_patch: Succeeded
NOTE: Running task 2639 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Started
NOTE: Running task 2651 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2654 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2655 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Succeeded
NOTE: Running task 2656 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2657 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2658 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2659 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 2660 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-5.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2661 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe tiff-4.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_configure: Succeeded
NOTE: Running task 2662 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_compile)
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2663 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_compile: Started
NOTE: Running task 2668 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: Running task 2669 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2670 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 2671 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: Running task 2672 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe gtk4-4.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 2673 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: Running task 2674 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_configure)
NOTE: recipe gtk4-4.8.3-r0: task do_patch: Started
NOTE: recipe gtk4-4.8.3-r0: task do_patch: Succeeded
NOTE: Running task 2675 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2676 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_populate_lic)
NOTE: recipe harfbuzz-5.3.1-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 2677 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Succeeded
NOTE: Running task 2678 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: Running task 2679 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2680 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2681 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: Running task 2682 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk4-4.8.3-r0: task do_populate_lic: Started
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe gtk4-4.8.3-r0: task do_populate_lic: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_populate_lic unihash changed to ea4007752803aa3d92a5099c00233ffed16740570b0d93173573baf7c2781152
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_compile: Succeeded
NOTE: Running task 2683 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_install)
NOTE: recipe gi-docgen-2022.2-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 2684 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_install: Succeeded
NOTE: Running task 2685 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot)
NOTE: Running task 2686 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package)
NOTE: recipe gi-docgen-2022.2-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2687 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2688 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe gi-docgen-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2689 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2690 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2691 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2692 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2693 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 2694 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 2695 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2696 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_package: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: Running task 2697 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 2698 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe gi-docgen-2022.2-r0: task do_packagedata: Started
NOTE: Running task 2699 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2700 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: Running task 2701 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe gi-docgen-2022.2-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2702 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2703 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2704 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.4.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 2705 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2706 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_compile: Started
NOTE: Running task 2707 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 2708 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2709 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: Running task 2710 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2711 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_configure_ptest_base)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2712 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile: Started
NOTE: Running task 2713 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2714 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: Running task 2715 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2716 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 2717 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 2718 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 2719 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 2720 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2721 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: Running task 2722 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2723 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_compile)
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2724 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: Running task 2725 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: Running task 2726 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Started
NOTE: Running task 2727 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: Running task 2728 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2729 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2730 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: Running task 2731 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: Running task 2732 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: Running task 2733 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2734 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2735 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2736 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2737 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2738 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2739 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2740 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2741 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2742 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2743 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: Running task 2744 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2745 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: Running task 2746 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2747 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Succeeded
NOTE: Running task 2748 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: Running task 2749 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2750 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: Running task 2751 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2752 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Started
NOTE: Running task 2753 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2754 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: Running task 2755 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2756 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 2757 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2758 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: Running task 2759 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2760 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2761 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: Running task 2762 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2763 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2764 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2765 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2766 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2767 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: Running task 2768 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2769 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: Running task 2770 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2771 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: Running task 2772 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2773 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_package_write_rpm: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2774 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2775 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 2776 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2777 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 2778 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2779 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: Running task 2780 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2781 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 2782 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2783 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2784 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe libwebp-1.2.4-r0: task do_install: Started
NOTE: recipe tiff-4.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2785 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_compile)
NOTE: recipe tiff-4.4.0-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2786 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2787 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 2788 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2789 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 2790 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 2791 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: Running task 2792 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 2793 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2794 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2795 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2796 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install: Succeeded
NOTE: Running task 2797 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: Running task 2798 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_install_ptest_base)
NOTE: recipe libwebp-1.2.4-r0: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: Running task 2799 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install_ptest_base: Started
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 2800 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_populate_sysroot)
NOTE: Running task 2801 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_package)
NOTE: Running task 2802 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2803 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2804 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2805 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2806 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: Running task 2807 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2808 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Succeeded
NOTE: Running task 2809 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot)
NOTE: Running task 2810 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2811 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_install)
NOTE: Running task 2812 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2813 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2814 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2815 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Started
NOTE: recipe tiff-4.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2816 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_install)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2817 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.4.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2818 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2819 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_install: Succeeded
NOTE: Running task 2820 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_populate_sysroot)
NOTE: Running task 2821 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_package)
NOTE: Running task 2822 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2823 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe tiff-4.4.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2824 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe tiff-4.4.0-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Succeeded
NOTE: Running task 2825 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: Running task 2826 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Started
NOTE: recipe tiff-4.4.0-r0: task do_package: Succeeded
NOTE: Running task 2827 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_packagedata)
NOTE: recipe tiff-4.4.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2828 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: Running task 2829 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_package: Succeeded
NOTE: Running task 2830 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2831 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 2832 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 2833 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 2834 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2835 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2836 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2837 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2838 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2839 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: Running task 2840 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2841 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_install)
NOTE: recipe harfbuzz-5.3.1-r0: task do_install: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_install: Succeeded
NOTE: Running task 2842 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_sysroot)
NOTE: Running task 2843 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_package)
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_package: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2844 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2845 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure)
NOTE: recipe pango-1.50.11-r0: task do_configure: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_package: Succeeded
NOTE: Running task 2846 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata)
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_configure: Succeeded
NOTE: Running task 2847 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2848 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile)
NOTE: recipe pango-1.50.11-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2849 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2850 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2851 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2852 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2853 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2854 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2855 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_compile: Succeeded
NOTE: Running task 2856 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2857 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install)
NOTE: recipe pango-1.50.11-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2858 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe pango-1.50.11-r0: task do_install: Succeeded
NOTE: Running task 2859 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2860 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_populate_sysroot)
NOTE: Running task 2861 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_package)
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Started
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2862 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2863 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2864 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: Running task 2865 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2866 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2867 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2868 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2869 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2870 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2871 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2872 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_package: Succeeded
NOTE: Running task 2873 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata)
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2874 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_compile)
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Succeeded
NOTE: Running task 2875 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_compile: Started
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: Running task 2876 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_compile)
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2877 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_install: Succeeded
NOTE: Running task 2878 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_populate_sysroot)
NOTE: Running task 2879 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_package: Succeeded
NOTE: Running task 2880 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_compile: Succeeded
NOTE: Running task 2881 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_install)
NOTE: recipe gtk+3-3.24.35-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_install: Succeeded
NOTE: Running task 2882 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_package)
NOTE: recipe gtk+3-3.24.35-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_package: Succeeded
NOTE: Running task 2888 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.35-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Succeeded
NOTE: Running task 2892 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_install)
NOTE: recipe librsvg-2.54.5-r0: task do_install: Started
NOTE: recipe librsvg-2.54.5-r0: task do_install: Succeeded
NOTE: Running task 2893 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_populate_sysroot)
NOTE: Running task 2894 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_package)
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.5-r0: task do_package: Started
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2895 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2896 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_package: Succeeded
NOTE: Running task 2897 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_packagedata)
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2898 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2899 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_install: Succeeded
NOTE: Running task 2900 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_populate_sysroot)
NOTE: Running task 2901 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2902 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2903 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_configure)
NOTE: recipe gtk4-4.8.3-r0: task do_configure: Started
NOTE: recipe gtk4-4.8.3-r0: task do_configure: Succeeded
NOTE: Running task 2904 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_compile)
NOTE: recipe gtk4-4.8.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_package: Succeeded
NOTE: Running task 2905 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_compile: Succeeded
NOTE: Running task 2906 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_install)
NOTE: recipe gtk4-4.8.3-r0: task do_install: Started
NOTE: recipe gtk4-4.8.3-r0: task do_install: Succeeded
NOTE: Running task 2907 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_package)
NOTE: Running task 2908 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.8.3-r0: task do_package: Started
NOTE: recipe gtk4-4.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_package: Succeeded
NOTE: Running task 2909 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_packagedata)
NOTE: recipe gtk4-4.8.3-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.8.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2910 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_package_write_rpm)
NOTE: Running task 2911 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_package_qa)
NOTE: recipe gtk4-4.8.3-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.8.3-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.8.3-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2912 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2912 tasks of which 2482 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-src went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dbg went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-staticdev went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dev went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-doc went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-locale went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0055336224242322741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1691 targets, 48 skipped, 0 masked, 0 errors.
Removing 119 recipes from the core2-32 sysroot...done.
Removing 123 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f8c9980e27de19462748aa70c6dde34b1b70cded"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 521 Local 357 Mirrors 0 Missed 164 Current 309 (68% match, 80% complete)
Removing 2 stale sstate objects for arch allarch...done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 310 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.66.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.66.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.66.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 510 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 511 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe curl-7.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 515 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 808 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 824 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_fetch)
NOTE: Running task 825 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 826 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
NOTE: Running task 828 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_fetch)
NOTE: Running task 860 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 898 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 940 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_write_config)
NOTE: Running task 941 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: Running task 948 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_write_config)
NOTE: Running task 954 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_fetch)
NOTE: Running task 982 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 983 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 988 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running setscene task 518 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: Running task 1012 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.66.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: Running task 1064 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_write_config)
NOTE: Running task 1065 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: Running task 1080 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 1081 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1084 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_fetch)
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: Running setscene task 522 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 830 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.66.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.11-r0: task do_fetch: Started
NOTE: Running task 1088 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 1093 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: Running task 1114 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_fetch)
NOTE: Running task 1120 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: Running task 1121 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 533 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe pango-1.50.11-r0: task do_fetch: Succeeded
NOTE: Running setscene task 539 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: Running setscene task 542 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: Running task 1122 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1123 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: Running task 1124 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_write_config: Started
NOTE: recipe pango-1.50.11-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_fetch: Started
NOTE: Running task 1125 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: Running task 1126 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 1127 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_write_config: Started
NOTE: Running task 1139 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 1165 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1166 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: Running task 1167 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: Running setscene task 552 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 557 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_write_config: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_fetch: Started
NOTE: Running setscene task 569 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.37-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 570 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1185 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe vala-0.56.3-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1187 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_unpack)
NOTE: Running task 1188 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe cargo-native-1.66.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: Running task 1192 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 1193 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: Running task 1194 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: Running task 1195 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1197 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Started
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 581 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe pango-1.50.11-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gobject-introspection/1.72.0-r0/temp/log.do_packagedata_setscene.2694942
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cargo-native-1.66.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_unpack: Succeeded
NOTE: Running setscene task 601 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 830 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.66.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1240 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_unpack: Succeeded
NOTE: Running task 1249 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: Running task 1250 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1251 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_patch)
NOTE: Running task 1257 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1272 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_patch)
NOTE: Running task 1273 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1286 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 1289 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1298 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: Running task 1299 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1301 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_patch)
NOTE: Running task 1302 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: Running task 1303 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: Running task 1305 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_unpack)
NOTE: Running task 1306 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: Running task 1307 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: recipe rust-native-1.66.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1308 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1315 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: Running task 1317 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1318 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 1331 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_write_config)
NOTE: Running task 1334 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_fetch)
NOTE: Running task 1335 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_fetch)
NOTE: Running task 1336 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 1337 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1341 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running task 1342 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1343 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 1375 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_write_config)
NOTE: Running task 1376 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: Running task 1395 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 1396 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_fetch)
NOTE: Running task 1397 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1398 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1399 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 1400 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1401 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_fetch)
NOTE: Running task 1402 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: Running task 1423 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_fetch)
NOTE: Running task 1425 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running setscene task 644 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 653 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1438 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: Running task 1440 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: Running task 1450 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 1451 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_write_config: Started
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_fetch: Started
NOTE: recipe pango-1.50.11-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: Running setscene task 658 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running setscene task 661 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 1464 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: Running task 1465 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_write_config: Started
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: Running task 1466 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2022.2-r0: task do_fetch: Started
NOTE: Running task 1467 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.37-r0: task do_write_config: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1468 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_fetch: Succeeded
NOTE: Running task 1469 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe tiff-4.4.0-r0: task do_fetch: Started
NOTE: Running task 1470 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_deploy_source_date_epoch)
NOTE: Running task 1471 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 1472 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 1473 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 1474 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_unpack)
NOTE: Running task 1475 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1476 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 1477 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1482 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: Running task 1483 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Succeeded
NOTE: Running task 1484 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_fetch: Started
NOTE: Running task 1490 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1491 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_unpack)
NOTE: Running task 1498 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_fetch)
NOTE: Running task 1502 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_unpack)
NOTE: Running task 1512 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_write_config)
NOTE: Running task 1513 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1514 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1515 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1516 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_patch: Succeeded
NOTE: Running task 1517 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: Running task 1518 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_unpack)
NOTE: Running task 1519 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1520 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1566 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1567 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: Running task 1579 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_write_config)
NOTE: Running task 1580 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1598 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: Running task 1606 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Started
NOTE: recipe gtk4-4.8.3-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: Running setscene task 672 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: Running setscene task 673 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_unpack: Started
NOTE: Running task 1647 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: Running task 1648 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1649 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: Running task 1650 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1651 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_patch)
NOTE: Running task 1652 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1653 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_write_config: Succeeded
NOTE: Running task 1654 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: Running task 1655 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe rust-native-1.66.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: Running task 1674 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1675 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: Running task 1676 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1677 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1678 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe libx11-1_1.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1679 of 2930 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Started
NOTE: Running task 1683 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_write_config)
NOTE: recipe gtk+3-3.24.35-r0: task do_write_config: Succeeded
NOTE: Running task 1699 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe tiff-4.4.0-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_write_config: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1720 of 2930 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: Running task 1721 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1730 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_unpack: Started
NOTE: Running task 1731 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_patch)
NOTE: Running task 1732 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1733 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_patch)
NOTE: Running task 1734 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1753 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1764 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libx11-1_1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1765 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 1766 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1767 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-native-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.8.3-r0: task do_write_config: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running setscene task 676 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running task 1768 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.4.0-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1769 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1770 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1771 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_patch)
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_write_config: Succeeded
NOTE: Running setscene task 679 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1776 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1777 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe librsvg-native-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-native-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1778 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-native-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1779 of 2930 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1780 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_patch)
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1781 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe gi-docgen-2022.2-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-native-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 688 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running setscene task 689 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_unpack: Succeeded
NOTE: Running task 1790 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-native-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1791 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1792 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: Running task 1793 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 1794 of 2930 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1795 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.4.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: Running task 1796 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe librsvg-native-2.54.5-r0: task do_configure: Started
NOTE: recipe tiff-4.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1809 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_patch: Succeeded
NOTE: Running task 1814 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Succeeded
NOTE: Running task 1829 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_patch)
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 1830 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Succeeded
NOTE: Running task 1831 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: Running task 1836 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1837 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe gtk4-4.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1838 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_patch)
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 728 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_package_setscene)
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_patch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_patch: Succeeded
NOTE: Running task 1839 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1840 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_populate_lic)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_package_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_populate_lic: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_populate_lic unihash changed to ea4007752803aa3d92a5099c00233ffed16740570b0d93173573baf7c2781152
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 745 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 746 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 793 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 807 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2406 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2407 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2408 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2411 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2412 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2459 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2474 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2486 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: Running task 2517 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-5.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2544 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2551 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2560 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2566 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2571 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2572 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2573 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2574 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-native-2.54.5-r0: task do_configure: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: Running task 2579 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2580 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2597 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2598 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2599 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2630 of 2930 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2632 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2640 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2651 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe librsvg-native-2.54.5-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2656 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: Running task 2657 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 2658 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2659 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_configure)
NOTE: Running task 2660 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: Running task 2661 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: Running task 2662 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: Running task 2663 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2664 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Started
NOTE: Running task 2665 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: Running task 2666 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe xkeyboard-config-2.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2667 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_configure)
NOTE: Running task 2668 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: Running task 2669 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: Running task 2670 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2671 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2672 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_configure)
NOTE: Running task 2673 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_configure: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2674 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2675 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2676 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: Running task 2677 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_configure: Succeeded
NOTE: Running task 2678 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_compile)
NOTE: recipe harfbuzz-5.3.1-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2679 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_configure: Succeeded
NOTE: Running task 2680 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_compile)
NOTE: recipe xkeyboard-config-2.37-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2681 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: Running task 2682 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: Running task 2683 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_compile)
NOTE: recipe gi-docgen-2022.2-r0: task do_compile: Succeeded
NOTE: Running task 2684 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe orc-0.4.33-r0: task do_compile: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_compile: Succeeded
NOTE: Running task 2685 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_install)
NOTE: recipe xkeyboard-config-2.37-r0: task do_install: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_install: Succeeded
NOTE: Running task 2686 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot)
NOTE: Running task 2687 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package)
NOTE: recipe gi-docgen-2022.2-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_package: Started
NOTE: Running task 2688 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2689 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_install: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2690 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: Running task 2691 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_populate_sysroot)
NOTE: Running task 2692 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_package)
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2693 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2694 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2695 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2696 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2697 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2698 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 2699 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_compile: Succeeded
NOTE: Running task 2700 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_install)
NOTE: Running task 2701 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 2702 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe orc-0.4.33-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_package: Succeeded
NOTE: Running task 2703 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_packagedata)
NOTE: recipe gi-docgen-2022.2-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2704 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2705 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 2706 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot)
NOTE: recipe tiff-4.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2707 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_package)
NOTE: Running task 2708 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe gi-docgen-2022.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2709 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2710 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_package: Started
NOTE: Running task 2711 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe tiff-4.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2712 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_configure)
NOTE: recipe harfbuzz-5.3.1-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe tiff-4.4.0-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2713 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2714 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2715 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2716 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2717 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2718 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2719 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_configure_ptest_base)
NOTE: Running task 2720 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2721 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 2722 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 2723 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_package: Succeeded
NOTE: Running task 2724 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata)
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Succeeded
NOTE: Running task 2725 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2726 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.37-r0: task do_package: Succeeded
NOTE: Running task 2727 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 2728 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_install)
NOTE: recipe xkeyboard-config-2.37-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 2729 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2730 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 2731 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 2732 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_package)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2733 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: Running task 2734 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 2735 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 2736 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2737 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: Running task 2738 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2739 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2740 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2741 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2742 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2743 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_compile)
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2744 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: Running task 2745 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: Running task 2746 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2747 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2748 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: Running task 2749 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2750 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2751 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2752 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2753 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2754 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: Running task 2755 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2756 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_install)
NOTE: Running task 2757 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2758 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 2759 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2760 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2761 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: Running task 2762 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: Running task 2763 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: Running task 2764 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2765 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2766 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: Running task 2767 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2768 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2769 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2770 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2771 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Succeeded
NOTE: Running task 2772 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2773 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot)
NOTE: Running task 2774 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package)
NOTE: Running task 2775 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2776 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2777 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2778 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Started
NOTE: Running task 2779 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 2780 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 2781 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2782 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2783 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: Running task 2784 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2785 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: Running task 2786 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: Running task 2787 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_package_write_rpm)
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2788 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2789 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: Running task 2790 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2791 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: Running task 2792 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2793 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: Running task 2794 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 2795 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: Running task 2796 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 2797 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2798 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Succeeded
NOTE: Running task 2799 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2800 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe tiff-4.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2801 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 2802 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 2803 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: Running task 2804 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2805 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_install)
NOTE: recipe libwebp-1.2.4-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2806 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 2807 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libwebp-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2808 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2809 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_package)
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2810 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_compile_ptest_base)
NOTE: recipe libwebp-1.2.4-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile_ptest_base: Started
NOTE: Running task 2811 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2812 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: Running task 2813 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2814 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2815 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install: Succeeded
NOTE: Running task 2816 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_install_ptest_base)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2817 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install_ptest_base: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2818 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Started
NOTE: Running task 2819 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_populate_sysroot)
NOTE: Running task 2820 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2821 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2822 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2823 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2824 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe tiff-4.4.0-r0: task do_compile: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2825 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_install)
NOTE: Running task 2826 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe tiff-4.4.0-r0: task do_install: Started
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Succeeded
NOTE: Running task 2827 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot)
NOTE: Running task 2828 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Started
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2829 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_compile)
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2830 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_install)
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Started
NOTE: recipe tiff-4.4.0-r0: task do_install: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2831 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_populate_sysroot)
NOTE: Running task 2832 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_package)
NOTE: Running task 2833 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe tiff-4.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.4.0-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2834 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2835 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Started
NOTE: recipe tiff-4.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2836 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2837 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2838 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2839 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Succeeded
NOTE: Running task 2840 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2841 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_package: Succeeded
NOTE: Running task 2842 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_packagedata)
NOTE: recipe tiff-4.4.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: Running task 2843 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: Running task 2844 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2845 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_package: Succeeded
NOTE: Running task 2846 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2847 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2848 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2849 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 2850 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2851 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2852 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 2853 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 2854 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2855 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: Running task 2856 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2857 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_install)
NOTE: recipe harfbuzz-5.3.1-r0: task do_install: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_install: Succeeded
NOTE: Running task 2858 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_sysroot)
NOTE: Running task 2859 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_package)
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_package: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2860 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2861 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2862 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure)
NOTE: recipe pango-1.50.11-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2863 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2864 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2865 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_package: Succeeded
NOTE: Running task 2866 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata)
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2867 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2868 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe pango-1.50.11-r0: task do_configure: Succeeded
NOTE: Running task 2869 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2870 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile)
NOTE: recipe pango-1.50.11-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2871 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2872 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe librsvg-native-2.54.5-r0: task do_compile: Succeeded
NOTE: Running task 2873 of 2930 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_install)
NOTE: recipe librsvg-native-2.54.5-r0: task do_install: Started
NOTE: recipe librsvg-native-2.54.5-r0: task do_install: Succeeded
NOTE: Running task 2874 of 2930 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_populate_sysroot)
NOTE: recipe librsvg-native-2.54.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2875 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe librsvg-native-2.54.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2876 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2877 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2878 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_compile: Succeeded
NOTE: Running task 2879 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2880 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install)
NOTE: recipe pango-1.50.11-r0: task do_install: Started
NOTE: recipe pango-1.50.11-r0: task do_install: Succeeded
NOTE: Running task 2881 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2882 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_populate_sysroot)
NOTE: Running task 2883 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_package)
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Started
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2884 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2885 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2886 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2887 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2888 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_configure)
NOTE: Running task 2889 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2890 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Succeeded
NOTE: Running task 2891 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata)
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Succeeded
NOTE: Running task 2892 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_compile)
NOTE: recipe gtk+3-3.24.35-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2893 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_compile: Started
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: Running task 2894 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_compile)
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2895 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_install: Succeeded
NOTE: Running task 2896 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_populate_sysroot)
NOTE: Running task 2897 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_compile: Succeeded
NOTE: Running task 2898 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_install)
NOTE: recipe gtk+3-3.24.35-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_install: Succeeded
NOTE: Running task 2899 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_package)
NOTE: Running task 2900 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.35-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2901 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_prepare_recipe_sysroot)
NOTE: recipe adwaita-icon-theme-43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_package: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_package: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2901 tasks of which 2449 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_prepare_recipe_sysroot
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-src went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dbg went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-staticdev went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dev went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-doc went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-locale went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: adwaita-icon-theme-43-r0 do_prepare_recipe_sysroot: Error executing a python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:extend_recipe_sysroot(d)
     0003:
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes-global/staging.bbclass', lineno: 614, function: extend_recipe_sysroot
     0610:                    if "/bin/" in l or "/sbin/" in l:
     0611:                        # defer /*bin/* files until last in case they need libs
     0612:                        binfiles[l] = (targetdir, dest)
     0613:                    else:
 *** 0614:                        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
     0615:
     0616:    # Handle deferred binfiles
     0617:    for l in binfiles:
     0618:        (targetdir, dest) = binfiles[l]
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes-global/staging.bbclass', lineno: 156, function: staging_copyfile
     0152:    if os.path.islink(c):
     0153:        linkto = os.readlink(c)
     0154:        if os.path.lexists(dest):
     0155:            if not os.path.islink(dest):
 *** 0156:                raise OSError(errno.EEXIST, "Link %s already exists as a file" % dest, dest)
     0157:            if os.readlink(dest) == linkto:
     0158:                return dest
     0159:            raise OSError(errno.EEXIST, "Link %s already exists to a different location? (%s vs %s)" % (dest, os.readlink(dest), linkto), dest)
     0160:        os.symlink(linkto, dest)
Exception: FileExistsError: [Errno 17] Link /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/43-r0/recipe-sysroot/usr/include/c++/12.2.0/i686-poky-linux already exists as a file: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/43-r0/recipe-sysroot/usr/include/c++/12.2.0/i686-poky-linux'

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/43-r0/temp/log.do_prepare_recipe_sysroot.2925288
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_prepare_recipe_sysroot) failed with exit code '1'

--===============0055336224242322741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-dbg: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 44780872 to 44788184 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.800.2", added "/usr/lib/.debug/libgtk-4.so.1.800.3"
packages/core2-32-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-dev: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 21358699 to 21366891 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-doc: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ab: PKGSIZE changed from 6251 to 17003 (+172%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-es: PKGSIZE changed from 101140 to 101075 (-0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-eu: PKGSIZE changed from 100900 to 100831 (-0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fa: PKGSIZE changed from 115912 to 115777 (-0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hu: PKGSIZE changed from 102124 to 102054 (-0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PKGSIZE changed from 122250 to 126405 (+3%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-kg: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-kg: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nl: PKGSIZE changed from 98882 to 98817 (-0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ru: PKGSIZE changed from 121897 to 121920 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tk: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tk: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-printbackend-file: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-printbackend-file: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-printbackend-lpr: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-printbackend-lpr: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-src: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-src: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 37566256 to 37601176 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4/gtk4: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4/gtk4: PKGSIZE changed from 13198406 to 13210694 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.800.2", added "/usr/lib/libgtk-4.so.1.800.3"
packages/core2-32-poky-linux/gtk4: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/gtk4: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/gtk4: SRC_URI changed from "http://ftp.gnome.org/pub/gnome/sources/gtk/4.8/gtk-4.8.2.tar.xz" to "http://ftp.gnome.org/pub/gnome/sources/gtk/4.8/gtk-4.8.3.tar.xz"
packages/core2-32-poky-linux/gtk4: PACKAGES: added "gtk4-locale-ie"
Changes to packages/core2-32-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.800.2 to libgtk-4.so.1.800.3
  /usr/lib/libgtk-4.so.1.800.2 moved to /usr/lib/libgtk-4.so.1.800.3

--===============0055336224242322741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f8c9980e27de19462748aa70c6dde34b1b70cded"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 166 Local 14 Mirrors 0 Missed 152 Current 667 (8% match, 81% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 679 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gobject-introspection/1.72.0-r0/temp/log.do_packagedata_setscene.1887425
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 832 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package_setscene)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1464 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1520 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 1521 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_fetch)
NOTE: Running task 1522 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
NOTE: Running task 1548 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_fetch)
NOTE: Running task 1622 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1667 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: Running task 1764 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: Running task 1782 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: Running task 1783 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_write_config)
NOTE: Running task 1790 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_write_config)
NOTE: Running task 1797 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_fetch)
NOTE: Running task 1798 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 1813 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_fetch: Started
NOTE: Running task 1814 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1815 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_unpack)
NOTE: Running task 1816 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: Running task 1817 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe iso-codes-4.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: Running task 1818 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_unpack)
NOTE: Running task 1820 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1827 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 1833 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: Running task 1906 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: Running task 1938 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1966 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_write_config)
NOTE: Running task 1967 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: Running task 1985 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1986 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: Running task 1998 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 1999 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_fetch: Succeeded
NOTE: Running task 2021 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 2025 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: Running task 2072 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Started
NOTE: recipe pango-1.50.11-r0: task do_unpack: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe pango-1.50.11-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2083 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: Running task 2086 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 2087 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: Running task 2094 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 2126 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 2127 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 2128 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 2129 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: Running task 2137 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2138 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 2167 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_fetch)
NOTE: Running task 2168 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2169 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_fetch)
NOTE: Running task 2170 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2214 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: Running task 2242 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_fetch)
NOTE: Running task 2243 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2244 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_fetch)
NOTE: Running task 2245 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_fetch)
NOTE: Running task 2246 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2266 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_fetch)
NOTE: Running task 2269 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 2270 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: Running task 2280 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_fetch)
NOTE: Running task 2291 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: Running task 2292 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: Running task 2293 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2294 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_write_config: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: Running task 2295 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 2296 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: Running task 2297 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 2298 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: Running task 2299 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_unpack: Started
NOTE: Running task 2300 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: Running task 2301 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: Running task 2302 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: Running task 2303 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 2304 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: Running task 2305 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2306 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: Running task 2307 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: Running task 2308 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: Running task 2309 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2310 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: Running task 2311 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running task 2312 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_fetch: Started
NOTE: Running task 2313 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2314 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_unpack)
NOTE: Running task 2315 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2316 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_unpack)
NOTE: recipe tiff-4.4.0-r0: task do_fetch: Started
NOTE: Running task 2317 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2318 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: recipe tiff-4.4.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_fetch: Started
NOTE: Running task 2319 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe gtk4-4.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2320 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gi-docgen-2022.2-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: Running task 2321 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2322 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 2323 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2324 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_unpack)
NOTE: Running task 2325 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2326 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_unpack)
NOTE: Running task 2327 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_unpack)
NOTE: Running task 2328 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: Running task 2329 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: Running task 2330 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2333 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: Running task 2334 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: Running task 2335 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_write_config)
NOTE: Running task 2336 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: Running task 2340 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: Running task 2341 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe pango-1.50.11-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_unpack: Started
NOTE: Running task 2342 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2343 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_patch)
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: Running task 2344 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_patch)
NOTE: Running task 2345 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: Running task 2346 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2370 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2371 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 2372 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: Running task 2378 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_unpack: Started
NOTE: recipe tiff-4.4.0-r0: task do_unpack: Started
NOTE: Running task 2379 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: Running task 2380 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: Running task 2381 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 2382 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_patch)
NOTE: Running task 2406 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: Running task 2407 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2415 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_write_config)
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Started
NOTE: Running task 2416 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2417 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2418 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: Running task 2419 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2420 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: Running task 2421 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2422 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_write_config: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: Running task 2448 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_write_config)
NOTE: Running task 2449 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2450 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: Running task 2462 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2494 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_write_config)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: Running task 2508 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 2509 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2551 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: Running task 2565 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2593 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe tiff-4.4.0-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 2594 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2595 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2609 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: Running task 2610 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2611 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2612 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2613 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2614 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2615 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_write_config: Started
NOTE: recipe gtk4-4.8.3-r0: task do_write_config: Started
NOTE: Running task 2616 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_write_config: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 2617 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2618 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2619 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_patch)
NOTE: Running task 2620 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2621 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2622 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: Running task 2623 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 2624 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: recipe gtk+3-3.24.35-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_patch: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2625 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: Running task 2626 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2627 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2628 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk4-4.8.3-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2629 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: Running task 2630 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2631 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2632 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2633 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2634 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2635 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: Running task 2636 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2637 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 2638 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2639 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_patch: Started
NOTE: Running task 2640 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2641 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2642 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 2643 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_patch: Succeeded
NOTE: Running task 2644 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2645 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2646 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: Running task 2647 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: Running task 2648 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2649 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2650 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: Running task 2651 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2652 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2653 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2654 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe tiff-4.4.0-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: Running task 2655 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 2656 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 2657 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package_setscene: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: Running task 2668 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2669 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Succeeded
NOTE: Running task 2670 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2672 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2684 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2687 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2688 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2689 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2690 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2691 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 2692 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_configure: Succeeded
NOTE: Running task 2693 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_compile)
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Succeeded
NOTE: Running task 2698 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2699 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2700 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2701 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure: Started
NOTE: recipe gtk4-4.8.3-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 2702 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_patch)
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 2703 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2704 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_deploy_source_date_epoch)
NOTE: Running task 2705 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_configure)
NOTE: recipe gtk4-4.8.3-r0: task do_patch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2706 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe gtk4-4.8.3-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2707 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2708 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_populate_lic)
NOTE: recipe harfbuzz-5.3.1-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2709 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: Running task 2710 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2711 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe gtk4-4.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.8.3-r0: task do_populate_lic: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_populate_lic: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_populate_lic unihash changed to ea4007752803aa3d92a5099c00233ffed16740570b0d93173573baf7c2781152
NOTE: Running task 2712 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2713 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: Running task 2714 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_compile: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_compile: Succeeded
NOTE: Running task 2715 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_install)
NOTE: recipe gi-docgen-2022.2-r0: task do_install: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_install: Succeeded
NOTE: Running task 2716 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot)
NOTE: Running task 2717 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package)
NOTE: recipe gi-docgen-2022.2-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_package: Started
NOTE: Running task 2718 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2719 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2720 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2721 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: Running task 2722 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2723 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2724 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: Running task 2725 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_package: Succeeded
NOTE: Running task 2726 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 2727 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2728 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.33-r0: task do_compile: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2729 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2730 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2731 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.33-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2732 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2733 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe tiff-4.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2734 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2735 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe tiff-4.4.0-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 2736 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe orc-0.4.33-r0: task do_install: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: Running task 2737 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot)
NOTE: Running task 2738 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_package)
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2739 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 2740 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2741 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_compile)
NOTE: recipe harfbuzz-5.3.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2742 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2743 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 2744 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2745 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2746 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2747 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2748 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_package: Succeeded
NOTE: Running task 2749 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2750 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata)
NOTE: Running task 2751 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2752 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 2753 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 2754 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: Running task 2755 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 2756 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 2757 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2758 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2759 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 2760 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_compile)
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Started
NOTE: Running task 2761 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 2762 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: Running task 2763 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Started
NOTE: Running task 2764 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2765 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2766 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: Running task 2767 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2768 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: Running task 2769 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2770 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2771 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2772 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: Running task 2773 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2774 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2775 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: Running task 2776 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: Running task 2777 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2778 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: Running task 2779 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: Running task 2780 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: Running task 2781 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot)
NOTE: Running task 2782 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: Running task 2783 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: Running task 2784 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2785 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: Running task 2786 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2787 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2788 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 2789 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2790 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: Running task 2791 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: Running task 2792 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 2793 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2794 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2795 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: Running task 2796 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2797 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2798 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: Running task 2799 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2800 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2801 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2802 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2803 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2804 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2805 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2806 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2807 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: Running task 2808 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: Running task 2809 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_package_write_rpm)
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_package_write_rpm: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2810 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: Running task 2811 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 2812 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2813 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2814 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 2815 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: Running task 2816 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: Running task 2817 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 2818 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 2819 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2820 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 2821 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe tiff-4.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2822 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2823 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe tiff-4.4.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 2824 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2825 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 2826 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2827 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: Running task 2828 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 2829 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe libwebp-1.2.4-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: Running task 2830 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2831 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_package)
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2832 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_compile_ptest_base)
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2833 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2834 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2835 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install: Succeeded
NOTE: Running task 2836 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2837 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_install_ptest_base)
NOTE: Running task 2838 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install_ptest_base: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2839 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: Running task 2840 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_populate_sysroot)
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2841 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_package)
NOTE: Running task 2842 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2843 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_packagedata)
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2844 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2845 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Succeeded
NOTE: Running task 2846 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot)
NOTE: Running task 2847 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2848 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_compile)
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2849 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe tiff-4.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2850 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe tiff-4.4.0-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2851 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2852 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2853 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2854 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2855 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe tiff-4.4.0-r0: task do_install: Succeeded
NOTE: Running task 2856 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_populate_sysroot)
NOTE: Running task 2857 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_package)
NOTE: recipe tiff-4.4.0-r0: task do_package: Started
NOTE: recipe tiff-4.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2858 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe tiff-4.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2859 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: Running task 2860 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2861 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: Running task 2862 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata)
NOTE: recipe tiff-4.4.0-r0: task do_package: Succeeded
NOTE: Running task 2863 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Started
NOTE: recipe tiff-4.4.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2864 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: Running task 2865 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_package: Succeeded
NOTE: Running task 2866 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2867 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 2868 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2869 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2870 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2871 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2872 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 2873 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: Running task 2874 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2875 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2876 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_install)
NOTE: recipe harfbuzz-5.3.1-r0: task do_install: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_install: Succeeded
NOTE: Running task 2877 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_sysroot)
NOTE: Running task 2878 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2879 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe harfbuzz-5.3.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2880 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2881 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure)
NOTE: recipe pango-1.50.11-r0: task do_configure: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_package: Succeeded
NOTE: Running task 2882 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata)
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_configure: Succeeded
NOTE: Running task 2883 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2884 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile)
NOTE: recipe pango-1.50.11-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2885 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2886 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2887 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2888 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2889 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2890 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2891 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_compile: Succeeded
NOTE: Running task 2892 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Started
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2893 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2894 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe pango-1.50.11-r0: task do_install: Started
NOTE: recipe pango-1.50.11-r0: task do_install: Succeeded
NOTE: Running task 2895 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2896 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_populate_sysroot)
NOTE: Running task 2897 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_package)
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2898 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2899 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2900 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2901 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2902 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2903 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2904 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2905 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2906 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2907 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2908 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_package: Succeeded
NOTE: Running task 2909 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata)
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Succeeded
NOTE: Running task 2910 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_compile)
NOTE: recipe gtk+3-3.24.35-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2911 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_compile: Started
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: Running task 2912 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_compile)
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2913 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_install: Succeeded
NOTE: Running task 2914 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_populate_sysroot)
NOTE: Running task 2915 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_package: Succeeded
NOTE: Running task 2916 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_compile: Succeeded
NOTE: Running task 2917 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_install)
NOTE: recipe gtk+3-3.24.35-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_install: Succeeded
NOTE: Running task 2918 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_package)
NOTE: recipe gtk+3-3.24.35-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_package: Succeeded
NOTE: Running task 2924 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.35-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Succeeded
NOTE: Running task 2928 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_install)
NOTE: recipe librsvg-2.54.5-r0: task do_install: Started
NOTE: recipe librsvg-2.54.5-r0: task do_install: Succeeded
NOTE: Running task 2929 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_populate_sysroot)
NOTE: Running task 2930 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_package)
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.5-r0: task do_package: Started
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2931 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2932 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_package: Succeeded
NOTE: Running task 2933 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_packagedata)
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2934 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2935 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_install: Succeeded
NOTE: Running task 2936 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_populate_sysroot)
NOTE: Running task 2937 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2938 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2939 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_configure)
NOTE: recipe gtk4-4.8.3-r0: task do_configure: Started
NOTE: recipe gtk4-4.8.3-r0: task do_configure: Succeeded
NOTE: Running task 2940 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_compile)
NOTE: recipe gtk4-4.8.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_package: Succeeded
NOTE: Running task 2941 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_compile: Succeeded
NOTE: Running task 2942 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_install)
NOTE: recipe gtk4-4.8.3-r0: task do_install: Started
NOTE: recipe gtk4-4.8.3-r0: task do_install: Succeeded
NOTE: Running task 2943 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_package)
NOTE: Running task 2944 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.8.3-r0: task do_package: Started
NOTE: recipe gtk4-4.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_package: Succeeded
NOTE: Running task 2945 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_packagedata)
NOTE: recipe gtk4-4.8.3-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.8.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2946 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_package_write_rpm)
NOTE: Running task 2947 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_package_qa)
NOTE: recipe gtk4-4.8.3-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.8.3-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.8.3-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2948 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2948 tasks of which 2506 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-src went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dbg went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-staticdev went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dev went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-doc went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-locale went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0055336224242322741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1690 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (892 cached, 1 parsed). 1690 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f8c9980e27de19462748aa70c6dde34b1b70cded"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 168 Local 16 Mirrors 0 Missed 152 Current 669 (9% match, 81% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 675 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 692 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 764 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iso-codes-4.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 776 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-43-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 777 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1464 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gobject-introspection/1.72.0-r0/temp/log.do_packagedata_setscene.1617869
NOTE: Running task 1520 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 1521 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_fetch)
NOTE: Running task 1522 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 836 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1548 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_fetch)
NOTE: Running task 1573 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: recipe iso-codes-4.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1625 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1670 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 1688 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: Running task 1689 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_unpack)
NOTE: Running task 1690 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe pango-1.50.11-r0: task do_fetch: Started
NOTE: recipe pango-1.50.11-r0: task do_fetch: Succeeded
NOTE: Running task 1791 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: Running task 1792 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1793 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_unpack)
NOTE: Running task 1794 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_write_config)
NOTE: Running task 1795 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: Running task 1802 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_write_config)
NOTE: Running task 1809 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_fetch)
NOTE: Running task 1822 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: Running task 1838 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1845 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 1851 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: Running task 1898 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: Running task 1899 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1926 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: Running task 1947 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1948 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_unpack: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1987 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_write_config)
NOTE: Running task 1988 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: Running task 2017 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 2018 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe pango-1.50.11-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 2040 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 2044 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2101 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Succeeded
NOTE: Running task 2102 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_unpack)
NOTE: Running task 2103 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2104 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: Running task 2107 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 2108 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: Running task 2115 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: Running task 2147 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 2148 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 2149 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: Running task 2150 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 2158 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2159 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: Running task 2188 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_fetch)
NOTE: Running task 2189 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_fetch)
NOTE: Running task 2190 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2191 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2235 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: Running task 2263 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2264 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_fetch)
NOTE: Running task 2265 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_fetch)
NOTE: Running task 2266 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_fetch)
NOTE: Running task 2267 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 2288 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_fetch)
NOTE: Running task 2290 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 2291 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: Running task 2301 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_fetch)
NOTE: Running task 2314 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_write_config)
NOTE: Running task 2315 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: Running task 2377 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_write_config)
NOTE: Running task 2378 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: Running task 2406 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_write_config)
NOTE: Running task 2415 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: Running task 2434 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: Running task 2435 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2436 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: Running task 2437 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2438 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: Running task 2439 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 2440 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: Running task 2441 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_fetch: Succeeded
NOTE: Running task 2442 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: Running task 2443 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: Running task 2458 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_write_config)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe tiff-4.4.0-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: Running task 2476 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: Running task 2477 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: Running task 2478 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: Running task 2479 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: Running task 2480 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2481 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 2482 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: Running task 2483 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_unpack)
NOTE: Running task 2484 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2485 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2486 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Started
NOTE: Running task 2487 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 2488 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: Running task 2489 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: recipe gtk4-4.8.3-r0: task do_fetch: Started
NOTE: recipe gtk4-4.8.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_write_config: Started
NOTE: Running task 2490 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Succeeded
NOTE: Running task 2491 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2492 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running task 2493 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_write_config: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: Running task 2494 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2495 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 2496 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 2497 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2498 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_unpack)
NOTE: Running task 2499 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_unpack)
NOTE: Running task 2500 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_unpack)
NOTE: Running task 2501 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_write_config: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2502 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_unpack)
NOTE: Running task 2503 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.8.3-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe pango-1.50.11-r0: task do_unpack: Succeeded
NOTE: Running task 2504 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: Running task 2505 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: Running task 2506 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: Running task 2507 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: Running task 2508 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_unpack)
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: Running task 2509 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Started
NOTE: Running task 2510 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2511 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 2512 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: Running task 2513 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_patch)
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2542 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2551 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2553 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 2554 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_patch)
NOTE: Running task 2555 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2556 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2557 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2558 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: Running task 2559 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: Running task 2560 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_unpack: Started
NOTE: Running task 2561 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: Running task 2562 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2563 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: Running task 2564 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe tiff-4.4.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: Running task 2565 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: Running task 2566 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2567 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2568 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 2587 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_patch: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2588 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running task 2589 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 2594 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2625 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2626 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2627 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2628 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2629 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: Running task 2630 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe tiff-4.4.0-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: Running task 2632 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.11-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2633 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: Running task 2634 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: Running task 2635 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 2636 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2637 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Started
NOTE: Running task 2638 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: Running task 2639 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running task 2640 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2641 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2642 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2643 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2644 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: Running task 2645 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2646 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2647 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2648 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_patch: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2649 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 2650 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2022.2-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2651 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2652 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2653 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2654 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2655 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_patch)
NOTE: Running task 2656 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2657 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package_setscene: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2658 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2659 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2660 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe gi-docgen-2022.2-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2661 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_patch: Succeeded
NOTE: Running task 2662 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: Running task 2663 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2664 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: Running task 2665 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: Running task 2666 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2667 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: Running task 2668 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_patch)
NOTE: Running task 2669 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: Running task 2670 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Started
NOTE: Running task 2671 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2672 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2673 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: Running task 2674 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_patch: Started
NOTE: Running task 2675 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package_setscene: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: Running task 2686 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.4.0-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: Running task 2687 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2689 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: Running task 2701 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2702 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2705 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2706 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2707 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2708 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2709 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2710 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_configure: Succeeded
NOTE: Running task 2711 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2712 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe tiff-4.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2717 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2718 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_configure)
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Succeeded
NOTE: Running task 2719 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2720 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure: Started
NOTE: Running task 2721 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe gtk4-4.8.3-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Started
NOTE: Running task 2722 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_patch)
NOTE: recipe harfbuzz-5.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2723 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gtk4-4.8.3-r0: task do_patch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe gtk4-4.8.3-r0: task do_patch: Succeeded
NOTE: Running task 2724 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2725 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_populate_lic)
NOTE: recipe harfbuzz-5.3.1-r0: task do_configure: Started
NOTE: recipe gtk4-4.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.8.3-r0: task do_populate_lic: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: Running task 2726 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2727 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: Running task 2728 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk4-4.8.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_populate_lic unihash changed to ea4007752803aa3d92a5099c00233ffed16740570b0d93173573baf7c2781152
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2729 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2730 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2731 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: Running task 2732 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_compile)
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_compile: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_compile: Succeeded
NOTE: Running task 2733 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_install)
NOTE: recipe gi-docgen-2022.2-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 2734 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_install: Succeeded
NOTE: Running task 2735 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot)
NOTE: Running task 2736 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package)
NOTE: recipe gi-docgen-2022.2-r0: task do_package: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2737 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2738 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2739 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2740 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2741 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2742 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2743 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe gi-docgen-2022.2-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 2744 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_packagedata)
NOTE: Running task 2745 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2746 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_compile: Succeeded
NOTE: Running task 2747 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_install)
NOTE: recipe gi-docgen-2022.2-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2748 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe orc-0.4.33-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 2749 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2750 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_install: Succeeded
NOTE: Running task 2751 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot)
NOTE: Running task 2752 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_package: Started
NOTE: Running task 2753 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 2754 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: Running task 2755 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe harfbuzz-5.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2756 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2757 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2758 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2759 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2760 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_configure_ptest_base)
NOTE: recipe tiff-4.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2761 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure_ptest_base: Started
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_configure: Started
NOTE: Running task 2762 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2763 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2764 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2765 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2766 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_package: Succeeded
NOTE: Running task 2767 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata)
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2768 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 2769 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 2770 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2771 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 2772 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: Running task 2773 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: Running task 2774 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 2775 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: Running task 2776 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Started
NOTE: Running task 2777 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2778 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2779 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: Running task 2780 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: Running task 2781 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2782 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2783 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2784 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2785 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_install)
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2786 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2787 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: Running task 2788 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: Running task 2789 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2790 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 2791 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 2792 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2793 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2794 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2795 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: Running task 2796 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2797 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package)
NOTE: Running task 2798 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2799 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2800 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Started
NOTE: Running task 2801 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: Running task 2802 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: Running task 2803 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Started
NOTE: Running task 2804 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2805 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: Running task 2806 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2807 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: Running task 2808 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: Running task 2809 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2810 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: Running task 2811 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2812 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2813 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2814 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2815 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2816 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 2817 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2818 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2819 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2820 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2821 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: Running task 2822 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2823 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2824 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2825 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 2826 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2827 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2828 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2829 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: Running task 2830 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: Running task 2831 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_package_write_rpm: Started
NOTE: Running task 2832 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2833 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: Running task 2834 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2835 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: Running task 2836 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2837 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2838 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 2839 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2840 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2841 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 2842 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe tiff-4.4.0-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.4-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: Running task 2843 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2844 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2845 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.4-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2846 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2847 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_compile_ptest_base)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2848 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 2849 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2850 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2851 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 2852 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: Running task 2853 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_install_ptest_base)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2854 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2855 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install_ptest_base: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Started
NOTE: Running task 2856 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_populate_sysroot)
NOTE: Running task 2857 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2858 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2859 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.4-r0: task do_package: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: Running task 2860 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_packagedata)
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2861 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Succeeded
NOTE: Running task 2862 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot)
NOTE: Running task 2863 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2864 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2865 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2866 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_compile)
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2867 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2868 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2869 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2870 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package)
NOTE: recipe tiff-4.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2871 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_install)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Started
NOTE: recipe tiff-4.4.0-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2872 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2873 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Succeeded
NOTE: Running task 2874 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2875 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe tiff-4.4.0-r0: task do_install: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2876 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_populate_sysroot)
NOTE: Running task 2877 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_package)
NOTE: Running task 2878 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe tiff-4.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.4.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2879 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_package: Succeeded
NOTE: Running task 2880 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: Running task 2881 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: Running task 2882 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2883 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_package: Succeeded
NOTE: Running task 2884 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2885 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 2886 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2887 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2888 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2889 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 2890 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 2891 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2892 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2893 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: Running task 2894 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2895 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_install)
NOTE: recipe harfbuzz-5.3.1-r0: task do_install: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_install: Succeeded
NOTE: Running task 2896 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_sysroot)
NOTE: Running task 2897 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_package)
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_package: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2898 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2899 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure)
NOTE: recipe pango-1.50.11-r0: task do_configure: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_package: Succeeded
NOTE: Running task 2900 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata)
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_configure: Succeeded
NOTE: Running task 2901 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure_ptest_base)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2902 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2903 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe pango-1.50.11-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2904 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2905 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2906 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2907 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2908 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2909 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2910 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2911 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2912 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2913 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_compile: Succeeded
NOTE: Running task 2914 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2915 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install)
NOTE: recipe pango-1.50.11-r0: task do_install: Started
NOTE: recipe pango-1.50.11-r0: task do_install: Succeeded
NOTE: Running task 2916 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install_ptest_base)
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2917 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2918 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_populate_sysroot)
NOTE: Running task 2919 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_package)
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2920 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2921 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2922 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2923 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2924 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2925 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2926 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Succeeded
NOTE: Running task 2927 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata)
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Succeeded
NOTE: Running task 2928 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_compile)
NOTE: recipe gtk+3-3.24.35-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2929 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_compile: Started
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: Running task 2930 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_compile)
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2931 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_install: Succeeded
NOTE: Running task 2932 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_populate_sysroot)
NOTE: Running task 2933 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_package: Succeeded
NOTE: Running task 2934 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_compile: Succeeded
NOTE: Running task 2935 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_install)
NOTE: recipe gtk+3-3.24.35-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_install: Succeeded
NOTE: Running task 2936 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_package)
NOTE: recipe gtk+3-3.24.35-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_package: Succeeded
NOTE: Running task 2942 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.35-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Succeeded
NOTE: Running task 2946 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_install)
NOTE: recipe librsvg-2.54.5-r0: task do_install: Started
NOTE: recipe librsvg-2.54.5-r0: task do_install: Succeeded
NOTE: Running task 2947 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_populate_sysroot)
NOTE: Running task 2948 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_package)
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.5-r0: task do_package: Started
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2949 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2950 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_package: Succeeded
NOTE: Running task 2951 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_packagedata)
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2952 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2953 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_install: Succeeded
NOTE: Running task 2954 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_populate_sysroot)
NOTE: Running task 2955 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2956 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2957 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_configure)
NOTE: recipe gtk4-4.8.3-r0: task do_configure: Started
NOTE: recipe gtk4-4.8.3-r0: task do_configure: Succeeded
NOTE: Running task 2958 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_compile)
NOTE: recipe gtk4-4.8.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_package: Succeeded
NOTE: Running task 2959 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_compile: Succeeded
NOTE: Running task 2960 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_install)
NOTE: recipe gtk4-4.8.3-r0: task do_install: Started
NOTE: recipe gtk4-4.8.3-r0: task do_install: Succeeded
NOTE: Running task 2961 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_package)
NOTE: Running task 2962 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.8.3-r0: task do_package: Started
NOTE: recipe gtk4-4.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_package: Succeeded
NOTE: Running task 2963 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_packagedata)
NOTE: recipe gtk4-4.8.3-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.8.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2964 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_package_write_rpm)
NOTE: Running task 2965 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_package_qa)
NOTE: recipe gtk4-4.8.3-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.8.3-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.8.3-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2966 of 2966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2966 tasks of which 2524 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-src went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dbg went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-staticdev went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dev went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-doc went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-locale went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0055336224242322741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 71 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f8c9980e27de19462748aa70c6dde34b1b70cded"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 166 Local 14 Mirrors 0 Missed 152 Current 667 (8% match, 81% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 679 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gobject-introspection/1.72.0-r0/temp/log.do_packagedata_setscene.2423938
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 832 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package_setscene)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1464 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1520 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_fetch)
NOTE: Running task 1521 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 1522 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
NOTE: Running task 1548 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_fetch)
NOTE: Running task 1622 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: Running task 1667 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1690 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_fetch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1757 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: Running task 1766 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_unpack)
NOTE: Running task 1767 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: recipe pango-1.50.11-r0: task do_fetch: Succeeded
NOTE: Running task 1785 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_write_config)
NOTE: Running task 1786 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: Running task 1787 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1788 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_unpack)
NOTE: Running task 1789 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: Running task 1796 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_write_config)
NOTE: Running task 1803 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: Running task 1804 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: Running task 1820 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1827 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 1833 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: Running task 1859 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Started
NOTE: Running task 1888 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1889 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1908 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: recipe pango-1.50.11-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1946 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: recipe pango-1.50.11-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_fetch: Started
NOTE: Running task 1969 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_write_config)
NOTE: Running task 1970 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Succeeded
NOTE: Running task 1999 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 2000 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2022 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 2026 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: Running task 2053 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2054 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2055 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2088 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: recipe pango-1.50.11-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 2089 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: Running task 2090 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: Running task 2097 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 2129 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 2130 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 2131 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: Running task 2132 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 2141 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2142 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2170 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2171 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_fetch)
NOTE: Running task 2172 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_fetch)
NOTE: Running task 2173 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: Running task 2215 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2216 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2219 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: Running task 2247 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_fetch)
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_write_config: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2248 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: Running task 2249 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: Running task 2250 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 2251 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2252 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: Running task 2253 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: Running task 2254 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: Running task 2255 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: Running task 2256 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2257 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Started
NOTE: Running task 2258 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: Running task 2259 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: Running task 2260 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: Running task 2261 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2262 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: Running task 2263 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running task 2264 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_fetch: Started
NOTE: Running task 2265 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2266 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: Running task 2267 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2268 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_unpack)
NOTE: Running task 2269 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: Running task 2270 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 2271 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2272 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.11-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: Running task 2273 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2274 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: Running task 2275 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2276 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_patch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: Running task 2277 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: Running task 2278 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_fetch)
NOTE: Running task 2279 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2280 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2281 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_fetch)
NOTE: Running task 2302 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_fetch)
NOTE: Running task 2304 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 2305 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: Running task 2306 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: Running task 2307 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: Running task 2308 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: Running task 2309 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2310 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2311 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2312 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_patch)
NOTE: Running task 2315 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2316 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: Running task 2317 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_patch: Started
NOTE: Running task 2318 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: Running task 2322 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_unpack)
NOTE: Running task 2327 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_fetch)
NOTE: Running task 2328 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe tiff-4.4.0-r0: task do_fetch: Started
NOTE: Running task 2329 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: Running task 2330 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: Running task 2331 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe tiff-4.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 2332 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: Running task 2333 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: Running task 2334 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_fetch: Succeeded
NOTE: Running task 2335 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2336 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_unpack)
NOTE: Running task 2337 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2338 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2339 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Started
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: Running task 2340 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: Running task 2341 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_patch: Started
NOTE: Running task 2342 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 2346 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: Running task 2356 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gi-docgen-2022.2-r0: task do_unpack: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2357 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: Running task 2358 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_configure)
NOTE: recipe gtk4-4.8.3-r0: task do_fetch: Started
NOTE: recipe gtk4-4.8.3-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2359 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2360 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 2361 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2362 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Started
NOTE: Running task 2363 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2364 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2365 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: Running task 2366 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2367 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.4.0-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 2368 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2369 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: Running task 2370 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: Running task 2371 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: Running task 2372 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_unpack: Started
NOTE: Running task 2373 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: Running task 2374 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: Running task 2375 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_write_config)
NOTE: Running task 2376 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2387 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Started
NOTE: Running task 2388 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 2433 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_unpack)
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2434 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_patch)
NOTE: Running task 2435 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2436 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 2437 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2439 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2446 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_patch: Succeeded
NOTE: Running task 2447 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2448 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2449 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_write_config)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package_setscene: Started
NOTE: Running task 2466 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2476 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2479 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_write_config)
NOTE: Running task 2488 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: Running task 2495 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: Running task 2522 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_write_config)
NOTE: recipe tiff-4.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2524 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2548 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_write_config: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2578 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: Running task 2595 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe gi-docgen-2022.2-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: Running task 2623 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_write_config: Started
NOTE: Running task 2635 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2636 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2637 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_write_config: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_write_config: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_patch: Started
NOTE: Running task 2638 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: recipe gtk4-4.8.3-r0: task do_write_config: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 2639 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2640 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2641 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 2642 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2643 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2644 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2645 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_patch)
NOTE: Running task 2646 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: Running task 2647 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2648 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: Running task 2649 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2650 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2651 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Setscene tasks completed
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2662 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_unpack: Succeeded
NOTE: Running task 2663 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: Running task 2664 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2666 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 2678 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_patch)
NOTE: Running task 2679 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2680 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe harfbuzz-5.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_patch: Succeeded
NOTE: Running task 2683 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2684 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2685 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe gi-docgen-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_patch: Started
NOTE: Running task 2686 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2687 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2022.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 2688 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe tiff-4.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_patch: Succeeded
NOTE: Running task 2689 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2022.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2690 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: Running task 2691 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2692 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_configure: Succeeded
NOTE: Running task 2697 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Succeeded
NOTE: Running task 2698 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2699 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2700 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 2701 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_configure)
NOTE: Running task 2702 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe harfbuzz-5.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2703 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: Running task 2704 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe harfbuzz-5.3.1-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Succeeded
NOTE: Running task 2705 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2706 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: Running task 2707 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk4-4.8.3-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2708 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_patch)
NOTE: Running task 2709 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.8.3-r0: task do_patch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_patch: Succeeded
NOTE: Running task 2710 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2711 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_populate_lic)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 2712 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2713 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_populate_lic: Started
NOTE: recipe gtk4-4.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2714 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: recipe gtk4-4.8.3-r0: task do_populate_lic: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_populate_lic unihash changed to ea4007752803aa3d92a5099c00233ffed16740570b0d93173573baf7c2781152
NOTE: recipe gtk4-4.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 2715 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe gi-docgen-2022.2-r0: task do_compile: Succeeded
NOTE: Running task 2716 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_install: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_install: Succeeded
NOTE: Running task 2717 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot)
NOTE: Running task 2718 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2719 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe gi-docgen-2022.2-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2720 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: recipe gi-docgen-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2721 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2722 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: Running task 2723 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 2724 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 2725 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2726 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2727 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 2728 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.33-r0: task do_compile: Succeeded
NOTE: Running task 2729 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: Running task 2730 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe orc-0.4.33-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2731 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2732 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe gi-docgen-2022.2-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: Running task 2733 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_packagedata)
NOTE: recipe tiff-4.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 2734 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe gi-docgen-2022.2-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.33-r0: task do_install: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2735 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_configure)
NOTE: Running task 2736 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: Running task 2737 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2738 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe orc-0.4.33-r0: task do_package: Started
NOTE: recipe tiff-4.4.0-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2022.2-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: Running task 2739 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2740 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_compile)
NOTE: Running task 2741 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe harfbuzz-5.3.1-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2742 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: Running task 2743 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2744 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2745 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2746 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2747 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2748 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Succeeded
NOTE: Running task 2749 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata)
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2750 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 2751 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2752 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2753 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2754 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_compile)
NOTE: Running task 2755 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2756 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2757 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 2758 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2759 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 2760 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: Running task 2761 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2762 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 2763 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2764 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: Running task 2765 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2766 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2767 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2768 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_install)
NOTE: Running task 2769 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2770 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: Running task 2771 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2772 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 2773 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: Running task 2774 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2775 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: Running task 2776 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot)
NOTE: Running task 2777 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2778 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2779 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2780 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2781 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: Running task 2782 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2783 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: Running task 2784 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: Running task 2785 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: Running task 2786 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 2787 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: Running task 2788 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: Running task 2789 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2790 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2791 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2792 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2793 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2794 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2795 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2796 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 2797 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2798 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2799 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2800 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2801 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: Running task 2802 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 2803 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2804 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2805 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2806 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2807 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2808 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2809 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2810 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2811 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2812 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: Running task 2813 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 2814 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2815 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: Running task 2816 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 2817 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 2818 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 2819 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2820 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 2821 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2822 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2823 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_install)
NOTE: Running task 2824 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_compile)
NOTE: recipe tiff-4.4.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe libwebp-1.2.4-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 2825 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2826 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_package)
NOTE: Running task 2827 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.4-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 2828 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2829 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 2830 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2831 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_compile_ptest_base)
NOTE: Running task 2832 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2833 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2834 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install: Succeeded
NOTE: Running task 2835 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install_ptest_base: Started
NOTE: recipe libwebp-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2836 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2837 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_populate_sysroot)
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Started
NOTE: Running task 2838 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: Running task 2839 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2840 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Started
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2841 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2842 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2843 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Succeeded
NOTE: Running task 2844 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot)
NOTE: Running task 2845 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_package)
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2846 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_compile)
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2847 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2848 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2849 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_install)
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2850 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2851 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package)
NOTE: recipe tiff-4.4.0-r0: task do_compile: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: Running task 2852 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_install)
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Started
NOTE: recipe tiff-4.4.0-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2853 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2854 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2855 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe tiff-4.4.0-r0: task do_install: Succeeded
NOTE: Running task 2856 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_populate_sysroot)
NOTE: Running task 2857 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe tiff-4.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.4.0-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2858 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2859 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2860 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Succeeded
NOTE: recipe tiff-4.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2861 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: Running task 2862 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Started
NOTE: recipe tiff-4.4.0-r0: task do_package: Succeeded
NOTE: Running task 2863 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb:do_packagedata)
NOTE: recipe tiff-4.4.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2864 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: Running task 2865 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_package: Succeeded
NOTE: Running task 2866 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2867 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 2868 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 2869 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2870 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: Running task 2871 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 2872 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2873 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2874 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2875 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2876 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_install)
NOTE: recipe harfbuzz-5.3.1-r0: task do_install: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_install: Succeeded
NOTE: Running task 2877 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_sysroot)
NOTE: Running task 2878 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_package)
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: Running task 2879 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2880 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2881 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure)
NOTE: recipe pango-1.50.11-r0: task do_configure: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_package: Succeeded
NOTE: Running task 2882 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata)
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_configure: Succeeded
NOTE: Running task 2883 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2884 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile)
NOTE: recipe pango-1.50.11-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2885 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2886 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2887 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2888 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2889 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2890 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2891 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_compile: Succeeded
NOTE: Running task 2892 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2893 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2894 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe pango-1.50.11-r0: task do_install: Started
NOTE: recipe pango-1.50.11-r0: task do_install: Succeeded
NOTE: Running task 2895 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2896 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_populate_sysroot)
NOTE: Running task 2897 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_package)
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2898 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2899 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2900 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2901 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2902 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2903 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2904 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2905 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2906 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2907 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2908 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_package: Succeeded
NOTE: Running task 2909 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata)
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Succeeded
NOTE: Running task 2910 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_compile)
NOTE: recipe gtk+3-3.24.35-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2911 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_compile: Started
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: Running task 2912 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_compile)
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2913 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_install: Succeeded
NOTE: Running task 2914 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_populate_sysroot)
NOTE: Running task 2915 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_package: Succeeded
NOTE: Running task 2916 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_compile: Succeeded
NOTE: Running task 2917 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_install)
NOTE: recipe gtk+3-3.24.35-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_install: Succeeded
NOTE: Running task 2918 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_package)
NOTE: recipe gtk+3-3.24.35-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_package: Succeeded
NOTE: Running task 2924 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.35-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Succeeded
NOTE: Running task 2928 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_install)
NOTE: recipe librsvg-2.54.5-r0: task do_install: Started
NOTE: recipe librsvg-2.54.5-r0: task do_install: Succeeded
NOTE: Running task 2929 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_populate_sysroot)
NOTE: Running task 2930 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_package)
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.5-r0: task do_package: Started
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2931 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2932 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_package: Succeeded
NOTE: Running task 2933 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_packagedata)
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2934 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2935 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_install: Succeeded
NOTE: Running task 2936 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_populate_sysroot)
NOTE: Running task 2937 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2938 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2939 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_configure)
NOTE: recipe gtk4-4.8.3-r0: task do_configure: Started
NOTE: recipe gtk4-4.8.3-r0: task do_configure: Succeeded
NOTE: Running task 2940 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_compile)
NOTE: recipe gtk4-4.8.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_package: Succeeded
NOTE: Running task 2941 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_compile: Succeeded
NOTE: Running task 2942 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_install)
NOTE: recipe gtk4-4.8.3-r0: task do_install: Started
NOTE: recipe gtk4-4.8.3-r0: task do_install: Succeeded
NOTE: Running task 2943 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_package)
NOTE: Running task 2944 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.8.3-r0: task do_package: Started
NOTE: recipe gtk4-4.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_package: Succeeded
NOTE: Running task 2945 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_packagedata)
NOTE: recipe gtk4-4.8.3-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.8.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2946 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_package_write_rpm)
NOTE: Running task 2947 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_package_qa)
NOTE: recipe gtk4-4.8.3-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.8.3-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.8.3-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2948 of 2948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2948 tasks of which 2506 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-src went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dbg went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-staticdev went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dev went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-doc went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-locale went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection went backwards which would break package feeds (from 0:1.74.0-r0 to 0:1.72.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.72.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0055336224242322741==--

