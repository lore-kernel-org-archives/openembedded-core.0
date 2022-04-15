Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA25EC47080
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.11564.1650052687170910961
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=8w3siY8a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101802ecde13e-bc9fcdaf-1c4f-4661-b197-02fc8f212c43-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5oSWiqBRRpm6/pfgpWiO+ULCAmtMtq9Ive34DtQjzRc=;
	b=8w3siY8a8dXZwMEq7XdTtMm6tcLUk1TyIf6WI+xgD9DzDMzcS67I6UTEbkcdBa/z
	kEsqtkybgt+coqYEMTYNbmJvW6w6HITwd9xTNg9/NhgXRzZ036XBpl5xGUkL3QtYCQl
	5jNqv/J/j0qmCLafTQ9rkcuVTXxFP/ljs8JPqwSc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5oSWiqBRRpm6/pfgpWiO+ULCAmtMtq9Ive34DtQjzRc=;
	b=Su8znPN2p97vRq0PevTezGNNAousR402QiC66CrMOJKC2c/5sV6mDkLewo+v6GuT
	SqO+JBVjByWbt3A2L4qhP+JPGkZPMoygU+EUVEp5b54a7y1m29nTme2BUrESenva57M
	EenUgakQ3AYIL0QxFVoJ1IG43olfAbkAJvXxPtk0=
Content-Type: multipart/mixed; boundary="===============6745508694710311948=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 0.20.0 SUCCEEDED
Message-ID: 
 <010101802ecde13e-bc9fcdaf-1c4f-4661-b197-02fc8f212c43-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:06 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164451

--===============6745508694710311948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *0.20.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-0.19.0-0.20.0.patch
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
--===============6745508694710311948==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-0.19.0-0.20.0.patch"

From f63818734f419e4f7ecd94a7930c40f5ecae8f05 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 07:42:41 +0000
Subject: [PATCH] createrepo-c: upgrade 0.19.0 -> 0.20.0

