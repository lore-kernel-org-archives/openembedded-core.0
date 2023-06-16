Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF47C27C7A
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.817.1686887482671802602
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=clFDkibz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010188c2544201-2df9bd74-0269-4c02-b54d-7f50d444d50f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GA5ZIooEuATMCdWx3uxGco0BJvkxHqj1Mf9u5Dl5JA0=;
	b=clFDkibz2to75wCGAiMG2GDm2hvVi9Tj4A+fgC7G1FIa93ByLu+/lK8lwiPT2tKu
	9VoeSOE5PTsWlTXZspK/GCZ/1jnF/S3/FYKApTOxvx3jOJiAGkTTneSA2QxZ5b5+QP2
	Az+A7cL3mNH6XDtor/+aUcHKhsrFSPcjWPE3J4ME=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GA5ZIooEuATMCdWx3uxGco0BJvkxHqj1Mf9u5Dl5JA0=;
	b=mmtqy2BOeVUcALcPrKS5Ew9Ni+Vhli3TBJR5yaXjGb5HSPDv/mIViFVAYmM2sTga
	l9quRuER8lTKGljj3D233qtkzZSkHj9Ie4ppEoO2Juge0CFoxAcoCzj+zippWWhePaV
	gwz+RYfJM4tbhOoaxiK1Z+lAZya9ZV3B9GrWHwf0=
Content-Type: multipart/mixed; boundary="===============2090055460707505226=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.16.1 SUCCEEDED
Message-ID: <01010188c2544201-2df9bd74-0269-4c02-b54d-7f50d444d50f-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182905

--===============2090055460707505226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.16.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.14.0-4.16.1.patch
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

-- >8 --
From 292b392abec6c868b33032df793a99a3664f98e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 08:41:41 +0000
Subject: [PATCH] dnf: upgrade 4.14.0 -> 4.16.1

