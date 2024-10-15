Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5993ED1D879
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:15:51 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.11794.1728994550992748680
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RriYzW1c;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cbV6zP4k;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010192901b21f9-c9a71bac-2ebb-4587-9687-8723aef88229-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994550;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KXZN4paBqQnFgyjzm/ksh8oo/msHLnemUBxofWUHz/Y=;
	b=RriYzW1c409RfoSE75YmqS76jEbkN6wUecbz0bvo5t5q156h/HqCQ6CK9tcCmvVX
	1pbblsB8z3sp7twSC/6NE53R4gzf9iWVTmuxyoeXSuSs7rroLGxPaweRbSfM+Sh07jQ
	ozSNN33olT2hgGrQpd7RwJaVu/ZaReSYO1bYNVzk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994550;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KXZN4paBqQnFgyjzm/ksh8oo/msHLnemUBxofWUHz/Y=;
	b=cbV6zP4kWu8jo7wf5lz45A0Yw+D4jkKefimjyj6ZthkqLCOJVcgPYAPYO3HOvteW
	NaUncj/YsXjh5MI4FCPB1cXEECc069K1qTpNduelU/lO/ujDyjW784nkxO5ExX8J258
	DYXkqycXnB3Nk+tKKc27TqZ0wBDGfgFexC14wHnA=
Content-Type: multipart/mixed; boundary="===============0471309766423434236=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 6.11.0 FAILED
Message-ID: <01010192901b21f9-c9a71bac-2ebb-4587-9687-8723aef88229-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205826

--===============0471309766423434236==
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
From 24e97887014c740c9f5a4b76331a8588d7a0189c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 07:12:06 +0000
Subject: [PATCH] iproute2: upgrade 6.10.0 -> 6.11.0

