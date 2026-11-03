Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5401.1793687202704283569
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 22:26:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CCSwJ0Yi;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4nHlQFUG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1a016a818-cb96055f-9bf2-4145-93f1-1584250a4084-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793687201;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sjgyLlZ6x+hKnR0IMgn86w2ovCA5yvwBPnOl68o5qyw=;
	b=CCSwJ0YigHvZ+wNukAlYCPZKNtFKjTQ9WjTR+ykWm5VgUuclW7GLwv2p6dsbqLpg
	dqR6aZ77UQ2+5ZzuoJDBMmkhIPXahVROlfPdfT/M6H6CaPy31vHoeIvIPO4iQQjnd/6
	woEn3/uNkbqeq+JBHvwl15H643CmF8wUzsX72bP0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793687201;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sjgyLlZ6x+hKnR0IMgn86w2ovCA5yvwBPnOl68o5qyw=;
	b=4nHlQFUGEREbXg/Yi+caBRMoGPvq7LPae7vsFZpVA1VxQI8QnB2TsDyafhJBI0IQ
	Tvx8ca7ByOGA8aTQ1SMBcWUzUNWSZXoboUU+1ifnLn8+4R9xHX10SsJjA7CzYe4awOZ
	AHrCZUJ+hv3+1Xk9RYjecRTFqGDEa3xCriHlG4L4=
Content-Type: multipart/mixed; boundary="===============0499260054777504957=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librepo: upgrading to 1.22.0 SUCCEEDED
Message-ID: <010101a1a016a818-cb96055f-9bf2-4145-93f1-1584250a4084-000000@us-west-2.amazonses.com>
Date: Tue, 3 Nov 2026 06:26:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.03-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 06:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249238

--===============0499260054777504957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *librepo* to *1.22.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-librepo-upgrade-1.21.3-1.22.0.patch
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
From aef276d5629efd5071ee62e617a9728235e5bab5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 3 Nov 2026 05:36:39 +0000
Subject: [PATCH] librepo: upgrade 1.21.3 -> 1.22.0

---
 ...2-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch | 2 +-
 .../librepo/{librepo_1.21.3.bb => librepo_1.22.0.bb}            | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.21.3.bb => librepo_1.22.0.bb} (100%)

diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index c7d23732ab..2b6c1c85b4 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
@@ -1,4 +1,4 @@
-From a6282ddaf4a7143866ef500db3bb334b599fa300 Mon Sep 17 00:00:00 2001
+From 66610d0a0c683ecdd2f39e3936f88624452590c1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:05:36 +0200
 Subject: [PATCH] Do not try to obtain PYTHON_INSTALL_DIR by running python.
diff --git a/meta/recipes-devtools/librepo/librepo_1.21.3.bb b/meta/recipes-devtools/librepo/librepo_1.22.0.bb
similarity index 100%
rename from meta/recipes-devtools/librepo/librepo_1.21.3.bb
rename to meta/recipes-devtools/librepo/librepo_1.22.0.bb
-- 
2.47.1


--===============0499260054777504957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/librepo: PV changed from "1.21.3" to "1.22.0"
packages/x86-64-v3-poky-linux/librepo: SRC_URI changed from "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https;tag=1.21.3 file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch" to "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https;tag=1.22.0 file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch"
packages/x86-64-v3-poky-linux/librepo: PKGV changed from 1.21.3 [default] to 1.22.0 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PV changed from "1.21.3" to "1.22.0"
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PKGV changed from 1.21.3 [default] to 1.22.0 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-dev: PV changed from "1.21.3" to "1.22.0"
packages/x86-64-v3-poky-linux/librepo/librepo-dev: PKGV changed from 1.21.3 [default] to 1.22.0 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-doc: PV changed from "1.21.3" to "1.22.0"
packages/x86-64-v3-poky-linux/librepo/librepo-doc: PKGV changed from 1.21.3 [default] to 1.22.0 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-locale: PV changed from "1.21.3" to "1.22.0"
packages/x86-64-v3-poky-linux/librepo/librepo-locale: PKGV changed from 1.21.3 [default] to 1.22.0 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-src: PV changed from "1.21.3" to "1.22.0"
packages/x86-64-v3-poky-linux/librepo/librepo-src: FILELIST: directory renamed /usr/src/debug/librepo/1.21.3/librepo/python -> /usr/src/debug/librepo/1.22.0/librepo/python, directory renamed /usr/src/debug/librepo/1.21.3/librepo -> /usr/src/debug/librepo/1.22.0/librepo
packages/x86-64-v3-poky-linux/librepo/librepo-src: PKGV changed from 1.21.3 [default] to 1.22.0 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-staticdev: PV changed from "1.21.3" to "1.22.0"
packages/x86-64-v3-poky-linux/librepo/librepo-staticdev: PKGV changed from 1.21.3 [default] to 1.22.0 [default]
packages/x86-64-v3-poky-linux/librepo/librepo: PV changed from "1.21.3" to "1.22.0"
packages/x86-64-v3-poky-linux/librepo/librepo: PKGV changed from 1.21.3 [default] to 1.22.0 [default]

