Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B594CC35296
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.2220.1651434542883375201
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RtYUwUrS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010180812b539b-ba4c1b03-dfb2-4e7a-bb7d-351e4274ba5b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Eq52JRHLhHWamkMZ5nrqtdHkPm7jfhEgIwa7ZSUKRpI=;
	b=RtYUwUrSOQ+jq2lSqjanxDJJ39dE1d68QXJwXGNcOAuh/v4h63y0YGeK6VUegcgC
	15Fs+GYckLjVGIiCXSpl3hmFP+tYttLKhQNLDafVobJ0Z9B7s3dmve84BpRkexUiUai
	UXm5MoORwqcPvE2RakRP2NSJX6dqdxfgfB9N3Vsg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Eq52JRHLhHWamkMZ5nrqtdHkPm7jfhEgIwa7ZSUKRpI=;
	b=iEMdfQsWflli4+BkX4MJuKS+16jJSi82MZ1nlpsUQ4CvF/pHe50zygI8PcXBhqH8
	kCHjp+2QET6QRMMumY9fPjW/Tz24OWP0Aw/6R6MaXm3f3FbcDGzrVbo7UtVRl2ZJmwy
	f+F0uvrGOltkWx7tet/gSgRK27K11NXJMjzqDbLU=
Content-Type: multipart/mixed; boundary="===============2727113197685896079=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.12.0 SUCCEEDED
Message-ID: 
 <01010180812b539b-ba4c1b03-dfb2-4e7a-bb7d-351e4274ba5b-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165104

--===============2727113197685896079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.12.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.11.1-4.12.0.patch
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
--===============2727113197685896079==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.11.1-4.12.0.patch"

From c9eceecee82fad5c9312d6a7dc5996bb2f80e8c5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 09:06:29 +0000
Subject: [PATCH] dnf: upgrade 4.11.1 -> 4.12.0

