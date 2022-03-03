Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B046C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:27 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.13954.1646329345969329691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ql9CwZd9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 0101017f50e032d6-990b67d7-a8e4-45f6-bd19-f11d617c541b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z6XDg2A61vuRk+hWG43l5syxx7pLg5OM+OUHanKvsvE=;
	b=ql9CwZd9VSZy9bP9/5qn/oTgXKPIZ7AoZJdiUm2DXUSmh4sNnC8iztQnCwdyEafr
	WK4uiSaS2RY51nHOMi5hVRolTZr3kAvn/sJJhpZ/HiVgBwIN/2XVaSe3ZWOpQXlamK2
	MQYG46agTt1UWyA1F4UeKRDwje6cWZHzRtDuBgeQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z6XDg2A61vuRk+hWG43l5syxx7pLg5OM+OUHanKvsvE=;
	b=XhIe7JZl4/i65VzevyQSABauOHBcOoofu6LOoAu6dolfpjH+Uj85KrqKtVQcRzQW
	A5M+C7ylCq5tc6fY/ayd/cTMdZOmDlrE+jv0I4bVsTZ6uTdyCB33esP67Ix+5re680U
	x0fXitCpn+8IG8NOkFdbx+cQiKK0+LwMc26OkdAs=
Content-Type: multipart/mixed; boundary="===============3656690433040648831=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 206 SUCCEEDED
Message-ID: 
 <0101017f50e032d6-990b67d7-a8e4-45f6-bd19-f11d617c541b-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:25 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162698