---
 .../{createrepo-c_0.19.0.bb => createrepo-c_0.20.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.19.0.bb => createrepo-c_0.20.0.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb
index 82351252e5..bc61cac955 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "a531ee881a8f1d9273b4383fb9fa604c56fff138"
+SRCREV = "e53188f86f4dfad46f5b81d6931cbaec19e44ea2"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============6745508694710311948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 62 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6c9ee467b8c856489f1eec7975351634a26dcf34"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 148 Local 11 Mirrors 0 Missed 137 Current 373 (7% match, 73% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 413 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.02.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2022a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2022.02.11-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.25-r0: task do_packagedata_setscene: Started
NOTE: Running task 816 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_fetch)
NOTE: Running task 875 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_fetch)
NOTE: Running task 886 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: recipe wayland-protocols-1.25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 956 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot)
NOTE: recipe autoconf-archive-2022.02.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 991 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 1002 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_fetch)
NOTE: Running task 1007 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_fetch)
NOTE: Running task 1008 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_fetch)
NOTE: Running task 1009 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: recipe tzdata-2022a-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1038 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_write_config)
NOTE: Running task 1054 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot)
NOTE: recipe expat-2.4.7-r0: task do_fetch: Started
NOTE: Running task 1055 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 1062 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_write_config)
NOTE: Running task 1067 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_write_config)
NOTE: Running task 1071 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 1072 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: Running task 1073 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 1074 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_fetch)
NOTE: Running task 1077 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 1078 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_fetch)
NOTE: Running task 1079 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_fetch)
NOTE: Running task 1128 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: recipe expat-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 1139 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_fetch)
NOTE: Running task 1142 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_fetch)
NOTE: Running task 1143 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: Running task 1144 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_fetch)
NOTE: Running task 1149 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1150 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_fetch)
NOTE: Running task 1151 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_fetch)
NOTE: Running task 1152 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: Running task 1153 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_fetch)
NOTE: Running task 1154 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1155 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1156 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_fetch)
NOTE: Running task 1157 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_fetch)
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: Running task 1264 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_write_config)
NOTE: Running task 1276 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_write_config)
NOTE: Running task 1306 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_warn_musl)
NOTE: Running task 1307 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_write_config)
NOTE: Running task 1328 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_unpack)
NOTE: Running task 1329 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: Running task 1331 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_unpack)
NOTE: Running task 1332 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: Running task 1333 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Started
NOTE: Running task 1342 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 1357 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_fetch)
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: Running task 1410 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Started
NOTE: Running task 1411 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_unpack)
NOTE: Running task 1412 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_unpack)
NOTE: Running task 1413 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 1414 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_fetch: Started
NOTE: Running task 1415 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 1416 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.14-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: Running task 1417 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: Running task 1418 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_unpack)
NOTE: Running task 1426 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe curl-7.82.0-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1428 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_unpack)
NOTE: Running task 1429 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 1430 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_unpack)
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Started
NOTE: Running task 1431 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: Running task 1432 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_unpack)
NOTE: Running task 1433 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Succeeded
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Started
NOTE: Running task 1434 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: Running task 1435 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_unpack)
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Started
NOTE: Running task 1436 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 1437 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Started
NOTE: Running task 1438 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_unpack)
NOTE: Running task 1439 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe kmod-29-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_fetch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: Running task 1440 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: Running task 1441 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_unpack)
NOTE: Running task 1442 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: Running task 1443 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1444 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_unpack)
NOTE: Running task 1445 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1446 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_unpack)
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Started
NOTE: recipe systemd-1_250.4-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_250.4-r0: task do_warn_musl: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Started
NOTE: Running task 1447 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1448 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1449 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-29-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_fetch: Started
NOTE: Running task 1450 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_unpack)
NOTE: Running task 1451 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.186-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: Running task 1452 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: recipe systemd-1_250.4-r0: task do_write_config: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Started
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Started
NOTE: Running task 1471 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1472 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_unpack)
NOTE: Running task 1473 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_250.4-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_write_config: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: Running task 1474 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: Running task 1475 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_unpack)
NOTE: Running task 1476 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 1477 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1535 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 1536 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Started
NOTE: recipe curl-7.82.0-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Started
NOTE: Running task 1537 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_patch)
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: Running task 1538 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1539 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: Running task 1540 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_patch)
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Started
NOTE: Running task 1541 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Started
NOTE: recipe curl-7.82.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1542 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1543 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_patch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Started
NOTE: Running task 1544 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe kmod-29-r0: task do_unpack: Started
NOTE: Running task 1545 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Started
NOTE: recipe elfutils-0.186-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: Running task 1546 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1547 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: recipe expat-2.4.7-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1548 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 1549 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: Running task 1550 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: Running task 1551 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Started
NOTE: Running task 1552 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe wayland-1.20.0-r0: task do_patch: Started
NOTE: recipe systemd-1_250.4-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Started
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_patch)
NOTE: recipe expat-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 1554 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: Running task 1555 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: Running task 1556 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_patch)
NOTE: Running task 1557 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_generate_toolchain_file)
NOTE: Running task 1558 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1559 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.14-r0: task do_patch: Started
NOTE: Running task 1560 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
NOTE: recipe kmod-29-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1561 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: Running task 1562 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_patch)
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1563 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1564 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1565 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: Running task 1566 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1567 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Started
NOTE: recipe wayland-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1568 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_unpack: Succeeded
NOTE: Running task 1569 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1570 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1571 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_patch)
NOTE: recipe libxcb-1.14-r0: task do_patch: Succeeded
NOTE: Running task 1572 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.82.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Started
NOTE: Running task 1573 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_patch)
NOTE: Running task 1574 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1575 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe kmod-29-r0: task do_patch: Started
NOTE: Running task 1576 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1577 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: Running task 1578 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1579 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1580 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1581 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1582 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: Running task 1583 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1584 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1585 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1586 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe curl-7.82.0-r0: task do_patch: Started
NOTE: recipe dbus-1.14.0-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1587 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_patch: Succeeded
NOTE: Running task 1588 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1589 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1590 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1591 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_patch)
NOTE: Running task 1592 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1593 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_generate_toolchain_file)
NOTE: Running task 1594 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic)
NOTE: Running task 1595 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: Running task 1596 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: Running task 1597 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1598 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1599 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-29-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1600 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1601 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Started
NOTE: Running task 1602 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1603 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_configure)
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1604 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: Running task 1605 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_configure)
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1606 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1607 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_configure)
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: Running task 1608 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: Running task 1609 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.41-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Started
NOTE: Running task 1610 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_patch)
NOTE: Running task 1611 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic unihash changed to 2b94707fe55063cf3c209746ada5d65395753725632fe123369bc2b21328a491
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: recipe curl-7.82.0-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1612 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe systemd-1_250.4-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_unpack: Succeeded
NOTE: Running task 1613 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: Running task 1614 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_patch)
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Succeeded
NOTE: Running task 1615 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_patch: Succeeded
NOTE: Running task 1616 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1617 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1618 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Succeeded
NOTE: Running task 1619 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Started
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1620 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1621 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.186-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Succeeded
NOTE: Running task 1622 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_deploy_source_date_epoch)
NOTE: Running task 1623 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_install)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1624 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1625 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_configure)
NOTE: Running task 1626 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure_ptest_base)
NOTE: Running task 1627 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: Running task 1628 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_compile)
NOTE: Running task 1629 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe xorgproto-2021.5-r0: task do_install: Started
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1630 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile)
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Succeeded
NOTE: Running task 1631 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: Running task 1632 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: Running task 1633 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_install)
NOTE: Running task 1634 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe expat-2.4.7-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: Running task 1635 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot)
NOTE: Running task 1636 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1637 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: Running task 1638 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: recipe xorgproto-2021.5-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1639 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot)
NOTE: Running task 1640 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_package)
NOTE: Running task 1641 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1642 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Succeeded
NOTE: Running task 1643 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2021.5-r0: task do_package: Started
NOTE: Running task 1644 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot)
NOTE: Running task 1645 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: Running task 1646 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: Running task 1647 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1648 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1649 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1650 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1651 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1652 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_configure)
NOTE: Running task 1653 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: Running task 1654 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1655 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_configure)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 1656 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1657 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_configure)
NOTE: recipe xorgproto-2021.5-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: Running task 1658 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1659 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1660 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 1661 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_compile)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 1662 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_install)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 1663 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot)
NOTE: Running task 1664 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1665 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile_ptest_base)
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1666 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 1667 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe expat-2.4.7-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1668 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe expat-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1669 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install_ptest_base)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1670 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1671 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_package)
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.7-r0: task do_package: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 1672 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1673 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1674 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: Running task 1675 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: Running task 1676 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1677 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1678 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Succeeded
NOTE: Running task 1679 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: Running task 1680 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata: Started
NOTE: recipe expat-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 1681 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata)
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1682 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 1683 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe file-5.41-r0: task do_configure: Succeeded
NOTE: Running task 1684 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: recipe file-5.41-r0: task do_compile: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Failed
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: recipe file-5.41-r0: task do_compile: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1684 tasks of which 1446 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/expat/2.4.7-r0/temp/log.do_packagedata.3331360
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata) failed with exit code '1'