---
 meta/recipes-devtools/dnf/{dnf_4.11.1.bb => dnf_4.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.11.1.bb => dnf_4.12.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.11.1.bb b/meta/recipes-devtools/dnf/dnf_4.12.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.11.1.bb
rename to meta/recipes-devtools/dnf/dnf_4.12.0.bb
index 00eed0ce96..d621e72d4e 100644
--- a/meta/recipes-devtools/dnf/dnf_4.11.1.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.12.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "fba1e2ec93f3d045a874567fd7ecafd606346509"
+SRCREV = "956b5c74bab2affde27f404e7aee98c10818b188"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.27.0


--===============2727113197685896079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 53 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-1cff4aa500258f520af6fc8cfa3c5cc6eef3a6dc"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1cff4aa500258f520af6fc8cfa3c5cc6eef3a6dc"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 115 Local 20 Mirrors 0 Missed 95 Current 490 (17% match, 84% complete)
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 538 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2022a-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2022a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_250.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_250.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1252 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1254 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1527 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 1553 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 1554 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_fetch)
NOTE: Running task 1558 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_fetch)
NOTE: Running task 1574 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1575 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_fetch)
NOTE: Running task 1576 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1596 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1597 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1598 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1599 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1607 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_fetch)
NOTE: Running task 1608 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1609 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1622 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_fetch)
NOTE: Running task 1623 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_fetch)
NOTE: Running task 1665 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_fetch)
NOTE: Running task 1675 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_fetch)
NOTE: Running task 1676 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: Running task 1677 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_fetch)
NOTE: Running task 1678 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Started
NOTE: Running task 1716 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_fetch)
NOTE: Running task 1738 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_fetch)
NOTE: Running task 1740 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe librepo-1.14.2-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe json-c-0.16-r0: task do_fetch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Started
NOTE: Running task 1786 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_unpack)
NOTE: Running task 1787 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 1823 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: recipe librepo-1.14.2-r0: task do_fetch: Succeeded
NOTE: Running task 1824 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1825 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_unpack)
NOTE: Running task 1826 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_250.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: Running task 1827 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_unpack)
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Started
NOTE: recipe libdnf-0.66.0-r0: task do_fetch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Started
NOTE: Running task 1828 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_unpack)
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Started
NOTE: Running task 1829 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: recipe dnf-4.12.0-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Started
NOTE: Running task 1830 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1831 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Succeeded
NOTE: recipe gnupg-2.3.4-r0: task do_fetch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 1832 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 1833 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_unpack)
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1834 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1835 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_unpack)
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1836 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1837 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnupg-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_fetch: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1838 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 1839 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: Running task 1840 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_unpack)
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Started
NOTE: Running task 1841 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_unpack)
NOTE: Running task 1842 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 1843 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: Running task 1844 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: Running task 1845 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_unpack)
NOTE: Running task 1846 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe json-c-0.16-r0: task do_unpack: Started
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.14.2-r0: task do_unpack: Started
NOTE: Running task 1847 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_unpack)
NOTE: Running task 1848 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_unpack)
NOTE: Running task 1849 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1850 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/systemd/1_250.4-r0/temp/log.do_packagedata_setscene.1510560
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe json-c-0.16-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 599 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_package_setscene)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Started
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1851 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_patch)
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1852 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: Running task 1853 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_unpack: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: Running task 1854 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_patch)
NOTE: recipe gnupg-2.3.4-r0: task do_unpack: Started
NOTE: Running task 1855 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_patch)
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.14.2-r0: task do_unpack: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_unpack: Started
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1856 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_patch)
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1857 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_patch)
NOTE: Running task 1858 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Succeeded
NOTE: Running task 1859 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1860 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_patch)
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1861 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1862 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1863 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: Running task 1864 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_patch)
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1865 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_patch)
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: Running task 1866 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: Running task 1867 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_patch)
NOTE: Running task 1868 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_patch: Started
NOTE: recipe dnf-4.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Started
NOTE: recipe librepo-1.14.2-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Started
NOTE: Running task 1869 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_patch)
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Started
NOTE: recipe libksba-1.6.0-r0: task do_patch: Started
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_patch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1870 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1871 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_patch)
NOTE: Running task 1872 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1873 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1874 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_patch: Started
NOTE: Running task 1875 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1876 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1877 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1878 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Succeeded
NOTE: Running task 1879 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1880 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_generate_toolchain_file)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Succeeded
NOTE: Running task 1881 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_deploy_source_date_epoch)
NOTE: Running task 1882 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1883 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1884 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_generate_toolchain_file)
NOTE: recipe librepo-1.14.2-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1885 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1886 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1887 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_generate_toolchain_file)
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1888 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1889 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe librepo-1.14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.14.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1890 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1891 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_configure)
NOTE: Running task 1892 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe librepo-1.14.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1893 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1894 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_configure)
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe libdnf-0.66.0-r0: task do_patch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1895 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_configure)
NOTE: recipe json-c-0.16-r0: task do_configure: Started
NOTE: Running task 1896 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1897 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_generate_toolchain_file)
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: Running task 1898 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librepo-1.14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1899 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Started
NOTE: recipe dnf-4.12.0-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_package_setscene: Started
NOTE: recipe libdnf-0.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1900 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libdnf-0.66.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1901 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_generate_toolchain_file)
NOTE: Running task 1902 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_populate_lic)
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1903 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: recipe libksba-1.6.0-r0: task do_configure: Started
NOTE: Running task 1904 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_configure)
NOTE: Running task 1905 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Started
NOTE: recipe libdnf-0.66.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.12.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe dnf-4.12.0-r0: task do_populate_lic: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe dnf-4.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Succeeded
NOTE: Running task 1906 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gnupg-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1907 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_populate_lic unihash changed to 2059057eb6a58b4046f22e7352cdfcd05a05501a85a91c6987d63f5240fe548e
NOTE: recipe dnf-4.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.3.4-r0: task do_patch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1908 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Succeeded
NOTE: Running task 1909 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1910 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Started
NOTE: recipe gnupg-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1911 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1912 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe gnupg-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1913 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Succeeded
NOTE: Running task 1915 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe libcomps-0.1.18-r0: task do_install: Started
NOTE: recipe systemd-1_250.4-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1926 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 1948 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 1949 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.18-r0: task do_install: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: Running task 1950 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package)
NOTE: Running task 1951 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1952 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1953 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1954 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libcomps-0.1.18-r0: task do_package: Started
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1955 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1956 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 22db8996b954ad500e98bde8eb5d8f3f9ee45325e3d6ebc87a67531882ff9085
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1970 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1971 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1972 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1973 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1974 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 1975 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Succeeded
NOTE: Running task 1976 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 221777e03b432750d81a3353ee12bea75da31230352399fa97384f965b4130c2
NOTE: Running task 1978 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_packagedata)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package: Succeeded
NOTE: Running task 1979 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_packagedata)
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 1980 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package_write_rpm)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_250.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Succeeded
NOTE: Running task 1983 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_install)
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Started
NOTE: recipe json-c-0.16-r0: task do_configure: Succeeded
NOTE: Running task 1984 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_compile)
NOTE: recipe json-c-0.16-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Succeeded
NOTE: Running task 1985 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package)
NOTE: Running task 1986 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1987 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_compile: Succeeded
NOTE: Running task 1988 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_install)
NOTE: recipe json-c-0.16-r0: task do_install: Started
NOTE: recipe json-c-0.16-r0: task do_install: Succeeded
NOTE: Running task 1989 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_populate_sysroot)
NOTE: Running task 1990 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_package)
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Succeeded
NOTE: Running task 1991 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Started
NOTE: Running task 1992 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1993 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_rpm)
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe json-c-0.16-r0: task do_package: Succeeded
NOTE: Running task 1994 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_packagedata)
NOTE: recipe json-c-0.16-r0: task do_packagedata: Started
NOTE: recipe json-c-0.16-r0: task do_packagedata: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Succeeded
NOTE: Running task 1995 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_compile)
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 1996 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 1997 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 1998 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 1999 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2000 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe libksba-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 2001 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2002 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Succeeded
NOTE: Running task 2003 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_install)
NOTE: recipe libksba-1.6.0-r0: task do_compile: Started
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: Running task 2004 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: recipe libmodulemd-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Started
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 2005 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_compile)
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Succeeded
NOTE: Running task 2006 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot)
NOTE: Running task 2007 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_package)
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2008 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe libmodulemd-2.14.0-r0: task do_configure: Started
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: Running task 2009 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2010 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2011 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2012 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 2013 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 2014 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: Running task 2015 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 2016 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 2017 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_populate_sysroot)
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Succeeded
NOTE: Running task 2018 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2019 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_packagedata)
NOTE: Running task 2020 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 2021 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe libksba-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2022 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_install)
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe libksba-1.6.0-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2023 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2024 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: Running task 2025 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2026 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 2027 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_package)
NOTE: Running task 2028 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_populate_sysroot)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2029 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libksba-1.6.0-r0: task do_package: Started
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2030 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_configure)
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: Running task 2031 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Started
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2032 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_configure)
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2033 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2034 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Started
NOTE: recipe gnupg-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_compile: Started
NOTE: recipe gnupg-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2035 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_configure)
NOTE: recipe gnupg-2.3.4-r0: task do_configure: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2036 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_configure)
NOTE: recipe libassuan-2.5.5-r0: task do_package: Succeeded
NOTE: Running task 2037 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Started
NOTE: Running task 2038 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: Running task 2039 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_write_rpm)
NOTE: recipe libksba-1.6.0-r0: task do_package: Succeeded
NOTE: Running task 2040 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_packagedata)
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Started
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2041 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2042 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.14.0-r0: task do_install: Started
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2043 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_compile)
NOTE: recipe libmodulemd-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2044 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: Running task 2045 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_package: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2046 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_install)
NOTE: recipe pinentry-1.2.0-r0: task do_install: Started
NOTE: recipe pinentry-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2047 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_package)
NOTE: recipe pinentry-1.2.0-r0: task do_package: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2048 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2049 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_packagedata)
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Succeeded
NOTE: Running task 2050 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_compile)
NOTE: recipe gpgme-1.17.1-r0: task do_compile: Started
NOTE: recipe gnupg-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2051 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_compile)
NOTE: recipe gnupg-2.3.4-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2052 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_compile)
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2053 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_install)
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Succeeded
NOTE: Running task 2054 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_populate_sysroot)
NOTE: Running task 2055 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package)
NOTE: recipe rpm-1_4.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2056 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnupg-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2057 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_install)
NOTE: recipe gnupg-2.3.4-r0: task do_install: Started
NOTE: recipe libsolv-0.7.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2058 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_configure)
NOTE: recipe libsolv-0.7.22-r0: task do_configure: Started
NOTE: recipe gnupg-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 2059 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_package)
NOTE: recipe gnupg-2.3.4-r0: task do_package: Started
NOTE: recipe libsolv-0.7.22-r0: task do_configure: Succeeded
NOTE: Running task 2060 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_compile)
NOTE: recipe libsolv-0.7.22-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Succeeded
NOTE: Running task 2061 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2062 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.22-r0: task do_compile: Succeeded
NOTE: Running task 2063 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_install)
NOTE: recipe libsolv-0.7.22-r0: task do_install: Started
NOTE: recipe gnupg-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 2064 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_packagedata)
NOTE: recipe gnupg-2.3.4-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.22-r0: task do_install: Succeeded
NOTE: Running task 2065 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_populate_sysroot)
NOTE: Running task 2066 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_package)
NOTE: recipe gnupg-2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_package: Started
NOTE: Running task 2067 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_package_write_rpm)
NOTE: recipe libsolv-0.7.22-r0: task do_populate_sysroot: Started
NOTE: recipe gnupg-2.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.22-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_package: Succeeded
NOTE: Running task 2068 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_packagedata)
NOTE: recipe libsolv-0.7.22-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.22-r0: task do_packagedata: Succeeded
NOTE: recipe gnupg-2.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_compile: Succeeded
NOTE: Running task 2069 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_install)
NOTE: recipe gpgme-1.17.1-r0: task do_install: Started
NOTE: recipe gpgme-1.17.1-r0: task do_install: Succeeded
NOTE: Running task 2070 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_populate_sysroot)
NOTE: Running task 2071 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_package)
NOTE: recipe gpgme-1.17.1-r0: task do_populate_sysroot: Started
NOTE: recipe gpgme-1.17.1-r0: task do_package: Started
NOTE: recipe gpgme-1.17.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2072 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2073 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_configure)
NOTE: recipe librepo-1.14.2-r0: task do_configure: Started
NOTE: recipe librepo-1.14.2-r0: task do_configure: Succeeded
NOTE: Running task 2074 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_compile)
NOTE: recipe librepo-1.14.2-r0: task do_compile: Started
NOTE: recipe gpgme-1.17.1-r0: task do_package: Succeeded
NOTE: Running task 2075 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_packagedata)
NOTE: recipe gpgme-1.17.1-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.17.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2076 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_package_write_rpm)
NOTE: recipe gpgme-1.17.1-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.14.2-r0: task do_compile: Succeeded
NOTE: Running task 2077 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_install)
NOTE: recipe librepo-1.14.2-r0: task do_install: Started
NOTE: recipe librepo-1.14.2-r0: task do_install: Succeeded
NOTE: Running task 2078 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_populate_sysroot)
NOTE: Running task 2079 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_package)
NOTE: recipe librepo-1.14.2-r0: task do_populate_sysroot: Started
NOTE: recipe librepo-1.14.2-r0: task do_package: Started
NOTE: recipe librepo-1.14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2080 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdnf-0.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2081 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_configure)
NOTE: recipe libdnf-0.66.0-r0: task do_configure: Started
NOTE: recipe librepo-1.14.2-r0: task do_package: Succeeded
NOTE: Running task 2082 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_packagedata)
NOTE: recipe librepo-1.14.2-r0: task do_packagedata: Started
NOTE: recipe librepo-1.14.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2083 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_package_write_rpm)
NOTE: recipe librepo-1.14.2-r0: task do_package_write_rpm: Started
NOTE: recipe gpgme-1.17.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_configure: Succeeded
NOTE: Running task 2084 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_compile)
NOTE: recipe libdnf-0.66.0-r0: task do_compile: Started
NOTE: recipe librepo-1.14.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_compile: Succeeded
NOTE: Running task 2085 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_install)
NOTE: recipe libdnf-0.66.0-r0: task do_install: Started
NOTE: recipe libdnf-0.66.0-r0: task do_install: Succeeded
NOTE: Running task 2086 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_package)
NOTE: Running task 2087 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_populate_sysroot)
NOTE: recipe libdnf-0.66.0-r0: task do_package: Started
NOTE: recipe libdnf-0.66.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdnf-0.66.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2088 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dnf-4.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dnf-4.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2089 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_configure)
NOTE: recipe dnf-4.12.0-r0: task do_configure: Started
NOTE: recipe dnf-4.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2090 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_compile)
NOTE: recipe dnf-4.12.0-r0: task do_compile: Started
NOTE: recipe dnf-4.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2091 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_install)
NOTE: recipe dnf-4.12.0-r0: task do_install: Started
NOTE: recipe dnf-4.12.0-r0: task do_install: Succeeded
NOTE: Running task 2092 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_populate_sysroot)
NOTE: recipe dnf-4.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe dnf-4.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_package: Succeeded
NOTE: Running task 2093 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_packagedata)
NOTE: recipe libdnf-0.66.0-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2094 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_package)
NOTE: Running task 2095 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_package_write_rpm)
NOTE: recipe dnf-4.12.0-r0: task do_package: Started
NOTE: recipe libdnf-0.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.12.0-r0: task do_package: Succeeded
NOTE: Running task 2096 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_packagedata)
NOTE: recipe dnf-4.12.0-r0: task do_packagedata: Started
NOTE: recipe dnf-4.12.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2097 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_package_write_rpm)
NOTE: Running task 2098 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_package_qa)
NOTE: recipe dnf-4.12.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.12.0-r0: task do_package_qa: Started
NOTE: recipe dnf-4.12.0-r0: task do_package_qa: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2099 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2099 tasks of which 1841 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 66 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-src went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dbg went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-staticdev went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dev went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-doc went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-gui went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-vconsole-setup went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-initramfs went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-analyze went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-kernel-install went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-rpm-macros went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-binfmt went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-zsh-completion went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-container went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-gatewayd went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-upload went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-remote went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-extra-utils went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-udev-rules went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd-shared went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev-hwdb went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-bash-completion went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be+latin went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-bg went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ca went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-cs went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-da went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-de went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-el went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-es went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fi went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fr went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-gl went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hr went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hu went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-id went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-it went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ja went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-kab went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ko went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-lt went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-nl went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pa went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pl went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt-br went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ro went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ru went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-si went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sk went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sr went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sv went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-tr went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-uk went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-cn went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-tw went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-myhostname went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-mymachines went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-resolve went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-systemd went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libudev went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2727113197685896079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dnf/dnf-bash-completion: PKGSIZE changed from 10230 to 10220 (-0%)
packages/core2-32-poky-linux/dnf/dnf-bash-completion: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-dbg: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-dbg: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-dev: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-dev: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-doc: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-doc: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-da: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-de: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-el: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-es: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-he: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-id: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-it: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-or: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-si: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-th: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-src: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-src: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf-staticdev: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf/dnf: PKGSIZE changed from 943913 to 944048 (+0%)
packages/core2-32-poky-linux/dnf/dnf: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf/dnf: PKGV changed from 4.11.1 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/dnf: PV changed from "4.11.1" to "4.12.0"
packages/core2-32-poky-linux/dnf: PKGV changed from 4.11.1 [default] to 4.12.0 [default]