---
 meta/recipes-devtools/dnf/{dnf_4.14.0.bb => dnf_4.16.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.14.0.bb => dnf_4.16.1.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.14.0.bb b/meta/recipes-devtools/dnf/dnf_4.16.1.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.14.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.16.1.bb
index 62df8c4ace..ff79701dc7 100644
--- a/meta/recipes-devtools/dnf/dnf_4.14.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.16.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "e50875b3f5790f70720bdb670e1dd2bf4d828744"
+SRCREV = "94b7cc7956580405b219329541d6b40db6499cf1"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============2090055460707505226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1804 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1802 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:401449597c16696408f93f7d64d6611a1ddabc26"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 193 Local 28 Mirrors 0 Missed 165 Current 586 (14% match, 78% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 644 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 663 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 779 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 761 of 779 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_253.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 770 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1127 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: Running task 1289 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_compile)
NOTE: Running task 1321 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure_ptest_base)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: Running task 1388 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1389 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1575 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: Running task 1614 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: Running task 1652 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_fetch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1665 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: Running task 1666 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_fetch)
NOTE: Running task 1668 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 1673 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata)
NOTE: Running task 1674 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1675 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1676 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_253.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1686 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1707 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1708 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1716 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.15.1.bb:do_fetch)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: Running task 1729 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: recipe json-c-0.16-r0: task do_fetch: Started
NOTE: Running task 1743 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_fetch)
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: Running task 1781 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_fetch)
NOTE: Running task 1782 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1783 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1784 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1787 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1797 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb:do_fetch)
NOTE: Running task 1798 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_fetch)
NOTE: recipe json-c-0.16-r0: task do_fetch: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_fetch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 1822 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_unpack)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: Running task 1823 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1824 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_unpack)
NOTE: Running task 1825 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: Running task 1827 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_fetch)
NOTE: recipe gpgme-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 1848 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_unpack)
NOTE: Running task 1849 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: Running task 1850 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1859 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: Running task 1860 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_fetch)
NOTE: Running task 1861 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: Running task 1866 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_fetch)
NOTE: Running task 1867 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_collect_spdx_deps)
NOTE: recipe librepo-1.15.1-r0: task do_fetch: Started
NOTE: Running task 1872 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe libsolv-0.7.24-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1879 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 1883 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe libcomps-0.1.19-r0: task do_fetch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Started
NOTE: Running task 1884 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: Running task 1885 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1897 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.4.0.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1915 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe libdnf-0.70.1-r0: task do_fetch: Started
NOTE: recipe json-c-0.16-r0: task do_unpack: Started
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Succeeded
NOTE: Running task 1931 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1932 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1933 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1934 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_unpack: Started
NOTE: recipe libksba-1.6.3-r0: task do_fetch: Started
NOTE: recipe libsolv-0.7.24-r0: task do_fetch: Succeeded
NOTE: Running task 1935 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.15.1.bb:do_unpack)
NOTE: Running task 1944 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_collect_spdx_deps)
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: recipe dnf-4.16.1-r0: task do_fetch: Started
NOTE: recipe json-c-0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1945 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_unpack)
NOTE: recipe libksba-1.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 1946 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_unpack)
NOTE: Running task 1947 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_unpack)
NOTE: Running task 1948 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Started
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1962 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: Running task 1963 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.70.1-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: Running task 1964 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: Running task 1967 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_collect_spdx_deps)
NOTE: Running task 1968 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_unpack)
NOTE: Running task 1969 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe gnupg-2.4.0-r0: task do_fetch: Started
NOTE: Running task 1970 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_patch)
NOTE: Running task 1971 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb:do_unpack)
NOTE: Running task 1972 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_unpack)
NOTE: Running task 1973 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1974 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_collect_spdx_deps)
NOTE: recipe gnupg-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2004 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_collect_spdx_deps)
NOTE: recipe libsolv-0.7.24-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.15.1-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Started
NOTE: recipe dnf-4.16.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2005 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: Running task 2006 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.4.0.bb:do_unpack)
NOTE: Running task 2010 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe file-5.44-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: Running task 2011 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_patch)
NOTE: recipe libcomps-0.1.19-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_patch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.3-r0: task do_unpack: Started
NOTE: Running task 2012 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe libdnf-0.70.1-r0: task do_unpack: Started
NOTE: recipe libksba-1.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2013 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running task 2014 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_unpack)
NOTE: Running task 2015 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2016 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2017 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_patch)
NOTE: Running task 2018 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_collect_spdx_deps)
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe gnupg-2.4.0-r0: task do_unpack: Started
NOTE: Running task 2029 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: Running task 2030 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_fetch)
NOTE: recipe file-5.44-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: Running task 2040 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_collect_spdx_deps)
NOTE: Running task 2041 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: Running task 2042 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_create_spdx)
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe dnf-4.16.1-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2043 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: Running task 2044 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_create_spdx)
NOTE: recipe libksba-1.6.3-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Started
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: Running task 2045 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_collect_spdx_deps)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2046 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe pinentry-1.2.1-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Succeeded
NOTE: Running task 2047 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_patch)
NOTE: Running task 2048 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pinentry-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Succeeded
NOTE: recipe file-5.44-r0: task do_create_spdx: Started
NOTE: Running task 2049 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_collect_spdx_deps)
NOTE: recipe gpgme-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: Running task 2050 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2051 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx)
NOTE: Running task 2052 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2053 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_collect_spdx_deps)
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_create_spdx: Started
NOTE: recipe libksba-1.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2054 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_patch)
NOTE: Running task 2055 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_collect_spdx_deps)
NOTE: Running task 2057 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: Running task 2058 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_unpack)
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Started
NOTE: recipe libksba-1.6.3-r0: task do_patch: Started
NOTE: Running task 2106 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_collect_spdx_deps)
NOTE: recipe libyaml-0.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-c-0.16-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Started
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2142 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: recipe pinentry-1.2.1-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe npth-1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-c-0.16-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-c-0.16-r0: task do_patch: Succeeded
NOTE: Running task 2143 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_generate_toolchain_file)
NOTE: Running task 2144 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 2145 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_unpack: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2146 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_patch)
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Succeeded
NOTE: Running task 2147 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2148 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.24-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe pinentry-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: recipe libdnf-0.70.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 2149 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2150 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: Running task 2151 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb:do_patch)
NOTE: Running task 2152 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_patch)
NOTE: Running task 2153 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libksba-1.6.3-r0: task do_patch: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_unpack: Succeeded
NOTE: recipe librepo-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2154 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: Running task 2155 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_patch)
NOTE: Running task 2156 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_collect_spdx_deps)
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: Running task 2157 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.15.1.bb:do_patch)
NOTE: Running task 2158 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 2159 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2160 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2161 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pinentry-1.2.1-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.70.1-r0: task do_patch: Started
NOTE: Running task 2162 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Started
NOTE: Running task 2163 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe libsolv-0.7.24-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libksba-1.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2164 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_generate_toolchain_file)
NOTE: Running task 2165 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_deploy_source_date_epoch)
NOTE: recipe libcomps-0.1.19-r0: task do_patch: Started
NOTE: recipe dnf-4.16.1-r0: task do_unpack: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe librepo-1.15.1-r0: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2166 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_patch)
NOTE: recipe file-5.44-r0: task do_create_spdx: Succeeded
NOTE: Running task 2167 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_configure)
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2168 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_configure)
NOTE: Running task 2169 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Succeeded
NOTE: Running task 2170 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libsolv-0.7.24-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-c-0.16-r0: task do_configure: Started
NOTE: recipe dnf-4.16.1-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.19-r0: task do_patch: Succeeded
NOTE: recipe pinentry-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2171 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: Running task 2172 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2173 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_generate_toolchain_file)
NOTE: Running task 2174 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2175 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure)
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2176 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe librepo-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 2177 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2178 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.15.1.bb:do_generate_toolchain_file)
NOTE: Running task 2179 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2180 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe pinentry-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2181 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.19-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2182 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe libcomps-0.1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librepo-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.15.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libdnf-0.70.1-r0: task do_patch: Succeeded
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: Running task 2183 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2184 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb:do_generate_toolchain_file)
NOTE: recipe dbus-1.14.6-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: Running task 2185 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_collect_spdx_deps)
NOTE: Running task 2186 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_collect_spdx_deps)
NOTE: Running task 2187 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2188 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe librepo-1.15.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2189 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_configure)
NOTE: recipe libdnf-0.70.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pinentry-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.70.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe gnupg-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2190 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.4.0.bb:do_patch)
NOTE: Running task 2191 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_configure)
NOTE: recipe librepo-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 2192 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libassuan-2.5.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdnf-0.70.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnupg-2.4.0-r0: task do_patch: Started
NOTE: recipe libdnf-0.70.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_configure: Started
NOTE: recipe libksba-1.6.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.16.1-r0: task do_patch: Succeeded
NOTE: Running task 2193 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: Running task 2194 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2195 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_generate_toolchain_file)
NOTE: Running task 2196 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_populate_lic)
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe dnf-4.16.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe dnf-4.16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.16.1-r0: task do_populate_lic: Started
NOTE: recipe dnf-4.16.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.16.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_populate_lic unihash changed to 8e40b17c03fd444766e547da0576ff83700bc4dbf8c679567dbfcc29d2109db1
NOTE: recipe libcomps-0.1.19-r0: task do_configure: Succeeded
NOTE: Running task 2197 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_compile)
NOTE: recipe dnf-4.16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2198 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 2199 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libcomps-0.1.19-r0: task do_compile: Started
NOTE: recipe gnupg-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2200 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe gnupg-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_compile: Succeeded
NOTE: Running task 2201 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 2202 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe libcomps-0.1.19-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2203 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 2204 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: Running task 2205 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe libcomps-0.1.19-r0: task do_install: Succeeded
NOTE: Running task 2206 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: Running task 2207 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_populate_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2208 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 2209 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: Running task 2210 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe libcomps-0.1.19-r0: task do_package: Started
NOTE: recipe libcomps-0.1.19-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2211 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2212 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe libcomps-0.1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2213 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 2214 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2215 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_configure)
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Started
NOTE: recipe nettle-3.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Succeeded
NOTE: Running task 2216 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2217 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 2218 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2219 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx)
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe libcomps-0.1.19-r0: task do_package: Succeeded
NOTE: Running task 2220 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_packagedata)
NOTE: recipe libcomps-0.1.19-r0: task do_packagedata: Started
NOTE: recipe json-c-0.16-r0: task do_configure: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2221 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_configure_ptest_base)
NOTE: Running task 2222 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_collect_spdx_deps)
NOTE: recipe libcomps-0.1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2223 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_create_spdx)
NOTE: recipe json-c-0.16-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2224 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_package_write_rpm)
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Succeeded
NOTE: recipe json-c-0.16-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2225 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_compile)
NOTE: Running task 2226 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_install)
NOTE: recipe python3-iniparse-0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_create_spdx: Started
NOTE: recipe libcomps-0.1.19-r0: task do_package_write_rpm: Started
NOTE: recipe json-c-0.16-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Started
NOTE: recipe libcomps-0.1.19-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Succeeded
NOTE: Running task 2227 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package)
NOTE: Running task 2228 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_populate_sysroot)
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 2229 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe json-c-0.16-r0: task do_compile: Succeeded
NOTE: Running task 2230 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_compile_ptest_base)
NOTE: recipe libcomps-0.1.19-r0: task do_package_write_rpm: Succeeded
NOTE: recipe json-c-0.16-r0: task do_compile_ptest_base: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2231 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe json-c-0.16-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2232 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Succeeded
NOTE: Running task 2233 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2234 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_create_spdx)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe json-c-0.16-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe json-c-0.16-r0: task do_install: Succeeded
NOTE: Running task 2235 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_install_ptest_base)
NOTE: Running task 2236 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe json-c-0.16-r0: task do_install_ptest_base: Started
NOTE: recipe libarchive-3.6.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Succeeded
NOTE: Running task 2237 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_packagedata)
NOTE: recipe json-c-0.16-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2238 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_populate_sysroot)
NOTE: Running task 2239 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2240 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_create_spdx)
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Started
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_create_spdx: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2241 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_create_spdx)
NOTE: Running task 2242 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_rpm)
NOTE: recipe python3-iniparse-0.5-r0: task do_create_spdx: Started
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2243 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot)
NOTE: Running task 2244 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2245 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Succeeded
NOTE: Running task 2246 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2247 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2248 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 2249 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Running task 2250 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: Running task 2251 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2252 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: Running task 2253 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_compile)
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2254 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Succeeded
NOTE: Running task 2255 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install_ptest_base)
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Started
NOTE: recipe libksba-1.6.3-r0: task do_configure: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 2256 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_compile)
NOTE: Running task 2257 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_compile)
NOTE: Running task 2258 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_compile: Started
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2259 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot)
NOTE: Running task 2260 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package)
NOTE: recipe json-c-0.16-r0: task do_package: Succeeded
NOTE: Running task 2261 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Started
NOTE: recipe json-c-0.16-r0: task do_packagedata: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Succeeded
NOTE: Running task 2262 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_install)
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2263 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: Running task 2264 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe json-c-0.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2265 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: Running task 2266 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe json-c-0.16-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2267 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Succeeded
NOTE: Running task 2268 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot)
NOTE: Running task 2269 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_package)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Started
NOTE: Running task 2270 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_install)
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Started
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: Running task 2271 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 2272 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: recipe libassuan-2.5.5-r0: task do_install: Started
NOTE: recipe json-c-0.16-r0: task do_create_spdx: Succeeded
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2273 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx)
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_install: Succeeded
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2274 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: Running task 2275 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_populate_sysroot)
NOTE: Running task 2276 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package)
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2277 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 2278 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2279 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2280 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pinentry-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_compile: Succeeded
NOTE: Running task 2281 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pinentry-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2282 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_configure)
NOTE: recipe libksba-1.6.3-r0: task do_install: Started
NOTE: recipe pinentry-1.2.1-r0: task do_configure: Started
NOTE: recipe gpgme-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2283 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_configure)
NOTE: recipe gpgme-1.20.0-r0: task do_configure: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Succeeded
NOTE: Running task 2284 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: Running task 2285 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe libksba-1.6.3-r0: task do_install: Succeeded
NOTE: Running task 2286 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_package)
NOTE: Running task 2287 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_populate_sysroot)
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2288 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe libksba-1.6.3-r0: task do_populate_sysroot: Started
NOTE: recipe libksba-1.6.3-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2289 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_create_spdx)
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2290 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_create_spdx)
NOTE: recipe gtk-doc-1.33.2-r0: task do_create_spdx: Started
NOTE: recipe npth-1.6-r0: task do_create_spdx: Started
NOTE: recipe libksba-1.6.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_package: Succeeded
NOTE: Running task 2291 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2292 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_create_spdx)
NOTE: recipe libassuan-2.5.5-r0: task do_create_spdx: Started
NOTE: recipe libassuan-2.5.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Succeeded
NOTE: Running task 2293 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_collect_spdx_deps)
NOTE: Running task 2294 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata)
NOTE: recipe gpgme-1.20.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2295 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Started
NOTE: recipe libksba-1.6.3-r0: task do_package: Succeeded
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2296 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_packagedata)
NOTE: Running task 2297 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2298 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libksba-1.6.3-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libksba-1.6.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2299 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_create_spdx)
NOTE: recipe libksba-1.6.3-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2300 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_spdx: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2301 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2302 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libksba-1.6.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_spdx: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2303 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2304 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx)
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 2305 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Succeeded
NOTE: recipe pinentry-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2306 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_compile)
NOTE: recipe pinentry-1.2.1-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 2307 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: Running task 2308 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: recipe pinentry-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2309 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_install)
NOTE: recipe pinentry-1.2.1-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2310 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pinentry-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2311 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_package)
NOTE: recipe pinentry-1.2.1-r0: task do_package: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2312 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe libmodulemd-2.14.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: Running task 2313 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe pinentry-1.2.1-r0: task do_package: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: Running task 2314 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_packagedata)
NOTE: recipe pinentry-1.2.1-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_configure: Succeeded
NOTE: Running task 2315 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_create_spdx)
NOTE: Running task 2316 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure_ptest_base)
NOTE: recipe pinentry-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.6-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2317 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_compile)
NOTE: recipe dbus-1.14.6-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2318 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_collect_spdx_deps)
NOTE: recipe libmodulemd-2.14.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2319 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libmodulemd-2.14.0-r0: task do_compile: Started
NOTE: recipe gpgme-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2320 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_compile)
NOTE: recipe gpgme-1.20.0-r0: task do_compile: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2321 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.14.0-r0: task do_install: Started
NOTE: recipe dbus-1.14.6-r0: task do_compile: Succeeded
NOTE: Running task 2322 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2323 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_install)
NOTE: recipe libmodulemd-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2324 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: Running task 2325 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: recipe libmodulemd-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.6-r0: task do_install: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_package: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2326 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2327 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_create_spdx)
NOTE: recipe libmodulemd-2.14.0-r0: task do_create_spdx: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_install: Succeeded
NOTE: Running task 2328 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2329 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot)
NOTE: Running task 2330 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_package)
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.6-r0: task do_package: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_package: Succeeded
NOTE: Running task 2331 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata: Failed
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2331 tasks of which 2039 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-src went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-dbg went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-lib went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-common went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-tools went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-ptest went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-staticdev went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-dev went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-doc went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-locale went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/dbus/1.14.6-r0/temp/log.do_packagedata.211823
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata) failed with exit code '1'

