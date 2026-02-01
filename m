Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10079D172DE
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:58 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29196.1769951573142473470
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xSVtI+1z;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PcWB5/c6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c1955bc73-52c80e0a-6cbc-43d3-a35c-e75ee03fe0e6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=esOOTN5cz5pfgfKkmlhC6iXdq8f4ZYv8mQ6b7U04m7g=;
	b=xSVtI+1zn/Md1VYBmkSMkKOK1PpCxv9IzQ5RgdTw2bcM6dQH356fYhQuHIRkaosG
	WbmTAfrdrQ9h5S87Ut6za+wPjg0qNQuJ25vz7X/BNNVq5aj6+Q+ID2KmxMJrEOO18Ex
	JH8e8j6x73GSneF0Fh1jCwCsc4uC2YfDyEV3+Pts=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=esOOTN5cz5pfgfKkmlhC6iXdq8f4ZYv8mQ6b7U04m7g=;
	b=PcWB5/c6D6C1SwX4FzbpZ/2azfVhMU6aVit/c2ZBE4JSMhhKiSwqGgg+q9VGfGjI
	2KBRn2ygbjzWQ6N9yegTXT4HRqq+RBGC/VBeBD8UG0Yb6Z0u8DDhIDC1oh0KgqN8UFA
	so1ugzuPXAuw1sRwHNZhlXLn1ZrHY46q8hl5ZGhQ=
Content-Type: multipart/mixed; boundary="===============2500480200262998802=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libpam: upgrading to 1.7.2 FAILED
Message-ID: <0101019c1955bc73-52c80e0a-6cbc-43d3-a35c-e75ee03fe0e6-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230302

--===============2500480200262998802==
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
From 7c5d7b4962b134df23ba4bb19a88e1d17f6f4b2c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 10:18:53 +0000
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


--===============2500480200262998802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1957 targets, 47 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.3.99+snapshot-c15062d0163004cbee33b6cbb7b06b8017d7c9f0"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:c15062d0163004cbee33b6cbb7b06b8017d7c9f0"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 144 Local 110 Mirrors 0 Missed 34 Current 446 (76% match, 94% complete)
done.
Removing 14 stale sstate objects for arch x86-64-v3...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 567 of 590 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_setscene)
NOTE: Running setscene task 579 of 590 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 970 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa)
NOTE: Running task 1022 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_write_config)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1586 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_fetch)
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1587 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_unpack)
NOTE: Running task 1588 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1589 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_patch)
NOTE: Running task 1590 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.7.2-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1591 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1592 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_lic)
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_lic: Started
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_deploy_source_date_epoch unihash changed to 777f7f21122979d30f81c83452da2f342becb2b43028b12ef8511ed5cc7fdf5c
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx as unihash 8b615fd6310c4d33d6c670226811c4ae91a5be3a38a57f50615ee8b1fcb8e5a7 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '39ac9edc2b30625b5d8226e5348afae89144c0751eefe08cc047fcc966bbae3f', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '8b615fd6310c4d33d6c670226811c4ae91a5be3a38a57f50615ee8b1fcb8e5a7'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx unihash changed 39ac9edc2b30625b5d8226e5348afae89144c0751eefe08cc047fcc966bbae3f -> 8b615fd6310c4d33d6c670226811c4ae91a5be3a38a57f50615ee8b1fcb8e5a7 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_lic unihash changed to 69270955ae68dd8e7ebbb8b9db2fc9789adb14481d3b4e38db92d0e7a84b404a
NOTE: Running task 1593 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_configure)
NOTE: recipe libpam-1.7.2-r0: task do_configure: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1610 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1611 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_compile)
NOTE: recipe libpam-1.7.2-r0: task do_compile: Started
NOTE: recipe libpam-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1612 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.7.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1613 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_install)
NOTE: recipe libpam-1.7.2-r0: task do_install: Started
NOTE: recipe libpam-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 1614 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_install_ptest_base)
NOTE: recipe libpam-1.7.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1615 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot)
NOTE: Running task 1616 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_package)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.7.2-r0: task do_package: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot unihash changed to ce8cb8682312a2f30f193683c46dfc0087110ac44379a584509badac7d8981cc
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx as unihash 8b615fd6310c4d33d6c670226811c4ae91a5be3a38a57f50615ee8b1fcb8e5a7 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '60432392c55917ce294df4352a77350e8095af4388c7fd504e5c3cff8d8280a0', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '8b615fd6310c4d33d6c670226811c4ae91a5be3a38a57f50615ee8b1fcb8e5a7'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx unihash changed 60432392c55917ce294df4352a77350e8095af4388c7fd504e5c3cff8d8280a0 -> 8b615fd6310c4d33d6c670226811c4ae91a5be3a38a57f50615ee8b1fcb8e5a7 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 1617 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1618 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1619 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.77-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.77-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1620 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_configure)
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1621 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_configure)
NOTE: recipe libcap-2.77-r0: task do_configure: Started
NOTE: recipe shadow-4.18.0-r0: task do_configure: Started
NOTE: recipe util-linux-2.41.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1622 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_configure)
NOTE: recipe libcap-2.77-r0: task do_configure: Succeeded
NOTE: Running task 1623 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_compile)
NOTE: recipe util-linux-2.41.3-r0: task do_configure: Started
NOTE: recipe libcap-2.77-r0: task do_compile: Started
NOTE: recipe libcap-2.77-r0: task do_compile: Succeeded
NOTE: Running task 1624 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_install)
NOTE: recipe libcap-2.77-r0: task do_install: Started
NOTE: recipe libcap-2.77-r0: task do_install: Succeeded
NOTE: Running task 1625 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_populate_sysroot)
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1626 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1627 of 1684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_configure)
NOTE: recipe coreutils-9.9-r0: task do_configure: Started
NOTE: recipe libpam-1.7.2-r0: task do_package: Failed
NOTE: recipe shadow-4.18.0-r0: task do_configure: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_configure: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1627 tasks of which 1599 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201101738.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201101738.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libpam/1.7.2/temp/log.do_package.4142633
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libpam-1.7.2-r0 do_package: QA Issue: libpam: Files/directories were installed but not shipped in any package:
  /usr/share/pam
  /usr/share/pam/environment
  /usr/share/pam/security
  /usr/share/pam/security/namespace.init
  /usr/share/pam/security/time.conf
  /usr/share/pam/security/limits.conf
  /usr/share/pam/security/pam_env.conf
  /usr/share/pam/security/access.conf
  /usr/share/pam/security/namespace.conf
  /usr/share/pam/security/group.conf
  /usr/share/pam/security/pwhistory.conf
  /usr/share/pam/security/faillock.conf
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libpam: 12 installed and not shipped files. [installed-vs-shipped]
ERROR: libpam-1.7.2-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libpam/1.7.2/temp/log.do_package.4142633
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_package) failed with exit code '1'