--===============2727113197685896079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 63 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-1cff4aa500258f520af6fc8cfa3c5cc6eef3a6dc"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1cff4aa500258f520af6fc8cfa3c5cc6eef3a6dc"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 115 Local 20 Mirrors 0 Missed 95 Current 490 (17% match, 84% complete)
Removing 4 stale sstate objects for arch qemumips...done.
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 538 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2022a-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2022a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_250.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1251 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1253 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: recipe systemd-1_250.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 1527 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_fetch)
NOTE: Running task 1553 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 1554 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_fetch)
NOTE: Running task 1558 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_fetch)
NOTE: Running task 1574 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: Running task 1575 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_fetch)
NOTE: Running task 1576 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1601 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1602 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1603 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1604 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1607 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_fetch)
NOTE: Running task 1608 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1609 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1622 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_fetch)
NOTE: Running task 1623 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_fetch)
NOTE: Running task 1663 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_fetch)
NOTE: Running task 1675 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_fetch)
NOTE: Running task 1676 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: Running task 1677 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_fetch)
NOTE: Running task 1678 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Started
NOTE: Running task 1716 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_fetch)
NOTE: Running task 1738 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_fetch)
NOTE: Running task 1741 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe librepo-1.14.2-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Started
NOTE: recipe json-c-0.16-r0: task do_fetch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1800 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_unpack)
NOTE: Running task 1801 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: Running task 1802 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_unpack)
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Started
NOTE: recipe librepo-1.14.2-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Started
NOTE: Running task 1803 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: Running task 1804 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1805 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.66.0-r0: task do_fetch: Started
NOTE: recipe systemd-1_250.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1806 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_unpack)
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1807 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_unpack)
NOTE: Running task 1808 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_unpack)
NOTE: recipe dnf-4.12.0-r0: task do_fetch: Started
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 1811 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1812 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Started
NOTE: Running task 1813 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 1814 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_unpack)
NOTE: Running task 1815 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: Running task 1816 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1817 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_unpack)
NOTE: Running task 1818 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_unpack)
NOTE: Running task 1819 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_unpack)
NOTE: Running task 1820 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_fetch: Succeeded
NOTE: recipe gnupg-2.3.4-r0: task do_fetch: Started
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: Running task 1821 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1822 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_unpack)
NOTE: Running task 1823 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: Running task 1824 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnupg-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1836 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Started
NOTE: Running task 1837 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 1838 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_unpack)
NOTE: Running task 1839 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_unpack)
NOTE: Running task 1840 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_unpack)
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe librepo-1.14.2-r0: task do_unpack: Started
NOTE: Running task 1849 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Started
NOTE: Running task 1850 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.16-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: Running task 1851 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1852 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Started
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Started
NOTE: Running task 1853 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: recipe libdnf-0.66.0-r0: task do_unpack: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe dnf-4.12.0-r0: task do_unpack: Started
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: Running task 1854 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_patch)
NOTE: Running task 1855 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_patch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/systemd/1_250.4-r0/temp/log.do_packagedata_setscene.1629019
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 599 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_package_setscene)
NOTE: recipe gnupg-2.3.4-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_patch: Started
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Started
NOTE: recipe librepo-1.14.2-r0: task do_unpack: Succeeded
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Succeeded
NOTE: Running task 1856 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_patch)
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Started
NOTE: Running task 1857 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_patch)
NOTE: Running task 1858 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_patch)
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1859 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: Running task 1860 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Started
NOTE: Running task 1861 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1862 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: Running task 1863 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1864 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1865 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1866 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_patch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_patch: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_unpack: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1867 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_patch)
NOTE: recipe dnf-4.12.0-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1868 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Succeeded
NOTE: Running task 1869 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1870 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1871 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_patch)
NOTE: Running task 1872 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1873 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_patch)
NOTE: Running task 1874 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1875 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1876 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe librepo-1.14.2-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libksba-1.6.0-r0: task do_patch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Started
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.66.0-r0: task do_patch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.12.0-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1877 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libksba-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Succeeded
NOTE: Running task 1878 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Succeeded
NOTE: Running task 1879 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1880 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_generate_toolchain_file)
NOTE: Running task 1881 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_generate_toolchain_file)
NOTE: Running task 1882 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_deploy_source_date_epoch)
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: Running task 1883 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.14.2-r0: task do_patch: Succeeded
NOTE: Running task 1884 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1885 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1886 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_generate_toolchain_file)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1887 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1888 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1889 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_configure)
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Succeeded
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe librepo-1.14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1890 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_configure)
NOTE: recipe librepo-1.14.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: Running task 1891 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: Running task 1892 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe librepo-1.14.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1893 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1894 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1895 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_configure)
NOTE: recipe json-c-0.16-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1896 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.66.0-r0: task do_patch: Succeeded
NOTE: Running task 1897 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: Running task 1898 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1899 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_generate_toolchain_file)
NOTE: recipe librepo-1.14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Started
NOTE: recipe systemd-1_250.4-r0: task do_package_setscene: Started
NOTE: recipe dnf-4.12.0-r0: task do_patch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_configure: Started
NOTE: Running task 1900 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1901 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_generate_toolchain_file)
NOTE: Running task 1902 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_populate_lic)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.66.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1903 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: Running task 1904 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1905 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_configure)
NOTE: recipe dnf-4.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.12.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe dnf-4.12.0-r0: task do_populate_lic: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Succeeded
NOTE: recipe gnupg-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1906 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1907 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_patch)
NOTE: recipe dnf-4.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Started
NOTE: recipe libdnf-0.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.3.4-r0: task do_patch: Started
NOTE: recipe dnf-4.12.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_populate_lic unihash changed to 2059057eb6a58b4046f22e7352cdfcd05a05501a85a91c6987d63f5240fe548e
NOTE: recipe dnf-4.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Succeeded
NOTE: Running task 1908 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1909 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_compile)
NOTE: recipe gnupg-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1910 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1911 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnupg-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1912 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1913 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Succeeded
NOTE: Running task 1915 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe libcomps-0.1.18-r0: task do_install: Started
NOTE: recipe systemd-1_250.4-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1926 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 1948 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 1949 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: recipe libcomps-0.1.18-r0: task do_install: Succeeded
NOTE: Running task 1950 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package)
NOTE: Running task 1951 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1952 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_package: Started
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Started
NOTE: Running task 1953 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1954 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1955 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1956 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to adc99ef3803769c431eb1fe143d0d4d2272069a430faf47bb88e42d021c57eca
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1970 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1971 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1972 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 1973 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1974 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: Running task 1975 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Succeeded
NOTE: Running task 1976 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_compile)
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4f672850dad29842ce5ccb8318ecf7cb5c099e33eefd97dfd516e6119a48cb96
NOTE: Running task 1978 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_packagedata)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package: Succeeded
NOTE: Running task 1979 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_packagedata)
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 1980 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package_write_rpm)
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_250.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Succeeded
NOTE: Running task 1983 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_install)
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Started
NOTE: recipe json-c-0.16-r0: task do_configure: Succeeded
NOTE: Running task 1984 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_compile)
NOTE: recipe json-c-0.16-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Succeeded
NOTE: Running task 1985 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package)
NOTE: Running task 1986 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1987 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_compile: Succeeded
NOTE: Running task 1988 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_install)
NOTE: recipe json-c-0.16-r0: task do_install: Started
NOTE: recipe json-c-0.16-r0: task do_install: Succeeded
NOTE: Running task 1989 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_populate_sysroot)
NOTE: Running task 1990 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_package)
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Succeeded
NOTE: recipe json-c-0.16-r0: task do_package: Started
NOTE: Running task 1991 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 1992 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1993 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_rpm)
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe json-c-0.16-r0: task do_package: Succeeded
NOTE: Running task 1994 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_packagedata)
NOTE: recipe json-c-0.16-r0: task do_packagedata: Started
NOTE: recipe json-c-0.16-r0: task do_packagedata: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Succeeded
NOTE: Running task 1995 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: Running task 1996 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_compile)
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 1997 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 1998 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 1999 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2000 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2001 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: Running task 2002 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 2003 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_compile)
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Succeeded
NOTE: Running task 2004 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Started
NOTE: recipe libksba-1.6.0-r0: task do_configure: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2005 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: Running task 2006 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_compile)
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Succeeded
NOTE: Running task 2007 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot)
NOTE: Running task 2008 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_package)
NOTE: recipe libksba-1.6.0-r0: task do_compile: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_configure: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Started
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: Running task 2009 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2010 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 2011 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: Running task 2012 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 2013 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2014 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: recipe libassuan-2.5.5-r0: task do_install: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2015 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_install: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 2016 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: Running task 2017 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_populate_sysroot)
NOTE: Running task 2018 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package)
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 2019 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Succeeded
NOTE: Running task 2020 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2021 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2022 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2023 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2024 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_install)
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2025 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2026 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: Running task 2027 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_install: Started
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: Running task 2028 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2029 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Started
NOTE: Running task 2030 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2031 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libksba-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 2032 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_package)
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2033 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_compile: Started
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_package: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Succeeded
NOTE: Running task 2034 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_packagedata)
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Started
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2035 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnupg-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2036 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe gnupg-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2037 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe gnupg-2.3.4-r0: task do_configure: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2038 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: Running task 2039 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe libksba-1.6.0-r0: task do_package: Succeeded
NOTE: Running task 2040 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_packagedata)
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2041 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2042 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.14.0-r0: task do_install: Started
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2043 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_compile)
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2044 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: Running task 2045 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: recipe libmodulemd-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_package: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2046 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_install)
NOTE: recipe pinentry-1.2.0-r0: task do_install: Started
NOTE: recipe pinentry-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2047 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_package)
NOTE: recipe pinentry-1.2.0-r0: task do_package: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2048 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2049 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_packagedata)
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Succeeded
NOTE: Running task 2050 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_compile)
NOTE: recipe gpgme-1.17.1-r0: task do_compile: Started
NOTE: recipe gnupg-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2051 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_compile)
NOTE: recipe gnupg-2.3.4-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2052 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2053 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_install)
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Succeeded
NOTE: Running task 2054 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_populate_sysroot)
NOTE: Running task 2055 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package)
NOTE: recipe rpm-1_4.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2056 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2057 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_configure)
NOTE: recipe libsolv-0.7.22-r0: task do_configure: Started
NOTE: recipe gnupg-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2058 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_install)
NOTE: recipe gnupg-2.3.4-r0: task do_install: Started
NOTE: recipe libsolv-0.7.22-r0: task do_configure: Succeeded
NOTE: Running task 2059 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_compile)
NOTE: recipe libsolv-0.7.22-r0: task do_compile: Started
NOTE: recipe gnupg-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 2060 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_package)
NOTE: recipe gnupg-2.3.4-r0: task do_package: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Succeeded
NOTE: Running task 2061 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2062 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.22-r0: task do_compile: Succeeded
NOTE: Running task 2063 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_install)
NOTE: recipe libsolv-0.7.22-r0: task do_install: Started
NOTE: recipe libsolv-0.7.22-r0: task do_install: Succeeded
NOTE: Running task 2064 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_populate_sysroot)
NOTE: Running task 2065 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_package)
NOTE: recipe libsolv-0.7.22-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.22-r0: task do_package: Started
NOTE: recipe libsolv-0.7.22-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnupg-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 2066 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_packagedata)
NOTE: recipe gnupg-2.3.4-r0: task do_packagedata: Started
NOTE: recipe gnupg-2.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2067 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_package_write_rpm)
NOTE: recipe gnupg-2.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_package: Succeeded
NOTE: Running task 2068 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_packagedata)
NOTE: recipe libsolv-0.7.22-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.22-r0: task do_packagedata: Succeeded
NOTE: recipe gnupg-2.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_compile: Succeeded
NOTE: Running task 2069 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_install)
NOTE: recipe gpgme-1.17.1-r0: task do_install: Started
NOTE: recipe gpgme-1.17.1-r0: task do_install: Succeeded
NOTE: Running task 2070 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_populate_sysroot)
NOTE: Running task 2071 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_package)
NOTE: recipe gpgme-1.17.1-r0: task do_populate_sysroot: Started
NOTE: recipe gpgme-1.17.1-r0: task do_package: Started
NOTE: recipe gpgme-1.17.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2072 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2073 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_configure)
NOTE: recipe librepo-1.14.2-r0: task do_configure: Started
NOTE: recipe librepo-1.14.2-r0: task do_configure: Succeeded
NOTE: Running task 2074 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_compile)
NOTE: recipe librepo-1.14.2-r0: task do_compile: Started
NOTE: recipe gpgme-1.17.1-r0: task do_package: Succeeded
NOTE: Running task 2075 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_packagedata)
NOTE: recipe gpgme-1.17.1-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.17.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2076 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_package_write_rpm)
NOTE: recipe gpgme-1.17.1-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.14.2-r0: task do_compile: Succeeded
NOTE: Running task 2077 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_install)
NOTE: recipe librepo-1.14.2-r0: task do_install: Started
NOTE: recipe librepo-1.14.2-r0: task do_install: Succeeded
NOTE: Running task 2078 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_populate_sysroot)
NOTE: Running task 2079 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_package)
NOTE: recipe librepo-1.14.2-r0: task do_populate_sysroot: Started
NOTE: recipe librepo-1.14.2-r0: task do_package: Started
NOTE: recipe librepo-1.14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2080 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdnf-0.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2081 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_configure)
NOTE: recipe libdnf-0.66.0-r0: task do_configure: Started
NOTE: recipe librepo-1.14.2-r0: task do_package: Succeeded
NOTE: Running task 2082 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_packagedata)
NOTE: recipe librepo-1.14.2-r0: task do_packagedata: Started
NOTE: recipe librepo-1.14.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2083 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_package_write_rpm)
NOTE: recipe librepo-1.14.2-r0: task do_package_write_rpm: Started
NOTE: recipe gpgme-1.17.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_configure: Succeeded
NOTE: Running task 2084 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_compile)
NOTE: recipe libdnf-0.66.0-r0: task do_compile: Started
NOTE: recipe librepo-1.14.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_compile: Succeeded
NOTE: Running task 2085 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_install)
NOTE: recipe libdnf-0.66.0-r0: task do_install: Started
NOTE: recipe libdnf-0.66.0-r0: task do_install: Succeeded
NOTE: Running task 2086 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_package)
NOTE: Running task 2087 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_populate_sysroot)
NOTE: recipe libdnf-0.66.0-r0: task do_package: Started
NOTE: recipe libdnf-0.66.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdnf-0.66.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2088 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dnf-4.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dnf-4.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2089 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_configure)
NOTE: recipe dnf-4.12.0-r0: task do_configure: Started
NOTE: recipe dnf-4.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2090 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_compile)
NOTE: recipe dnf-4.12.0-r0: task do_compile: Started
NOTE: recipe dnf-4.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2091 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_install)
NOTE: recipe dnf-4.12.0-r0: task do_install: Started
NOTE: recipe dnf-4.12.0-r0: task do_install: Succeeded
NOTE: Running task 2092 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_populate_sysroot)
NOTE: recipe dnf-4.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe dnf-4.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_package: Succeeded
NOTE: Running task 2093 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_packagedata)
NOTE: recipe libdnf-0.66.0-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2094 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_package)
NOTE: Running task 2095 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_package_write_rpm)
NOTE: recipe dnf-4.12.0-r0: task do_package: Started
NOTE: recipe libdnf-0.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.12.0-r0: task do_package: Succeeded
NOTE: Running task 2096 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_packagedata)
NOTE: recipe dnf-4.12.0-r0: task do_packagedata: Started
NOTE: recipe dnf-4.12.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2097 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_package_write_rpm)
NOTE: Running task 2098 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_package_qa)
NOTE: recipe dnf-4.12.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.12.0-r0: task do_package_qa: Started
NOTE: recipe dnf-4.12.0-r0: task do_package_qa: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2099 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2099 tasks of which 1841 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 66 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-src went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dbg went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-staticdev went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dev went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-doc went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-gui went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-vconsole-setup went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-initramfs went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-analyze went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-kernel-install went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-rpm-macros went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-binfmt went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-zsh-completion went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-container went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-gatewayd went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-upload went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-remote went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-extra-utils went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-udev-rules went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd-shared went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev-hwdb went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-bash-completion went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be+latin went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-bg went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ca went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-cs went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-da went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-de went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-el went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-es went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fi went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fr went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-gl went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hr went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hu went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-id went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-it went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ja went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-kab went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ko went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-lt went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-nl went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pa went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pl went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt-br went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ro went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ru went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-si went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sk went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sr went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sv went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-tr went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-uk went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-cn went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-tw went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-myhostname went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-mymachines went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-resolve went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-systemd went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libudev went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2727113197685896079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 70 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-1cff4aa500258f520af6fc8cfa3c5cc6eef3a6dc"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1cff4aa500258f520af6fc8cfa3c5cc6eef3a6dc"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 115 Local 20 Mirrors 0 Missed 95 Current 490 (17% match, 84% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 538 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2022a-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2022a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_250.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1254 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1255 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: recipe systemd-1_250.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 1527 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1553 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 1554 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_fetch)
NOTE: Running task 1558 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_fetch)
NOTE: Running task 1574 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: Running task 1575 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_fetch)
NOTE: Running task 1576 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1593 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1594 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1595 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1596 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1607 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_fetch)
NOTE: Running task 1608 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1609 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1622 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_fetch)
NOTE: Running task 1623 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_fetch)
NOTE: Running task 1665 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_fetch)
NOTE: Running task 1675 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: Running task 1676 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_fetch)
NOTE: Running task 1677 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_fetch)
NOTE: Running task 1678 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: Running task 1716 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_fetch)
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Started
NOTE: Running task 1738 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_fetch)
NOTE: Running task 1741 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe librepo-1.14.2-r0: task do_fetch: Started
NOTE: recipe json-c-0.16-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Started
NOTE: Running task 1810 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 1811 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Started
NOTE: Running task 1823 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_unpack)
NOTE: Running task 1824 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1825 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: Running task 1826 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/systemd/1_250.4-r0/temp/log.do_packagedata_setscene.1747982
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Succeeded
NOTE: recipe librepo-1.14.2-r0: task do_fetch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 599 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_package_setscene)
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_fetch: Started
NOTE: Running task 1827 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_unpack)
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe dnf-4.12.0-r0: task do_fetch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Succeeded
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Started
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1828 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_unpack)
NOTE: Running task 1829 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_unpack)
NOTE: Running task 1830 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_unpack)
NOTE: Running task 1831 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1832 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: recipe libdnf-0.66.0-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe systemd-1_250.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe gnupg-2.3.4-r0: task do_fetch: Started
NOTE: Running task 1833 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Started
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1834 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1835 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_unpack)
NOTE: Running task 1836 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_unpack)
NOTE: Running task 1837 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_unpack)
NOTE: Running task 1838 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1839 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_unpack)
NOTE: Running task 1840 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Started
NOTE: recipe gnupg-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_unpack: Started
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1841 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 1842 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 1843 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_unpack)
NOTE: Running task 1844 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: Running task 1845 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.16-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 1846 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_patch)
NOTE: Running task 1847 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1848 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: Running task 1849 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_unpack)
NOTE: Running task 1850 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_unpack)
NOTE: Running task 1851 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1852 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1853 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_patch)
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librepo-1.14.2-r0: task do_unpack: Started
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Started
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Started
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Started
NOTE: recipe libdnf-0.66.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1854 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: Running task 1855 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Started
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.14.2-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.16-r0: task do_patch: Started
NOTE: Running task 1856 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_patch)
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1857 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_unpack: Started
NOTE: recipe gnupg-2.3.4-r0: task do_unpack: Started
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1858 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: Running task 1859 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1860 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_patch)
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Started
NOTE: Running task 1861 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1862 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 1863 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librepo-1.14.2-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Started
NOTE: Running task 1864 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: recipe libdnf-0.66.0-r0: task do_unpack: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Started
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Started
NOTE: Running task 1865 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 1866 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1867 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1868 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1869 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_patch)
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1870 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1871 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1872 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe libdnf-0.66.0-r0: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1873 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1874 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_patch)
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: Running task 1875 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_generate_toolchain_file)
NOTE: Running task 1876 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_deploy_source_date_epoch)
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1877 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_patch)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: Running task 1878 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.14.2-r0: task do_patch: Succeeded
NOTE: Running task 1879 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1880 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_generate_toolchain_file)
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1881 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Started
NOTE: Running task 1882 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_configure)
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe libksba-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_patch: Started
NOTE: Running task 1883 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librepo-1.14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Succeeded
NOTE: recipe librepo-1.14.2-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1884 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: Running task 1885 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1886 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1887 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: Running task 1888 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_configure: Started
NOTE: recipe systemd-1_250.4-r0: task do_package_setscene: Started
NOTE: recipe librepo-1.14.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1889 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1890 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1891 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1892 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_generate_toolchain_file)
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librepo-1.14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Started
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.66.0-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1893 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1894 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_generate_toolchain_file)
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1895 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1896 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1897 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1898 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: Running task 1899 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_configure)
NOTE: recipe libdnf-0.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.66.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libksba-1.6.0-r0: task do_configure: Started
NOTE: recipe libdnf-0.66.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1900 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1901 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_configure)
NOTE: recipe dnf-4.12.0-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 1902 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1903 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_generate_toolchain_file)
NOTE: Running task 1904 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_populate_lic)
NOTE: Running task 1905 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe libdnf-0.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Started
NOTE: recipe dnf-4.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.12.0-r0: task do_populate_lic: Started
NOTE: recipe dnf-4.12.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Succeeded
NOTE: Running task 1906 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_deploy_source_date_epoch)
NOTE: recipe dnf-4.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.12.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_populate_lic unihash changed to 2059057eb6a58b4046f22e7352cdfcd05a05501a85a91c6987d63f5240fe548e
NOTE: recipe dnf-4.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1907 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_patch)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1908 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.3.4-r0: task do_patch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Succeeded
NOTE: Running task 1909 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_compile)
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1910 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnupg-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1911 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1912 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe gnupg-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1913 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe systemd-1_250.4-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1924 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1946 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Succeeded
NOTE: Running task 1947 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe libcomps-0.1.18-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1948 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1949 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 1950 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 1951 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.18-r0: task do_install: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: Running task 1952 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package)
NOTE: Running task 1953 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_populate_sysroot)
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to cb21232c5a28826a835c7b82a0929a680de568bfa22b4e8f2902c7990c647f3e
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1967 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: Running task 1968 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1969 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1970 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1971 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1972 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: Running task 1973 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 383898a484d5745ad8dfc12903788320e353f730bca51d01c97a5e5c0c4bdc03
NOTE: Running task 1975 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: Running task 1976 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1977 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Succeeded
NOTE: Running task 1978 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_250.4-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_package: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1979 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_packagedata)
NOTE: recipe systemd-1_250.4-r0: task do_packagedata: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 1982 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package_write_rpm)
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Started
NOTE: recipe json-c-0.16-r0: task do_configure: Succeeded
NOTE: Running task 1983 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_compile)
NOTE: recipe json-c-0.16-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Succeeded
NOTE: Running task 1984 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_install)
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Succeeded
NOTE: Running task 1985 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package)
NOTE: Running task 1986 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_populate_sysroot)
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Started
NOTE: recipe json-c-0.16-r0: task do_compile: Succeeded
NOTE: Running task 1987 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_install)
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_install: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe json-c-0.16-r0: task do_install: Succeeded
NOTE: Running task 1988 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: Running task 1989 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_populate_sysroot)
NOTE: Running task 1990 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 1991 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: Running task 1992 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1993 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_rpm)
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Started
NOTE: recipe json-c-0.16-r0: task do_package: Succeeded
NOTE: Running task 1994 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_packagedata)
NOTE: recipe json-c-0.16-r0: task do_packagedata: Started
NOTE: recipe json-c-0.16-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 1995 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Succeeded
NOTE: Running task 1996 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_compile)
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 1997 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 1998 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1999 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2000 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe libksba-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 2001 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 2002 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2003 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe libksba-1.6.0-r0: task do_compile: Started
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Started
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: Running task 2004 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Succeeded
NOTE: Running task 2005 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_install)
NOTE: recipe libmodulemd-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2006 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_configure: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Succeeded
NOTE: Running task 2007 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot)
NOTE: Running task 2008 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_package)
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: Running task 2009 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: Running task 2010 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2011 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: Running task 2012 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: recipe libassuan-2.5.5-r0: task do_install: Started
NOTE: Running task 2013 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 2014 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2015 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe libassuan-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 2016 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_populate_sysroot)
NOTE: Running task 2017 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package)
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 2018 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe libksba-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2019 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 2020 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2021 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2022 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libksba-1.6.0-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2023 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2024 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2025 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2026 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2027 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe libksba-1.6.0-r0: task do_install: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2028 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_package)
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Started
NOTE: Running task 2029 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_populate_sysroot)
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_package: Started
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2030 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: Running task 2031 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.14.0-r0: task do_configure: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Started
NOTE: Running task 2032 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: Running task 2033 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_compile: Started
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2034 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnupg-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_package: Succeeded
NOTE: recipe gnupg-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2035 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_configure)
NOTE: Running task 2036 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_packagedata)
NOTE: recipe gnupg-2.3.4-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2037 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_configure)
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 2038 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: Running task 2039 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_write_rpm)
NOTE: recipe libksba-1.6.0-r0: task do_package: Succeeded
NOTE: Running task 2040 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_packagedata)
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2041 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2042 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.14.0-r0: task do_install: Started
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2043 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_compile)
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2044 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: Running task 2045 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: recipe libmodulemd-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_package: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2046 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_install)
NOTE: recipe pinentry-1.2.0-r0: task do_install: Started
NOTE: recipe pinentry-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2047 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_package)
NOTE: recipe pinentry-1.2.0-r0: task do_package: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2048 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2049 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_packagedata)
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Succeeded
NOTE: Running task 2050 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_compile)
NOTE: recipe gpgme-1.17.1-r0: task do_compile: Started
NOTE: recipe gnupg-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2051 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_compile)
NOTE: recipe gnupg-2.3.4-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2052 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2053 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_install)
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Succeeded
NOTE: Running task 2054 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_populate_sysroot)
NOTE: Running task 2055 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package)
NOTE: recipe rpm-1_4.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2056 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnupg-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2057 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_install)
NOTE: recipe gnupg-2.3.4-r0: task do_install: Started
NOTE: recipe libsolv-0.7.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2058 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_configure)
NOTE: recipe libsolv-0.7.22-r0: task do_configure: Started
NOTE: recipe gnupg-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 2059 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_package)
NOTE: recipe gnupg-2.3.4-r0: task do_package: Started
NOTE: recipe libsolv-0.7.22-r0: task do_configure: Succeeded
NOTE: Running task 2060 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_compile)
NOTE: recipe libsolv-0.7.22-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Succeeded
NOTE: Running task 2061 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2062 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe gpgme-1.17.1-r0: task do_compile: Succeeded
NOTE: Running task 2063 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_install)
NOTE: recipe libsolv-0.7.22-r0: task do_compile: Succeeded
NOTE: Running task 2064 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_install)
NOTE: recipe gpgme-1.17.1-r0: task do_install: Started
NOTE: recipe libsolv-0.7.22-r0: task do_install: Started
NOTE: recipe gnupg-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 2065 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_packagedata)
NOTE: recipe libsolv-0.7.22-r0: task do_install: Succeeded
NOTE: recipe gnupg-2.3.4-r0: task do_packagedata: Started
NOTE: Running task 2066 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_populate_sysroot)
NOTE: Running task 2067 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_package)
NOTE: recipe libsolv-0.7.22-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.22-r0: task do_package: Started
NOTE: recipe gnupg-2.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2068 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_package_write_rpm)
NOTE: recipe gnupg-2.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.22-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_install: Succeeded
NOTE: Running task 2069 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_populate_sysroot)
NOTE: Running task 2070 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_package)
NOTE: recipe gpgme-1.17.1-r0: task do_populate_sysroot: Started
NOTE: recipe gpgme-1.17.1-r0: task do_package: Started
NOTE: recipe gpgme-1.17.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2071 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2072 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_configure)
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librepo-1.14.2-r0: task do_configure: Started
NOTE: recipe librepo-1.14.2-r0: task do_configure: Succeeded
NOTE: Running task 2073 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_compile)
NOTE: recipe librepo-1.14.2-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.22-r0: task do_package: Succeeded
NOTE: Running task 2074 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_packagedata)
NOTE: recipe gpgme-1.17.1-r0: task do_package: Succeeded
NOTE: Running task 2075 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_packagedata)
NOTE: recipe libsolv-0.7.22-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.17.1-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.22-r0: task do_packagedata: Succeeded
NOTE: recipe librepo-1.14.2-r0: task do_compile: Succeeded
NOTE: Running task 2076 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_install)
NOTE: recipe gpgme-1.17.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2077 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_package_write_rpm)
NOTE: recipe librepo-1.14.2-r0: task do_install: Started
NOTE: recipe gpgme-1.17.1-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.14.2-r0: task do_install: Succeeded
NOTE: Running task 2078 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_populate_sysroot)
NOTE: Running task 2079 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_package)
NOTE: recipe librepo-1.14.2-r0: task do_populate_sysroot: Started
NOTE: recipe librepo-1.14.2-r0: task do_package: Started
NOTE: recipe librepo-1.14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2080 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdnf-0.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2081 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_configure)
NOTE: recipe libdnf-0.66.0-r0: task do_configure: Started
NOTE: recipe librepo-1.14.2-r0: task do_package: Succeeded
NOTE: Running task 2082 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_packagedata)
NOTE: recipe librepo-1.14.2-r0: task do_packagedata: Started
NOTE: recipe librepo-1.14.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2083 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_package_write_rpm)
NOTE: recipe librepo-1.14.2-r0: task do_package_write_rpm: Started
NOTE: recipe libdnf-0.66.0-r0: task do_configure: Succeeded
NOTE: Running task 2084 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_compile)
NOTE: recipe libdnf-0.66.0-r0: task do_compile: Started
NOTE: recipe gpgme-1.17.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librepo-1.14.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnupg-2.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_compile: Succeeded
NOTE: Running task 2085 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_install)
NOTE: recipe libdnf-0.66.0-r0: task do_install: Started
NOTE: recipe libdnf-0.66.0-r0: task do_install: Succeeded
NOTE: Running task 2086 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_package)
NOTE: Running task 2087 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_populate_sysroot)
NOTE: recipe libdnf-0.66.0-r0: task do_package: Started
NOTE: recipe libdnf-0.66.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdnf-0.66.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2088 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dnf-4.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dnf-4.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2089 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_configure)
NOTE: recipe dnf-4.12.0-r0: task do_configure: Started
NOTE: recipe dnf-4.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2090 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_compile)
NOTE: recipe dnf-4.12.0-r0: task do_compile: Started
NOTE: recipe dnf-4.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2091 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_install)
NOTE: recipe dnf-4.12.0-r0: task do_install: Started
NOTE: recipe dnf-4.12.0-r0: task do_install: Succeeded
NOTE: Running task 2092 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_populate_sysroot)
NOTE: recipe dnf-4.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe dnf-4.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_package: Succeeded
NOTE: Running task 2093 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_packagedata)
NOTE: recipe libdnf-0.66.0-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2094 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_package)
NOTE: Running task 2095 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_package_write_rpm)
NOTE: recipe dnf-4.12.0-r0: task do_package: Started
NOTE: recipe libdnf-0.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.12.0-r0: task do_package: Succeeded
NOTE: Running task 2096 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_packagedata)
NOTE: recipe dnf-4.12.0-r0: task do_packagedata: Started
NOTE: recipe dnf-4.12.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2097 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_package_write_rpm)
NOTE: Running task 2098 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_package_qa)
NOTE: recipe dnf-4.12.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.12.0-r0: task do_package_qa: Started
NOTE: recipe dnf-4.12.0-r0: task do_package_qa: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2099 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2099 tasks of which 1841 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 66 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-src went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dbg went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-staticdev went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dev went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-doc went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-gui went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-vconsole-setup went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-initramfs went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-analyze went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-kernel-install went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-rpm-macros went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-binfmt went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-zsh-completion went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-container went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-gatewayd went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-upload went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-remote went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-extra-utils went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-udev-rules went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd-shared went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev-hwdb went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-bash-completion went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be+latin went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-bg went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ca went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-cs went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-da went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-de went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-el went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-es went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fi went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fr went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-gl went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hr went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hu went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-id went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-it went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ja went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-kab went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ko went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-lt went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-nl went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pa went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pl went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt-br went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ro went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ru went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-si went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sk went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sr went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sv went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-tr went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-uk went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-cn went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-tw went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-myhostname went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-mymachines went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-resolve went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-systemd went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libudev went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2727113197685896079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1644 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1642 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-1cff4aa500258f520af6fc8cfa3c5cc6eef3a6dc"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1cff4aa500258f520af6fc8cfa3c5cc6eef3a6dc"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 115 Local 20 Mirrors 0 Missed 95 Current 490 (17% match, 84% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 538 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2022a-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2022a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_250.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_250.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1254 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1255 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 1527 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1553 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 1554 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_fetch)
NOTE: Running task 1558 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1574 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1575 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1576 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1577 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1578 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: Running task 1579 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_fetch)
NOTE: Running task 1580 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_fetch)
NOTE: Running task 1607 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_fetch)
NOTE: Running task 1608 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1609 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1622 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_fetch)
NOTE: Running task 1623 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_fetch)
NOTE: Running task 1665 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_fetch)
NOTE: Running task 1675 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_fetch)
NOTE: Running task 1676 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: Running task 1677 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_fetch)
NOTE: Running task 1678 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: Running task 1716 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_fetch)
NOTE: Running task 1738 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_fetch)
NOTE: Running task 1741 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe librepo-1.14.2-r0: task do_fetch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe json-c-0.16-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Started
NOTE: Running task 1821 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_unpack)
NOTE: Running task 1822 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Started
NOTE: recipe librepo-1.14.2-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Started
NOTE: recipe systemd-1_250.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.16-r0: task do_fetch: Succeeded
NOTE: Running task 1823 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_unpack)
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_fetch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Succeeded
NOTE: Running task 1824 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_unpack)
NOTE: Running task 1825 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_unpack)
NOTE: Running task 1826 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: Running task 1827 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Succeeded
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Started
NOTE: Running task 1828 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_unpack)
NOTE: Running task 1829 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_unpack)
NOTE: Running task 1830 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1831 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Succeeded
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Started
NOTE: recipe gnupg-2.3.4-r0: task do_fetch: Started
NOTE: Running task 1832 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_fetch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_fetch: Started
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Started
NOTE: Running task 1833 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 1834 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: Running task 1835 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnupg-2.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1836 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 1837 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 1838 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_unpack)
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1839 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_unpack)
NOTE: Running task 1840 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_unpack)
NOTE: Running task 1841 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_unpack)
NOTE: Running task 1842 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: recipe dnf-4.12.0-r0: task do_fetch: Succeeded
NOTE: Running task 1843 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/systemd/1_250.4-r0/temp/log.do_packagedata_setscene.1391686
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Succeeded
NOTE: Running task 1844 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_unpack)
NOTE: Running task 1845 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_prepare_recipe_sysroot)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe librepo-1.14.2-r0: task do_unpack: Started
NOTE: Running setscene task 599 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_package_setscene)
NOTE: recipe json-c-0.16-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1846 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Started
NOTE: Running task 1847 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_unpack)
NOTE: Running task 1848 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_unpack)
NOTE: Running task 1849 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1850 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Started
NOTE: recipe json-c-0.16-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1851 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Started
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Started
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_unpack: Started
NOTE: Running task 1852 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: Running task 1853 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Started
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: Running task 1854 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_patch)
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_unpack: Started
NOTE: recipe librepo-1.14.2-r0: task do_unpack: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Succeeded
NOTE: Running task 1855 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_patch)
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1856 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1857 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1858 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_patch)
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1859 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_patch)
NOTE: Running task 1860 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: Running task 1861 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_patch)
NOTE: Running task 1862 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_patch)
NOTE: Running task 1863 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_patch)
NOTE: Running task 1864 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1865 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_patch)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_unpack: Succeeded
NOTE: Running task 1866 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: Running task 1867 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_patch)
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Succeeded
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe gnupg-2.3.4-r0: task do_unpack: Started
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1868 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_patch)
NOTE: recipe json-c-0.16-r0: task do_patch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Started
NOTE: recipe librepo-1.14.2-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Started
NOTE: recipe libksba-1.6.0-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_patch: Started
NOTE: Running task 1869 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1870 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1871 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe dnf-4.12.0-r0: task do_patch: Started
NOTE: Running task 1872 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1873 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_patch)
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Succeeded
NOTE: Running task 1874 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libksba-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1875 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1876 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1877 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1878 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_generate_toolchain_file)
NOTE: Running task 1879 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Succeeded
NOTE: Running task 1880 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_generate_toolchain_file)
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Started
NOTE: Running task 1881 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1882 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.14.2-r0: task do_patch: Succeeded
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1883 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1884 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: Running task 1885 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1886 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_generate_toolchain_file)
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Succeeded
NOTE: Running task 1887 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librepo-1.14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1888 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_configure)
NOTE: Running task 1889 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe librepo-1.14.2-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1890 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: Running task 1891 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.14.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1892 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_configure: Started
NOTE: Running task 1893 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1894 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_configure)
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: Running task 1895 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1896 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_configure)
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_patch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Started
NOTE: Running task 1897 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1898 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_generate_toolchain_file)
NOTE: recipe systemd-1_250.4-r0: task do_package_setscene: Started
NOTE: recipe libksba-1.6.0-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe dnf-4.12.0-r0: task do_patch: Succeeded
NOTE: Running task 1899 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Started
NOTE: Running task 1900 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1901 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_generate_toolchain_file)
NOTE: Running task 1902 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_populate_lic)
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1903 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_configure)
NOTE: Running task 1904 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe libdnf-0.66.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1905 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe dnf-4.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.12.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_populate_lic: Started
NOTE: recipe libdnf-0.66.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe dnf-4.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Succeeded
NOTE: Running task 1906 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libdnf-0.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_populate_lic unihash changed to 2059057eb6a58b4046f22e7352cdfcd05a05501a85a91c6987d63f5240fe548e
NOTE: recipe dnf-4.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Succeeded
NOTE: Running task 1907 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1908 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1909 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_patch)
NOTE: recipe gnupg-2.3.4-r0: task do_patch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1910 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnupg-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1911 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: recipe gnupg-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1912 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Succeeded
NOTE: Running task 1913 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1914 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe libcomps-0.1.18-r0: task do_install: Started
NOTE: recipe gnupg-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1915 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe systemd-1_250.4-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1926 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1948 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 1949 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe libcomps-0.1.18-r0: task do_install: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1950 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package)
NOTE: Running task 1951 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_populate_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package: Started
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1952 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1953 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1954 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1955 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1956 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ea93135e6bc8e63cc54852e198d3eabbf225aea3faf287903bdd2c4fb2e8da5b
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1970 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1971 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1972 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 1973 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_configure)
NOTE: Running task 1974 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: Running task 1975 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Succeeded
NOTE: Running task 1976 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_compile)
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e12ef1466cb841b8170ebe21bf855a1d72ab36d5c6b2197eb65f7498b9c23a64
NOTE: Running task 1978 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_package: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_packagedata: Started
NOTE: Running task 1979 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_packagedata)
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 1980 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package_write_rpm)
NOTE: recipe systemd-1_250.4-r0: task do_packagedata: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Succeeded
NOTE: Running task 1983 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_install)
NOTE: recipe json-c-0.16-r0: task do_configure: Succeeded
NOTE: Running task 1984 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_compile)
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Started
NOTE: recipe json-c-0.16-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Succeeded
NOTE: Running task 1985 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1986 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: Running task 1987 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_populate_sysroot)
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_compile: Succeeded
NOTE: Running task 1988 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_install)
NOTE: recipe json-c-0.16-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_install: Succeeded
NOTE: Running task 1989 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_populate_sysroot)
NOTE: Running task 1990 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_package)
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_package: Started
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Succeeded
NOTE: Running task 1991 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 1992 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1993 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_rpm)
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Started
NOTE: recipe json-c-0.16-r0: task do_package: Succeeded
NOTE: Running task 1994 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_packagedata)
NOTE: recipe json-c-0.16-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe json-c-0.16-r0: task do_packagedata: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Succeeded
NOTE: Running task 1995 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_compile)
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 1996 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 1997 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 1998 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: Running task 1999 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2000 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe libksba-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 2001 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2002 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libksba-1.6.0-r0: task do_compile: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 2003 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_compile)
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Succeeded
NOTE: Running task 2004 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: Running task 2005 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_install)
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Started
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Succeeded
NOTE: Running task 2006 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: Running task 2007 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot)
NOTE: Running task 2008 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_package)
NOTE: recipe libmodulemd-2.14.0-r0: task do_configure: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Started
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: Running task 2009 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 2010 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2011 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2012 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2013 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: Running task 2014 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 2015 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: Running task 2016 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 2017 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: recipe libassuan-2.5.5-r0: task do_install: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2018 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_install)
NOTE: recipe libassuan-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 2019 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_populate_sysroot)
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2020 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package)
NOTE: Running task 2021 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe libksba-1.6.0-r0: task do_install: Started
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Succeeded
NOTE: Running task 2022 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2023 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2024 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 2025 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2026 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2027 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_package)
NOTE: Running task 2028 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_populate_sysroot)
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2029 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2030 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_configure)
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Started
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2031 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 2032 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: Running task 2033 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe gnupg-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2034 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2035 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Started
NOTE: recipe gnupg-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_compile: Started
NOTE: Running task 2036 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_configure)
NOTE: Running task 2037 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_write_rpm)
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: recipe gnupg-2.3.4-r0: task do_configure: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2038 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_configure)
NOTE: recipe libassuan-2.5.5-r0: task do_package: Succeeded
NOTE: Running task 2039 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_package: Succeeded
NOTE: Running task 2040 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_packagedata)
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Started
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2041 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2042 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.14.0-r0: task do_install: Started
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2043 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_compile)
NOTE: recipe libmodulemd-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2044 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: Running task 2045 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_package: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2046 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_install)
NOTE: recipe pinentry-1.2.0-r0: task do_install: Started
NOTE: recipe pinentry-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2047 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_package)
NOTE: recipe pinentry-1.2.0-r0: task do_package: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2048 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2049 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_packagedata)
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Succeeded
NOTE: Running task 2050 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_compile)
NOTE: recipe gpgme-1.17.1-r0: task do_compile: Started
NOTE: recipe gnupg-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2051 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_compile)
NOTE: recipe gnupg-2.3.4-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2052 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2053 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_install)
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Started
NOTE: recipe gnupg-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2054 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_install)
NOTE: recipe gnupg-2.3.4-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Succeeded
NOTE: Running task 2055 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_populate_sysroot)
NOTE: Running task 2056 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package)
NOTE: recipe rpm-1_4.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Started
NOTE: recipe gnupg-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 2057 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_package)
NOTE: recipe rpm-1_4.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2058 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnupg-2.3.4-r0: task do_package: Started
NOTE: recipe libsolv-0.7.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2059 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_configure)
NOTE: recipe libsolv-0.7.22-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.22-r0: task do_configure: Succeeded
NOTE: Running task 2060 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_compile)
NOTE: recipe libsolv-0.7.22-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Succeeded
NOTE: Running task 2061 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_packagedata)
NOTE: recipe gnupg-2.3.4-r0: task do_package: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Started
NOTE: Running task 2062 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_packagedata)
NOTE: recipe gnupg-2.3.4-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2063 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package_write_rpm)
NOTE: recipe gnupg-2.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2064 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.4.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe gnupg-2.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.22-r0: task do_compile: Succeeded
NOTE: Running task 2065 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_install)
NOTE: recipe libsolv-0.7.22-r0: task do_install: Started
NOTE: recipe libsolv-0.7.22-r0: task do_install: Succeeded
NOTE: Running task 2066 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_populate_sysroot)
NOTE: Running task 2067 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_package)
NOTE: recipe libsolv-0.7.22-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.22-r0: task do_package: Started
NOTE: recipe libsolv-0.7.22-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_package: Succeeded
NOTE: Running task 2068 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_packagedata)
NOTE: recipe libsolv-0.7.22-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.22-r0: task do_packagedata: Succeeded
NOTE: recipe gnupg-2.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_compile: Succeeded
NOTE: Running task 2069 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_install)
NOTE: recipe gpgme-1.17.1-r0: task do_install: Started
NOTE: recipe gpgme-1.17.1-r0: task do_install: Succeeded
NOTE: Running task 2070 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_populate_sysroot)
NOTE: Running task 2071 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_package)
NOTE: recipe gpgme-1.17.1-r0: task do_populate_sysroot: Started
NOTE: recipe gpgme-1.17.1-r0: task do_package: Started
NOTE: recipe gpgme-1.17.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2072 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2073 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_configure)
NOTE: recipe librepo-1.14.2-r0: task do_configure: Started
NOTE: recipe librepo-1.14.2-r0: task do_configure: Succeeded
NOTE: Running task 2074 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_compile)
NOTE: recipe librepo-1.14.2-r0: task do_compile: Started
NOTE: recipe gpgme-1.17.1-r0: task do_package: Succeeded
NOTE: Running task 2075 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_packagedata)
NOTE: recipe gpgme-1.17.1-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.17.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2076 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_package_write_rpm)
NOTE: recipe librepo-1.14.2-r0: task do_compile: Succeeded
NOTE: Running task 2077 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_install)
NOTE: recipe gpgme-1.17.1-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.14.2-r0: task do_install: Started
NOTE: recipe librepo-1.14.2-r0: task do_install: Succeeded
NOTE: Running task 2078 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_populate_sysroot)
NOTE: Running task 2079 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_package)
NOTE: recipe librepo-1.14.2-r0: task do_populate_sysroot: Started
NOTE: recipe librepo-1.14.2-r0: task do_package: Started
NOTE: recipe librepo-1.14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2080 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdnf-0.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2081 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_configure)
NOTE: recipe libdnf-0.66.0-r0: task do_configure: Started
NOTE: recipe librepo-1.14.2-r0: task do_package: Succeeded
NOTE: Running task 2082 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_packagedata)
NOTE: recipe librepo-1.14.2-r0: task do_packagedata: Started
NOTE: recipe librepo-1.14.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2083 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.2.bb:do_package_write_rpm)
NOTE: recipe librepo-1.14.2-r0: task do_package_write_rpm: Started
NOTE: recipe libdnf-0.66.0-r0: task do_configure: Succeeded
NOTE: Running task 2084 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_compile)
NOTE: recipe libdnf-0.66.0-r0: task do_compile: Started
NOTE: recipe librepo-1.14.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_compile: Succeeded
NOTE: Running task 2085 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_install)
NOTE: recipe libdnf-0.66.0-r0: task do_install: Started
NOTE: recipe libdnf-0.66.0-r0: task do_install: Succeeded
NOTE: Running task 2086 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_package)
NOTE: Running task 2087 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_populate_sysroot)
NOTE: recipe libdnf-0.66.0-r0: task do_package: Started
NOTE: recipe libdnf-0.66.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdnf-0.66.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2088 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dnf-4.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dnf-4.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2089 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_configure)
NOTE: recipe dnf-4.12.0-r0: task do_configure: Started
NOTE: recipe dnf-4.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2090 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_compile)
NOTE: recipe dnf-4.12.0-r0: task do_compile: Started
NOTE: recipe dnf-4.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2091 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_install)
NOTE: recipe dnf-4.12.0-r0: task do_install: Started
NOTE: recipe dnf-4.12.0-r0: task do_install: Succeeded
NOTE: Running task 2092 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_populate_sysroot)
NOTE: recipe dnf-4.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe dnf-4.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_package: Succeeded
NOTE: Running task 2093 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_packagedata)
NOTE: recipe libdnf-0.66.0-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2094 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_package)
NOTE: Running task 2095 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb:do_package_write_rpm)
NOTE: recipe dnf-4.12.0-r0: task do_package: Started
NOTE: recipe libdnf-0.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.12.0-r0: task do_package: Succeeded
NOTE: Running task 2096 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_packagedata)
NOTE: recipe dnf-4.12.0-r0: task do_packagedata: Started
NOTE: recipe dnf-4.12.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2097 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_package_write_rpm)
NOTE: Running task 2098 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_package_qa)
NOTE: recipe dnf-4.12.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.12.0-r0: task do_package_qa: Started
NOTE: recipe dnf-4.12.0-r0: task do_package_qa: Succeeded
NOTE: recipe dnf-4.12.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2099 of 2099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.12.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2099 tasks of which 1841 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 66 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-src went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dbg went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-staticdev went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dev went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-doc went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-gui went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-vconsole-setup went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-initramfs went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-analyze went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-kernel-install went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-rpm-macros went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-binfmt went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-zsh-completion went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-container went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-gatewayd went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-upload went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-remote went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-extra-utils went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-udev-rules went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd-shared went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev-hwdb went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-bash-completion went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be+latin went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-bg went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ca went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-cs went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-da went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-de went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-el went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-es went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fi went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fr went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-gl went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hr went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hu went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-id went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-it went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ja went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-kab went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ko went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-lt went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-nl went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pa went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pl went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt-br went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ro went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ru went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-si went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sk went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sr went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sv went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-tr went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-uk went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-cn went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-tw went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-myhostname went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-mymachines went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-resolve went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-systemd went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: QA Issue: Package version for package libudev went backwards which would break package feeds (from 1:250.5-r0 to 1:250.4-r0) [version-going-backwards]
ERROR: systemd-1_250.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2727113197685896079==--