--===============3656690433040648831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *206* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-204-206.patch
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
--===============3656690433040648831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1522 targets, 50 skipped, 0 masked, 0 errors.
Removing 115 recipes from the core2-32 sysroot...done.
Removing 121 recipes from the qemux86 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============3656690433040648831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 62 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-c36df9a839db2d8419b51dacd9deb98da8956de1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c36df9a839db2d8419b51dacd9deb98da8956de1"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 92 Local 2 Mirrors 0 Missed 90 Current 629 (2% match, 87% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1254 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1511 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_fetch)
NOTE: Running task 1618 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 1656 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_fetch)
NOTE: Running task 1657 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1660 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_fetch)
NOTE: Running task 1821 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: recipe curl-7.81.0-r0: task do_fetch: Started
NOTE: recipe curl-7.81.0-r0: task do_fetch: Succeeded
NOTE: Running task 1959 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_unpack)
NOTE: Running task 1960 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1982 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1985 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2015 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_fetch)
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: recipe elfutils-0.186-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: Running task 2050 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Started
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 2052 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe diffoscope-206-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-206-r0: task do_fetch: Succeeded
NOTE: Running task 2053 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_unpack)
NOTE: Running task 2054 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 2055 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_unpack)
NOTE: Running task 2056 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.81.0-r0: task do_unpack: Succeeded
NOTE: Running task 2057 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_patch)
NOTE: Running task 2058 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.81.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2059 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2060 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2061 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 2062 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2064 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_unpack)
NOTE: Running task 2065 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 2066 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2067 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2068 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2069 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_fetch)
NOTE: Running task 2070 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2091 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2107 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: Running task 2112 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.186-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2117 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata)
NOTE: recipe curl-7.81.0-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2121 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe diffoscope-206-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Started
NOTE: recipe vim-8.2.4424-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe curl-7.81.0-r0: task do_patch: Succeeded
NOTE: Running task 2211 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: Running task 2227 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-206-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2235 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2236 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4424-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: Running task 2237 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 2238 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 2239 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 2240 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2241 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_unpack)
NOTE: Running task 2242 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_patch)
NOTE: Running task 2243 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-206-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: Running task 2244 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_patch)
NOTE: Running task 2245 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 2246 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Started
NOTE: Running task 2247 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: Running task 2248 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 2249 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe curl-7.81.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Started
NOTE: Running task 2250 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-206-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: Running task 2251 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_patch)
NOTE: recipe vim-8.2.4424-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2252 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2253 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2254 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2255 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2256 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2257 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: Running task 2258 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 2259 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2260 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe curl-7.81.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2261 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.81.0-r0: task do_configure: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 2262 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2263 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-206-r0: task do_patch: Succeeded
NOTE: Running task 2264 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_configure)
NOTE: Running task 2265 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: Running task 2266 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_deploy_source_date_epoch)
NOTE: Running task 2267 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_populate_lic)
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-206-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 2268 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_configure)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: Running task 2269 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 2270 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe diffoscope-206-r0: task do_populate_lic: Started
NOTE: recipe diffoscope-206-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Succeeded
NOTE: Running task 2305 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_install)
NOTE: Running task 2316 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: Running task 2320 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe file-5.41-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Succeeded
NOTE: Running task 2321 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: Running task 2322 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2323 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2324 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2325 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-206-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_populate_lic unihash changed to 009ff16b77ac2d445e312fca6db965e05c7c2b9fc5b44d3539acf143be243b5d
NOTE: recipe diffoscope-206-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_compile: Started
NOTE: Running task 2326 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_install: Started
NOTE: recipe elfutils-0.186-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2327 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2.4424-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2328 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: Running task 2329 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: Running task 2330 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe diffoscope-206-r0: task do_configure: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-8.2.4424-r0: task do_patch: Started
NOTE: Running task 2331 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe diffoscope-206-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2332 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_compile)
NOTE: Running task 2333 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2334 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_configure)
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: Running task 2335 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe diffoscope-206-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Succeeded
NOTE: Running task 2336 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2337 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Started
NOTE: Running task 2338 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9c37505a5f87be3cd51299bf70926728ba433007beef446ed9c9eb0a9ccf7f9c
NOTE: recipe vim-8.2.4424-r0: task do_patch: Succeeded
NOTE: Running task 2353 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-3.4.0-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_populate_sysroot)
NOTE: Running task 2355 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_package)
NOTE: recipe diffoscope-206-r0: task do_compile: Succeeded
NOTE: recipe vim-8.2.4424-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2356 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_install)
NOTE: recipe harfbuzz-3.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 2357 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-3.4.0-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2358 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe diffoscope-206-r0: task do_install: Started
NOTE: recipe vim-8.2.4424-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2359 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Succeeded
NOTE: Running task 2360 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_install)
NOTE: recipe elfutils-0.186-r0: task do_patch: Succeeded
NOTE: Running task 2361 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Started
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2362 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2363 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe pango-1.50.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: Running task 2364 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2365 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: Running task 2366 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2367 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: Running task 2368 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 2369 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2370 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2371 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2372 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2373 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2374 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_configure: Started
NOTE: Running task 2375 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Succeeded
NOTE: Running task 2376 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Succeeded
NOTE: Running task 2377 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe diffoscope-206-r0: task do_install: Succeeded
NOTE: Running task 2378 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_package)
NOTE: Running task 2379 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_populate_sysroot)
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Started
NOTE: recipe diffoscope-206-r0: task do_package: Started
NOTE: recipe diffoscope-206-r0: task do_populate_sysroot: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Succeeded
NOTE: Running task 2380 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Started
NOTE: recipe diffoscope-206-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_compile: Succeeded
NOTE: Running task 2381 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_install)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2382 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_package: Succeeded
NOTE: Running task 2385 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_install: Succeeded
NOTE: Running task 2386 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_populate_sysroot)
NOTE: Running task 2387 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_package)
NOTE: recipe harfbuzz-3.4.0-r0: task do_packagedata: Started
NOTE: recipe diffoscope-206-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2388 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_package: Started
NOTE: Running task 2389 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe diffoscope-206-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_packagedata: Failed
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: recipe diffoscope-206-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_package: Succeeded
NOTE: recipe file-5.41-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_configure: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2389 tasks of which 2257 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_packagedata
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/harfbuzz/3.4.0-r0/temp/log.do_packagedata.3588251
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_packagedata) failed with exit code '1'