--===============6745508694710311948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 52 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6c9ee467b8c856489f1eec7975351634a26dcf34"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 148 Local 11 Mirrors 0 Missed 137 Current 373 (7% match, 73% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 413 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.02.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2022a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2022.02.11-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.25-r0: task do_packagedata_setscene: Started
NOTE: Running task 816 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_fetch)
NOTE: Running task 875 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_fetch)
NOTE: Running task 886 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: recipe autoconf-archive-2022.02.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.25-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 956 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot)
NOTE: recipe tzdata-2022a-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 992 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 1005 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_fetch)
NOTE: Running task 1009 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_fetch)
NOTE: Running task 1010 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_fetch)
NOTE: Running task 1011 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 1041 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_write_config)
NOTE: Running task 1057 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot)
NOTE: recipe expat-2.4.7-r0: task do_fetch: Started
NOTE: Running task 1058 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 1063 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_write_config)
NOTE: Running task 1067 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_write_config)
NOTE: Running task 1073 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 1074 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: Running task 1075 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_fetch)
NOTE: Running task 1076 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 1079 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 1080 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_fetch)
NOTE: Running task 1081 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_fetch)
NOTE: Running task 1130 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 1141 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_fetch)
NOTE: Running task 1144 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: Running task 1145 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_fetch)
NOTE: Running task 1146 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_fetch)
NOTE: Running task 1151 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1152 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_fetch)
NOTE: Running task 1153 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: Running task 1154 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_fetch)
NOTE: Running task 1155 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_fetch)
NOTE: Running task 1156 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1157 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_fetch)
NOTE: Running task 1158 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1159 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_fetch)
NOTE: recipe expat-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: Running task 1266 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_write_config)
NOTE: Running task 1276 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_write_config)
NOTE: Running task 1306 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_warn_musl)
NOTE: Running task 1307 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_write_config)
NOTE: Running task 1337 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 1345 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_unpack)
NOTE: Running task 1346 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Started
NOTE: Running task 1354 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_fetch)
NOTE: Running task 1402 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_unpack)
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Started
NOTE: Running task 1403 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: Running task 1404 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Started
NOTE: Running task 1415 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 1437 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Succeeded
NOTE: Running task 1438 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_unpack)
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: Running task 1439 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1440 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 1441 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot: Started
NOTE: Running task 1442 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_unpack)
NOTE: Running task 1443 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_fetch: Started
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_fetch: Started
NOTE: recipe curl-7.82.0-r0: task do_fetch: Succeeded
NOTE: Running task 1445 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_unpack)
NOTE: Running task 1446 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: Running task 1447 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: Running task 1448 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_unpack)
NOTE: Running task 1449 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_unpack)
NOTE: Running task 1450 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 1451 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: Running task 1452 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: recipe kmod-29-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1453 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_unpack)
NOTE: Running task 1454 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Started
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe kmod-29-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Started
NOTE: Running task 1455 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: Running task 1456 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Started
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1457 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_unpack)
NOTE: Running task 1458 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 1459 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: Running task 1460 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_unpack)
NOTE: Running task 1461 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_unpack)
NOTE: Running task 1462 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1463 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_unpack)
NOTE: Running task 1464 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1465 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1466 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Started
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe elfutils-0.186-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Started
NOTE: Running task 1487 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Started
NOTE: Running task 1500 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_unpack)
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Started
NOTE: Running task 1501 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1502 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1503 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe elfutils-0.186-r0: task do_fetch: Succeeded
NOTE: Running task 1504 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_unpack)
NOTE: Running task 1505 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: recipe systemd-1_250.4-r0: task do_fetch: Started
NOTE: recipe systemd-1_250.4-r0: task do_write_config: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_warn_musl: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: Running task 1523 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_unpack)
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Started
NOTE: recipe systemd-1_250.4-r0: task do_warn_musl: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: Running task 1531 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: recipe systemd-1_250.4-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: Running task 1532 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_unpack)
NOTE: Running task 1533 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_unpack)
NOTE: Running task 1534 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1535 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: Running task 1536 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: recipe systemd-1_250.4-r0: task do_write_config: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.82.0-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1537 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe expat-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_unpack: Started
NOTE: Running task 1538 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Started
NOTE: recipe curl-7.82.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1539 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_patch)
NOTE: Running task 1540 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: recipe kmod-29-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: Running task 1541 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Succeeded
NOTE: Running task 1542 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1543 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: Running task 1544 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: Running task 1545 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_patch)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: Running task 1546 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: Running task 1547 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1548 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: recipe expat-2.4.7-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: Running task 1549 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: recipe systemd-1_250.4-r0: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_unpack: Succeeded
NOTE: Running task 1550 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1551 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: Running task 1552 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_patch)
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1553 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: Running task 1554 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_patch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Started
NOTE: Running task 1555 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe kmod-29-r0: task do_unpack: Succeeded
NOTE: Running task 1556 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.7-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Succeeded
NOTE: Running task 1557 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_patch)
NOTE: Running task 1558 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_generate_toolchain_file)
NOTE: Running task 1559 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1560 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_patch)
NOTE: Running task 1561 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Started
NOTE: recipe wayland-1.20.0-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 1562 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1563 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1564 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.14-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1565 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1566 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1567 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_patch)
NOTE: Running task 1568 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe kmod-29-r0: task do_patch: Started
NOTE: Running task 1569 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Started
NOTE: Running task 1570 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1571 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Started
NOTE: Running task 1572 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: Running task 1573 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: Running task 1574 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1575 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1576 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: Running task 1577 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1578 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1579 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1580 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Succeeded
NOTE: Running task 1581 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.82.0-r0: task do_patch: Started
NOTE: Running task 1582 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Started
NOTE: Running task 1583 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1584 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1585 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1586 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_patch: Started
NOTE: Running task 1587 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.82.0-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: Running task 1588 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1589 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_patch)
NOTE: Running task 1590 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1591 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_generate_toolchain_file)
NOTE: Running task 1592 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic)
NOTE: Running task 1593 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1594 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1595 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1596 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_patch)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: Running task 1597 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1598 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_patch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1599 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: Running task 1600 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_deploy_source_date_epoch)
NOTE: Running task 1601 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1602 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Started
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: Running task 1603 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Started
NOTE: recipe expat-2.4.7-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1604 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_configure)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: Running task 1605 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: Running task 1606 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1607 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_configure)
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe file-5.41-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic unihash changed to 2b94707fe55063cf3c209746ada5d65395753725632fe123369bc2b21328a491
NOTE: recipe systemd-1_250.4-r0: task do_unpack: Succeeded
NOTE: Running task 1608 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1609 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_patch)
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1610 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1611 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_configure)
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Started
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1612 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-7.82.0-r0: task do_configure: Started
NOTE: recipe systemd-1_250.4-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1613 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: recipe elfutils-0.186-r0: task do_unpack: Succeeded
NOTE: Running task 1614 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Succeeded
NOTE: Running task 1615 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_patch: Succeeded
NOTE: Running task 1616 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1617 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1618 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Succeeded
NOTE: Running task 1619 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_compile)
NOTE: recipe elfutils-0.186-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1620 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_deploy_source_date_epoch)
NOTE: Running task 1621 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1622 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1623 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_install)
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_configure: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1624 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Succeeded
NOTE: Running task 1625 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_configure)
NOTE: Running task 1626 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: Running task 1627 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_compile)
NOTE: Running task 1628 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: Running task 1629 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Started
NOTE: recipe xorgproto-2021.5-r0: task do_install: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Started
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: Running task 1630 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1631 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: Running task 1632 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Succeeded
NOTE: Running task 1633 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1634 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe expat-2.4.7-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: Running task 1635 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot)
NOTE: Running task 1636 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1637 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: Running task 1638 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: Running task 1639 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1640 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe xorgproto-2021.5-r0: task do_install: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: Running task 1641 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: Running task 1642 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot)
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Succeeded
NOTE: Running task 1643 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: Running task 1644 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe xorgproto-2021.5-r0: task do_package: Started
NOTE: Running task 1645 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1646 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1647 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: Running task 1648 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: Running task 1649 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1650 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1651 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1652 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1653 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1654 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_configure)
NOTE: Running task 1655 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1656 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_configure)
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 1657 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_package: Succeeded
NOTE: Running task 1658 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: Running task 1659 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1660 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: Running task 1661 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_compile)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 1662 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_install)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 1663 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot)
NOTE: Running task 1664 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package)
NOTE: recipe expat-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1665 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile_ptest_base)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Started
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1666 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install)
NOTE: recipe expat-2.4.7-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1667 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install_ptest_base)
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1668 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1669 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_package)
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.7-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 1670 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1671 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1672 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1673 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe expat-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 1674 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 1675 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Started
NOTE: Running task 1676 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: Running task 1677 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1678 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1679 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1680 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Failed
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: recipe file-5.41-r0: task do_configure: Succeeded
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1680 tasks of which 1446 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/expat/2.4.7-r0/temp/log.do_packagedata.3266922
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata) failed with exit code '1'

