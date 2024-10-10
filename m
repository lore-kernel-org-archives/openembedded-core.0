Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE8DD0EE35
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:16 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.53372.1728588960823120631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WPOgfiy6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=PUmgQ4Ut;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019277ee6a51-fab78ba4-19ef-4d6f-aeab-179ec79a7193-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0ekLZUu3nOpUt+KWtXXZhTTSel3DK/56spGkEYEIyfk=;
	b=WPOgfiy6f9/txmotcWUmuQdN8sRJegtwmQkZ3Yp3c2nQYUjG4tquz6/MDtO/a31K
	h9uScap2F0EcoJNSCcLp/gCBBGbaQI4XFL9574nNMMKOsLiOKO7oOAtIwIwQueX3f26
	TgRKkCZl/iffw16NqfX4pptC4jv/ueK2rt43OioU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0ekLZUu3nOpUt+KWtXXZhTTSel3DK/56spGkEYEIyfk=;
	b=PUmgQ4Ut+1ViUkocahsbo8NWy9p6uRVWBxTBVq5WUtagw5Vc/dgLRdwCk4jyamRK
	nb65B95p+ITc85CiWJ5Sd9Yuuuxi6vUb30RiFSLWzrOe97IuXDsIADW8fa5xOmAz7Jr
	ZDwJfgU1xW2yuRCtihuclghYIYkLu/P5qUjvm/cQ=
Content-Type: multipart/mixed; boundary="===============6369500125048281502=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 6.11.0 FAILED
Message-ID: <0101019277ee6a51-fab78ba4-19ef-4d6f-aeab-179ec79a7193-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205513

--===============6369500125048281502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *iproute2* to *6.11.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-6.10.0-6.11.0.patch
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
From 2e52dc564471e9a3f31332393cac934d97931074 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 00:35:30 +0000
Subject: [PATCH] iproute2: upgrade 6.10.0 -> 6.11.0