--===============3656690433040648831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 52 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-c36df9a839db2d8419b51dacd9deb98da8956de1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c36df9a839db2d8419b51dacd9deb98da8956de1"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 2 Mirrors 0 Missed 86 Current 633 (2% match, 88% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1264 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1517 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_fetch)
NOTE: Running task 1622 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 1660 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_fetch)
NOTE: Running task 1661 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1664 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_fetch)
NOTE: Running task 1823 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: recipe curl-7.81.0-r0: task do_fetch: Started
NOTE: recipe curl-7.81.0-r0: task do_fetch: Succeeded
NOTE: Running task 1983 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1986 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2005 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_unpack)
NOTE: Running task 2006 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: Running task 2017 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_fetch)
NOTE: recipe elfutils-0.186-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: Running task 2055 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2056 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2057 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2058 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 2059 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_fetch)
NOTE: Running task 2060 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2109 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 2110 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 2111 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe elfutils-0.186-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 2112 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: Running task 2113 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_unpack)
NOTE: Running task 2114 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_unpack)
NOTE: Running task 2115 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2116 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe curl-7.81.0-r0: task do_unpack: Started
NOTE: Running task 2117 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2118 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.81.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-206-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-206-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Started
NOTE: recipe vim-8.2.4424-r0: task do_fetch: Started
NOTE: Running task 2163 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 2164 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_unpack)
NOTE: Running task 2165 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2166 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: Running task 2171 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: Running task 2202 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_unpack)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 2203 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe vim-8.2.4424-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2204 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Succeeded
NOTE: Running task 2238 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Started
NOTE: Running task 2239 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2240 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2241 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2242 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe elfutils-0.186-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: Running task 2243 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-206-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-206-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2244 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 2245 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-206-r0: task do_unpack: Succeeded
NOTE: Running task 2246 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_patch)
NOTE: Running task 2247 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: Running task 2248 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_patch)
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 2249 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: Running task 2250 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_patch)
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.81.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe vim-8.2.4424-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2251 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_patch)
NOTE: Running task 2252 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 2253 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.81.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe diffoscope-206-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2254 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: Running task 2255 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: Running task 2256 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Succeeded
NOTE: Running task 2257 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2258 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 2259 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2260 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.81.0-r0: task do_patch: Succeeded
NOTE: Running task 2261 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2262 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe diffoscope-206-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-206-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2263 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_deploy_source_date_epoch)
NOTE: Running task 2264 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2265 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2266 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Succeeded
NOTE: Running task 2267 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2268 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2269 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_configure)
NOTE: recipe diffoscope-206-r0: task do_populate_lic: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2270 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_configure)
NOTE: Running task 2271 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe diffoscope-206-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.81.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2272 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2273 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2274 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe libarchive-3.6.0-r0: task do_configure: Started
NOTE: recipe file-5.41-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe diffoscope-206-r0: task do_populate_lic: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_populate_lic unihash changed to 009ff16b77ac2d445e312fca6db965e05c7c2b9fc5b44d3539acf143be243b5d
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2275 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.186-r0: task do_unpack: Succeeded
NOTE: Running task 2276 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_patch)
NOTE: recipe diffoscope-206-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.81.0-r0: task do_configure: Started
NOTE: Running task 2277 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_configure)
NOTE: Running task 2278 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_configure)
NOTE: recipe vim-8.2.4424-r0: task do_unpack: Succeeded
NOTE: Running task 2279 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2280 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Started
NOTE: recipe diffoscope-206-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2281 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe vim-8.2.4424-r0: task do_patch: Started
NOTE: Running task 2282 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: Running task 2317 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_install)
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-206-r0: task do_configure: Succeeded
NOTE: Running task 2328 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: Running task 2332 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: Running task 2333 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Succeeded
NOTE: Running task 2334 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_compile)
NOTE: Running task 2335 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_install: Started
NOTE: Running task 2336 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_compile)
NOTE: Running task 2337 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Started
NOTE: recipe diffoscope-206-r0: task do_compile: Started
NOTE: Running task 2338 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe vim-8.2.4424-r0: task do_patch: Succeeded
NOTE: Running task 2339 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: Running task 2340 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe vim-8.2.4424-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 2341 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2.4424-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2342 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Succeeded
NOTE: Running task 2343 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_install)
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: recipe diffoscope-206-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Running task 2344 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7bcf69c26b41fb05121df304f97927e5d6a8057df365c3d4c386a4af93023e72
NOTE: Running task 2357 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2360 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_install: Succeeded
NOTE: Running task 2361 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_populate_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: Running task 2362 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_package)
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-206-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2363 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2364 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2365 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 2366 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2367 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: Running task 2368 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2369 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 2370 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2371 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2372 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2373 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Succeeded
NOTE: Running task 2374 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Started
NOTE: Running task 2375 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2376 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Succeeded
NOTE: Running task 2377 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe pango-1.50.4-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Succeeded
NOTE: Running task 2378 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe diffoscope-206-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_package)
NOTE: Running task 2380 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_populate_sysroot)
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Started
NOTE: recipe diffoscope-206-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-206-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_compile: Succeeded
NOTE: Running task 2381 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_install)
NOTE: recipe diffoscope-206-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_install: Started
NOTE: Running task 2382 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_populate_sysroot)
NOTE: Running task 2386 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_package: Started
NOTE: Running task 2387 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_packagedata)
NOTE: recipe harfbuzz-3.4.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-206-r0: task do_package: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Succeeded
NOTE: Running task 2389 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_packagedata)
NOTE: Running task 2390 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: Running task 2391 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe harfbuzz-3.4.0-r0: task do_packagedata: Failed
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-206-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-206-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_package: Succeeded
NOTE: recipe file-5.41-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_configure: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2391 tasks of which 2262 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_packagedata
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/harfbuzz/3.4.0-r0/temp/log.do_packagedata.3430209
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_packagedata) failed with exit code '1'