--===============0499260054777504957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2003 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-642e163bda44a2d7608642fc717bb86df8269fe1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:642e163bda44a2d7608642fc717bb86df8269fe1"
meta-yocto-bsp       
meta-poky            = "master:dd6c2950bb507f8c311bd82410a032ed6eb38063"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 573 Local 511 Mirrors 0 Missed 62 Current 245 (89% match, 92% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 248 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 249 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 259 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 282 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_qa_setscene)
NOTE: Running setscene task 345 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 352 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 353 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 361 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_spdx_setscene)
NOTE: Running setscene task 364 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 376 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 380 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 385 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_create_spdx_setscene)
NOTE: recipe librepo-1.22.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe qemu-native-11.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gpgme-2.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gpgme-2.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_qa_setscene: Started
NOTE: recipe libgpg-error-native-1.61-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-native-11.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 392 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe librepo-1.22.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 397 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gpgme-2.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 401 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 402 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 406 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 407 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 412 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgpg-error-native-1.61-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 415 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 416 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 418 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 419 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gpgme-2.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 421 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 423 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe qemu-native-11.1.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libassuan-3.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 425 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_create_spdx_setscene)
NOTE: recipe qemu-native-11.1.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 426 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 427 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 429 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 430 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 431 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_create_spdx_setscene)
NOTE: recipe libassuan-3.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 432 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 434 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 435 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 437 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb:do_create_spdx_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gpgme-2.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 438 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 439 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 440 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gpgme-2.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 441 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 442 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 443 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 447 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 449 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 452 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 453 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 454 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 455 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libassuan-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 457 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 458 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 460 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 461 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 462 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_recipe_qa_setscene)
NOTE: recipe gpgme-2.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 466 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 468 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_recipe_qa_setscene)
NOTE: recipe meson-native-1.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 470 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 471 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 472 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libassuan-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata_setscene)
NOTE: recipe gpgme-2.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 474 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 475 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 476 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe meson-native-1.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 477 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 478 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 479 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 481 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 483 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 484 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 485 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 486 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libassuan-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 489 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 490 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 491 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 492 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 493 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 496 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 499 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe meson-native-1.12.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 517 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 524 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe meson-native-1.12.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libassuan-3.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 536 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 539 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 540 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 541 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 543 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_packagedata_setscene)
NOTE: recipe libassuan-3.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 548 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe elfutils-0.197-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 549 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 551 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 552 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 554 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 556 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 559 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 564 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.197-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 582 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/expat/2.9.0/temp/log.do_packagedata_setscene.3500646
NOTE: Running setscene task 588 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_populate_sysroot_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 592 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 593 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 595 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_package_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 599 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 627 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 629 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 630 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libarchive-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 653 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 630 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_fetch)
NOTE: recipe libarchive-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: Running task 693 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_fetch)
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 703 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_fetch)
NOTE: Running task 705 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_fetch)
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running task 717 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_fetch)
NOTE: Running task 719 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_fetch)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_fetch: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_fetch: Started
NOTE: Running task 783 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_write_config)
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Started
NOTE: Running task 784 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_unpack)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_fetch: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 796 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_fetch: Succeeded
NOTE: Running task 811 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_unpack)
NOTE: Running task 822 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_fetch)
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Succeeded
NOTE: Running task 823 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_unpack)
NOTE: recipe util-linux-2.42.4-r0: task do_fetch: Started
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 681 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 683 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 684 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_package_setscene)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_write_config: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Started
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe expat-2.9.0-r0: task do_package_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_unpack: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_unpack: Started
NOTE: Running setscene task 686 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe libassuan-3.0.2-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 688 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libassuan-3.0.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 689 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 695 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_package_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 698 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 703 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_package_setscene)
NOTE: Running task 826 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_patch)
NOTE: Running task 834 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_unpack)
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Succeeded
NOTE: Running task 835 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_patch)
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 836 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Started
NOTE: recipe libpam-1.7.3-r0: task do_package_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_unpack: Succeeded
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 837 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_patch)
NOTE: Running setscene task 726 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.9.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 728 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_unpack: Started
NOTE: Running task 864 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_unpack)
NOTE: Running task 866 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_fetch)
NOTE: Running task 869 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 880 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_fetch)
NOTE: Running task 904 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_write_config)
NOTE: Running task 907 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_write_config)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_unpack: Succeeded
NOTE: Running task 908 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_patch)
NOTE: recipe expat-2.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Started
NOTE: Running task 954 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_fetch)
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.49-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_fetch: Started
NOTE: Running task 977 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_recipe_qa)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Started
NOTE: Running task 994 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_unpack)
NOTE: Running task 995 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_patch: Started
NOTE: Running task 1021 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1033 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_create_recipe_spdx)
NOTE: Running task 1035 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_unpack: Succeeded
NOTE: recipe gpgme-2.2.0-r0: task do_fetch: Started
NOTE: Running task 1036 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_patch)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_write_config: Succeeded
NOTE: Running task 1067 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_create_recipe_spdx)
NOTE: recipe librepo-1.22.0-r0: task do_recipe_qa: Started
NOTE: recipe libxml2-2.15.4-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe gpgme-2.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1124 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_unpack)
NOTE: Running task 1135 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_unpack: Started
NOTE: Running task 1151 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1152 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libassuan-3.0.2-r0: task do_patch: Started
NOTE: recipe libpam-1.7.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe gpgme-2.2.0-r0: task do_unpack: Started
NOTE: recipe libxml2-2.15.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.22.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1153 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_fetch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1154 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1155 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libcap-ng-0.9.6-r0: task do_unpack: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1156 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_patch)
NOTE: recipe librepo-1.22.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1158 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_recipe_spdx)
NOTE: Running task 1159 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libpam-1.7.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Started
NOTE: Running task 1160 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-0.9.6-r0: task do_patch: Started
NOTE: recipe gpgme-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1161 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_patch)
NOTE: Running task 1163 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe gpgme-2.2.0-r0: task do_patch: Started
NOTE: recipe librepo-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1166 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1168 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_patch)
NOTE: Running task 1169 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_unpack: Succeeded
NOTE: Running task 1170 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_patch)
NOTE: Running task 1171 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_create_recipe_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe librepo-1.22.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libxml2-2.15.4-r0: task do_unpack: Succeeded
NOTE: Running task 1172 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_patch)
NOTE: recipe util-linux-2.42.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_patch: Started
NOTE: Running task 1173 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1174 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-linux-2.42.4-r0: task do_patch: Started
NOTE: recipe libxml2-2.15.4-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gpgme-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1177 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_create_recipe_spdx)
NOTE: recipe librepo-1.22.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_patch: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 738 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 744 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe librepo-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 1180 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_patch)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe librepo-1.22.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe librepo-1.22.0-r0: task do_patch: Started
NOTE: recipe curl-8.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_package_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librepo-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 1182 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1183 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_generate_toolchain_file)
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_package_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1186 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_fetch)
NOTE: recipe librepo-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librepo-1.22.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librepo-1.22.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_fetch: Started
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 1202 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_unpack)
NOTE: recipe librepo-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 758 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 761 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1204 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_patch)
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_patch: Started
NOTE: Running task 1206 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_package_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Succeeded
NOTE: Running task 1207 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_unpack)
NOTE: recipe curl-8.23.0-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 763 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 764 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe qemu-native-11.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Succeeded
NOTE: Running task 1210 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_patch)
NOTE: recipe libpam-1.7.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 765 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Started
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1213 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_fetch)
NOTE: recipe qemu-native-11.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.3-r0: task do_fetch: Succeeded
NOTE: Running task 1218 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 767 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 768 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 770 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_unpack: Started
NOTE: recipe libunistring-1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 771 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 1219 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_patch)
NOTE: recipe libunistring-1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 776 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_patch: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1231 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe meson-native-1.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1238 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: Running setscene task 782 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-native-1.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1248 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 793 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-build-native-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 801 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 803 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 804 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-1.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 815 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe python3-installer-native-1.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 818 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 818 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1473 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1520 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1566 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1664 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1750 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_packagedata)
NOTE: recipe libpcre2-10.49-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1828 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx)
NOTE: recipe bash-completion-2.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1878 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libgpg-error-1.61-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1919 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_create_spdx)
NOTE: recipe libxml2-2.15.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.9.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libpam-1.7.3-r0: task do_create_spdx: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1921 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_configure)
NOTE: Running task 1922 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_configure)
NOTE: recipe libgpg-error-1.61-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1923 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_configure)
NOTE: Running task 1924 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_configure)
NOTE: recipe expat-2.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_configure: Started
NOTE: recipe libpcre2-10.49-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.61-r0: task do_configure: Started
NOTE: recipe libxml2-2.15.4-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 1929 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_spdx)
NOTE: recipe libpsl-0.23.3-r0: task do_create_spdx: Started
NOTE: recipe libpsl-0.23.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1930 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_create_spdx)
NOTE: recipe curl-8.23.0-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.3-r0: task do_create_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1931 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: recipe bash-completion-2.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1938 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_compile)
NOTE: recipe curl-8.23.0-r0: task do_create_spdx: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_compile: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1939 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_install)
NOTE: recipe bash-completion-2.18.0-r0: task do_install: Started
NOTE: recipe libxml2-2.15.4-r0: task do_configure: Succeeded
NOTE: Running task 1940 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.15.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.15.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1941 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_compile)
NOTE: recipe libxml2-2.15.4-r0: task do_compile: Started
NOTE: recipe libpcre2-10.49-r0: task do_configure: Succeeded
NOTE: Running task 1942 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_configure_ptest_base)
NOTE: recipe libpcre2-10.49-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre2-10.49-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1943 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_compile)
NOTE: recipe libpcre2-10.49-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.61-r0: task do_configure: Succeeded
NOTE: Running task 1944 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.61-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.61-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1945 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_compile)
NOTE: recipe libgpg-error-1.61-r0: task do_compile: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_install: Succeeded
NOTE: Running task 1947 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1948 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package)
NOTE: recipe libcap-ng-0.9.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1949 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_configure)
NOTE: recipe libcap-ng-0.9.6-r0: task do_configure: Started
NOTE: recipe libxml2-2.15.4-r0: task do_compile: Succeeded
NOTE: Running task 1950 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.15.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.15.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1951 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_install)
NOTE: recipe libxml2-2.15.4-r0: task do_install: Started
NOTE: recipe libxml2-2.15.4-r0: task do_install: Succeeded
NOTE: Running task 1952 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.15.4-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre2-10.49-r0: task do_compile: Succeeded
NOTE: Running task 1953 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_compile_ptest_base)
NOTE: recipe libpcre2-10.49-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre2-10.49-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1954 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_install)
NOTE: recipe libpcre2-10.49-r0: task do_install: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_compile: Succeeded
NOTE: Running task 1955 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_compile_ptest_base)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package unihash changed to 006e1aff400eb7a847362d9e49da53fbcac3515c3d071a83ea525000fc29789a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata became valid
NOTE: Running setscene task 814 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.61-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1956 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_install)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 818 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_install: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpcre2-10.49-r0: task do_install: Succeeded
NOTE: Running task 1959 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_install_ptest_base)
NOTE: recipe libpcre2-10.49-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre2-10.49-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1961 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1962 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_package)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.49-r0: task do_package: Started
NOTE: recipe libgpg-error-1.61-r0: task do_install: Succeeded
NOTE: Running task 1963 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.61-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.61-r0: task do_install_ptest_base: Succeeded
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1965 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1966 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_configure)
NOTE: Running task 1967 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_package)
NOTE: recipe libassuan-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.61-r0: task do_package: Started
NOTE: recipe libassuan-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1968 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_configure)
NOTE: recipe libassuan-3.0.2-r0: task do_configure: Started
NOTE: recipe libxml2-2.15.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1969 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_package)
NOTE: recipe libxml2-2.15.4-r0: task do_package: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1971 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_compile)
NOTE: recipe libcap-ng-0.9.6-r0: task do_compile: Started
NOTE: recipe libpcre2-10.49-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_package unihash changed to da3eb43ffcce4f5bb8ead77c67ab54dc7d75f7c601118356f738103ffc19e97a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_create_spdx became valid
NOTE: Running setscene task 813 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 818 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_package unihash changed to 615981da67a0a3194959624bb686fd54603c942135c9df20aa0db8089896021d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata became valid
NOTE: recipe libpcre2-10.49-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 818 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libcap-ng-0.9.6-r0: task do_compile: Succeeded
NOTE: Running task 1976 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_install)
NOTE: recipe libcap-ng-0.9.6-r0: task do_install: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_install: Succeeded
NOTE: Running task 1978 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1979 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_package)
NOTE: recipe libcap-ng-0.9.6-r0: task do_package: Started
NOTE: recipe util-linux-2.42.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.42.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1980 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_configure)
NOTE: recipe util-linux-2.42.4-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_package unihash changed to e6159706d96db7b50e1a3e43e42e8f454e837d60575e49e82d2a8f27389e9eac
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_packagedata became valid
NOTE: Running setscene task 815 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 818 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libassuan-3.0.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1983 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_configure_ptest_base)
NOTE: recipe libassuan-3.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libassuan-3.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1984 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_compile)
NOTE: recipe libassuan-3.0.2-r0: task do_compile: Started
NOTE: recipe libassuan-3.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1985 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_compile_ptest_base)
NOTE: recipe libassuan-3.0.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libassuan-3.0.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1986 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_install)
NOTE: recipe libassuan-3.0.2-r0: task do_install: Started
NOTE: recipe libassuan-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 1987 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_install_ptest_base)
NOTE: recipe libassuan-3.0.2-r0: task do_install_ptest_base: Started
NOTE: recipe libassuan-3.0.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1989 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1990 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_package)
NOTE: recipe gpgme-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-3.0.2-r0: task do_package: Started
NOTE: recipe gpgme-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1991 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_configure)
NOTE: recipe gpgme-2.2.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_configure: Succeeded
NOTE: Running task 1992 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1993 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_compile)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_compile: Started
NOTE: recipe libassuan-3.0.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_package unihash changed to 0f82bc1767e781dae452564606f72f5f00c9197e989af40535dbc078bd1f4afb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_create_spdx became valid
NOTE: Running setscene task 816 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_create_spdx_setscene)
NOTE: recipe libassuan-3.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libassuan-3.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 818 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_packagedata_setscene)
NOTE: recipe libassuan-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libassuan-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxml2-2.15.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_package unihash changed to 831d76262cb3f6e4b15749f0da8857c3220883281b11595a1714b0ae60f615e9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_spdx became valid
NOTE: Running setscene task 815 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 818 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gpgme-2.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1998 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_compile)
NOTE: recipe gpgme-2.2.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_compile: Succeeded
NOTE: Running task 1999 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2000 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_install: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_install: Succeeded
NOTE: Running task 2001 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_install_ptest_base)
NOTE: recipe gpgme-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2002 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_install_ptest_base: Started
NOTE: recipe gpgme-2.2.0-r0: task do_install: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2003 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_populate_sysroot: Started
NOTE: recipe gpgme-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2004 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_package)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_populate_sysroot unihash changed to c1fc60267eee3a632a6501a082fa2957c40a911e98c504886ad31b6fb7ed92ac
NOTE: recipe gpgme-2.2.0-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 2006 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2007 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2008 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Started
NOTE: recipe gpgme-2.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_package unihash changed to 93eb1ab6f7fedeb7467bbdbc05a8dda415c5d8b7bbcaa757c1dead3de5fae8e4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_create_spdx became valid
NOTE: Running setscene task 815 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_create_spdx_setscene)
NOTE: recipe gpgme-2.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gpgme-2.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 818 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.2.0.bb:do_packagedata_setscene)
NOTE: recipe gpgme-2.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gpgme-2.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe util-linux-2.42.4-r0: task do_configure: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Succeeded
NOTE: Running task 2011 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_compile)
NOTE: Setscene tasks completed
NOTE: Running task 2012 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_configure_ptest_base)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Started
NOTE: recipe util-linux-2.42.4-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.42.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2013 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_compile)
NOTE: recipe util-linux-2.42.4-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Succeeded
NOTE: Running task 2014 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_install)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Succeeded
NOTE: Running task 2015 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot)
NOTE: Running task 2016 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package)
NOTE: recipe util-linux-2.42.4-r0: task do_compile: Succeeded
NOTE: Running task 2017 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_compile_ptest_base)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Started
NOTE: recipe util-linux-2.42.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2018 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_install)
NOTE: recipe util-linux-2.42.4-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Succeeded
NOTE: Running task 2019 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata unihash changed to 93a9042098e91ab9a57ce5a43d717b562544e971484a8d21e4e51302b6acc011
NOTE: Setscene tasks completed
NOTE: Running task 2020 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_install: Succeeded
NOTE: Running task 2021 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.42.4-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.42.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2022 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_populate_sysroot)
NOTE: Running task 2023 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_package)
NOTE: recipe util-linux-2.42.4-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.42.4-r0: task do_package: Started
NOTE: recipe util-linux-2.42.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_populate_sysroot unihash changed to 641c87e207d469589951e130c0eeb39f875676299e3c3237346a01046475f64e
NOTE: Setscene tasks completed
NOTE: Running task 2024 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2025 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_configure: Succeeded
NOTE: Running task 2026 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2027 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_compile: Started
NOTE: recipe util-linux-2.42.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_package unihash changed to f56bd1084b80cf10823406711f64fc09d830f332d02075577cdc5c59d105b0d4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_packagedata became valid
NOTE: Running setscene task 817 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2029 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_create_spdx)
NOTE: recipe util-linux-2.42.4-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.42.4-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2030 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2031 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_install)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_install: Succeeded
NOTE: Running task 2032 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2033 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_package)
NOTE: Running task 2034 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2035 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2036 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_configure)
NOTE: recipe librepo-1.22.0-r0: task do_configure: Started
NOTE: recipe librepo-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2037 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_compile)
NOTE: recipe librepo-1.22.0-r0: task do_compile: Started
NOTE: recipe librepo-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2038 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_install)
NOTE: recipe librepo-1.22.0-r0: task do_install: Started
NOTE: recipe librepo-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2039 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_populate_sysroot)
NOTE: recipe librepo-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe librepo-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package: Succeeded
NOTE: Running task 2040 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2041 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_package)
NOTE: Running task 2042 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_create_spdx)
NOTE: recipe librepo-1.22.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_spdx: Started
NOTE: recipe librepo-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2043 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_packagedata)
NOTE: recipe librepo-1.22.0-r0: task do_packagedata: Started
NOTE: recipe librepo-1.22.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2044 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_package_write_ipk)
NOTE: Running task 2045 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_package_write_deb)
NOTE: Running task 2046 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_package_write_rpm)
NOTE: Running task 2047 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_package_qa)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2048 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_create_spdx)
NOTE: recipe librepo-1.22.0-r0: task do_package_write_ipk: Started
NOTE: recipe librepo-1.22.0-r0: task do_package_write_deb: Started
NOTE: recipe librepo-1.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.22.0-r0: task do_package_qa: Started
NOTE: recipe librepo-1.22.0-r0: task do_create_spdx: Started
NOTE: recipe librepo-1.22.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2049 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_create_package_spdx)
NOTE: recipe librepo-1.22.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe librepo-1.22.0-r0: task do_create_package_spdx: Started
NOTE: recipe librepo-1.22.0-r0: task do_package_qa: Succeeded
NOTE: recipe librepo-1.22.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe librepo-1.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librepo-1.22.0-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2050 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.22.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2050 tasks of which 1874 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: expat-2.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.10.0-r0 to 0:2.9.0-r0) [version-going-backwards]
ERROR: expat-2.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.10.0-r0 to 0:2.9.0-r0) [version-going-backwards]
ERROR: expat-2.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.10.0-r0 to 0:2.9.0-r0) [version-going-backwards]
ERROR: expat-2.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.10.0-r0 to 0:2.9.0-r0) [version-going-backwards]
ERROR: expat-2.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.10.0-r0 to 0:2.9.0-r0) [version-going-backwards]
ERROR: expat-2.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.10.0-r0 to 0:2.9.0-r0) [version-going-backwards]
ERROR: expat-2.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.10.0-r0 to 0:2.9.0-r0) [version-going-backwards]
ERROR: expat-2.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.10.0-r0 to 0:2.9.0-r0) [version-going-backwards]
ERROR: expat-2.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.10.0-r0 to 0:2.9.0-r0) [version-going-backwards]
ERROR: expat-2.9.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0499260054777504957==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-librepo-upgrade-1.21.3-1.22.0.patch"