--===============6745508694710311948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.19.0", added "/usr/lib/libcreaterepo_c.so.0.20.0"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.19.0 to libcreaterepo_c.so.0.20.0
  /usr/lib/libcreaterepo_c.so.0.19.0 moved to /usr/lib/libcreaterepo_c.so.0.20.0

--===============6745508694710311948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1641 targets, 50 skipped, 0 masked, 0 errors.
Removing 76 recipes from the core2-32 sysroot...done.
Removing 80 recipes from the qemux86 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6c9ee467b8c856489f1eec7975351634a26dcf34"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 253 Local 176 Mirrors 0 Missed 77 Current 156 (69% match, 81% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 168 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 223 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 230 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 592 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: Running task 635 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 638 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 639 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 650 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_fetch)
NOTE: Running task 653 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_fetch)
NOTE: Running task 654 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_fetch)
NOTE: Running task 657 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_fetch)
NOTE: Running task 673 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 674 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 687 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_write_config)
NOTE: Running task 688 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_fetch)
NOTE: Running task 689 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: Running task 690 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 691 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: Running task 692 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_fetch)
NOTE: Running task 693 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 694 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_fetch)
NOTE: Running task 696 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe expat-2.4.7-r0: task do_fetch: Started
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe curl-7.82.0-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Started
NOTE: Running task 734 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: recipe curl-7.82.0-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: Running task 735 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 736 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Started
NOTE: Running task 737 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 738 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_unpack)
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 739 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_unpack)
NOTE: Running task 740 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: Running task 741 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: Running task 742 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_unpack)
NOTE: Running task 743 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 744 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_unpack)
NOTE: Running task 745 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: Running task 746 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_fetch: Started
NOTE: Running task 747 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running setscene task 248 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 250 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_packagedata_setscene)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe curl-7.82.0-r0: task do_unpack: Started
NOTE: recipe elfutils-0.186-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Started
NOTE: Running task 752 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe gnutls-3.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Started
NOTE: Running task 753 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_unpack)
NOTE: recipe expat-2.4.7-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 254 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 256 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 258 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 758 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.44-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: Running task 763 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 764 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: Running task 765 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe libgpg-error-1.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_unpack: Started
NOTE: recipe expat-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 770 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_patch)
NOTE: Running task 771 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 772 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_patch)
NOTE: Running task 773 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_patch)
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: Running task 778 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 271 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe expat-2.4.7-r0: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: Running setscene task 275 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_patch: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 284 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 783 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: Running task 797 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 805 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 806 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 807 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_patch)
NOTE: Running task 813 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_generate_toolchain_file)
NOTE: Running task 814 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 818 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 819 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: Running task 820 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 821 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 822 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: Running task 823 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: Running task 824 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: Running task 825 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 826 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_generate_toolchain_file)
NOTE: Running task 827 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: Running task 828 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic)
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 297 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 298 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 300 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 829 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 830 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_unpack: Started
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.82.0-r0: task do_patch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 831 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: Running task 832 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-2.37.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 833 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: Running task 834 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_fetch)
NOTE: recipe musl-obstack-1.1-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 835 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic unihash changed to 2b94707fe55063cf3c209746ada5d65395753725632fe123369bc2b21328a491
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_patch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 856 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_patch)
NOTE: Running task 857 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 858 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Started
NOTE: recipe util-linux-2.37.4-r0: task do_fetch: Succeeded
NOTE: Running task 859 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_unpack)
NOTE: recipe python3-3.10.4-r0: task do_package_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Succeeded
NOTE: Running task 860 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-2.37.4-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 315 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 865 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 866 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.37.4-r0: task do_unpack: Succeeded
NOTE: Running task 875 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_patch)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 876 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.186-r0: task do_patch: Succeeded
NOTE: Running task 877 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-2.37.4-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_patch: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 324 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 333 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 349 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 353 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: Running task 879 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_fetch)
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 354 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 361 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_fetch: Started
NOTE: recipe python3-3.10.4-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 920 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_unpack)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 373 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 377 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 379 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 382 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 393 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 403 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_unpack: Succeeded
NOTE: Running task 961 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_patch)
NOTE: recipe python3-3.10.4-r0: task do_patch: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 406 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_patch: Succeeded
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1138 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1151 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1152 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1170 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1182 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1183 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1191 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1202 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1213 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1222 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1252 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1253 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1311 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.37.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.82.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1325 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: Running task 1326 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1327 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1328 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: Running task 1329 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1330 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe util-linux-2.37.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: Running task 1331 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_configure)
NOTE: Running task 1332 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure)
NOTE: Running task 1333 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_configure)
NOTE: Running task 1334 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_configure)
NOTE: Running task 1335 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: Running task 1336 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1337 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: Running task 1338 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1339 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe expat-2.4.7-r0: task do_configure: Started
NOTE: recipe file-5.41-r0: task do_configure: Started
NOTE: recipe curl-7.82.0-r0: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe util-linux-2.37.4-r0: task do_configure: Started
NOTE: recipe python3-3.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_configure: Started
NOTE: Running task 1340 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1341 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe python3-3.10.4-r0: task do_configure: Started
NOTE: recipe expat-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1342 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure_ptest_base)
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1343 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile)
NOTE: recipe expat-2.4.7-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1344 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1345 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1346 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1347 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1348 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1349 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe musl-obstack-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1350 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe musl-obstack-1.1-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1351 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe expat-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1352 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile_ptest_base)
NOTE: recipe musl-obstack-1.1-r0: task do_install: Started
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1353 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: Running task 1354 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe musl-obstack-1.1-r0: task do_install: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_install: Started
NOTE: Running task 1355 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot)
NOTE: Running task 1356 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package: Started
NOTE: recipe expat-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1357 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install_ptest_base)
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1358 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1359 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_package)
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1360 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.7-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: Running task 1361 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot)
NOTE: Running task 1362 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package: Succeeded
NOTE: Running task 1363 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: Running task 1364 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 1365 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1366 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1367 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe expat-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 1368 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata)
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: Running task 1369 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata)
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Failed
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Succeeded
NOTE: recipe file-5.41-r0: task do_configure: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_configure: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_configure: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1369 tasks of which 1229 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/expat/2.4.7-r0/temp/log.do_packagedata.3440659
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata) failed with exit code '1'