--===============3656690433040648831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 204 [default] to 206 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "204" to "206"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 204 [default] to 206 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "204" to "206"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 204 [default] to 206 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "204" to "206"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 204 [default] to 206 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "204" to "206"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 204 [default] to 206 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "204" to "206"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 204 [default] to 206 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "204" to "206"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 204 [default] to 206 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "204" to "206"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1043111 to 1043459 (+0%)
packages/core2-32-poky-linux/diffoscope: PKGV changed from 204 [default] to 206 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "204" to "206"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-204.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-206.tar.gz"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-204.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-206.dist-info

--===============3656690433040648831==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-204-206.patch"

From 2ee906eee71b48f7c34484752357c24ac4259873 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 17:41:48 +0000
Subject: [PATCH] diffoscope: upgrade 204 -> 206

---
 .../diffoscope/{diffoscope_204.bb => diffoscope_206.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_204.bb => diffoscope_206.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_204.bb b/meta/recipes-support/diffoscope/diffoscope_206.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_204.bb
rename to meta/recipes-support/diffoscope/diffoscope_206.bb
index 588894cb9a..7eaca74b33 100644
--- a/meta/recipes-support/diffoscope/diffoscope_204.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_206.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "cc99eb4cd9555947b11d6abb7ba83e71234f92ad1372e3b61e934115192ecb4e"
+SRC_URI[sha256sum] = "93731939ede57547a3275c3c81875ab4bd222f26364a7519cf6aafe1939cd603"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.27.0


--===============3656690433040648831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-204.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-206.dist-info

--===============3656690433040648831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 68 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-c36df9a839db2d8419b51dacd9deb98da8956de1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c36df9a839db2d8419b51dacd9deb98da8956de1"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 2 Mirrors 0 Missed 86 Current 633 (2% match, 88% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1264 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1517 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_fetch)
NOTE: Running task 1622 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 1660 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_fetch)
NOTE: Running task 1661 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1664 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_fetch)
NOTE: Running task 1823 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: recipe curl-7.81.0-r0: task do_fetch: Started
NOTE: recipe curl-7.81.0-r0: task do_fetch: Succeeded
NOTE: Running task 1974 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_unpack)
NOTE: Running task 1975 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1984 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1987 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe elfutils-0.186-r0: task do_fetch: Started
NOTE: Running task 2017 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_fetch)
NOTE: Running task 2055 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 2056 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2057 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2058 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_fetch)
NOTE: Running task 2059 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2060 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 2109 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe elfutils-0.186-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 2110 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 2111 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: Running task 2112 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: Running task 2113 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2114 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_unpack)
NOTE: Running task 2115 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.81.0-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running task 2116 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2117 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2118 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe curl-7.81.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-206-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 2162 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe diffoscope-206-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: Running task 2231 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2232 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_unpack)
NOTE: Running task 2233 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: recipe vim-8.2.4424-r0: task do_fetch: Started
NOTE: Running task 2234 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 2235 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Started
NOTE: Running task 2236 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2237 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_unpack)
NOTE: Running task 2238 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2239 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe vim-8.2.4424-r0: task do_fetch: Succeeded
NOTE: Running task 2240 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_unpack: Started
NOTE: Running task 2241 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: Running task 2242 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe diffoscope-206-r0: task do_unpack: Started
NOTE: Running task 2243 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 2244 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe diffoscope-206-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Started
NOTE: Running task 2245 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2246 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2247 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Succeeded
NOTE: Running task 2248 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe diffoscope-206-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 2249 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_patch)
NOTE: Running task 2250 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: Running task 2251 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_patch)
NOTE: recipe vim-8.2.4424-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 2252 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe curl-7.81.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe curl-7.81.0-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 2253 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_patch)
NOTE: recipe diffoscope-206-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: Running task 2254 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2255 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: Running task 2256 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe curl-7.81.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2257 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2258 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Started
NOTE: Running task 2259 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2260 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.81.0-r0: task do_patch: Succeeded
NOTE: Running task 2261 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.81.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 2262 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2263 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe diffoscope-206-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2264 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_configure)
NOTE: Running task 2265 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: Running task 2266 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2267 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2268 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: Running task 2269 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_deploy_source_date_epoch)
NOTE: Running task 2270 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2271 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_deploy_source_date_epoch)
NOTE: Running task 2272 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2273 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-206-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2274 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe file-5.41-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe diffoscope-206-r0: task do_populate_lic: Started
NOTE: recipe diffoscope-206-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2275 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe curl-7.81.0-r0: task do_configure: Started
NOTE: recipe diffoscope-206-r0: task do_populate_lic: Succeeded
NOTE: recipe vim-8.2.4424-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_populate_lic unihash changed to 009ff16b77ac2d445e312fca6db965e05c7c2b9fc5b44d3539acf143be243b5d
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 2276 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-206-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2277 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2278 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2279 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: Running task 2280 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: Running task 2281 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_configure)
NOTE: recipe vim-8.2.4424-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-206-r0: task do_configure: Started
NOTE: recipe elfutils-0.186-r0: task do_unpack: Succeeded
NOTE: Running task 2316 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Started
NOTE: Running task 2317 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_patch)
NOTE: Running task 2328 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Succeeded
NOTE: Running task 2332 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_compile)
NOTE: Running task 2333 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-206-r0: task do_configure: Succeeded
NOTE: Running task 2334 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_patch: Started
NOTE: Running task 2335 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_compile)
NOTE: Running task 2336 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_install: Started
NOTE: Running task 2337 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2338 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe diffoscope-206-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2339 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe vim-8.2.4424-r0: task do_patch: Succeeded
NOTE: Running task 2340 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Succeeded
NOTE: Running task 2341 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_install)
NOTE: recipe vim-8.2.4424-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2342 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe diffoscope-206-r0: task do_compile: Succeeded
NOTE: Running task 2343 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_install)
NOTE: recipe harfbuzz-3.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Started
NOTE: Running task 2344 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_populate_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe vim-8.2.4424-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-206-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to fbc8394c590b06edd0efb0d4abbb9e0d085e377cf516c1a2a3c0f90c7dbff7a9
NOTE: Running task 2357 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_package)
NOTE: recipe harfbuzz-3.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2360 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 2361 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-3.4.0-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Succeeded
NOTE: Running task 2362 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2363 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2364 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 2365 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2366 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2367 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2368 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 2369 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: Running task 2370 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Succeeded
NOTE: Running task 2371 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: Running task 2372 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package)
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Succeeded
NOTE: Running task 2373 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2374 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2375 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2376 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 2377 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_configure)
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: Running task 2378 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe pango-1.50.4-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Started
NOTE: recipe diffoscope-206-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_package)
NOTE: Running task 2380 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_populate_sysroot)
NOTE: recipe diffoscope-206-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-206-r0: task do_package: Started
NOTE: recipe diffoscope-206-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Succeeded
NOTE: Running task 2381 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2382 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_compile: Succeeded
NOTE: Running task 2383 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_install)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_package: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Succeeded
NOTE: Running task 2385 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_packagedata)
NOTE: Running task 2386 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_packagedata: Started
NOTE: recipe diffoscope-206-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_packagedata)
NOTE: recipe diffoscope-206-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2388 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-3.4.0-r0: task do_packagedata: Failed
NOTE: recipe at-spi2-core-2.42.0-r0: task do_install: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe diffoscope-206-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: recipe file-5.41-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_configure: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2388 tasks of which 2262 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_packagedata
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/harfbuzz/3.4.0-r0/temp/log.do_packagedata.3792328
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_packagedata) failed with exit code '1'