--===============2500480200262998802==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpam-upgrade-1.7.1-1.7.2.patch"

RnJvbSA3YzVkN2I0OTYyYjEzNGRmMjNiYTRiYjE5YTg4ZTFkMTdmNmY0YjJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMDoxODo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnBhbTogdXBncmFkZSAxLjcuMSAtPiAxLjcuMgoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
cGFtL3tsaWJwYW1fMS43LjEuYmIgPT4gbGlicGFtXzEuNy4yLmJifSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9wYW0ve2xpYnBhbV8xLjcuMS5iYiA9PiBsaWJwYW1fMS43LjIuYmJ9ICg5OCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhbS9saWJwYW1fMS43LjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFtL2xpYnBhbV8xLjcuMi5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFtL2xpYnBhbV8xLjcu
MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhbS9saWJwYW1fMS43LjIuYmIK
aW5kZXggOGZiNjc5ODNlZS4uZTIyNjhjOWUxMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3BhbS9saWJwYW1fMS43LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Bh
bS9saWJwYW1fMS43LjIuYmIKQEAgLTI0LDcgKzI0LDcgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9C
QVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L0xpbnV4LVBBTS0ke1BWfS50YXIueHogXAogICAgICAg
ICAgICBmaWxlOi8vcGFtLXZvbGF0aWxlcy5jb25mIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMjFkYmNlYzZlMDFkZDU3OGYxNDc4OWVhYzkwMjRhMTg5NDFlNmYyNzAy
YTA1Y2Y5MWIyOGMyMzJlZWIyNmFiMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzZDg2YjYzODNm
YjVmZDllYjk1NzhkMmNkNDdkOTI4MDExOTFmNGJmM2Y5YmM2MTQxOWJmZWZjOGFhMWU1MzFhIgog
CiBERVBFTkRTID0gImJpc29uLW5hdGl2ZSBmbGV4LW5hdGl2ZSBsaWJ4bWwyLW5hdGl2ZSB2aXJ0
dWFsL2NyeXB0IgogCi0tIAoyLjQ3LjEKCg==

--===============2500480200262998802==--