--===============2090055460707505226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dnf/dnf-bash-completion: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-dbg: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-dbg: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-dev: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-dev: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-doc: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-doc: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bn: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-da: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-de: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-el: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-es: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-he: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-id: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-it: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-or: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-si: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-th: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-src: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-src: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-staticdev: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-test-dep: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-test-main: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-test-main: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf: PKGSIZE changed from 950126 to 955026 (+1%)
packages/core2-32-poky-linux/dnf/dnf: FILELIST: added "/etc/dnf/protected.d/python3-dnf.conf"
packages/core2-32-poky-linux/dnf/dnf: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf: PKGV changed from 4.14.0 [default] to 4.16.1 [default]

--===============2090055460707505226==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.14.0-4.16.1.patch"

RnJvbSAyOTJiMzkyYWJlYzZjODY4YjMzMDMyZGY3OTNhOTlhMzY2NGY5OGUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMDg6NDE6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
bmY6IHVwZ3JhZGUgNC4xNC4wIC0+IDQuMTYuMQoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mL3tkbmZfNC4xNC4wLmJiID0+IGRuZl80LjE2LjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2RuZi97ZG5mXzQuMTQuMC5iYiA9PiBkbmZfNC4xNi4xLmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTQuMC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjE0LjAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTYuMS5iYgppbmRleCA2MmRmOGM0YWNl
Li5mZjc5NzAxZGM3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80
LjE0LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xNi4xLmJiCkBA
IC0xOCw3ICsxOCw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUt
bWFuYWdlbWVudC9kbmYuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaCBcCiAgICAgICAgICAg
ICIKIAotU1JDUkVWID0gImU1MDg3NWIzZjU3OTBmNzA3MjBiZGI2NzBlMWRkMmJmNGQ4Mjg3NDQi
CitTUkNSRVYgPSAiOTRiN2NjNzk1NjU4MDQwNWIyMTkzMjk1NDFkNmI0MGRiNjQ5OWNmMSIKIFVQ
U1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAogUyA9
ICIke1dPUktESVJ9L2dpdCIKLS0gCjIuMzkuMgoK