--===============6745508694710311948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1640 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6c9ee467b8c856489f1eec7975351634a26dcf34"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 162 Local 25 Mirrors 0 Missed 137 Current 359 (15% match, 73% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 399 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.02.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_populate_sysroot_setscene)
NOTE: recipe tzdata-2022a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2022.02.11-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.25-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-native-1.1.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-native-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 760 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.46.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 803 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_fetch)
NOTE: Running task 806 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: Running task 852 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot)
NOTE: recipe autoconf-archive-2022.02.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.25-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_6.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 871 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 878 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_fetch)
NOTE: Running task 881 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_fetch)
NOTE: Running task 882 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_fetch)
NOTE: Running task 883 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 905 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_write_config)
NOTE: Running task 913 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 918 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_write_config)
NOTE: Running task 922 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_write_config)
NOTE: Running task 928 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 929 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 930 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_fetch)
NOTE: Running task 931 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: Running task 934 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 935 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_fetch)
NOTE: Running task 936 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_fetch)
NOTE: Running task 985 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 993 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_fetch)
NOTE: Running task 996 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_fetch)
NOTE: Running task 997 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: Running task 998 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_fetch)
NOTE: Running task 1001 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1002 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_fetch)
NOTE: Running task 1003 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_fetch)
NOTE: Running task 1004 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: Running task 1005 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_fetch)
NOTE: Running task 1006 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1007 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_fetch)
NOTE: Running task 1008 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1009 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_fetch)
NOTE: Running task 1087 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_write_config)
NOTE: Running task 1092 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_write_config)
NOTE: Running task 1105 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_warn_musl)
NOTE: Running task 1106 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_write_config)
NOTE: Running task 1108 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 1113 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_fetch)
NOTE: Running task 1131 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe tzdata-2022a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_fetch: Started
NOTE: recipe expat-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-native-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: Running setscene task 512 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: recipe wayland-native-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Started
NOTE: Running task 1192 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_unpack)
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Succeeded
NOTE: recipe qemu-native-6.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Started
NOTE: Running task 1193 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: Running task 1194 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1195 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 513 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot_setscene)
NOTE: Running task 1196 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: Running task 1198 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_unpack)
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Succeeded
NOTE: Running task 1211 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_unpack)
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.82.0-r0: task do_fetch: Started
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Started
NOTE: Running task 1212 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 1213 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Succeeded
NOTE: Running task 1214 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: Running task 1215 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe libxcb-1.14-r0: task do_fetch: Started
NOTE: recipe curl-7.82.0-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: Running task 1216 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_unpack)
NOTE: Running task 1217 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: Running task 1218 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 1219 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_unpack)
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_fetch: Succeeded
NOTE: Running task 1220 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1221 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_unpack)
NOTE: Running task 1222 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_unpack)
NOTE: recipe kmod-29-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: Running task 1223 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: Running task 1224 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Started
NOTE: Running task 1225 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: Running task 1226 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_unpack)
NOTE: Running task 1227 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe elfutils-0.186-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 1228 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe kmod-29-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: Running task 1229 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_unpack)
NOTE: Running task 1230 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Started
NOTE: Running task 1231 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_unpack)
NOTE: Running task 1232 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: Running task 1233 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1234 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_unpack)
NOTE: Running task 1235 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_unpack)
NOTE: recipe systemd-1_250.4-r0: task do_write_config: Started
NOTE: Running task 1236 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_unpack)
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1237 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: Running task 1238 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_unpack)
NOTE: Running task 1239 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: Running task 1240 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1241 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_unpack)
NOTE: Running task 1242 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1243 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Started
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Started
NOTE: Running task 1244 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_250.4-r0: task do_fetch: Succeeded
NOTE: Running task 1245 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1246 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_unpack)
NOTE: recipe expat-2.4.7-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_250.4-r0: task do_warn_musl: Succeeded
NOTE: Running task 1247 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_unpack)
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-native-2.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-native-2.9.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_write_config: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Started
NOTE: Running task 1248 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.46.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: Running task 1249 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Started
NOTE: recipe curl-7.82.0-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_unpack: Started
NOTE: Running task 1254 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: Running task 1255 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1256 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Started
NOTE: Running task 1257 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Succeeded
NOTE: Running task 1258 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_patch)
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: Running task 1259 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1260 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_patch)
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Started
NOTE: Running task 1261 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-markupsafe-native-2.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_unpack: Started
NOTE: Running task 1262 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.186-r0: task do_unpack: Started
NOTE: Running task 1264 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_patch)
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-native-2.9.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1268 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: Running task 1293 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot)
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Succeeded
NOTE: Running task 1299 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: Running task 1304 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: Running task 1305 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: Running task 1307 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 1308 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_unpack: Started
NOTE: recipe wayland-1.20.0-r0: task do_patch: Started
NOTE: recipe expat-2.4.7-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: Running task 1309 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_patch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: Running task 1327 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Started
NOTE: Running task 1328 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Succeeded
NOTE: Running task 1329 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_patch)
NOTE: Running task 1330 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_patch)
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1331 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_patch)
NOTE: recipe kmod-29-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 1332 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 1333 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1334 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: Running task 1335 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_generate_toolchain_file)
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Started
NOTE: Running task 1336 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: Running task 1337 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1338 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.82.0-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1339 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Started
NOTE: Running task 1340 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Started
NOTE: Running task 1341 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_patch)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1342 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1343 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1344 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 1345 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.14-r0: task do_patch: Succeeded
NOTE: Running task 1346 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Started
NOTE: recipe kmod-29-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Started
NOTE: Running task 1347 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 1348 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1349 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.82.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: Running task 1350 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Succeeded
NOTE: Running task 1351 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1352 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Succeeded
NOTE: Running task 1353 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1354 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1355 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.82.0-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1356 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_patch: Started
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1357 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: Running task 1358 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.82.0-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: Running task 1359 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1360 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1361 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1362 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 1363 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_patch)
NOTE: Running task 1364 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_patch)
NOTE: Running task 1365 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1366 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_generate_toolchain_file)
NOTE: Running task 1367 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic)
NOTE: Running task 1368 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe qemu-native-6.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 514 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.0-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1373 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1374 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: Running task 1375 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure)
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1376 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1377 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Started
NOTE: Running task 1378 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_configure: Started
NOTE: Running task 1379 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1380 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe kmod-29-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1381 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-native-1_2.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1382 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_configure)
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1383 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_configure)
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1384 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: Running task 1385 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_configure)
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic unihash changed to 2b94707fe55063cf3c209746ada5d65395753725632fe123369bc2b21328a491
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1386 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1387 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1388 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe file-5.41-r0: task do_configure: Started
NOTE: recipe curl-7.82.0-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe systemd-1_250.4-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1389 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_patch)
NOTE: Running setscene task 515 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 516 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.61.3.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1395 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_configure)
NOTE: Running task 1396 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe elfutils-0.186-r0: task do_unpack: Succeeded
NOTE: Running task 1397 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_patch)
NOTE: recipe meson-native-0.61.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe systemd-1_250.4-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Succeeded
NOTE: Running task 1398 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_deploy_source_date_epoch)
NOTE: recipe meson-native-0.61.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 517 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-native-59.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-native-59.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.37.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-wheel-native-0.37.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-wheel-native-0.37.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-installer_0.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1411 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_250.4-r0: task do_patch: Succeeded
NOTE: Running task 1412 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-installer-native-0.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1413 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-native-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-installer-native-0.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 521 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-flit-core-native-3.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Succeeded
NOTE: Running task 1551 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1552 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-flit-core-native-3.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1592 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1620 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1621 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure_ptest_base)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1622 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1623 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1624 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe expat-2.4.7-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: Running task 1625 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1626 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1627 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_configure)
NOTE: Running task 1628 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_compile)
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: Running task 1629 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_configure)
NOTE: Running task 1630 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Started
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: Running task 1631 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: Running task 1632 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: Running task 1633 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_install)
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: Running task 1634 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: Running task 1635 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot)
NOTE: Running task 1636 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1637 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: Running task 1638 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: Running task 1639 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1640 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1641 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Succeeded
NOTE: Running task 1642 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1643 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1644 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1645 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot)
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Started
NOTE: Running task 1646 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Succeeded
NOTE: Running task 1647 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_install)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1648 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1649 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_configure)
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_install: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: Running task 1650 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot)
NOTE: Running task 1651 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1652 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 1653 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_package: Started
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Started
NOTE: Running task 1654 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1655 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1656 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 1657 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1658 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_configure)
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1659 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_configure)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Started
NOTE: recipe expat-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1660 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile_ptest_base)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Started
NOTE: Running task 1661 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1662 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe expat-2.4.7-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 1663 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_install)
NOTE: recipe xorgproto-2021.5-r0: task do_package: Succeeded
NOTE: Running task 1664 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata)
NOTE: recipe expat-2.4.7-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Started
NOTE: Running task 1665 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install_ptest_base)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Started
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1666 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1667 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_package)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.7-r0: task do_package: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 1668 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot)
NOTE: Running task 1669 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 1670 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata)
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Failed
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: recipe file-5.41-r0: task do_configure: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1670 tasks of which 1446 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/expat/2.4.7-r0/temp/log.do_packagedata.3197867
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata) failed with exit code '1'