--===============3656690433040648831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1522 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (842 cached, 1 parsed). 1521 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-c36df9a839db2d8419b51dacd9deb98da8956de1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c36df9a839db2d8419b51dacd9deb98da8956de1"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 91 Local 2 Mirrors 0 Missed 89 Current 634 (2% match, 87% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1264 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1517 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_fetch)
NOTE: Running task 1622 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 1660 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_fetch)
NOTE: Running task 1661 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1664 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_fetch)
NOTE: recipe curl-7.81.0-r0: task do_fetch: Started
NOTE: Running task 1829 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: recipe curl-7.81.0-r0: task do_fetch: Succeeded
NOTE: Running task 1899 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_unpack)
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: Running task 1900 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Started
NOTE: recipe elfutils-0.186-r0: task do_fetch: Started
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 2000 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: Running task 2001 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_unpack)
NOTE: Running task 2002 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 2003 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2004 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.186-r0: task do_fetch: Succeeded
NOTE: Running task 2008 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 2010 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2040 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 2041 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_unpack)
NOTE: Running task 2079 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2080 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2081 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2082 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 2083 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_fetch)
NOTE: Running task 2084 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2123 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2124 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2125 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.81.0-r0: task do_unpack: Started
NOTE: Running task 2130 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata)
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2134 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe libarchive-3.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe diffoscope-206-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 2135 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-206-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 2136 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 2137 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: Running task 2138 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2139 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_unpack)
NOTE: Running task 2140 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2141 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe vim-8.2.4424-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: Running task 2142 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2143 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 2163 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_unpack)
NOTE: Running task 2164 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 2165 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Started
NOTE: recipe vim-8.2.4424-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 2166 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: Running task 2167 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: Running task 2168 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: Running task 2169 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 2170 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-206-r0: task do_unpack: Started
NOTE: recipe diffoscope-206-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2212 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Started
NOTE: Running task 2233 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: Running task 2261 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Started
NOTE: Running task 2266 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-206-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Succeeded
NOTE: Running task 2267 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2268 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_patch)
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe curl-7.81.0-r0: task do_unpack: Succeeded
NOTE: Running task 2269 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2270 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_patch)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: Running task 2271 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: recipe vim-8.2.4424-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2272 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-206-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Succeeded
NOTE: Running task 2273 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2274 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2275 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2276 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2277 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.81.0-r0: task do_patch: Succeeded
NOTE: Running task 2278 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 2279 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2280 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2281 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2282 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2283 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2284 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_configure)
NOTE: recipe diffoscope-206-r0: task do_patch: Succeeded
NOTE: Running task 2285 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_configure)
NOTE: recipe diffoscope-206-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2286 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2287 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_populate_lic)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2288 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2289 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: Running task 2290 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Succeeded
NOTE: Running task 2291 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_configure)
NOTE: recipe libarchive-3.6.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2292 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_configure: Started
NOTE: recipe diffoscope-206-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-206-r0: task do_populate_lic: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2293 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.81.0-r0: task do_configure: Started
NOTE: recipe diffoscope-206-r0: task do_populate_lic: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_populate_lic unihash changed to 009ff16b77ac2d445e312fca6db965e05c7c2b9fc5b44d3539acf143be243b5d
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 2294 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_patch)
NOTE: recipe diffoscope-206-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2295 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2296 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2297 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2298 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2299 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe vim-8.2.4424-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_patch: Started
NOTE: recipe diffoscope-206-r0: task do_configure: Started
NOTE: Running task 2334 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: Running task 2345 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: Running task 2349 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Started
NOTE: Running task 2350 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-206-r0: task do_configure: Succeeded
NOTE: Running task 2351 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: Running task 2352 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2353 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_install: Started
NOTE: Running task 2354 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2355 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_compile)
NOTE: recipe diffoscope-206-r0: task do_compile: Started
NOTE: Running task 2356 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe vim-8.2.4424-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2357 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 2358 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2.4424-r0: task do_patch: Succeeded
NOTE: Running task 2359 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.186-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2360 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe vim-8.2.4424-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ccf80ab85788ecb5226596dc501d7d6f4b7e676e1efda46a8a0376aa879a5819
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2375 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe diffoscope-206-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_install)
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2377 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_install)
NOTE: recipe vim-8.2.4424-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_install: Succeeded
NOTE: recipe diffoscope-206-r0: task do_install: Started
NOTE: Running task 2378 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_populate_sysroot)
NOTE: Running task 2379 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Started
NOTE: Running task 2380 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe harfbuzz-3.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2381 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe harfbuzz-3.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2382 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2383 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: Running task 2384 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2385 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe pango-1.50.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2386 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 2387 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2389 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2390 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2391 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Succeeded
NOTE: Running task 2392 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Succeeded
NOTE: Running task 2394 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Succeeded
NOTE: Running task 2395 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2396 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_configure)
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Started
NOTE: recipe pango-1.50.4-r0: task do_configure: Started
NOTE: recipe diffoscope-206-r0: task do_install: Succeeded
NOTE: Running task 2397 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_package)
NOTE: Running task 2398 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_populate_sysroot)
NOTE: recipe diffoscope-206-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-206-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_compile: Succeeded
NOTE: Running task 2399 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_install)
NOTE: recipe diffoscope-206-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Succeeded
NOTE: Running task 2400 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2401 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_install: Succeeded
NOTE: Running task 2402 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_populate_sysroot)
NOTE: Running task 2403 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_package)
NOTE: recipe harfbuzz-3.4.0-r0: task do_package: Succeeded
NOTE: Running task 2404 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_package: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2405 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Succeeded
NOTE: Running task 2406 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Started
NOTE: recipe diffoscope-206-r0: task do_package: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_packagedata: Failed
NOTE: Running task 2407 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_206.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-206-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-206-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: recipe file-5.41-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_configure: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2407 tasks of which 2277 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_packagedata
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:4.0.0-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: harfbuzz-3.4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/harfbuzz/3.4.0-r0/temp/log.do_packagedata.3357143
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_packagedata) failed with exit code '1'

--===============3656690433040648831==--