---
 ...1-include-libnetlink.h-add-missing-include-for-htobe64.patch | 2 +-
 .../iproute2/{iproute2_6.10.0.bb => iproute2_6.11.0.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.10.0.bb => iproute2_6.11.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
index 555d63b240..a801fd59b8 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -1,4 +1,4 @@
-From f3c574b27000fd887cee84ab47adf23f767cbea1 Mon Sep 17 00:00:00 2001
+From 6ed1a4d26aa09d3134f61ea36910c1fac7f67d2a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 24 Aug 2024 15:32:25 +0200
 Subject: [PATCH] include/libnetlink.h: add missing include for htobe64
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb
index 9f0c9aab59..44ab786c66 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch \
            "
 
-SRC_URI[sha256sum] = "91a62f82737b44905a00fa803369c447d549e914e9a2a4018fdd75b1d54e8dce"
+SRC_URI[sha256sum] = "1f795398a04aeaacd06a8f6ace2cfd913c33fa5953ca99daae83bb5c534611c3"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.44.1


--===============6369500125048281502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1872 targets, 51 skipped, 0 masked, 0 errors.
Removing 37 recipes from the core2-64 sysroot...done.
Removing 58 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e3be7ac9644f3f3bed1ecade42d51b2c8af0a59d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 480 Local 466 Mirrors 0 Missed 14 Current 198 (97% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 207 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 213 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 214 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 215 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: Running setscene task 218 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 219 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 220 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 221 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 224 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 225 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 227 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 228 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 229 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 230 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 231 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe iproute2-6.11.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 233 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iproute2-6.11.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 234 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_create_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 236 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 238 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_create_spdx_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libarchive-3.7.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 239 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 243 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_create_spdx_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 304 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 308 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 318 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gnutls-3.8.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 335 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running task 671 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_recipe_qa)
NOTE: Running setscene task 339 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 340 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 348 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 349 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 350 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 353 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iproute2-6.11.0-r0: task do_recipe_qa: Started
NOTE: Running setscene task 354 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 355 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 366 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 369 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 373 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 381 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_populate_sysroot_setscene)
NOTE: recipe iproute2-6.11.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 824 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 386 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.11.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 406 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 855 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_unpack)
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 425 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.11.0-r0: task do_unpack: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_package_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.11.0-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 444 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 446 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: Running task 913 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.11.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.11.0-r0: task do_patch: Succeeded
NOTE: Running task 975 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.191-r0: task do_package_setscene: Started
NOTE: recipe iproute2-6.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 481 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 488 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 496 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 502 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 506 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_package_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 514 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 515 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1020 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.191-r0: task do_fetch: Succeeded
NOTE: Running task 1058 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 522 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 523 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 527 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 533 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 535 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 536 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_package_setscene)
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 547 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 550 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 553 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 556 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_package_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 561 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 562 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 565 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 569 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 573 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 577 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1077 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 581 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 588 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1106 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe elfutils-0.191-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 590 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 592 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 593 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 595 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 602 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 605 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 607 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 610 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1147 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 1153 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_unpack)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 641 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 648 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 669 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1684 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1808 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_collect_spdx_deps)
NOTE: recipe iproute2-6.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1850 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_create_spdx)
NOTE: recipe iproute2-6.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1851 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_configure)
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx: Started
NOTE: recipe iproute2-6.11.0-r0: task do_configure: Started
NOTE: recipe iproute2-6.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1852 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_compile)
NOTE: recipe iproute2-6.11.0-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1853 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1854 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1855 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.191-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.191-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1856 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_create_spdx)
NOTE: recipe elfutils-0.191-r0: task do_create_spdx: Started
NOTE: recipe elfutils-0.191-r0: task do_create_spdx: Succeeded
NOTE: Running task 1857 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_collect_spdx_deps)
NOTE: recipe iproute2-6.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe iproute2-6.11.0-r0: task do_collect_spdx_deps: Succeeded
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75 CC=x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot KERNEL_INCLUDE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include DOCDIR=/usr/share/doc/iproute2 SUBDIRS=lib tc ip bridge misc genl devlink tipc SBINDIR=/sbin CONF_USR_DIR=/usr/lib/iproute2 LIBDIR=/usr/lib CCOPTS= -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/iproute2-6.11.0=/usr/src/debug/iproute2/6.11.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/iproute2-6.11.0=/usr/src/debug/iproute2/6.11.0  -fmacro-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/iproute2-6.11.0=/usr/src/debug/iproute2/6.11.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/iproute2-6.11.0=/usr/src/debug/iproute2/6.11.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot-native=  -pipe -Wno-error=incompatible-pointer-types
| 
| lib
|     CC       libgenl.o
|     CC       libnetlink.o
|     CC       mnl_utils.o
|     CC       utils.o
|     CC       utils_math.o
|     CC       rt_names.o
|     CC       ll_map.o
|     CC       ll_types.o
|     CC       ll_proto.o
|     CC       ll_addr.o
|     CC       inet_proto.o
|     CC       namespace.o
|     CC       json_writer.o
|     CC       json_print.o
|     CC       json_print_math.o
|     CC       names.o
| In file included from ll_types.c:20:
| ../include/uapi/linux/sockios.h:42:9: warning: "SIOCGSTAMP" redefined
|    42 | #define SIOCGSTAMP      SIOCGSTAMP_OLD
|       |         ^~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ll_types.c:12:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/bits/ioctl.h:111:9: note: this is the location of the previous definition
|   111 | #define SIOCGSTAMP      0x8906
|       |         ^~~~~~~~~~
| ../include/uapi/linux/sockios.h:43:9: warning: "SIOCGSTAMPNS" redefined
|    43 | #define SIOCGSTAMPNS    SIOCGSTAMPNS_OLD
|       |         ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/bits/ioctl.h:112:9: note: this is the location of the previous definition
|   112 | #define SIOCGSTAMPNS    0x8907
|       |         ^~~~~~~~~~~~
| In file included from ll_proto.c:21:
| ../include/uapi/linux/sockios.h:42:9: warning: "SIOCGSTAMP" redefined
|    42 | #define SIOCGSTAMP      SIOCGSTAMP_OLD
|       |         ^~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ll_proto.c:13:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/bits/ioctl.h:111:9: note: this is the location of the previous definition
|   111 | #define SIOCGSTAMP      0x8906
|       |         ^~~~~~~~~~
| In file included from ll_addr.c:20:
| ../include/uapi/linux/sockios.h:42:9: warning: "SIOCGSTAMP" redefined
|    42 | #define SIOCGSTAMP      SIOCGSTAMP_OLD
|       |         ^~~~~~~~~~
| ../include/uapi/linux/sockios.h:43:9: warning: "SIOCGSTAMPNS" redefined
|    43 | #define SIOCGSTAMPNS    SIOCGSTAMPNS_OLD
|       |         ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/bits/ioctl.h:112:9: note: this is the location of the previous definition
|   112 | #define SIOCGSTAMPNS    0x8907
|       |         ^~~~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ll_addr.c:12:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/bits/ioctl.h:111:9: note: this is the location of the previous definition
|   111 | #define SIOCGSTAMP      0x8906
|       |         ^~~~~~~~~~
| ../include/uapi/linux/sockios.h:43:9: warning: "SIOCGSTAMPNS" redefined
|    43 | #define SIOCGSTAMPNS    SIOCGSTAMPNS_OLD
|       |         ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/bits/ioctl.h:112:9: note: this is the location of the previous definition
|   112 | #define SIOCGSTAMPNS    0x8907
|       |         ^~~~~~~~~~~~
|     CC       color.o
|     CC       bpf_legacy.o
|     CC       bpf_glue.o
|     CC       exec.o
|     CC       fs.o
|     CC       cg_map.o
|     CC       ppp_proto.o
|     CC       selinux.o
|     CC       ax25_ntop.o
|     CC       rose_ntop.o
|     CC       mpls_ntop.o
|     CC       mpls_pton.o
|     CC       netrom_ntop.o
| In file included from rose_ntop.c:16:
| ../include/uapi/linux/sockios.h:42:9: warning: "SIOCGSTAMP" redefined
|    42 | #define SIOCGSTAMP      SIOCGSTAMP_OLD
|       |         ^~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from rose_ntop.c:7:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/bits/ioctl.h:111:9: note: this is the location of the previous definition
|   111 | #define SIOCGSTAMP      0x8906
|       |         ^~~~~~~~~~
| ../include/uapi/linux/sockios.h:43:9: warning: "SIOCGSTAMPNS" redefined
|    43 | #define SIOCGSTAMPNS    SIOCGSTAMPNS_OLD
|       |         ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/bits/ioctl.h:112:9: note: this is the location of the previous definition
|   112 | #define SIOCGSTAMPNS    0x8907
|       |         ^~~~~~~~~~~~
|     AR       libnetlink.a
|     AR       libutil.a
| 
| tc
|     CC       tc.o
|     CC       tc_qdisc.o
|     CC       tc_class.o
|     CC       tc_filter.o
|     CC       tc_util.o
|     CC       tc_monitor.o
|     CC       tc_exec.o
|     CC       m_police.o
|     CC       m_estimator.o
|     CC       m_action.o
|     CC       m_ematch.o
|     YACC     emp_ematch.tab.c
|     LEX      emp_ematch.lex.c
|     CC       q_fifo.o
|     CC       q_sfq.o
|     CC       q_red.o
|     CC       q_prio.o
|     CC       q_skbprio.o
|     CC       q_tbf.o
|     CC       q_multiq.o
|     CC       q_netem.o
|     CC       q_choke.o
|     CC       q_sfb.o
|     CC       f_u32.o
|     CC       f_route.o
|     CC       f_fw.o
|     CC       f_basic.o
|     CC       f_bpf.o
|     CC       f_flow.o
|     CC       f_cgroup.o
|     CC       f_flower.o
|     CC       q_gred.o
|     CC       q_ingress.o
|     CC       q_hfsc.o
| In file included from ../include/uapi/linux/netdevice.h:29,
|                  from ../include/uapi/linux/if_arp.h:27,
|                  from f_flower.c:14:
| ../include/uapi/linux/if.h:134:9: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |         ^~~~~~~~~~~~
| In file included from f_flower.c:12:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/net/if.h:48:9: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |         ^~~~~~~~~~~~
|     CC       q_htb.o
|     CC       q_drr.o
|     CC       q_qfq.o
|     CC       m_gact.o
|     CC       m_mirred.o
|     CC       m_mpls.o
|     CC       m_nat.o
|     CC       m_pedit.o
|     CC       m_ife.o
|     CC       m_skbedit.o
|     CC       m_skbmod.o
|     CC       m_csum.o
|     CC       m_simple.o
|     CC       m_vlan.o
|     CC       m_connmark.o
|     CC       m_ctinfo.o
|     CC       m_bpf.o
|     CC       m_tunnel_key.o
|     CC       m_sample.o
|     CC       m_ct.o
|     CC       m_gate.o
|     CC       p_ip.o
|     CC       p_ip6.o
|     CC       p_icmp.o
|     CC       p_eth.o
|     CC       p_tcp.o
|     CC       p_udp.o
|     CC       em_nbyte.o
|     CC       em_cmp.o
|     CC       em_u32.o
|     CC       em_canid.o
|     CC       em_meta.o
|     CC       q_mqprio.o
|     CC       q_codel.o
|     CC       q_fq_codel.o
|     CC       q_fq.o
|     CC       q_pie.o
|     CC       q_fq_pie.o
|     CC       q_cake.o
|     CC       q_hhf.o
|     CC       q_clsact.o
|     CC       e_bpf.o
|     CC       f_matchall.o
|     CC       q_cbs.o
|     CC       q_etf.o
|     CC       q_taprio.o
|     CC       q_plug.o
|     CC       q_ets.o
|     CC       em_ipt.o
|     CC       em_ipset.o
|     CC       tc_core.o
|     CC       tc_red.o
| In file included from tc_util.h:7,
|                  from m_ematch.h:11,
|                  from em_ipt.c:13:
| ../include/uapi/linux/if.h:134:9: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |         ^~~~~~~~~~~~
| In file included from ../include/xtables.h:17,
|                  from em_ipt.c:12:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/net/if.h:48:9: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |         ^~~~~~~~~~~~
|     CC       tc_estimator.o
| In file included from tc_util.h:7,
|                  from m_ematch.h:11,
|                  from em_ipset.c:39:
| ../include/uapi/linux/if.h:134:9: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |         ^~~~~~~~~~~~
| In file included from ../include/xtables.h:17,
|                  from em_ipset.c:23:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/net/if.h:48:9: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |         ^~~~~~~~~~~~
|     CC       tc_stab.o
|     CC       tc_qevent.o
|     CC       emp_ematch.tab.o
|     CC       emp_ematch.lex.o
|     AR       libtc.a
|     LINK     tc
| rm emp_ematch.lex.c
| 
| ip
|     CC       ip.o
|     CC       ipaddress.o
|     CC       ipaddrlabel.o
|     CC       iproute.o
|     CC       iprule.o
|     CC       ipnetns.o
|     CC       rtm_map.o
|     CC       iptunnel.o
|     CC       ip6tunnel.o
|     CC       tunnel.o
|     CC       ipneigh.o
|     CC       ipntable.o
|     CC       iplink.o
|     CC       ipmaddr.o
|     CC       ipmonitor.o
|     CC       ipmroute.o
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from iptunnel.c:19:
| ../include/uapi/linux/if.h:134:9: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |         ^~~~~~~~~~~~
| In file included from iptunnel.c:16:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/net/if.h:48:9: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |         ^~~~~~~~~~~~
| In file included from ipmaddr.c:21:
| ../include/uapi/linux/sockios.h:42:9: warning: "SIOCGSTAMP" redefined
|    42 | #define SIOCGSTAMP      SIOCGSTAMP_OLD
|       |         ^~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ipmaddr.c:12:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/bits/ioctl.h:111:9: note: this is the location of the previous definition
|   111 | #define SIOCGSTAMP      0x8906
|       |         ^~~~~~~~~~
| ../include/uapi/linux/sockios.h:43:9: warning: "SIOCGSTAMPNS" redefined
|    43 | #define SIOCGSTAMPNS    SIOCGSTAMPNS_OLD
|       |         ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/bits/ioctl.h:112:9: note: this is the location of the previous definition
|   112 | #define SIOCGSTAMPNS    0x8907
|       |         ^~~~~~~~~~~~
| In file included from ipmroute.c:22:
| ../include/uapi/linux/sockios.h:42:9: warning: "SIOCGSTAMP" redefined
|    42 | #define SIOCGSTAMP      SIOCGSTAMP_OLD
|       |         ^~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ipmroute.c:13:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/bits/ioctl.h:111:9: note: this is the location of the previous definition
|   111 | #define SIOCGSTAMP      0x8906
|       |         ^~~~~~~~~~
| ../include/uapi/linux/sockios.h:43:9: warning: "SIOCGSTAMPNS" redefined
|    43 | #define SIOCGSTAMPNS    SIOCGSTAMPNS_OLD
|       |         ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/bits/ioctl.h:112:9: note: this is the location of the previous definition
|   112 | #define SIOCGSTAMPNS    0x8907
|       |         ^~~~~~~~~~~~
| In file included from ipaddress.c:26:
| ../include/uapi/linux/sockios.h:42:9: warning: "SIOCGSTAMP" redefined
|    42 | #define SIOCGSTAMP      SIOCGSTAMP_OLD
|       |         ^~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ipaddress.c:14:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/bits/ioctl.h:111:9: note: this is the location of the previous definition
|   111 | #define SIOCGSTAMP      0x8906
|       |         ^~~~~~~~~~
| ../include/uapi/linux/sockios.h:43:9: warning: "SIOCGSTAMPNS" redefined
|    43 | #define SIOCGSTAMPNS    SIOCGSTAMPNS_OLD
|       |         ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/bits/ioctl.h:112:9: note: this is the location of the previous definition
|   112 | #define SIOCGSTAMPNS    0x8907
|       |         ^~~~~~~~~~~~
|     CC       ipprefix.o
|     CC       iptuntap.o
|     CC       iptoken.o
|     CC       ipxfrm.o
|     CC       xfrm_state.o
|     CC       xfrm_policy.o
|     CC       xfrm_monitor.o
|     CC       iplink_dummy.o
|     CC       iplink_ifb.o
|     CC       iplink_nlmon.o
|     CC       iplink_team.o
|     CC       iplink_vcan.o
|     CC       iplink_vxcan.o
|     CC       iplink_vlan.o
|     CC       link_veth.o
|     CC       link_gre.o
|     CC       iplink_can.o
|     CC       iplink_xdp.o
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_gre.c:15:
| ../include/uapi/linux/if.h:134:9: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |         ^~~~~~~~~~~~
| In file included from link_gre.c:9:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/net/if.h:48:9: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |         ^~~~~~~~~~~~
|     CC       iplink_macvlan.o
|     CC       ipl2tp.o
|     CC       link_vti.o
|     CC       link_vti6.o
|     CC       link_xfrm.o
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_vti.c:16:
| ../include/uapi/linux/if.h:134:9: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |         ^~~~~~~~~~~~
| In file included from link_vti.c:10:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/net/if.h:48:9: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |         ^~~~~~~~~~~~
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_vti6.c:17:
| ../include/uapi/linux/if.h:134:9: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |         ^~~~~~~~~~~~
| In file included from link_vti6.c:11:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/net/if.h:48:9: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |         ^~~~~~~~~~~~
|     CC       iplink_vxlan.o
|     CC       tcp_metrics.o
|     CC       iplink_ipoib.o
|     CC       ipnetconf.o
|     CC       link_ip6tnl.o
|     CC       link_iptnl.o
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_ip6tnl.c:15:
| ../include/uapi/linux/if.h:134:9: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |         ^~~~~~~~~~~~
| In file included from link_ip6tnl.c:9:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/net/if.h:48:9: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |         ^~~~~~~~~~~~
|     CC       link_gre6.o
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_iptnl.c:16:
| ../include/uapi/linux/if.h:134:9: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |         ^~~~~~~~~~~~
| In file included from link_iptnl.c:9:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/net/if.h:48:9: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |         ^~~~~~~~~~~~
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_gre6.c:15:
| ../include/uapi/linux/if.h:134:9: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |         ^~~~~~~~~~~~
| In file included from link_gre6.c:9:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/net/if.h:48:9: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |         ^~~~~~~~~~~~
|     CC       iplink_bond.o
|     CC       iplink_bond_slave.o
|     CC       iplink_hsr.o
|     CC       iplink_bridge.o
|     CC       iplink_bridge_slave.o
|     CC       iplink_dsa.o
|     CC       ipfou.o
|     CC       iplink_ipvlan.o
|     CC       iplink_geneve.o
|     CC       iplink_vrf.o
|     CC       iproute_lwtunnel.o
|     CC       ipmacsec.o
|     CC       ipila.o
|     CC       ipvrf.o
|     CC       iplink_xstats.o
|     CC       ipseg6.o
|     CC       iplink_netdevsim.o
|     CC       iplink_rmnet.o
|     CC       ipnexthop.o
|     CC       ipmptcp.o
|     CC       iplink_bareudp.o
|     CC       iplink_wwan.o
|     CC       ipioam6.o
|     CC       iplink_amt.o
|     CC       iplink_batadv.o
|     CC       iplink_gtp.o
|     CC       iplink_virt_wifi.o
|     CC       iplink_netkit.o
|     CC       ipstats.o
|     CC       rtmon.o
|     LINK     rtmon
|     LINK     ip
| 
| bridge
|     CC       bridge.o
|     CC       fdb.o
|     CC       monitor.o
|     CC       link.o
|     CC       mdb.o
|     CC       mst.o
|     CC       vlan.o
|     CC       vni.o
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/arpa/inet.h:9,
|                  from ../include/libnetlink.h:14,
|                  from mst.c:10:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/netinet/in.h:23:8: error: redefinition of 'struct in6_addr'
|    23 | struct in6_addr {
|       |        ^~~~~~~~
| In file included from ../include/uapi/linux/if_bridge.h:19,
|                  from mst.c:7:
| ../include/uapi/linux/in6.h:33:8: note: originally defined here
|    33 | struct in6_addr {
|       |        ^~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/netinet/in.h:34:8: error: redefinition of 'struct sockaddr_in6'
|    34 | struct sockaddr_in6 {
|       |        ^~~~~~~~~~~~
| ../include/uapi/linux/in6.h:50:8: note: originally defined here
|    50 | struct sockaddr_in6 {
|       |        ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/netinet/in.h:42:8: error: redefinition of 'struct ipv6_mreq'
|    42 | struct ipv6_mreq {
|       |        ^~~~~~~~~
| ../include/uapi/linux/in6.h:60:8: note: originally defined here
|    60 | struct ipv6_mreq {
|       |        ^~~~~~~~~
| In file included from mst.c:11:
| ../include/json_print.h:80:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
|    80 | _PRINT_FUNC(tv, const struct timeval *)
|       |                              ^~~~~~~
| ../include/json_print.h:50:37: note: in definition of macro '_PRINT_FUNC'
|    50 |                                     type value);                        \
|       |                                     ^~~~
| ../include/json_print.h:80:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
|    80 | _PRINT_FUNC(tv, const struct timeval *)
|       |                              ^~~~~~~
| ../include/json_print.h:55:45: note: in definition of macro '_PRINT_FUNC'
|    55 |                                             type value)                 \
|       |                                             ^~~~
| ../include/json_print.h: In function 'print_tv':
| ../include/json_print.h:58:48: warning: passing argument 5 of 'print_color_tv' from incompatible pointer type [-Wincompatible-pointer-types]
|    58 |                                                value);                  \
|       |                                                ^~~~~
|       |                                                |
|       |                                                const struct timeval *
| ../include/json_print.h:80:1: note: in expansion of macro '_PRINT_FUNC'
|    80 | _PRINT_FUNC(tv, const struct timeval *)
|       | ^~~~~~~~~~~
| ../include/json_print.h:50:42: note: expected 'const struct timeval *' but argument is of type 'const struct timeval *'
|    50 |                                     type value);                        \
|       |                                          ^
| ../include/json_print.h:80:1: note: in expansion of macro '_PRINT_FUNC'
|    80 | _PRINT_FUNC(tv, const struct timeval *)
|       | ^~~~~~~~~~~
| make[1]: *** [../config.mk:44: mst.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make: *** [Makefile:81: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/run.do_compile.2351201:179 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/run.do_compile.2351201, line 179
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/run.do_compile.2351201, line 164
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/run.do_compile.2351201, line 169
| 	#4: base_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/run.do_compile.2351201, line 147
| 	#5: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/run.do_compile.2351201, line 141
| 	#6: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/run.do_compile.2351201, line 189
NOTE: recipe iproute2-6.11.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1857 tasks of which 1836 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010003507.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010003507.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/log.do_compile.2351201
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.11.0-r0 do_compile: oe_runmake failed
ERROR: iproute2-6.11.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/run.do_compile.2351201' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/log.do_compile.2351201
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_compile) failed with exit code '1'

--===============6369500125048281502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-bash-completion: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-bridge: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-bridge: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-bridge: PKGSIZE changed from 170344 to 174440 (+2%)
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 8070944 to 8091512 (+0%)
packages/core2-64-poky-linux/iproute2/iproute2-dev: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-dev: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-devlink: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-devlink: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-doc: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-doc: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-genl: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-genl: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-ifstat: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-ip: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-ip: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-lnstat: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-locale: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-locale: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-nstat: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-nstat: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-rdma: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-rdma: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-routel: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-routel: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-rtacct: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-src: FILELIST: directory renamed /usr/src/debug/iproute2/6.10.0/include/uapi/asm-generic -> /usr/src/debug/iproute2/6.11.0/include/uapi/asm-generic, directory renamed /usr/src/debug/iproute2/6.10.0/lib -> /usr/src/debug/iproute2/6.11.0/lib, directory renamed /usr/src/debug/iproute2/6.10.0/include/uapi/linux -> /usr/src/debug/iproute2/6.11.0/include/uapi/linux, directory renamed /usr/src/debug/iproute2/6.10.0/genl -> /usr/src/debug/iproute2/6.11.0/genl, directory renamed /usr/src/debug/iproute2/6.10.0/include/uapi/linux/netfilter -> /usr/src/debug/iproute2/6.11.0/include/uapi/linux/netfilter, directory renamed /usr/src/debug/iproute2/6.10.0/tipc -> /usr/src/debug/iproute2/6.11.0/tipc, directory renamed /usr/src/debug/iproute2/6.10.0/devlink -> /usr/src/debug/iproute2/6.11.0/devlink, directory renamed /usr/src/debug/iproute2/6.10.0/include -> /usr/src/debug/iproute2/6.11.0/include, directory renamed /usr/src/debug/iproute2/6.10.0/tc -> /us
 r/src/debug/iproute2/6.11.0/tc, directory renamed /usr/src/debug/iproute2/6.10.0/include/uapi/linux/tc_act -> /usr/src/debug/iproute2/6.11.0/include/uapi/linux/tc_act, directory renamed /usr/src/debug/iproute2/6.10.0/include/uapi/linux/hdlc -> /usr/src/debug/iproute2/6.11.0/include/uapi/linux/hdlc, directory renamed /usr/src/debug/iproute2/6.10.0/include/uapi/linux/netfilter/ipset -> /usr/src/debug/iproute2/6.11.0/include/uapi/linux/netfilter/ipset, directory renamed /usr/src/debug/iproute2/6.10.0/include/uapi/linux/can -> /usr/src/debug/iproute2/6.11.0/include/uapi/linux/can, directory renamed /usr/src/debug/iproute2/6.10.0/misc -> /usr/src/debug/iproute2/6.11.0/misc, directory renamed /usr/src/debug/iproute2/6.10.0/include/uapi/linux/tc_ematch -> /usr/src/debug/iproute2/6.11.0/include/uapi/linux/tc_ematch, directory renamed /usr/src/debug/iproute2/6.10.0/ip -> /usr/src/debug/iproute2/6.11.0/ip, removed "/usr/src/debug/iproute2/6.10.0/bridge/br_common.h /usr/src/debug/iproute2/6.10
 .0/bridge/monitor.c /usr/src/debug/iproute2/6.10.0/bridge/link.c /usr/src/debug/iproute2/6.10.0/bridge/fdb.c /usr/src/debug/iproute2/6.10.0/bridge/mdb.c /usr/src/debug/iproute2/6.10.0/bridge/vlan.c /usr/src/debug/iproute2/6.10.0/bridge/vni.c /usr/src/debug/iproute2/6.10.0/bridge/bridge.c", added "/usr/src/debug/iproute2/6.11.0/bridge/br_common.h /usr/src/debug/iproute2/6.11.0/bridge/monitor.c /usr/src/debug/iproute2/6.11.0/bridge/link.c /usr/src/debug/iproute2/6.11.0/bridge/fdb.c /usr/src/debug/iproute2/6.11.0/bridge/mdb.c /usr/src/debug/iproute2/6.11.0/bridge/vlan.c /usr/src/debug/iproute2/6.11.0/bridge/mst.c /usr/src/debug/iproute2/6.11.0/bridge/vni.c /usr/src/debug/iproute2/6.11.0/bridge/bridge.c"
packages/core2-64-poky-linux/iproute2/iproute2-src: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-src: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3679520 to 3688706 (+0%)
packages/core2-64-poky-linux/iproute2/iproute2-ss: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-ss: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-staticdev: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-tc: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-tc: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2-tipc: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-tipc: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2/iproute2: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2: PV changed from "6.10.0" to "6.11.0"
packages/core2-64-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.10.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.11.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch"

--===============6369500125048281502==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-6.10.0-6.11.0.patch"

RnJvbSAyZTUyZGM1NjQ0NzFlOWEzZjMxMzMyMzkzY2FjOTM0ZDk3OTMxMDc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDA6MzU6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
cHJvdXRlMjogdXBncmFkZSA2LjEwLjAgLT4gNi4xMS4wCgotLS0KIC4uLjEtaW5jbHVkZS1saWJu
ZXRsaW5rLmgtYWRkLW1pc3NpbmctaW5jbHVkZS1mb3ItaHRvYmU2NC5wYXRjaCB8IDIgKy0KIC4u
Li9pcHJvdXRlMi97aXByb3V0ZTJfNi4xMC4wLmJiID0+IGlwcm91dGUyXzYuMTEuMC5iYn0gICAg
ICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIve2lwcm91dGUy
XzYuMTAuMC5iYiA9PiBpcHJvdXRlMl82LjExLjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMi8wMDAxLWluY2x1ZGUtbGli
bmV0bGluay5oLWFkZC1taXNzaW5nLWluY2x1ZGUtZm9yLWh0b2JlNjQucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyLzAwMDEtaW5jbHVkZS1saWJuZXRs
aW5rLmgtYWRkLW1pc3NpbmctaW5jbHVkZS1mb3ItaHRvYmU2NC5wYXRjaAppbmRleCA1NTVkNjNi
MjQwLi5hODAxZmQ1OWI4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lw
cm91dGUyL2lwcm91dGUyLzAwMDEtaW5jbHVkZS1saWJuZXRsaW5rLmgtYWRkLW1pc3NpbmctaW5j
bHVkZS1mb3ItaHRvYmU2NC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lw
cm91dGUyL2lwcm91dGUyLzAwMDEtaW5jbHVkZS1saWJuZXRsaW5rLmgtYWRkLW1pc3NpbmctaW5j
bHVkZS1mb3ItaHRvYmU2NC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjNjNTc0YjI3MDAw
ZmQ4ODdjZWU4NGFiNDdhZGYyM2Y3NjdjYmVhMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gNmVkMWE0ZDI2YWEwOWQzMTM0ZjYxZWEzNjkxMGMxZmFjN2Y2N2QyYSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+
CiBEYXRlOiBTYXQsIDI0IEF1ZyAyMDI0IDE1OjMyOjI1ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGluY2x1ZGUvbGlibmV0bGluay5oOiBhZGQgbWlzc2luZyBpbmNsdWRlIGZvciBodG9iZTY0CmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzYu
MTAuMC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi4x
MS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi4xMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzYuMTEuMC5iYgppbmRleCA5ZjBjOWFh
YjU5Li40NGFiNzg2YzY2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lw
cm91dGUyL2lwcm91dGUyXzYuMTAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2lwcm91dGUyL2lwcm91dGUyXzYuMTEuMC5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0g
IiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvdXRpbHMvbmV0LyR7QlBOfS8ke0JQfS50YXIueHog
XAogICAgICAgICAgICBmaWxlOi8vMDAwMS1pbmNsdWRlLWxpYm5ldGxpbmsuaC1hZGQtbWlzc2lu
Zy1pbmNsdWRlLWZvci1odG9iZTY0LnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiOTFhNjJmODI3MzdiNDQ5MDVhMDBmYTgwMzM2OWM0NDdkNTQ5ZTkxNGU5YTJh
NDAxOGZkZDc1YjFkNTRlOGRjZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxZjc5NTM5OGEwNGFl
YWFjZDA2YThmNmFjZTJjZmQ5MTNjMzNmYTU5NTNjYTk5ZGFhZTgzYmI1YzUzNDYxMWMzIgogCiBp
bmhlcml0IHVwZGF0ZS1hbHRlcm5hdGl2ZXMgYmFzaC1jb21wbGV0aW9uIHBrZ2NvbmZpZwogCi0t
IAoyLjQ0LjEKCg==

--===============6369500125048281502==--