--===============6745508694710311948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 69 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6c9ee467b8c856489f1eec7975351634a26dcf34"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 148 Local 11 Mirrors 0 Missed 137 Current 373 (7% match, 73% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 413 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.02.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2022a-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2022.02.11-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.25-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.25-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe autoconf-archive-2022.02.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2022a-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 816 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: Running task 875 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_fetch)
NOTE: Running task 886 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: Running task 956 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot)
NOTE: Running task 992 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 1005 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_fetch)
NOTE: Running task 1009 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_fetch)
NOTE: Running task 1010 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_fetch)
NOTE: Running task 1011 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 1041 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_write_config)
NOTE: Running task 1057 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot)
NOTE: Running task 1058 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 1063 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_write_config)
NOTE: Running task 1067 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_write_config)
NOTE: Running task 1073 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 1074 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_fetch)
NOTE: Running task 1075 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: Running task 1076 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 1079 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 1080 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_fetch)
NOTE: Running task 1081 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_fetch)
NOTE: recipe expat-2.4.7-r0: task do_fetch: Started
NOTE: Running task 1130 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 1141 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_fetch)
NOTE: Running task 1144 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: Running task 1145 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_fetch)
NOTE: Running task 1146 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_fetch)
NOTE: Running task 1151 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1152 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_fetch)
NOTE: Running task 1153 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_fetch)
NOTE: Running task 1154 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: Running task 1155 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_fetch)
NOTE: Running task 1156 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1157 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1158 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_fetch)
NOTE: Running task 1159 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_fetch)
NOTE: recipe expat-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 1266 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_write_config)
NOTE: Running task 1276 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_write_config)
NOTE: Running task 1306 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_warn_musl)
NOTE: Running task 1307 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_write_config)
NOTE: Running task 1337 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 1352 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_fetch)
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Started
NOTE: Running task 1353 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_unpack)
NOTE: Running task 1354 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Started
NOTE: Running task 1413 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 1460 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_unpack)
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Started
NOTE: Running task 1461 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: Running task 1462 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot: Started
NOTE: Running task 1494 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: Running task 1495 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_unpack)
NOTE: Running task 1496 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_unpack)
NOTE: Running task 1497 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 1498 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Started
NOTE: Running task 1499 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Started
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1500 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_unpack)
NOTE: Running task 1501 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-29-r0: task do_fetch: Started
NOTE: recipe libxcb-1.14-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: Running task 1502 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: Running task 1503 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 1504 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_unpack)
NOTE: Running task 1505 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_unpack)
NOTE: Running task 1506 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Started
NOTE: recipe curl-7.82.0-r0: task do_fetch: Started
NOTE: Running task 1507 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Started
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: Running task 1508 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_unpack)
NOTE: Running task 1509 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-29-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe curl-7.82.0-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 1510 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Started
NOTE: Running task 1511 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: Running task 1512 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1513 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_unpack)
NOTE: Running task 1514 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_unpack)
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_fetch: Started
NOTE: Running task 1515 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Started
NOTE: Running task 1516 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: Running task 1517 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_unpack)
NOTE: Running task 1518 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_unpack)
NOTE: Running task 1519 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_unpack)
NOTE: Running task 1520 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: Running task 1521 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_unpack)
NOTE: Running task 1522 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: Running task 1523 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_fetch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_fetch: Started
NOTE: recipe systemd-1_250.4-r0: task do_write_config: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1524 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: recipe expat-2.4.7-r0: task do_unpack: Started
NOTE: Running task 1525 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_unpack)
NOTE: Running task 1526 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1527 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1528 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Started
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Started
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1529 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_unpack)
NOTE: Running task 1530 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_250.4-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: Running task 1531 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Started
NOTE: Running task 1532 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1533 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_250.4-r0: task do_warn_musl: Succeeded
NOTE: Running task 1534 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: Running task 1535 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_unpack)
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: Running task 1536 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_unpack)
NOTE: recipe systemd-1_250.4-r0: task do_write_config: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: Running task 1537 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Started
NOTE: recipe curl-7.82.0-r0: task do_unpack: Started
NOTE: recipe curl-7.82.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: Running task 1538 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: Running task 1539 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Started
NOTE: recipe expat-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Started
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1540 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_patch)
NOTE: recipe kmod-29-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1541 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_patch)
NOTE: Running task 1542 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_patch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1543 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1544 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1545 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe elfutils-0.186-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Started
NOTE: Running task 1546 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_patch)
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1547 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: Running task 1548 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Started
NOTE: Running task 1549 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1550 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: recipe wayland-1.20.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Started
NOTE: Running task 1551 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1552 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: Running task 1554 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_patch)
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Started
NOTE: Running task 1555 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_patch)
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: Running task 1556 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_patch)
NOTE: recipe libxcb-1.14-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 1557 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: recipe kmod-29-r0: task do_unpack: Succeeded
NOTE: Running task 1558 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1559 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_patch)
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 1560 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1561 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1562 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_generate_toolchain_file)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Started
NOTE: Running task 1563 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1564 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1565 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: Running task 1566 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.82.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_patch: Succeeded
NOTE: Running task 1567 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1568 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.82.0-r0: task do_unpack: Succeeded
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1570 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1571 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_patch)
NOTE: recipe wayland-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1572 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Succeeded
NOTE: recipe kmod-29-r0: task do_patch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1573 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1574 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1575 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 1576 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1577 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_patch)
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1578 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1579 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1580 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: Running task 1581 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1582 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1583 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1584 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.0-r0: task do_patch: Started
NOTE: Running task 1585 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1586 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1587 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_patch)
NOTE: Running task 1588 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.82.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1589 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_patch)
NOTE: Running task 1590 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1591 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1592 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_generate_toolchain_file)
NOTE: Running task 1593 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.0-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1594 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1595 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1596 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Started
NOTE: Running task 1597 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure)
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1598 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1599 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1600 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe kmod-29-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Started
NOTE: Running task 1601 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1602 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1603 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1604 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_configure)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.7-r0: task do_configure: Started
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: Running task 1605 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1606 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1607 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_configure)
NOTE: Running task 1608 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Started
NOTE: recipe file-5.41-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic unihash changed to 2b94707fe55063cf3c209746ada5d65395753725632fe123369bc2b21328a491
NOTE: Running task 1609 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_configure)
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: Running task 1610 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Started
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe systemd-1_250.4-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1611 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_patch)
NOTE: recipe curl-7.82.0-r0: task do_configure: Started
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 1612 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1613 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe systemd-1_250.4-r0: task do_patch: Started
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe elfutils-0.186-r0: task do_unpack: Succeeded
NOTE: Running task 1614 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_patch)
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Succeeded
NOTE: Running task 1615 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.186-r0: task do_patch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_patch: Succeeded
NOTE: Running task 1616 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1617 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1618 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Succeeded
NOTE: Running task 1619 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1620 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_compile)
NOTE: Running task 1621 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Started
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1622 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_configure: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Succeeded
NOTE: Running task 1623 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1624 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure_ptest_base)
NOTE: Running task 1625 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: Running task 1626 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_compile)
NOTE: Running task 1627 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1628 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: recipe xorgproto-2021.5-r0: task do_install: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: Running task 1629 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile)
NOTE: Running task 1630 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Succeeded
NOTE: Running task 1631 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1632 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: Running task 1633 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe expat-2.4.7-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: Running task 1634 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot)
NOTE: Running task 1635 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1636 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_configure)
NOTE: Running task 1637 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: Running task 1638 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: recipe xorgproto-2021.5-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1639 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot)
NOTE: Running task 1640 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_package)
NOTE: Running task 1641 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1642 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: Running task 1643 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot)
NOTE: Running task 1644 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: Running task 1645 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe xorgproto-2021.5-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1646 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1647 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1648 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1649 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: Running task 1650 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: Running task 1651 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1652 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1653 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_configure)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1654 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1655 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_configure)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Started
NOTE: Running task 1656 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 1657 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_package: Succeeded
NOTE: Running task 1658 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 1659 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1660 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Started
NOTE: Running task 1661 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 1662 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_install)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Started
NOTE: recipe expat-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1663 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile_ptest_base)
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1664 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 1665 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot)
NOTE: Running task 1666 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package)
NOTE: recipe expat-2.4.7-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Started
NOTE: recipe expat-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1667 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install_ptest_base)
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1668 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1669 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_package)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.7-r0: task do_package: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 1670 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1671 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe expat-2.4.7-r0: task do_package: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1672 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata)
NOTE: Running task 1673 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1674 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Failed
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: recipe file-5.41-r0: task do_configure: Succeeded
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1674 tasks of which 1446 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/expat/2.4.7-r0/temp/log.do_packagedata.3385708
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata) failed with exit code '1'

--===============6745508694710311948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.0.19.0", added "/usr/lib/.debug/libcreaterepo_c.so.0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1143720 to 1148796 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGSIZE changed from 139947 to 138270 (-1%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1214231 to 1219452 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.19.0", added "/usr/lib/libcreaterepo_c.so.0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 525633 to 530311 (+1%)
packages/core2-32-poky-linux/createrepo-c: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.19.0 to libcreaterepo_c.so.0.20.0
  /usr/lib/libcreaterepo_c.so.0.19.0 moved to /usr/lib/libcreaterepo_c.so.0.20.0

--===============6745508694710311948==--