--===============2090055460707505226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:401449597c16696408f93f7d64d6611a1ddabc26"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 189 Local 25 Mirrors 0 Missed 164 Current 590 (13% match, 78% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 649 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 668 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_253.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 774 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_253.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1127 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: Running task 1290 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe systemd-1_253.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1322 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure_ptest_base)
NOTE: Running task 1391 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1393 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1585 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1643 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 1645 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 1683 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_fetch)
NOTE: Running task 1693 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1694 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1698 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: Running task 1699 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_fetch)
NOTE: Running task 1701 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1712 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1713 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1716 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.15.1.bb:do_fetch)
NOTE: Running task 1723 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile)
NOTE: Running task 1730 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: Running task 1744 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_fetch)
NOTE: Running task 1782 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1783 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_fetch)
NOTE: Running task 1784 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1785 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1788 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1798 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb:do_fetch)
NOTE: Running task 1799 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_fetch)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: Running task 1824 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_fetch)
NOTE: Running task 1853 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: Running task 1854 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: Running task 1855 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_fetch)
NOTE: Running task 1860 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_fetch)
NOTE: Running task 1861 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_collect_spdx_deps)
NOTE: Running task 1866 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_collect_spdx_deps)
NOTE: recipe json-c-0.16-r0: task do_fetch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: Running task 1887 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.4.0.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_fetch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe librepo-1.15.1-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1918 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_unpack)
NOTE: recipe gpgme-1.20.0-r0: task do_fetch: Started
NOTE: Running task 1919 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_unpack)
NOTE: Running task 1920 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1921 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1932 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.24-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: Running task 1942 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1943 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Started
NOTE: recipe gpgme-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Started
NOTE: recipe libcomps-0.1.19-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: Running task 1944 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 1945 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_unpack)
NOTE: Running task 1946 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: Running task 1947 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Succeeded
NOTE: Running task 1954 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe librepo-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Started
NOTE: recipe dnf-4.16.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1955 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libsolv-0.7.24-r0: task do_fetch: Succeeded
NOTE: recipe libdnf-0.70.1-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1956 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1957 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: Running task 1958 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.15.1.bb:do_unpack)
NOTE: Running task 1959 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_unpack)
NOTE: Running task 1960 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_unpack)
NOTE: Running task 1961 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1962 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1963 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_unpack)
NOTE: recipe libcomps-0.1.19-r0: task do_fetch: Succeeded
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: recipe libksba-1.6.3-r0: task do_fetch: Started
NOTE: recipe json-c-0.16-r0: task do_unpack: Started
NOTE: Running task 1964 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: Running task 1965 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_unpack)
NOTE: Running task 1966 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1967 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_fetch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: recipe gnupg-2.4.0-r0: task do_fetch: Started
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1968 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Started
NOTE: Running task 1969 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnupg-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dnf-4.16.1-r0: task do_fetch: Succeeded
NOTE: recipe file-5.44-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdnf-0.70.1-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: Running task 1972 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_unpack)
NOTE: Running task 1973 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: Running task 1974 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_unpack)
NOTE: Running task 1975 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1976 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe gpgme-1.20.0-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-c-0.16-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1977 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb:do_unpack)
NOTE: Running task 1978 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.4.0.bb:do_unpack)
NOTE: Running task 2006 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_collect_spdx_deps)
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe nettle-3.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe librepo-1.15.1-r0: task do_unpack: Started
NOTE: Running task 2007 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_patch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Started
NOTE: Running task 2008 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx)
NOTE: Running task 2012 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Started
NOTE: recipe libcomps-0.1.19-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.24-r0: task do_unpack: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2013 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2014 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2015 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: Running task 2016 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_patch)
NOTE: Running task 2017 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: Running task 2018 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2019 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: Running task 2020 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_collect_spdx_deps)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dnf-4.16.1-r0: task do_unpack: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2030 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe libksba-1.6.3-r0: task do_unpack: Started
NOTE: recipe gnupg-2.4.0-r0: task do_unpack: Started
NOTE: Running task 2031 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_create_spdx)
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Started
NOTE: Running task 2033 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_fetch)
NOTE: Running task 2034 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: Running task 2044 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_collect_spdx_deps)
NOTE: recipe libarchive-3.6.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2045 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_collect_spdx_deps)
NOTE: Running task 2046 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_collect_spdx_deps)
NOTE: Running task 2047 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: Running task 2076 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: Running task 2077 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_collect_spdx_deps)
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2078 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: Running task 2099 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_collect_spdx_deps)
NOTE: recipe libksba-1.6.3-r0: task do_unpack: Succeeded
NOTE: recipe pinentry-1.2.1-r0: task do_fetch: Started
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_create_spdx: Started
NOTE: Running task 2114 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_patch)
NOTE: recipe pinentry-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Succeeded
NOTE: Running task 2136 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2137 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: Running task 2138 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_patch)
NOTE: Running task 2139 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_collect_spdx_deps)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdnf-0.70.1-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_patch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe pinentry-1.2.1-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-six-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.14.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libyaml-0.2.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libksba-1.6.3-r0: task do_patch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libksba-1.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2140 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2141 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Succeeded
NOTE: recipe librepo-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 2142 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2143 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: Running task 2144 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.15.1.bb:do_patch)
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-c-0.16-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2145 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pinentry-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2146 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_patch)
NOTE: Running task 2147 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-c-0.16-r0: task do_patch: Succeeded
NOTE: Running task 2148 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.19-r0: task do_unpack: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_unpack: Succeeded
NOTE: recipe librepo-1.15.1-r0: task do_patch: Started
NOTE: Running task 2149 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_generate_toolchain_file)
NOTE: Running task 2150 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 2151 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe dnf-4.16.1-r0: task do_unpack: Succeeded
NOTE: Running task 2152 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_patch)
NOTE: Running task 2153 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Started
NOTE: Running task 2154 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_patch)
NOTE: Running task 2155 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_patch)
NOTE: Running task 2156 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe pinentry-1.2.1-r0: task do_patch: Started
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsolv-0.7.24-r0: task do_patch: Started
NOTE: Running task 2157 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2158 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 2159 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2160 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libksba-1.6.3-r0: task do_patch: Succeeded
NOTE: recipe dnf-4.16.1-r0: task do_patch: Started
NOTE: Running task 2161 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: Running task 2162 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2163 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe file-5.44-r0: task do_create_spdx: Succeeded
NOTE: Running task 2164 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.24-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: Running task 2165 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_generate_toolchain_file)
NOTE: Running task 2166 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_deploy_source_date_epoch)
NOTE: recipe librepo-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2167 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2168 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.15.1.bb:do_generate_toolchain_file)
NOTE: recipe pinentry-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2169 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libcomps-0.1.19-r0: task do_patch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2170 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2171 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_configure)
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2172 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2173 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2174 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.70.1-r0: task do_unpack: Succeeded
NOTE: recipe pinentry-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2175 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe librepo-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2176 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure)
NOTE: recipe librepo-1.15.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: Running task 2177 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb:do_patch)
NOTE: Running task 2178 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_generate_toolchain_file)
NOTE: recipe libsolv-0.7.24-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Started
NOTE: recipe libksba-1.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2179 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2180 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe librepo-1.15.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2181 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_configure: Started
NOTE: recipe libdnf-0.70.1-r0: task do_patch: Started
NOTE: Running task 2182 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_collect_spdx_deps)
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2183 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: Running task 2184 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: Running task 2185 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_collect_spdx_deps)
NOTE: recipe libsolv-0.7.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pinentry-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2186 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_collect_spdx_deps)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe libksba-1.6.3-r0: task do_configure: Started
NOTE: recipe dnf-4.16.1-r0: task do_patch: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2187 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2188 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_generate_toolchain_file)
NOTE: Running task 2189 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_populate_lic)
NOTE: recipe librepo-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2190 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: Running task 2191 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_configure)
NOTE: recipe libassuan-2.5.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libksba-1.6.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcomps-0.1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2192 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: recipe dnf-4.16.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe dnf-4.16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2193 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot)
NOTE: Running task 2194 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dnf-4.16.1-r0: task do_populate_lic: Started
NOTE: recipe gpgme-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2195 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libassuan-2.5.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Started
NOTE: recipe dnf-4.16.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libcomps-0.1.19-r0: task do_configure: Started
NOTE: recipe gnupg-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2196 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.4.0.bb:do_patch)
NOTE: recipe libdnf-0.70.1-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2197 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe dnf-4.16.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 2198 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2199 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb:do_generate_toolchain_file)
NOTE: recipe gpgme-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_populate_lic unihash changed to 8e40b17c03fd444766e547da0576ff83700bc4dbf8c679567dbfcc29d2109db1
NOTE: recipe gnupg-2.4.0-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe libdnf-0.70.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe dnf-4.16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.70.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.70.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.70.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_configure: Succeeded
NOTE: Running task 2200 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_compile)
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 2201 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gnupg-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2202 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcomps-0.1.19-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2203 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe libcomps-0.1.19-r0: task do_compile: Succeeded
NOTE: Running task 2204 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2205 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 2206 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 2207 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Running task 2208 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata)
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: recipe libcomps-0.1.19-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Started
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2209 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2210 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx)
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcomps-0.1.19-r0: task do_install: Succeeded
NOTE: Running task 2211 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_package)
NOTE: Running task 2212 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_populate_sysroot)
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 2213 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 2214 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2215 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe libcomps-0.1.19-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.19-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2216 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2217 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe libcomps-0.1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2218 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Succeeded
NOTE: Running task 2219 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2220 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2221 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 2222 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2223 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe nettle-3.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2224 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_collect_spdx_deps)
NOTE: recipe python3-iniparse-0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 2225 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Succeeded
NOTE: Running task 2226 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_install)
NOTE: recipe libcomps-0.1.19-r0: task do_package: Succeeded
NOTE: Running task 2227 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Started
NOTE: recipe libcomps-0.1.19-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2228 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_create_spdx)
NOTE: Running task 2229 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_package_write_rpm)
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Succeeded
NOTE: Running task 2230 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package)
NOTE: recipe libcomps-0.1.19-r0: task do_create_spdx: Started
NOTE: Running task 2231 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_populate_sysroot)
NOTE: recipe libcomps-0.1.19-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Started
NOTE: recipe json-c-0.16-r0: task do_configure: Succeeded
NOTE: Running task 2232 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_configure_ptest_base)
NOTE: recipe json-c-0.16-r0: task do_configure_ptest_base: Started
NOTE: recipe json-c-0.16-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2233 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_compile)
NOTE: recipe libcomps-0.1.19-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 2234 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2235 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_create_spdx)
NOTE: recipe libarchive-3.6.2-r0: task do_create_spdx: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2236 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe json-c-0.16-r0: task do_compile: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: Running task 2237 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_compile_ptest_base)
NOTE: recipe json-c-0.16-r0: task do_compile_ptest_base: Started
NOTE: recipe json-c-0.16-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2238 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_install)
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Succeeded
NOTE: Running task 2239 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe json-c-0.16-r0: task do_install: Started
NOTE: Running task 2240 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe json-c-0.16-r0: task do_install: Succeeded
NOTE: Running task 2241 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_install_ptest_base)
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2242 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_create_spdx)
NOTE: Running task 2243 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_rpm)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2244 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_create_spdx)
NOTE: recipe json-c-0.16-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_create_spdx: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Started
NOTE: recipe lua-5.4.4-r0: task do_create_spdx: Started
NOTE: recipe json-c-0.16-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2245 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_populate_sysroot)
NOTE: Running task 2246 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_package)
NOTE: recipe python3-iniparse-0.5-r0: task do_create_spdx: Succeeded
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2247 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Succeeded
NOTE: Running task 2248 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile_ptest_base)
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Succeeded
NOTE: Running task 2249 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_compile)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2250 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2251 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2252 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 2253 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe libksba-1.6.3-r0: task do_configure: Succeeded
NOTE: Running task 2254 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_compile: Started
NOTE: Running task 2255 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 2256 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Started
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: Running task 2257 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Succeeded
NOTE: Running task 2258 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Succeeded
NOTE: Running task 2259 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_install)
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2260 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot)
NOTE: Running task 2261 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package)
NOTE: recipe json-c-0.16-r0: task do_package: Succeeded
NOTE: Running task 2262 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Succeeded
NOTE: Running task 2263 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: Running task 2264 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot)
NOTE: Running task 2265 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_package)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Started
NOTE: recipe json-c-0.16-r0: task do_packagedata: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2266 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 2267 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2268 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe libassuan-2.5.5-r0: task do_install: Started
NOTE: recipe json-c-0.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2269 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe json-c-0.16-r0: task do_create_spdx: Started
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: Running task 2270 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 2271 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2272 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 2273 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_populate_sysroot)
NOTE: Running task 2274 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package)
NOTE: recipe json-c-0.16-r0: task do_create_spdx: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2275 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx)
NOTE: recipe libksba-1.6.3-r0: task do_compile: Succeeded
NOTE: Running task 2276 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx: Started
NOTE: recipe libksba-1.6.3-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2277 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2278 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2279 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe gpgme-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pinentry-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2280 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 2281 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe pinentry-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2282 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_configure)
NOTE: recipe libksba-1.6.3-r0: task do_install: Succeeded
NOTE: Running task 2283 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_package)
NOTE: Running task 2284 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_populate_sysroot)
NOTE: recipe pinentry-1.2.1-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_populate_sysroot: Started
NOTE: Running task 2285 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libksba-1.6.3-r0: task do_package: Started
NOTE: recipe gpgme-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2286 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_configure)
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: Running task 2287 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_packagedata)
NOTE: recipe gpgme-1.20.0-r0: task do_configure: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Started
NOTE: recipe libksba-1.6.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2288 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_create_spdx)
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: Running task 2289 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe gtk-doc-1.33.2-r0: task do_create_spdx: Started
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_package: Succeeded
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2290 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_create_spdx)
NOTE: Running task 2291 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_create_spdx: Started
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Started
NOTE: recipe npth-1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2292 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_create_spdx)
NOTE: recipe libassuan-2.5.5-r0: task do_create_spdx: Started
NOTE: recipe libassuan-2.5.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2293 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_collect_spdx_deps)
NOTE: recipe gpgme-1.20.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libksba-1.6.3-r0: task do_package: Succeeded
NOTE: Running task 2294 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_packagedata)
NOTE: recipe gpgme-1.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Succeeded
NOTE: Running task 2295 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2296 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Started
NOTE: recipe libksba-1.6.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2297 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_create_spdx)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libksba-1.6.3-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2298 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_create_spdx)
NOTE: recipe libksba-1.6.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2299 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2300 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2301 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2302 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_spdx: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2303 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2304 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx)
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Succeeded
NOTE: recipe pinentry-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2305 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_compile)
NOTE: recipe pinentry-1.2.1-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 2306 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe pinentry-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2307 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_install)
NOTE: recipe pinentry-1.2.1-r0: task do_install: Started
NOTE: recipe pinentry-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2308 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_package)
NOTE: recipe pinentry-1.2.1-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 2309 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: Running task 2310 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2311 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2312 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe dbus-1.14.6-r0: task do_configure: Succeeded
NOTE: Running task 2313 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure_ptest_base)
NOTE: recipe libmodulemd-2.14.0-r0: task do_configure: Started
NOTE: recipe pinentry-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2314 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_packagedata)
NOTE: recipe dbus-1.14.6-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2315 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_compile)
NOTE: recipe pinentry-1.2.1-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.6-r0: task do_compile: Started
NOTE: recipe pinentry-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: Running task 2316 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2317 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2318 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_collect_spdx_deps)
NOTE: recipe libmodulemd-2.14.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2319 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libmodulemd-2.14.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_compile: Started
NOTE: recipe gpgme-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2320 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_compile)
NOTE: recipe gpgme-1.20.0-r0: task do_compile: Started
NOTE: recipe dbus-1.14.6-r0: task do_compile: Succeeded
NOTE: Running task 2321 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2322 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_install)
NOTE: recipe dbus-1.14.6-r0: task do_install: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2323 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.14.0-r0: task do_install: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2324 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: Running task 2325 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: recipe libmodulemd-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_package: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_install: Succeeded
NOTE: Running task 2326 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2327 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot)
NOTE: Running task 2328 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_package)
NOTE: recipe libmodulemd-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2329 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.6-r0: task do_package: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2330 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_create_spdx)
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_create_spdx: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_package: Succeeded
NOTE: Running task 2331 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata: Failed
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2331 tasks of which 2041 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-src went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-dbg went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-lib went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-common went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-tools went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-ptest went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-staticdev went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-dev went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-doc went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-locale went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/dbus/1.14.6-r0/temp/log.do_packagedata.363900
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata) failed with exit code '1'

