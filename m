Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24494C531EB
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:50 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1428.1771440109058787062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZeBTvUSE;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=snrmck4W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019c720ef368-7fb18062-4cec-425b-ba2a-6db7609e06b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440108;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oWZGZ5RXdj+l3dlze2pmsEj5PW2PkY0C69AgDtNeQQQ=;
	b=ZeBTvUSE/l+q5pSxp5SgG/OJ7tVEPiVW8Fv9fT/42ckkU5YRcjMAGyN2Vje4cdrW
	2loN2As3vUcH+jh4/C0bnN1HcmVRtrlsoRACOdo/SmR61VrLbj5fUssy+c2AxE6LAci
	Zm8BfklO0NlVpnnTBNqodLjS+rKLvh47PbYeZxJg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440108;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oWZGZ5RXdj+l3dlze2pmsEj5PW2PkY0C69AgDtNeQQQ=;
	b=snrmck4WFc9OUBR7F7ueCobL2iLqfyeyXEYN7GLQ2NZx0jFKGIkU+3T1eliryChe
	ptn4LkTgNJsg3qUE8eVKvaXTXNuk+JeXRiKS00WqsbyVf8aurPp3T9o2z0akg577gFm
	5tfaxhP4MQaSYdNXrJpTRcysyppGLG9r+aXHQ+mU=
Content-Type: multipart/mixed; boundary="===============7003689618829453533=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libpam: upgrading to 1.7.2 FAILED
Message-ID: <0101019c720ef368-7fb18062-4cec-425b-ba2a-6db7609e06b4-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231378

--===============7003689618829453533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpam* to *1.7.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libpam-upgrade-1.7.1-1.7.2.patch
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
From c0c13e07cf29ebcd50eb33f541f2bab8d11aa2c7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 14:43:03 +0000
Subject: [PATCH] libpam: upgrade 1.7.1 -> 1.7.2

---
 meta/recipes-extended/pam/{libpam_1.7.1.bb => libpam_1.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/pam/{libpam_1.7.1.bb => libpam_1.7.2.bb} (98%)

diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-extended/pam/libpam_1.7.2.bb
similarity index 98%
rename from meta/recipes-extended/pam/libpam_1.7.1.bb
rename to meta/recipes-extended/pam/libpam_1.7.2.bb
index 8fb67983ee..e2268c9e11 100644
--- a/meta/recipes-extended/pam/libpam_1.7.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.2.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://pam-volatiles.conf \
            "
 
-SRC_URI[sha256sum] = "21dbcec6e01dd578f14789eac9024a18941e6f2702a05cf91b28c232eeb26ab0"
+SRC_URI[sha256sum] = "3d86b6383fb5fd9eb9578d2cd47d92801191f4bf3f9bc61419bfefc8aa1e531a"
 
 DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
-- 
2.47.1


--===============7003689618829453533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-7327ddb76221364b711b6fa54057039e341ad845"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:7327ddb76221364b711b6fa54057039e341ad845"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 160 Local 128 Mirrors 0 Missed 32 Current 429 (80% match, 94% complete)
done.
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 11 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 473 of 589 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_setscene)
NOTE: Running setscene task 514 of 589 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 556 of 589 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 564 of 589 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 566 of 589 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 567 of 589 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 572 of 589 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe qemu-native-10.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe qemu-native-10.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 865 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_write_config)
NOTE: Running setscene task 573 of 589 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 589 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 577 of 589 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 580 of 589 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Started
NOTE: recipe meson-native-1.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe meson-native-1.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1161 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_fetch)
NOTE: recipe bash-5.3-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1245 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_unpack)
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Started
NOTE: recipe qemu-native-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 588 of 589 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-native-1_2.86.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1250 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_patch)
NOTE: recipe libpam-1.7.2-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-native-1_2.86.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 589 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe meson-native-1.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe meson-native-1.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1323 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1537 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1591 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_configure)
NOTE: recipe libpam-1.7.2-r0: task do_configure: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1608 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1609 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_compile)
NOTE: recipe libpam-1.7.2-r0: task do_compile: Started
NOTE: recipe libpam-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1610 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.7.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1611 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_install)
NOTE: recipe libpam-1.7.2-r0: task do_install: Started
NOTE: recipe libpam-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 1612 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_install_ptest_base)
NOTE: recipe libpam-1.7.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1613 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot)
NOTE: Running task 1614 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_package)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.7.2-r0: task do_package: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot unihash changed to b8d80aa6bab20354d85a262d69f9dc36a2f8d5464f69620272cbc221b0f91b09
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot as unihash f81a8b61d655dfb079e6328a1aadc2c934b8720ea2c3c5c4a2f772fbc3746e6b to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '0fd91e0a4bd2ec74a2ca43caaa4045fe411cdc0131b6b0ed177c1b4e7d47f682', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'f81a8b61d655dfb079e6328a1aadc2c934b8720ea2c3c5c4a2f772fbc3746e6b'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot unihash changed 0fd91e0a4bd2ec74a2ca43caaa4045fe411cdc0131b6b0ed177c1b4e7d47f682 -> f81a8b61d655dfb079e6328a1aadc2c934b8720ea2c3c5c4a2f772fbc3746e6b as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx as unihash e06adef119e59f5fde7b699c599ac3c29a6c1cb450a1306c6a8c9149b68291d4 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '0cc28f0f2cd001bb23ddcdc83b7d4eacd152522adf757479debc1c4ca7f4164e', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'e06adef119e59f5fde7b699c599ac3c29a6c1cb450a1306c6a8c9149b68291d4'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx unihash changed 0cc28f0f2cd001bb23ddcdc83b7d4eacd152522adf757479debc1c4ca7f4164e -> e06adef119e59f5fde7b699c599ac3c29a6c1cb450a1306c6a8c9149b68291d4 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 1615 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1616 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1617 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.77-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.77-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1618 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_configure)
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1619 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_configure)
NOTE: recipe libcap-2.77-r0: task do_configure: Started
NOTE: recipe shadow-4.18.0-r0: task do_configure: Started
NOTE: recipe libcap-2.77-r0: task do_configure: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1620 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_compile)
NOTE: Running task 1621 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_configure)
NOTE: recipe libcap-2.77-r0: task do_compile: Started
NOTE: recipe util-linux-2.41.3-r0: task do_configure: Started
NOTE: recipe libcap-2.77-r0: task do_compile: Succeeded
NOTE: Running task 1622 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_install)
NOTE: recipe libcap-2.77-r0: task do_install: Started
NOTE: recipe libcap-2.77-r0: task do_install: Succeeded
NOTE: Running task 1623 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_populate_sysroot)
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_populate_sysroot unihash changed to 81385977399d48a7b4b97337f3635abb3df610adff6d6d9d8a4f5e8536de11e6
NOTE: Setscene tasks completed
NOTE: Running task 1624 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1625 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_configure)
NOTE: recipe coreutils-9.9-r0: task do_configure: Started
NOTE: recipe libpam-1.7.2-r0: task do_package: Failed
NOTE: recipe shadow-4.18.0-r0: task do_configure: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_configure: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1625 tasks of which 1600 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218144148.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218144148.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libpam/1.7.2/temp/log.do_package.957206
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libpam-1.7.2-r0 do_package: QA Issue: libpam: Files/directories were installed but not shipped in any package:
  /usr/share/pam
  /usr/share/pam/environment
  /usr/share/pam/security
  /usr/share/pam/security/limits.conf
  /usr/share/pam/security/namespace.init
  /usr/share/pam/security/pwhistory.conf
  /usr/share/pam/security/group.conf
  /usr/share/pam/security/namespace.conf
  /usr/share/pam/security/faillock.conf
  /usr/share/pam/security/access.conf
  /usr/share/pam/security/pam_env.conf
  /usr/share/pam/security/time.conf
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libpam: 12 installed and not shipped files. [installed-vs-shipped]
ERROR: libpam-1.7.2-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libpam/1.7.2/temp/log.do_package.957206
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_package) failed with exit code '1'