RnJvbSBhZWYyNzZkNTYyOWVmZDUwNzFlZTYyZTYxN2E5NzI4MjM1ZTViYWI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMyBOb3YgMjAyNiAwNTozNjozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnJlcG86IHVwZ3JhZGUgMS4yMS4zIC0+IDEuMjIuMAoKLS0tCiAuLi4yLURvLW5vdC10cnktdG8t
b2J0YWluLVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXAucGF0Y2ggfCAyICstCiAuLi4v
bGlicmVwby97bGlicmVwb18xLjIxLjMuYmIgPT4gbGlicmVwb18xLjIyLjAuYmJ9ICAgICAgICAg
ICAgfCAwCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8ve2xpYnJlcG9fMS4yMS4zLmJiID0+
IGxpYnJlcG9fMS4yMi4wLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGlicmVwby9saWJyZXBvLzAwMDItRG8tbm90LXRyeS10by1vYnRhaW4tUFlUSE9OX0lO
U1RBTExfRElSLWJ5LXJ1bm5pbmctcC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJy
ZXBvL2xpYnJlcG8vMDAwMi1Eby1ub3QtdHJ5LXRvLW9idGFpbi1QWVRIT05fSU5TVEFMTF9ESVIt
YnktcnVubmluZy1wLnBhdGNoCmluZGV4IGM3ZDIzNzMyYWIuLjJiNmMxYzg1YjQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG8vMDAwMi1Eby1ub3QtdHJ5
LXRvLW9idGFpbi1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1wLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG8vMDAwMi1Eby1ub3QtdHJ5LXRvLW9i
dGFpbi1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1wLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBhNjI4MmRkYWY0YTcxNDM4NjZlZjUwMGRiM2JiMzM0YjU5OWZhMzAwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2NjYxMGQwYTBjNjgzZWNkZDJmMzllMzkzNmY4ODYyNDQ1
MjU5MGMxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4g
PGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDMwIERlYyAyMDE2IDE4OjA1OjM2
ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCB0cnkgdG8gb2J0YWluIFBZVEhPTl9JTlNU
QUxMX0RJUiBieSBydW5uaW5nIHB5dGhvbi4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9saWJyZXBvL2xpYnJlcG9fMS4yMS4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xp
YnJlcG8vbGlicmVwb18xLjIyLjAuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG9fMS4yMS4zLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGlicmVwby9saWJyZXBvXzEuMjIuMC5iYgotLSAKMi40
Ny4xCgo=

--===============0499260054777504957==--