---
 ...1-include-libnetlink.h-add-missing-include-for-htobe64.patch | 2 +-
 .../iproute2/{iproute2_6.10.0.bb => iproute2_6.11.0.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.10.0.bb => iproute2_6.11.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
index 555d63b240..c024befb3a 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -1,4 +1,4 @@
-From f3c574b27000fd887cee84ab47adf23f767cbea1 Mon Sep 17 00:00:00 2001
+From 36f9590179c2f37bee4db8b3c643252677007588 Mon Sep 17 00:00:00 2001
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


--===============0471309766423434236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (0 cached, 919 parsed). 1876 targets, 52 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:a462ae4e143c3b0b047a3d2bf2f556385eef4083"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 480 Local 451 Mirrors 0 Missed 29 Current 198 (93% match, 95% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 207 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 213 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 214 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 215 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: Running setscene task 218 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 224 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 225 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 228 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 232 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 233 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 236 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 237 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 238 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe iproute2-6.11.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 242 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iproute2-6.11.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 243 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 244 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 245 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 246 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 247 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 249 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.7.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 250 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_recipe_qa_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 251 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 252 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 253 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iproute2-6.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 258 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 263 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 267 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe iproute2-6.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 268 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 270 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.43.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 285 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 288 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 289 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 291 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_ipk_setscene)
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 292 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 294 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 296 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 298 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 300 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 304 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 306 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 308 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 309 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 310 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 312 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 314 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_create_spdx_setscene)
NOTE: Running setscene task 315 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 316 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 318 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 319 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 321 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 324 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 331 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 334 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 338 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 341 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 343 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 345 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 347 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 349 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_package_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 354 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 358 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 366 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 369 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 371 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 378 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 379 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 380 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 381 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 382 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 388 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 460 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 464 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 468 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 472 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 476 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 480 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 485 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 491 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 494 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 497 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 509 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.6-r0: task do_package_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 670 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_fetch)
NOTE: Running setscene task 521 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 522 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 714 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: Running task 718 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_fetch)
NOTE: recipe libgpg-error-1.50-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 777 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_fetch)
NOTE: Running task 781 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_fetch)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 525 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 802 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_unpack)
NOTE: Running task 808 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe elfutils-0.191-r0: task do_fetch: Started
NOTE: recipe iproute2-6.11.0-r0: task do_fetch: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_fetch: Started
NOTE: Running setscene task 527 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.11.0-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 532 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 856 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_unpack)
NOTE: recipe coreutils-9.5-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 857 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_unpack)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 858 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 899 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_fetch)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 538 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe iproute2-6.11.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_unpack: Started
NOTE: Running setscene task 542 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.5-r0: task do_unpack: Started
NOTE: recipe binutils-2.43.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.43.1-r0: task do_fetch: Succeeded
NOTE: Running task 995 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: Running task 996 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Started
NOTE: recipe binutils-2.43.1-r0: task do_unpack: Started
NOTE: recipe iproute2-6.11.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1007 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iproute2-6.11.0-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iproute2-6.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1085 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.5-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1087 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_patch)
NOTE: Running task 1088 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_patch)
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Started
NOTE: recipe coreutils-9.5-r0: task do_patch: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iproute2-6.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_deploy_source_date_epoch unihash changed to 51695cfb3835431ca79f6444ef5fbab228984e6c68bbf77b60489b64503753ad
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.5-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_unpack: Succeeded
NOTE: Running task 1107 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_patch)
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.43.1-r0: task do_unpack: Succeeded
NOTE: Running task 1115 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_patch)
NOTE: recipe binutils-2.43.1-r0: task do_patch: Started
NOTE: recipe python3-3.12.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 565 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 573 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 576 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 611 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 620 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 622 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 628 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 632 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 639 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
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
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 650 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 653 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
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
NOTE: Running task 1416 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1623 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1767 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1806 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_configure)
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1807 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure)
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.5-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1808 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1809 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_compile)
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1810 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1811 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_install)
NOTE: recipe libgcrypt-1.11.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_install: Succeeded
NOTE: Running task 1812 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.11.0-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1813 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot)
NOTE: Running task 1814 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_package)
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_package: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot unihash changed to 9ca4bd6d3d8a3206bba5937bd0438334e48674e7579c7c0ccc5e83cb4bd465cd
NOTE: Setscene tasks completed
NOTE: Running task 1815 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1816 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_package unihash changed to f4eea9f08228bf714a1548528c8b5180b905c700b2e9f26d80f2011336ce9392
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata became valid
NOTE: Running setscene task 677 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1818 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1819 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_configure: Succeeded
NOTE: Running task 1820 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.5-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1821 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_compile)
NOTE: recipe coreutils-9.5-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1822 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_compile)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_compile: Started
NOTE: recipe coreutils-9.5-r0: task do_compile: Succeeded
NOTE: Running task 1823 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.5-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1824 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_install)
NOTE: recipe coreutils-9.5-r0: task do_install: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1825 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_install)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_install: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 1826 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot)
NOTE: Running task 1827 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_package)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1828 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.191-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.191-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1829 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_configure)
NOTE: recipe coreutils-9.5-r0: task do_install: Succeeded
NOTE: Running task 1830 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.191-r0: task do_configure: Started
NOTE: recipe coreutils-9.5-r0: task do_install_ptest_base: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 1831 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1832 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package)
NOTE: recipe coreutils-9.5-r0: task do_package: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata unihash changed to 7c34f47c2880f11ed9fcf4739f102feb0f59ae07a9b6da12c445bd8728d33ea7
NOTE: Setscene tasks completed
NOTE: Running task 1833 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1834 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.191-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.191-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1835 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.191-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.191-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1836 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_compile)
NOTE: recipe elfutils-0.191-r0: task do_compile: Started
NOTE: recipe coreutils-9.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package unihash changed to 07599a9ae59e015aa9998ba53d7dd4c1a72008881d4b757aeb8fed211a4dc2ef
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata became valid
NOTE: Running setscene task 678 of 678 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe elfutils-0.191-r0: task do_compile: Succeeded
NOTE: Running task 1838 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.191-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.191-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1839 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_install)
NOTE: recipe elfutils-0.191-r0: task do_install: Started
NOTE: recipe elfutils-0.191-r0: task do_install: Succeeded
NOTE: Running task 1840 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.191-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.191-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1841 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_package)
NOTE: Running task 1842 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.191-r0: task do_package: Started
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1843 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1844 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.43.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1845 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_configure)
NOTE: recipe iproute2-6.11.0-r0: task do_configure: Started
NOTE: recipe binutils-2.43.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1846 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_configure)
NOTE: recipe binutils-2.43.1-r0: task do_configure: Started
NOTE: recipe iproute2-6.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1847 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_compile)
NOTE: recipe iproute2-6.11.0-r0: task do_compile: Started
NOTE: recipe binutils-2.43.1-r0: task do_configure: Succeeded
NOTE: Running task 1848 of 1868 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_compile)
NOTE: recipe binutils-2.43.1-r0: task do_compile: Started
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
|     CC       ll_addr.o
|     CC       ll_proto.o
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
| In file included from ll_addr.c:20:
| ../include/uapi/linux/sockios.h:42:9: warning: "SIOCGSTAMP" redefined
|    42 | #define SIOCGSTAMP      SIOCGSTAMP_OLD
|       |         ^~~~~~~~~~
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
| In file included from ll_proto.c:21:
| ../include/uapi/linux/sockios.h:42:9: warning: "SIOCGSTAMP" redefined
|    42 | #define SIOCGSTAMP      SIOCGSTAMP_OLD
|       |         ^~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ll_proto.c:13:
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
|     CC       q_hfsc.o
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
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_vti.c:16:
| ../include/uapi/linux/if.h:134:9: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |         ^~~~~~~~~~~~
| In file included from link_vti.c:10:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/recipe-sysroot/usr/include/net/if.h:48:9: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |         ^~~~~~~~~~~~
|     CC       link_xfrm.o
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/run.do_compile.3352346:179 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/run.do_compile.3352346, line 179
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/run.do_compile.3352346, line 164
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/run.do_compile.3352346, line 169
| 	#4: base_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/run.do_compile.3352346, line 147
| 	#5: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/run.do_compile.3352346, line 141
| 	#6: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/run.do_compile.3352346, line 189
NOTE: recipe iproute2-6.11.0-r0: task do_compile: Failed
NOTE: recipe elfutils-0.191-r0: task do_package: Succeeded
NOTE: recipe binutils-2.43.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1848 tasks of which 1785 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015070959.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015070959.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/log.do_compile.3352346
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.11.0-r0 do_compile: oe_runmake failed
ERROR: iproute2-6.11.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/run.do_compile.3352346' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.11.0/temp/log.do_compile.3352346
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_compile) failed with exit code '1'