--===============7003689618829453533==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpam-upgrade-1.7.1-1.7.2.patch"

RnJvbSBjMGMxM2UwN2NmMjllYmNkNTBlYjMzZjU0MWYyYmFiOGQxMWFhMmM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTQ6NDM6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwYW06IHVwZ3JhZGUgMS43LjEgLT4gMS43LjIKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3BhbS97bGlicGFtXzEuNy4xLmJiID0+IGxpYnBhbV8xLjcuMi5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvcGFtL3tsaWJwYW1fMS43LjEuYmIgPT4gbGlicGFtXzEuNy4yLmJifSAoOTgl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wYW0vbGlicGFtXzEuNy4xLmJi
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhbS9saWJwYW1fMS43LjIuYmIKc2ltaWxhcml0eSBp
bmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhbS9saWJwYW1fMS43
LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wYW0vbGlicGFtXzEuNy4yLmJi
CmluZGV4IDhmYjY3OTgzZWUuLmUyMjY4YzllMTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9wYW0vbGlicGFtXzEuNy4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9w
YW0vbGlicGFtXzEuNy4yLmJiCkBAIC0yNCw3ICsyNCw3IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJf
QkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS9MaW51eC1QQU0tJHtQVn0udGFyLnh6IFwKICAgICAg
ICAgICAgZmlsZTovL3BhbS12b2xhdGlsZXMuY29uZiBcCiAgICAgICAgICAgICIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjIxZGJjZWM2ZTAxZGQ1NzhmMTQ3ODllYWM5MDI0YTE4OTQxZTZmMjcw
MmEwNWNmOTFiMjhjMjMyZWViMjZhYjAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2Q4NmI2Mzgz
ZmI1ZmQ5ZWI5NTc4ZDJjZDQ3ZDkyODAxMTkxZjRiZjNmOWJjNjE0MTliZmVmYzhhYTFlNTMxYSIK
IAogREVQRU5EUyA9ICJiaXNvbi1uYXRpdmUgZmxleC1uYXRpdmUgbGlieG1sMi1uYXRpdmUgdmly
dHVhbC9jcnlwdCIKIAotLSAKMi40Ny4xCgo=

--===============7003689618829453533==--