--===============2090055460707505226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 69 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:401449597c16696408f93f7d64d6611a1ddabc26"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 189 Local 25 Mirrors 0 Missed 164 Current 590 (13% match, 78% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 649 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 668 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_253.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 774 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_253.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1127 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: Running task 1290 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe systemd-1_253.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1322 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure_ptest_base)
NOTE: Running task 1391 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1393 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1585 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: Running task 1643 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1645 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_fetch)
NOTE: Running task 1657 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile)
NOTE: Running task 1658 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1659 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1660 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1661 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1688 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_fetch)
NOTE: Running task 1701 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: Running task 1702 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_fetch)
NOTE: Running task 1704 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 1717 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.15.1.bb:do_fetch)
NOTE: Running task 1730 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: Running task 1744 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_fetch)
NOTE: Running task 1782 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1783 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_fetch)
NOTE: Running task 1784 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1785 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1788 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1798 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb:do_fetch)
NOTE: Running task 1799 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_fetch)
NOTE: Running task 1824 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_fetch)
NOTE: recipe json-c-0.16-r0: task do_fetch: Started
NOTE: Running task 1853 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: Running task 1854 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: Running task 1855 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_fetch)
NOTE: Running task 1860 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_fetch)
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 1861 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Started
NOTE: Running task 1862 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_unpack)
NOTE: Running task 1863 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe librepo-1.15.1-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe gpgme-1.20.0-r0: task do_fetch: Started
NOTE: Running task 1868 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_collect_spdx_deps)
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 1869 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_unpack)
NOTE: Running task 1870 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gpgme-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe libcomps-0.1.19-r0: task do_fetch: Started
NOTE: Running task 1871 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe libsolv-0.7.24-r0: task do_fetch: Started
NOTE: Running task 1872 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: Running task 1873 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Started
NOTE: recipe libdnf-0.70.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1874 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_unpack)
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1883 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_unpack)
NOTE: Running task 1884 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1885 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1886 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1899 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.4.0.bb:do_fetch)
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Started
NOTE: recipe dnf-4.16.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1940 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_collect_spdx_deps)
NOTE: recipe librepo-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: recipe libksba-1.6.3-r0: task do_fetch: Started
NOTE: recipe json-c-0.16-r0: task do_unpack: Started
NOTE: Running task 1941 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Succeeded
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_fetch: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 1942 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: Running task 1943 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: Running task 1944 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.15.1.bb:do_unpack)
NOTE: Running task 1945 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.24-r0: task do_fetch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Started
NOTE: recipe libdnf-0.70.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1946 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: Running task 1947 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_unpack)
NOTE: Running task 1948 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: Running task 1949 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_unpack)
NOTE: Running task 1950 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_unpack)
NOTE: Running task 1951 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe dnf-4.16.1-r0: task do_fetch: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Started
NOTE: Running task 1952 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb:do_unpack)
NOTE: Running task 1953 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: Running task 1954 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_unpack)
NOTE: Running task 1955 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.16-r0: task do_unpack: Succeeded
NOTE: recipe gnupg-2.4.0-r0: task do_fetch: Started
NOTE: Running task 1956 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_unpack)
NOTE: Running task 1957 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1958 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnupg-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1974 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_collect_spdx_deps)
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe file-5.44-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1975 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_patch)
NOTE: Running task 1976 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe librepo-1.15.1-r0: task do_unpack: Started
NOTE: Running task 2006 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_collect_spdx_deps)
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe libsolv-0.7.24-r0: task do_unpack: Started
NOTE: recipe libcomps-0.1.19-r0: task do_unpack: Started
NOTE: Running task 2008 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_patch)
NOTE: Running task 2009 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: Running task 2010 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx)
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Started
NOTE: recipe libdnf-0.70.1-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Started
NOTE: Running task 2011 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe libksba-1.6.3-r0: task do_unpack: Started
NOTE: recipe libcomps-0.1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2012 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.4.0.bb:do_unpack)
NOTE: Running task 2015 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Succeeded
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: recipe dnf-4.16.1-r0: task do_unpack: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe nettle-3.8.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2016 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2017 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_create_spdx)
NOTE: Running task 2018 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_collect_spdx_deps)
NOTE: Running task 2019 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_patch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: Running task 2020 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: Running task 2021 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_collect_spdx_deps)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Started
NOTE: recipe gnupg-2.4.0-r0: task do_unpack: Started
NOTE: recipe libksba-1.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 2032 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_fetch)
NOTE: Running task 2033 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Started
NOTE: Running task 2042 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.44-r0: task do_create_spdx: Started
NOTE: Running task 2043 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_patch)
NOTE: Running task 2044 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2045 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2046 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: Running task 2048 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Started
NOTE: Running task 2049 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_collect_spdx_deps)
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2050 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: Running task 2051 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2052 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_collect_spdx_deps)
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: Running task 2053 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe pinentry-1.2.1-r0: task do_fetch: Started
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: Running task 2054 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_collect_spdx_deps)
NOTE: recipe libksba-1.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_create_spdx: Started
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pinentry-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_patch: Started
NOTE: Running task 2056 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2057 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: recipe json-c-0.16-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2058 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_patch)
NOTE: Running task 2059 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_unpack)
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2107 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_collect_spdx_deps)
NOTE: recipe gtk-doc-1.33.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libyaml-0.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-c-0.16-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Succeeded
NOTE: Running task 2143 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.16-r0: task do_patch: Succeeded
NOTE: Running task 2144 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2145 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_generate_toolchain_file)
NOTE: Running task 2146 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcomps-0.1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 2147 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.15.1.bb:do_patch)
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2148 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe libsolv-0.7.24-r0: task do_unpack: Succeeded
NOTE: Running task 2149 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: Running task 2150 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_patch)
NOTE: recipe libdnf-0.70.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_patch: Succeeded
NOTE: Running task 2151 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb:do_patch)
NOTE: Running task 2152 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2153 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: recipe pinentry-1.2.1-r0: task do_unpack: Started
NOTE: recipe npth-1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gpgme-1.20.0-r0: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.24-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librepo-1.15.1-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2154 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe npth-1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.70.1-r0: task do_patch: Started
NOTE: Running task 2155 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libcomps-0.1.19-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_create_spdx: Succeeded
NOTE: recipe dnf-4.16.1-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2156 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_patch)
NOTE: Running task 2157 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_collect_spdx_deps)
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2158 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_patch)
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 2159 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2160 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 2161 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2162 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2163 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2164 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe pinentry-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2165 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_configure)
NOTE: Running task 2166 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2167 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libsolv-0.7.24-r0: task do_patch: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_patch: Started
NOTE: Running task 2168 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_generate_toolchain_file)
NOTE: Running task 2169 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.14.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2170 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_deploy_source_date_epoch)
NOTE: recipe dnf-4.16.1-r0: task do_patch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe librepo-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2171 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2172 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.15.1.bb:do_generate_toolchain_file)
NOTE: recipe pinentry-1.2.1-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_configure: Started
NOTE: recipe libksba-1.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2173 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_configure)
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2174 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_patch: Succeeded
NOTE: Running task 2175 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure)
NOTE: recipe librepo-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.15.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2176 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2177 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_generate_toolchain_file)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_configure: Started
NOTE: Running task 2178 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2179 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2180 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe librepo-1.15.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libdnf-0.70.1-r0: task do_patch: Succeeded
NOTE: Running task 2181 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2182 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb:do_generate_toolchain_file)
NOTE: recipe pinentry-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2183 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2184 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_collect_spdx_deps)
NOTE: recipe libcomps-0.1.19-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2185 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: Running task 2186 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: recipe libcomps-0.1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.6-r0: task do_configure: Started
NOTE: Running task 2187 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_collect_spdx_deps)
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 2188 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_collect_spdx_deps)
NOTE: recipe libdnf-0.70.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.70.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2189 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_configure)
NOTE: recipe libcomps-0.1.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe librepo-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pinentry-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2190 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe libdnf-0.70.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2191 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe libksba-1.6.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: recipe dnf-4.16.1-r0: task do_patch: Succeeded
NOTE: Running task 2192 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2193 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_generate_toolchain_file)
NOTE: Running task 2194 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_populate_lic)
NOTE: Running task 2195 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: Running task 2196 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe libassuan-2.5.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.70.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2197 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe libksba-1.6.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pinentry-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.16.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe dnf-4.16.1-r0: task do_populate_lic: Started
NOTE: recipe dnf-4.16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: Running task 2198 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.4.0.bb:do_patch)
NOTE: recipe libcomps-0.1.19-r0: task do_configure: Started
NOTE: recipe dnf-4.16.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe gnupg-2.4.0-r0: task do_patch: Started
NOTE: recipe dnf-4.16.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 2199 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_populate_lic unihash changed to 8e40b17c03fd444766e547da0576ff83700bc4dbf8c679567dbfcc29d2109db1
NOTE: recipe gpgme-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe libcomps-0.1.19-r0: task do_configure: Succeeded
NOTE: Running task 2200 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2201 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_compile)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnupg-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 2202 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libcomps-0.1.19-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2203 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe libcomps-0.1.19-r0: task do_compile: Succeeded
NOTE: Running task 2204 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Running task 2205 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 2206 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: Running task 2207 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata)
NOTE: recipe libcomps-0.1.19-r0: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 2208 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2209 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx)
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2210 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: Running task 2211 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcomps-0.1.19-r0: task do_install: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Started
NOTE: Running task 2212 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_package)
NOTE: Running task 2213 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcomps-0.1.19-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2214 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe libcomps-0.1.19-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 2215 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 2216 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libcomps-0.1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2217 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: Running task 2218 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2219 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Succeeded
NOTE: Running task 2220 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_compile)
NOTE: Running task 2221 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2222 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2223 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx)
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe nettle-3.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2224 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 2225 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe python3-iniparse-0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe libcomps-0.1.19-r0: task do_package: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2226 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Succeeded
NOTE: Running task 2227 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_install)
NOTE: recipe libcomps-0.1.19-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Started
NOTE: recipe json-c-0.16-r0: task do_configure: Succeeded
NOTE: Running task 2228 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_configure_ptest_base)
NOTE: recipe libcomps-0.1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2229 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_create_spdx)
NOTE: Running task 2230 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb:do_package_write_rpm)
NOTE: recipe json-c-0.16-r0: task do_configure_ptest_base: Started
NOTE: recipe json-c-0.16-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2231 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_compile)
NOTE: recipe libcomps-0.1.19-r0: task do_create_spdx: Started
NOTE: recipe libcomps-0.1.19-r0: task do_package_write_rpm: Started
NOTE: recipe json-c-0.16-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Succeeded
NOTE: Running task 2232 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package)
NOTE: Running task 2233 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_populate_sysroot)
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Started
NOTE: recipe libcomps-0.1.19-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_compile: Succeeded
NOTE: Running task 2234 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_compile_ptest_base)
NOTE: recipe json-c-0.16-r0: task do_compile_ptest_base: Started
NOTE: recipe json-c-0.16-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2235 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 2236 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2237 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe json-c-0.16-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe libcomps-0.1.19-r0: task do_package_write_rpm: Succeeded
NOTE: recipe json-c-0.16-r0: task do_install: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Succeeded
NOTE: Running task 2238 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_install_ptest_base)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2239 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_packagedata)
NOTE: Running task 2240 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_create_spdx)
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.2-r0: task do_create_spdx: Started
NOTE: recipe json-c-0.16-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2241 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: Running task 2242 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_create_spdx)
NOTE: Running task 2243 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_rpm)
NOTE: recipe json-c-0.16-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2244 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_populate_sysroot)
NOTE: Running task 2245 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_package)
NOTE: recipe python3-iniparse-0.5-r0: task do_create_spdx: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Started
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2246 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_create_spdx)
NOTE: recipe libarchive-3.6.2-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_create_spdx: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_create_spdx: Succeeded
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Succeeded
NOTE: Running task 2247 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2248 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2249 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Succeeded
NOTE: Running task 2250 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: recipe libksba-1.6.3-r0: task do_configure: Succeeded
NOTE: Running task 2251 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: Running task 2252 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2253 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 2254 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe libksba-1.6.3-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Succeeded
NOTE: Running task 2255 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install_ptest_base)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2256 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Started
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 2257 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_compile)
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: Running task 2258 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot)
NOTE: Running task 2259 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package)
NOTE: Running task 2260 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: recipe json-c-0.16-r0: task do_package: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: Running task 2261 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Succeeded
NOTE: Running task 2262 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_install)
NOTE: recipe json-c-0.16-r0: task do_packagedata: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Started
NOTE: recipe json-c-0.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2263 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_create_spdx: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Succeeded
NOTE: Running task 2264 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot)
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2265 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_package)
NOTE: Running task 2266 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: Running task 2267 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2268 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 2269 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe libassuan-2.5.5-r0: task do_install: Started
NOTE: recipe json-c-0.16-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: Running task 2270 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 2271 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2272 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 2273 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_populate_sysroot)
NOTE: Running task 2274 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2275 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx)
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2276 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe libksba-1.6.3-r0: task do_compile: Succeeded
NOTE: Running task 2277 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe libksba-1.6.3-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2278 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2279 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2280 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 2281 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe gpgme-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pinentry-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe pinentry-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2282 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_configure)
NOTE: recipe libksba-1.6.3-r0: task do_install: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Succeeded
NOTE: Running task 2283 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_package)
NOTE: recipe pinentry-1.2.1-r0: task do_configure: Started
NOTE: Running task 2284 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_populate_sysroot)
NOTE: Running task 2285 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_packagedata)
NOTE: recipe libksba-1.6.3-r0: task do_populate_sysroot: Started
NOTE: recipe libksba-1.6.3-r0: task do_package: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2286 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_configure: Started
NOTE: Running task 2287 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2288 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_create_spdx)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_create_spdx: Started
NOTE: recipe libksba-1.6.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2289 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2290 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_create_spdx)
NOTE: recipe libassuan-2.5.5-r0: task do_package: Succeeded
NOTE: Running task 2291 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_create_spdx: Started
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Started
NOTE: recipe npth-1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2292 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_create_spdx)
NOTE: recipe libassuan-2.5.5-r0: task do_create_spdx: Started
NOTE: recipe libassuan-2.5.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2293 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Succeeded
NOTE: Running task 2294 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata)
NOTE: recipe gpgme-1.20.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Started
NOTE: recipe libksba-1.6.3-r0: task do_package: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2295 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_packagedata)
NOTE: recipe libksba-1.6.3-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2296 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Started
NOTE: recipe libksba-1.6.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2297 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.3.bb:do_create_spdx)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2298 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libksba-1.6.3-r0: task do_create_spdx: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libksba-1.6.3-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2299 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2300 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2301 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2302 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_create_spdx: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_spdx: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2303 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2304 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx)
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 2305 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe pinentry-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: Running task 2306 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_compile)
NOTE: recipe pinentry-1.2.1-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 2307 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: Running task 2308 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: recipe pinentry-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2309 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_install)
NOTE: recipe pinentry-1.2.1-r0: task do_install: Started
NOTE: recipe pinentry-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2310 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_package)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2311 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe pinentry-1.2.1-r0: task do_package: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2312 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe libmodulemd-2.14.0-r0: task do_configure: Started
NOTE: recipe pinentry-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2313 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_packagedata)
NOTE: recipe pinentry-1.2.1-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_configure: Succeeded
NOTE: Running task 2314 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: Running task 2315 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure_ptest_base)
NOTE: recipe pinentry-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.6-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2316 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_compile)
NOTE: recipe dbus-1.14.6-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2317 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2318 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_collect_spdx_deps)
NOTE: recipe libmodulemd-2.14.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2319 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libmodulemd-2.14.0-r0: task do_compile: Started
NOTE: recipe gpgme-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2320 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.20.0.bb:do_compile)
NOTE: recipe gpgme-1.20.0-r0: task do_compile: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2321 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.14.0-r0: task do_install: Started
NOTE: recipe dbus-1.14.6-r0: task do_compile: Succeeded
NOTE: Running task 2322 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2323 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_install)
NOTE: recipe dbus-1.14.6-r0: task do_install: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2324 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: Running task 2325 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: recipe libmodulemd-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_package: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2326 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2327 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_create_spdx)
NOTE: recipe libmodulemd-2.14.0-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.6-r0: task do_install: Succeeded
NOTE: Running task 2328 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_install_ptest_base: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2329 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot)
NOTE: Running task 2330 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_package)
NOTE: recipe dbus-1.14.6-r0: task do_package: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_package: Succeeded
NOTE: Running task 2331 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata: Failed
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: recipe gpgme-1.20.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2331 tasks of which 2041 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-src went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-dbg went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-lib went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-common went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-tools went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-ptest went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-staticdev went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-dev went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-doc went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus-locale went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: QA Issue: Package version for package dbus went backwards which would break package feeds (from 0:1.14.8-r0 to 0:1.14.6-r0) [version-going-backwards]
ERROR: dbus-1.14.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dbus/1.14.6-r0/temp/log.do_packagedata.878544
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata) failed with exit code '1'

--===============2090055460707505226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/dnf/dnf: FILELIST: added "/etc/dnf/protected.d/python3-dnf.conf"

--===============2090055460707505226==--