--===============0471309766423434236==
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
packages/core2-64-poky-linux/iproute2/iproute2-src: PKGV changed from 6.10.0 [default] to 6.11.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-src: FILELIST: directory renamed /usr/src/debug/iproute2/6.10.0/include/uapi/linux/netfilter -> /usr/src/debug/iproute2/6.11.0/include/uapi/linux/netfilter, directory renamed /usr/src/debug/iproute2/6.10.0/include/uapi/linux/can -> /usr/src/debug/iproute2/6.11.0/include/uapi/linux/can, directory renamed /usr/src/debug/iproute2/6.10.0/include/uapi/asm-generic -> /usr/src/debug/iproute2/6.11.0/include/uapi/asm-generic, directory renamed /usr/src/debug/iproute2/6.10.0/include/uapi/linux/tc_act -> /usr/src/debug/iproute2/6.11.0/include/uapi/linux/tc_act, directory renamed /usr/src/debug/iproute2/6.10.0/include/uapi/linux/hdlc -> /usr/src/debug/iproute2/6.11.0/include/uapi/linux/hdlc, directory renamed /usr/src/debug/iproute2/6.10.0/include/uapi/linux/tc_ematch -> /usr/src/debug/iproute2/6.11.0/include/uapi/linux/tc_ematch, directory renamed /usr/src/debug/iproute2/6.10.0/ip -> /usr/src/debug/iproute2/6.11.0/ip, directory renamed /usr/src/deb
 ug/iproute2/6.10.0/genl -> /usr/src/debug/iproute2/6.11.0/genl, directory renamed /usr/src/debug/iproute2/6.10.0/include/uapi/linux/netfilter/ipset -> /usr/src/debug/iproute2/6.11.0/include/uapi/linux/netfilter/ipset, directory renamed /usr/src/debug/iproute2/6.10.0/lib -> /usr/src/debug/iproute2/6.11.0/lib, directory renamed /usr/src/debug/iproute2/6.10.0/misc -> /usr/src/debug/iproute2/6.11.0/misc, directory renamed /usr/src/debug/iproute2/6.10.0/include -> /usr/src/debug/iproute2/6.11.0/include, directory renamed /usr/src/debug/iproute2/6.10.0/tipc -> /usr/src/debug/iproute2/6.11.0/tipc, directory renamed /usr/src/debug/iproute2/6.10.0/devlink -> /usr/src/debug/iproute2/6.11.0/devlink, directory renamed /usr/src/debug/iproute2/6.10.0/include/uapi/linux -> /usr/src/debug/iproute2/6.11.0/include/uapi/linux, directory renamed /usr/src/debug/iproute2/6.10.0/tc -> /usr/src/debug/iproute2/6.11.0/tc, removed "/usr/src/debug/iproute2/6.10.0/bridge/monitor.c /usr/src/debug/iproute2/6.10.0
 /bridge/br_common.h /usr/src/debug/iproute2/6.10.0/bridge/vlan.c /usr/src/debug/iproute2/6.10.0/bridge/link.c /usr/src/debug/iproute2/6.10.0/bridge/fdb.c /usr/src/debug/iproute2/6.10.0/bridge/vni.c /usr/src/debug/iproute2/6.10.0/bridge/bridge.c /usr/src/debug/iproute2/6.10.0/bridge/mdb.c", added "/usr/src/debug/iproute2/6.11.0/bridge/monitor.c /usr/src/debug/iproute2/6.11.0/bridge/br_common.h /usr/src/debug/iproute2/6.11.0/bridge/vlan.c /usr/src/debug/iproute2/6.11.0/bridge/link.c /usr/src/debug/iproute2/6.11.0/bridge/fdb.c /usr/src/debug/iproute2/6.11.0/bridge/vni.c /usr/src/debug/iproute2/6.11.0/bridge/bridge.c /usr/src/debug/iproute2/6.11.0/bridge/mdb.c /usr/src/debug/iproute2/6.11.0/bridge/mst.c"
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
packages/core2-64-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.10.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.11.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch"
packages/core2-64-poky-linux/iproute2: PV changed from "6.10.0" to "6.11.0"

--===============0471309766423434236==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-6.10.0-6.11.0.patch"

RnJvbSAyNGU5Nzg4NzAxNGM3NDBjOWY1YTRiNzYzMzFhODU4OGQ3YTAxODljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDc6MTI6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
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
MjQwLi5jMDI0YmVmYjNhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lw
cm91dGUyL2lwcm91dGUyLzAwMDEtaW5jbHVkZS1saWJuZXRsaW5rLmgtYWRkLW1pc3NpbmctaW5j
bHVkZS1mb3ItaHRvYmU2NC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lw
cm91dGUyL2lwcm91dGUyLzAwMDEtaW5jbHVkZS1saWJuZXRsaW5rLmgtYWRkLW1pc3NpbmctaW5j
bHVkZS1mb3ItaHRvYmU2NC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjNjNTc0YjI3MDAw
ZmQ4ODdjZWU4NGFiNDdhZGYyM2Y3NjdjYmVhMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gMzZmOTU5MDE3OWMyZjM3YmVlNGRiOGIzYzY0MzI1MjY3NzAwNzU4OCBNb24gU2VwIDE3IDAw
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

--===============0471309766423434236==--

