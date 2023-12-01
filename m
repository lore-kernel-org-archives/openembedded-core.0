Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7010C19772
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:14:58 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.22183.1701436490919217528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NZreNSDm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=h9dnWF7W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018c2584817a-2890f6aa-ecae-4cfd-bac7-99ff44d14cdf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436490;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FG+wGVQEmCOp0kCmq12dPsrN9FLZGLsRBUjYUrRqnZ0=;
	b=NZreNSDmx6ntncIrY+3OywF9bcLi29PM7n2RZQN+coW1uVP/ufqUxvtGHn0WJnyZ
	o9w483IABX88oPxp5/xzr3jmT1crT22JXxFJMWcnTzH1qT0lwN+G6qB9nZqOpFj3Dlc
	ibMGXn19ieloO6w1vGMqgArcgYZbyACWMMY9GAqc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436490;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FG+wGVQEmCOp0kCmq12dPsrN9FLZGLsRBUjYUrRqnZ0=;
	b=h9dnWF7WN4tq+Hj4C9LIx3AoPJmNQRDGB5broTfoj5ZCQpU80/TfbnA3dR7QJvIe
	brh39zCcVYjI5DeqPJgGTz/55RMo8+ZwmWBtIjcd5cW5B4ksglBKSABTnQL4WPv5ek/
	TMMcCPAtiA8zJLz7CzcnanCczbzrhaPSo1Y1ifi8=
Content-Type: multipart/mixed; boundary="===============8349514558468122345=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gettext: upgrading to 0.22.4 FAILED
Message-ID: <0101018c2584817a-2890f6aa-ecae-4cfd-bac7-99ff44d14cdf-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191579

--===============8349514558468122345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gettext* to *0.22.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gettext-upgrade-0.22-0.22.4.patch
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
From 44c13c5ff71c02842f32067350c4470b2a8f0d23 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 06:04:29 +0000
Subject: [PATCH] gettext: upgrade 0.22 -> 0.22.4

---
 meta/recipes-core/gettext/gettext-sources.inc                   | 2 +-
 .../recipes-core/gettext/{gettext_0.22.bb => gettext_0.22.4.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/gettext/{gettext_0.22.bb => gettext_0.22.4.bb} (100%)

diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index b4fb647916..8b4e240101 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,4 +1,4 @@
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab"
+SRC_URI[sha256sum] = "c1e0bb2a4427a9024390c662cd532d664c4b36b8ff444ed5e54b115fdb7a1aea"
diff --git a/meta/recipes-core/gettext/gettext_0.22.bb b/meta/recipes-core/gettext/gettext_0.22.4.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext_0.22.bb
rename to meta/recipes-core/gettext/gettext_0.22.4.bb
-- 
2.39.2


--===============8349514558468122345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1847 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (910 cached, 2 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d035a0768210b56cba2a2f244c32149913b2dab7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d035a0768210b56cba2a2f244c32149913b2dab7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 526 Local 137 Mirrors 0 Missed 389 Current 120 (26% match, 39% complete)
Removing 58 stale sstate objects for arch core2-64...done.
Removing 92 stale sstate objects for arch x86_64...done.
Removing 49 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 180 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 211 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 229 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 235 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 288 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 296 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 297 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 306 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 312 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 315 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 317 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4_1.4.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 318 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 320 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 324 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 326 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 331 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnu-config-20230216+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe autoconf-2.72c-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe m4-1.4.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-native-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dpkg-native-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 332 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 336 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnu-config-20230216+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 339 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 340 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 341 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe autoconf-2.72c-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 342 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 343 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_recipe_qa_setscene)
NOTE: recipe m4-1.4.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 344 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4_1.4.19.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 347 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 348 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 351 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 353 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 355 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dpkg-native-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 356 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.38.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 357 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-native-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 360 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnu-config-20230216+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe autoconf-2.72c-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe m4-1.4.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 364 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnu-config-20230216+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 367 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe autoconf-2.72c-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 373 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 374 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 375 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 378 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 381 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 386 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe m4-1.4.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 388 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 391 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 394 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 398 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 401 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 402 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 403 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 404 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 405 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 406 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 407 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 408 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 417 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 422 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 424 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 427 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 430 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 432 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 433 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 442 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 445 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/help2man/help2man_1.49.3.bb:do_recipe_qa_setscene)
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 447 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 451 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 459 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 461 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe help2man-native-1.49.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 465 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 466 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe meson-native-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-native-69.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 467 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 468 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.41.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 479 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.5.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-build-native-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 482 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 484 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 485 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 488 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 489 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe help2man-native-1.49.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 491 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-native-23.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-native-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 492 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 495 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-native-69.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 499 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-build-native-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 503 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-native-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-native-0.189-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-native-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lua-native-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 509 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe patch-native-2.7.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 510 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-native-23.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 515 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 516 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 519 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe rpm-native-1_4.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 524 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-native-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 527 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 531 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-native-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-native-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 540 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-native-0.189-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 546 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lua-native-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 550 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe patch-native-2.7.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 552 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 553 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-native-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-native-4.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 558 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rsync-native-3.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rpm-native-1_4.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 559 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 561 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cmake-native-3.27.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-native-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-native-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-native-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-native-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 564 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 565 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-native-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 566 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-native-4.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 567 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-native-3.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-native-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 569 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe ninja-native-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-native-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 571 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-native-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 572 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe attr-native-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cmake-native-3.27.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-native-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 574 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 576 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 580 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-native-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 581 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perlcross-native-1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-native-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-native-3.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 583 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-native-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 587 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-native-5.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 589 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-native-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 590 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-native-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 593 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-native-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-native-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-native-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 595 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 597 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 600 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-native-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-native-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-native-5.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 601 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-native-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 611 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perlcross-native-1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 613 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-native-1.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 614 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-native-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 617 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-native-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-native-1.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 622 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 630 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_create_spdx_setscene)
NOTE: recipe gperf-native-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-native-10.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-native-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-native-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 631 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 635 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-native-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 642 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4-native_1.4.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perlcross-native-1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-native-1.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmpc-native-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 643 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 644 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-native-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 645 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-native-10.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-native-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 646 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-native-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe popt-native-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe m4-native-1.4.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-native-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 13 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_recipe_qa)
NOTE: Running task 20 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe gnu-config-native-20230216+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gperf-native-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 23 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-native-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 34 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_fetch)
NOTE: Running task 37 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_fetch)
NOTE: recipe gmp-native-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 38 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe nettle-native-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe autoconf-native-2.72c-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe automake-native-1.16.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gettext-minimal-native-0.22-r0: task do_recipe_qa: Started
NOTE: Running task 43 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_fetch)
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnu-config-native-20230216+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-native-3_3.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 54 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_fetch)
NOTE: recipe libtool-native-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 55 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_fetch)
NOTE: recipe popt-native-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 59 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb:do_fetch)
NOTE: recipe xz-native-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe m4-native-1.4.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 60 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_fetch)
NOTE: Running task 61 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4-native_1.4.19.bb:do_fetch)
NOTE: recipe flex-native-2.6.4-r0: task do_fetch: Started
NOTE: recipe attr-native-2.5.1-r0: task do_fetch: Started
NOTE: recipe bison-native-3.8.2-r0: task do_fetch: Started
NOTE: recipe patch-native-2.7.6-r0: task do_fetch: Started
NOTE: recipe automake-native-1.16.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_fetch: Succeeded
NOTE: recipe gmp-native-6.3.0-r0: task do_fetch: Started
NOTE: Running task 62 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_fetch)
NOTE: Running task 63 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_unpack)
NOTE: recipe autoconf-native-2.72c-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 64 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_fetch)
NOTE: recipe attr-native-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libtool-native-2.4.7-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_fetch: Started
NOTE: Running task 66 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 67 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_fetch)
NOTE: recipe gmp-native-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_fetch: Started
NOTE: recipe patch-native-2.7.6-r0: task do_fetch: Succeeded
NOTE: Running task 68 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: Running task 69 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_unpack)
NOTE: recipe gettext-minimal-native-0.22-r0: task do_recipe_qa: Succeeded
NOTE: recipe m4-native-1.4.19-r0: task do_fetch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_recipe_qa unihash changed to 580305930cbe37f5452919f711062a7df98dffcfd3e2bcd9f01aa01e9a34065a
NOTE: recipe sqlite3-native-3_3.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-native-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe autoconf-archive-native-2023.02.20-r0: task do_fetch: Started
NOTE: recipe m4-native-1.4.19-r0: task do_fetch: Succeeded
NOTE: recipe autoconf-archive-native-2023.02.20-r0: task do_fetch: Succeeded
NOTE: recipe xz-native-5.4.4-r0: task do_fetch: Started
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_fetch: Succeeded
NOTE: recipe xz-native-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_fetch: Succeeded
NOTE: recipe automake-native-1.16.5-r0: task do_fetch: Started
NOTE: recipe autoconf-native-2.72c-r0: task do_fetch: Started
NOTE: recipe mpfr-native-4.2.1-r0: task do_fetch: Started
NOTE: recipe flex-native-2.6.4-r0: task do_unpack: Started
NOTE: recipe attr-native-2.5.1-r0: task do_unpack: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_unpack: Started
NOTE: recipe automake-native-1.16.5-r0: task do_fetch: Succeeded
NOTE: recipe patch-native-2.7.6-r0: task do_unpack: Started
NOTE: recipe autoconf-native-2.72c-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-native-4.2.1-r0: task do_fetch: Succeeded
NOTE: recipe attr-native-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe patch-native-2.7.6-r0: task do_unpack: Succeeded
NOTE: recipe gmp-native-6.3.0-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 70 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_fetch)
NOTE: Running task 71 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4-native_1.4.19.bb:do_unpack)
NOTE: Running task 72 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_unpack)
NOTE: Running task 73 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_unpack)
NOTE: Running task 74 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_unpack)
NOTE: Running task 75 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_unpack)
NOTE: Running task 76 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_fetch)
NOTE: Running task 77 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: Running task 78 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
NOTE: Running task 79 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_patch)
NOTE: Running task 80 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_fetch)
NOTE: Running task 81 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 82 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_unpack)
NOTE: Running task 90 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 92 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 95 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_fetch)
NOTE: recipe gettext-minimal-native-0.22-r0: task do_fetch: Started
NOTE: recipe m4-native-1.4.19-r0: task do_unpack: Started
NOTE: recipe libtool-native-2.4.7-r0: task do_unpack: Started
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.tar.gz
Cleaning and trying again.
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.tar.gz_bad-checksum_49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_unpack: Started
NOTE: recipe autoconf-native-2.72c-r0: task do_unpack: Started
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_fetch: Started
NOTE: recipe automake-native-1.16.5-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.44.0-r0: task do_fetch: Started
NOTE: recipe patch-native-2.7.6-r0: task do_patch: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_patch: Started
NOTE: recipe xz-native-5.4.4-r0: task do_unpack: Started
NOTE: recipe flex-native-2.6.4-r0: task do_patch: Started
NOTE: recipe attr-native-2.5.1-r0: task do_patch: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_fetch: Started
NOTE: recipe acl-native-2.3.1-r0: task do_fetch: Started
NOTE: recipe popt-native-1.19-r0: task do_fetch: Started
NOTE: recipe sqlite3-native-3_3.44.0-r0: task do_fetch: Succeeded
NOTE: recipe popt-native-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 96 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_unpack)
NOTE: recipe rsync-native-3.2.7-r0: task do_fetch: Succeeded
NOTE: recipe acl-native-2.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 97 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_fetch)
NOTE: Running task 99 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_fetch)
NOTE: Running task 103 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: recipe attr-native-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 106 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_fetch)
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_fetch: Succeeded
NOTE: Running task 107 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_unpack)
NOTE: recipe m4-native-1.4.19-r0: task do_unpack: Succeeded
NOTE: Running task 108 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4-native_1.4.19.bb:do_patch)
NOTE: recipe xz-native-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 109 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_patch)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Started
NOTE: recipe libtool-native-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 110 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_patch)
NOTE: recipe unifdef-native-2.12-r0: task do_fetch: Started
NOTE: recipe automake-native-1.16.5-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-native-3_3.44.0-r0: task do_unpack: Started
NOTE: Running task 111 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_patch)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-native-1.3.1-r0: task do_fetch: Started
NOTE: recipe unifdef-native-2.12-r0: task do_fetch: Succeeded
NOTE: Running task 112 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Running task 113 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: recipe m4-native-1.4.19-r0: task do_patch: Started
NOTE: Running task 114 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_unpack)
NOTE: recipe libmpc-native-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_unpack: Started
NOTE: Running task 117 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: recipe gmp-native-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 119 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-native-2.4.7-r0: task do_patch: Started
NOTE: recipe xz-native-5.4.4-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.44.0-r0: task do_unpack: Succeeded
NOTE: Running task 120 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_patch)
NOTE: recipe xz-native-5.4.4-r0: task do_patch: Succeeded
NOTE: Running noexec task 129 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_fetch)
NOTE: Running task 131 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_fetch)
NOTE: recipe automake-native-1.16.5-r0: task do_patch: Started
NOTE: recipe autoconf-native-2.72c-r0: task do_unpack: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_unpack: Started
NOTE: Running task 132 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_patch)
NOTE: recipe popt-native-1.19-r0: task do_unpack: Started
NOTE: recipe acl-native-2.3.1-r0: task do_unpack: Started
NOTE: recipe flex-native-2.6.4-r0: task do_patch: Succeeded
NOTE: Running task 137 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_fetch)
NOTE: recipe libmpc-native-1.3.1-r0: task do_unpack: Started
NOTE: recipe unifdef-native-2.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-native-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 138 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe acl-native-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 139 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: recipe libmpc-native-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_unpack: Succeeded
NOTE: Running noexec task 141 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_fetch)
NOTE: recipe m4-native-1.4.19-r0: task do_patch: Succeeded
NOTE: Running task 151 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 152 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: Running task 154 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_patch)
NOTE: Running task 156 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: recipe sqlite3-native-3_3.44.0-r0: task do_patch: Started
NOTE: recipe gperf-native-3.1-r0: task do_fetch: Started
NOTE: recipe sqlite3-native-3_3.44.0-r0: task do_patch: Succeeded
NOTE: recipe gperf-native-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 160 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: Running task 161 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_unpack)
NOTE: recipe autoconf-native-2.72c-r0: task do_patch: Started
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Started
NOTE: recipe popt-native-1.19-r0: task do_patch: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_patch: Started
NOTE: recipe acl-native-2.3.1-r0: task do_patch: Started
NOTE: recipe gdbm-native-1.23-r0: task do_fetch: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_patch: Started
NOTE: recipe ncurses-native-6.4-r0: task do_fetch: Started
NOTE: recipe popt-native-1.19-r0: task do_patch: Succeeded
NOTE: recipe gdbm-native-1.23-r0: task do_fetch: Succeeded
NOTE: Running task 165 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_fetch)
NOTE: recipe libmpc-native-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 166 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: Running task 169 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe make-native-4.4.1-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Succeeded
NOTE: recipe gperf-native-3.1-r0: task do_unpack: Started
NOTE: Running task 170 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_unpack)
NOTE: recipe patch-native-2.7.6-r0: task do_patch: Succeeded
NOTE: Running task 173 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_fetch)
NOTE: recipe ncurses-native-6.4-r0: task do_fetch: Succeeded
NOTE: recipe make-native-4.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 174 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running noexec task 176 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: Running task 178 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_fetch)
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_unpack: Succeeded
NOTE: Running task 179 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_patch)
NOTE: recipe gperf-native-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 180 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_patch)
NOTE: recipe perl-native-5.38.0-r0: task do_fetch: Started
NOTE: recipe gdbm-native-1.23-r0: task do_unpack: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Started
NOTE: recipe automake-native-1.16.5-r0: task do_patch: Succeeded
NOTE: recipe perl-native-5.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 182 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe acl-native-2.3.1-r0: task do_patch: Succeeded
NOTE: Running task 184 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_unpack)
NOTE: recipe rsync-native-3.2.7-r0: task do_patch: Succeeded
NOTE: Running task 188 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: Running task 191 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/re2c/re2c_3.1.bb:do_fetch)
NOTE: recipe libtirpc-native-1.3.4-r0: task do_fetch: Started
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_patch: Started
NOTE: recipe openssl-native-3.1.4-r0: task do_fetch: Started
NOTE: recipe gdbm-native-1.23-r0: task do_unpack: Succeeded
NOTE: Running task 192 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe gperf-native-3.1-r0: task do_patch: Started
NOTE: recipe libtirpc-native-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-native-6.4-r0: task do_unpack: Started
NOTE: Running task 193 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_unpack)
NOTE: recipe bzip2-native-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe openssl-native-3.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 194 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_unpack)
NOTE: Running task 195 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_patch: Succeeded
NOTE: Running task 198 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_fetch)
NOTE: recipe make-native-4.4.1-r0: task do_unpack: Started
NOTE: recipe re2c-native-3.1-r0: task do_fetch: Started
NOTE: recipe perl-native-5.38.0-r0: task do_unpack: Started
NOTE: recipe expat-native-2.5.0-r0: task do_fetch: Started
NOTE: recipe re2c-native-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 200 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb:do_fetch)
NOTE: recipe expat-native-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-native-1.23-r0: task do_patch: Started
NOTE: Running task 202 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_fetch)
NOTE: recipe libtirpc-native-1.3.4-r0: task do_unpack: Started
NOTE: recipe gperf-native-3.1-r0: task do_patch: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_unpack: Started
NOTE: Running task 205 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: recipe openssl-native-3.1.4-r0: task do_unpack: Started
NOTE: recipe make-native-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 206 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe cmake-native-3.27.7-r0: task do_fetch: Started
NOTE: recipe gdbm-native-1.23-r0: task do_patch: Succeeded
NOTE: recipe ninja-native-1.11.1-r0: task do_fetch: Started
NOTE: Running task 210 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_fetch)
NOTE: recipe cmake-native-3.27.7-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-native-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 211 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 212 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_patch)
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_fetch: Succeeded
NOTE: recipe libffi-native-3.4.4-r0: task do_fetch: Started
NOTE: Running task 213 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: recipe make-native-4.4.1-r0: task do_patch: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 215 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_fetch)
NOTE: recipe libffi-native-3.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 222 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_unpack)
NOTE: recipe libtool-native-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 224 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb:do_unpack)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_fetch: Started
NOTE: recipe libtirpc-native-1.3.4-r0: task do_patch: Started
NOTE: recipe cmake-native-3.27.7-r0: task do_unpack: Started
NOTE: recipe make-native-4.4.1-r0: task do_patch: Succeeded
NOTE: Running task 227 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_fetch)
NOTE: recipe libedit-native-20230828-3.1-r0: task do_fetch: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_fetch: Succeeded
NOTE: recipe ninja-native-1.11.1-r0: task do_unpack: Started
NOTE: Running noexec task 229 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: Running task 230 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.5.0-r0: task do_unpack: Started
NOTE: Running task 231 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_unpack)
NOTE: recipe libtirpc-native-1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 232 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe zlib-1.3-r0: task do_fetch: Started
NOTE: recipe python3-native-3.11.5-r0: task do_fetch: Started
NOTE: recipe zlib-1.3-r0: task do_fetch: Succeeded
NOTE: Running task 235 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe python3-native-3.11.5-r0: task do_fetch: Succeeded
NOTE: Running task 236 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_unpack)
NOTE: recipe libffi-native-3.4.4-r0: task do_unpack: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_unpack: Started
NOTE: recipe expat-native-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 237 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: Running task 238 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe ncurses-native-6.4-r0: task do_unpack: Succeeded
NOTE: Running task 239 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 240 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_patch)
NOTE: recipe libffi-native-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3-r0: task do_unpack: Started
NOTE: Running task 241 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 242 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe openssl-native-3.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 243 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_patch)
NOTE: recipe zlib-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 246 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.4.bb:do_recipe_qa)
NOTE: recipe expat-native-2.5.0-r0: task do_patch: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_patch: Started
NOTE: recipe ncurses-native-6.4-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_patch: Started
NOTE: recipe expat-native-2.5.0-r0: task do_patch: Succeeded
NOTE: Running task 247 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe libffi-native-3.4.4-r0: task do_patch: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 253 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_fetch)
NOTE: recipe openssl-native-3.1.4-r0: task do_patch: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_patch: Succeeded
NOTE: recipe gettext-native-0.22.4-r0: task do_recipe_qa: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 258 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_fetch)
NOTE: Running task 259 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_patch)
NOTE: recipe perl-native-5.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 260 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_patch)
NOTE: recipe expat-native-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 262 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_fetch)
NOTE: recipe libffi-native-3.4.4-r0: task do_patch: Succeeded
NOTE: Running task 265 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_unpack)
NOTE: Running task 268 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_patch: Started
NOTE: recipe gettext-native-0.22.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe expat-native-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 269 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.4.bb:do_fetch)
NOTE: Running task 271 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_fetch)
NOTE: recipe perl-native-5.38.0-r0: task do_patch: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_unpack: Succeeded
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Checksum failure encountered with download of https://ftp.gnu.org/gnu/gettext/gettext-0.22.tar.gz - will attempt other sources if available
NOTE: recipe ninja-native-1.11.1-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 272 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 275 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_fetch)
NOTE: Running task 276 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_unpack)
NOTE: recipe ncurses-native-6.4-r0: task do_patch: Succeeded
NOTE: Running task 280 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_fetch: Started
NOTE: recipe libunistring-native-1.1-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_unpack: Started
NOTE: recipe libunistring-native-1.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_fetch: Succeeded
NOTE: Running task 281 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_fetch)
NOTE: Running task 283 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_fetch)
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 284 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_patch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Started
NOTE: recipe openssl-native-3.1.4-r0: task do_patch: Succeeded
NOTE: recipe gettext-native-0.22.4-r0: task do_fetch: Started
NOTE: Running task 287 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_patch: Started
NOTE: recipe curl-native-8.4.0-r0: task do_fetch: Started
NOTE: recipe gettext-native-0.22.4-r0: task do_fetch: Succeeded
NOTE: Running task 288 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.4.bb:do_unpack)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe curl-native-8.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 290 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_fetch)
NOTE: Running task 291 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 293 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_unpack)
NOTE: recipe libgpg-error-native-1.47-r0: task do_fetch: Started
NOTE: recipe libcap-native-2.69-r0: task do_fetch: Started
NOTE: recipe libgpg-error-native-1.47-r0: task do_fetch: Succeeded
NOTE: recipe libcap-native-2.69-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_patch: Started
NOTE: Running task 301 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 303 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 305 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: Running task 307 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_fetch)
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_patch: Succeeded
NOTE: Running task 310 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Started
NOTE: recipe gettext-native-0.22.4-r0: task do_unpack: Started
NOTE: recipe libunistring-native-1.1-r0: task do_unpack: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Started
NOTE: Running task 312 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 313 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_patch)
NOTE: recipe libxml2-native-2.11.5-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 315 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 317 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_fetch)
NOTE: recipe libxml2-native-2.11.5-r0: task do_fetch: Succeeded
NOTE: Running task 318 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 320 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: recipe cmake-native-3.27.7-r0: task do_unpack: Succeeded
NOTE: Running task 321 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb:do_patch)
NOTE: recipe libunistring-native-1.1-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-native-2.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 323 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: Running task 324 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_fetch)
NOTE: Running task 325 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Started
NOTE: recipe perl-native-5.38.0-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe libpcre2-native-10.42-r0: task do_fetch: Started
NOTE: Running task 327 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.4-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe cmake-native-3.27.7-r0: task do_patch: Started
NOTE: Running task 331 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: recipe libpcre2-native-10.42-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 332 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: recipe autoconf-native-2.72c-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_fetch: Started
NOTE: Running task 333 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 337 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe libunistring-native-1.1-r0: task do_patch: Started
NOTE: Running task 338 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_fetch)
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 341 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 342 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: recipe libgpg-error-native-1.47-r0: task do_unpack: Started
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.39.2-r0: task do_fetch: Started
NOTE: recipe libunistring-native-1.1-r0: task do_patch: Succeeded
NOTE: Running task 344 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Started
NOTE: recipe cmake-native-3.27.7-r0: task do_patch: Succeeded
NOTE: recipe util-linux-native-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 345 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_unpack)
NOTE: Running task 347 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe nettle-native-3.9.1-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-native-2.3.4-r0: task do_fetch: Started
NOTE: Running task 349 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_fetch)
NOTE: recipe nettle-native-3.9.1-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Started
NOTE: Running task 350 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: recipe libidn2-native-2.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 351 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: recipe gnutls-native-3.8.2-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Started
NOTE: Running task 352 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: recipe gnutls-native-3.8.2-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Succeeded
NOTE: Running task 353 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: recipe elfutils-native-0.189-r0: task do_fetch: Started
NOTE: Running task 354 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_unpack)
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_fetch: Succeeded
NOTE: Running task 355 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: recipe libgpg-error-native-1.47-r0: task do_unpack: Succeeded
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.tar.gz
Cleaning and trying again.
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.tar.gz_bad-checksum_49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab
NOTE: Running task 356 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_fetch: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_unpack: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-native-0.189-r0: task do_fetch: Succeeded
NOTE: Running task 357 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 358 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe libpcre2-native-10.42-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.4-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: Running task 359 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: recipe libgpg-error-native-1.47-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 360 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_patch)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Started
NOTE: recipe nettle-native-3.9.1-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 361 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe libidn2-native-2.3.4-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_patch: Started
NOTE: recipe nettle-native-3.9.1-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-native-1.47-r0: task do_patch: Succeeded
NOTE: Running task 363 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_patch)
NOTE: Running task 364 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_patch: Succeeded
NOTE: Running task 365 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_unpack)
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_unpack: Succeeded
NOTE: Running task 366 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 367 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Started
NOTE: recipe libidn2-native-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 368 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe libpcre2-native-10.42-r0: task do_unpack: Succeeded
NOTE: recipe nettle-native-3.9.1-r0: task do_patch: Started
NOTE: Running task 369 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_patch)
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 370 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Started
NOTE: Running task 372 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_unpack)
NOTE: recipe libarchive-native-3.7.2-r0: task do_unpack: Started
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_patch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 374 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: recipe gettext-native-0.22.4-r0: task do_unpack: Succeeded
NOTE: Running task 375 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.4.bb:do_patch)
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_unpack: Started
NOTE: recipe libidn2-native-2.3.4-r0: task do_patch: Started
NOTE: recipe libpcre2-native-10.42-r0: task do_patch: Started
NOTE: recipe openssl-3.1.4-r0: task do_unpack: Succeeded
NOTE: recipe nettle-native-3.9.1-r0: task do_patch: Succeeded
NOTE: recipe elfutils-native-0.189-r0: task do_unpack: Started
NOTE: Running task 378 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_unpack: Started
NOTE: Running task 379 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: recipe libidn2-native-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-native-10.42-r0: task do_patch: Succeeded
NOTE: Running task 381 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_patch)
NOTE: Running task 382 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: Running task 385 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_unpack: Succeeded
NOTE: Running task 386 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_patch)
NOTE: recipe libarchive-native-3.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 387 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_patch)
NOTE: recipe gettext-native-0.22.4-r0: task do_patch: Started
NOTE: recipe readline-native-8.2-r0: task do_fetch: Started
NOTE: recipe readline-native-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 389 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: recipe file-native-5.45-r0: task do_fetch: Started
NOTE: recipe lua-native-5.4.6-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_patch: Started
NOTE: recipe lua-native-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 391 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_patch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: recipe rpm-native-1_4.18.1-r0: task do_fetch: Started
NOTE: Running task 393 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_fetch)
NOTE: recipe cracklib-native-2.9.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 396 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: recipe libarchive-native-3.7.2-r0: task do_patch: Started
NOTE: Running task 397 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_patch)
NOTE: recipe file-native-5.45-r0: task do_fetch: Succeeded
NOTE: Running task 398 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_patch: Succeeded
NOTE: Running task 400 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: Running task 405 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: recipe rpm-native-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 406 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: recipe python3-build-native-1.0.3-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: Running task 408 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 410 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_fetch)
NOTE: recipe python3-build-native-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-native-23.2-r0: task do_fetch: Started
NOTE: Running task 412 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_fetch)
NOTE: recipe readline-native-8.2-r0: task do_unpack: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_patch: Started
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Succeeded
NOTE: Running task 413 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_unpack)
NOTE: recipe file-native-5.45-r0: task do_unpack: Started
NOTE: recipe python3-packaging-native-23.2-r0: task do_fetch: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe lua-native-5.4.6-r0: task do_unpack: Started
NOTE: Running task 414 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_unpack)
NOTE: recipe gettext-native-0.22.4-r0: task do_patch: Succeeded
NOTE: Running task 415 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: recipe lua-native-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_fetch: Started
NOTE: Running task 416 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: Running task 417 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: recipe cracklib-native-2.9.11-r0: task do_patch: Succeeded
NOTE: recipe rpm-native-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe readline-native-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 421 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.41.3.bb:do_fetch)
NOTE: Running task 422 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_patch)
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 423 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_unpack)
NOTE: Running task 425 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: recipe python3-build-native-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 426 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_patch)
NOTE: recipe python3-packaging-native-23.2-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 427 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe gettext-native-0.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe python3-packaging-native-23.2-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: Running task 428 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_patch)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_unpack: Succeeded
NOTE: recipe lua-native-5.4.6-r0: task do_patch: Started
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_fetch: Started
NOTE: Running task 429 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_patch)
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Started
NOTE: recipe readline-native-8.2-r0: task do_patch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: Running task 432 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe lua-native-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 434 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: Running task 437 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_fetch)
NOTE: Running task 441 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: recipe python3-build-native-1.0.3-r0: task do_patch: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_patch: Started
NOTE: recipe readline-native-8.2-r0: task do_patch: Succeeded
NOTE: recipe python3-build-native-1.0.3-r0: task do_patch: Succeeded
NOTE: Running task 443 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_fetch)
NOTE: Running task 444 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_fetch)
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe python3-packaging-native-23.2-r0: task do_patch: Started
NOTE: Running task 446 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe xz-5.4.4-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe gettext-native-0.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-packaging-native-23.2-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 448 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_fetch)
NOTE: Running task 449 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.41.3.bb:do_unpack)
NOTE: Running task 451 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.2.bb:do_fetch)
NOTE: Running task 454 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 455 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_fetch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Started
NOTE: Running task 456 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_unpack)
NOTE: recipe sqlite3-3_3.44.0-r0: task do_fetch: Succeeded
NOTE: Running task 457 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 458 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_unpack)
NOTE: recipe util-linux-2.39.2-r0: task do_fetch: Started
NOTE: recipe file-native-5.45-r0: task do_unpack: Succeeded
NOTE: Running task 459 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe util-linux-2.39.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Started
NOTE: Running task 460 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_unpack)
NOTE: recipe python3-setuptools-native-69.0.2-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_fetch: Started
NOTE: recipe xz-5.4.4-r0: task do_unpack: Started
NOTE: Running task 462 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.0.bb:do_fetch)
NOTE: recipe python3-setuptools-native-69.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 463 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.2.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 464 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.41.3.bb:do_patch)
NOTE: recipe elfutils-native-0.189-r0: task do_unpack: Succeeded
NOTE: Running task 466 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 467 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_patch)
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Started
NOTE: recipe file-native-5.45-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_fetch: Succeeded
NOTE: Running task 471 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_fetch)
NOTE: Running task 473 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: recipe xz-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 475 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_fetch)
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_unpack: Succeeded
NOTE: Running task 478 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_fetch)
NOTE: Running task 479 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_fetch)
NOTE: recipe meson-native-1.3.0-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Succeeded
NOTE: Running task 483 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_write_config)
NOTE: recipe rpm-native-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_patch: Started
NOTE: recipe meson-native-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 484 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 485 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.0.bb:do_unpack)
NOTE: Running task 486 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: recipe file-native-5.45-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-native-69.0.2-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.189-r0: task do_patch: Started
NOTE: Running task 488 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_write_config)
NOTE: recipe qemu-native-8.1.2-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_patch: Succeeded
NOTE: Running task 495 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: recipe qemu-native-8.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 497 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Started
NOTE: Running task 498 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-69.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 499 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.2.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: Running task 500 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.4.bb:do_recipe_qa)
NOTE: Running task 503 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_fetch)
NOTE: Running task 504 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_fetch)
NOTE: recipe meson-native-1.3.0-r0: task do_unpack: Started
NOTE: recipe rpm-native-1_4.18.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_write_config: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_write_config: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 506 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_fetch)
NOTE: recipe readline-8.2-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 507 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe readline-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 508 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_write_config: Succeeded
NOTE: Running task 512 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_fetch)
NOTE: Running task 515 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_fetch)
NOTE: recipe gettext-0.22.4-r0: task do_recipe_qa: Started
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Started
NOTE: recipe bash-5.2.21-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-native-69.0.2-r0: task do_patch: Started
NOTE: Running task 520 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_fetch)
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 521 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_unpack)
NOTE: recipe base-passwd-3.6.2-r0: task do_fetch: Started
NOTE: recipe bash-5.2.21-r0: task do_fetch: Succeeded
NOTE: Running task 522 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_unpack)
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.2-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.2-r0: task do_unpack: Started
NOTE: Running task 523 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe shadow-4.13-r0: task do_fetch: Started
NOTE: recipe perl-5.38.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.69-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 527 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4_1.4.19.bb:do_fetch)
NOTE: recipe shadow-4.13-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Started
NOTE: Running task 528 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_unpack)
NOTE: recipe gettext-0.22.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 529 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.4.bb:do_fetch)
NOTE: Running task 530 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_unpack)
NOTE: recipe readline-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 531 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe bash-5.2.21-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-69.0.2-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.69-r0: task do_fetch: Succeeded
NOTE: Running task 533 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_fetch)
NOTE: Running task 535 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe meson-native-1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 537 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_fetch)
NOTE: Running task 538 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.0.bb:do_patch)
NOTE: recipe m4-1.4.19-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_unpack: Started
NOTE: Running task 541 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: recipe gettext-0.22.4-r0: task do_fetch: Started
NOTE: recipe perl-5.38.0-r0: task do_unpack: Started
NOTE: recipe m4-1.4.19-r0: task do_fetch: Succeeded
NOTE: Running task 542 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe gettext-0.22.4-r0: task do_fetch: Succeeded
NOTE: Running task 543 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: Running task 544 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.4.bb:do_unpack)
NOTE: recipe elfutils-native-0.189-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-native-0.6.2-r0: task do_fetch: Started
NOTE: recipe coreutils-9.4-r0: task do_fetch: Started
NOTE: Running task 548 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe shadow-native-4.13-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_fetch: Started
NOTE: recipe meson-native-1.3.0-r0: task do_patch: Started
NOTE: recipe coreutils-9.4-r0: task do_fetch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_patch: Succeeded
NOTE: Running task 549 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.38.bb:do_fetch)
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: Running task 551 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4_1.4.19.bb:do_unpack)
NOTE: recipe shadow-native-4.13-r0: task do_fetch: Succeeded
NOTE: Running task 552 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_unpack)
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: Running task 554 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_fetch)
NOTE: recipe opkg-utils-native-0.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 555 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: Running task 556 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe gettext-0.22.4-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_fetch: Succeeded
NOTE: Running task 557 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running task 559 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/help2man/help2man_1.49.3.bb:do_fetch)
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_unpack: Succeeded
NOTE: Running task 560 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe m4-1.4.19-r0: task do_unpack: Started
NOTE: recipe autoconf-2.72c-r0: task do_fetch: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe bash-5.2.21-r0: task do_unpack: Succeeded
NOTE: Running task 562 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmd/libmd_1.1.0.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_unpack: Started
NOTE: recipe opkg-utils-native-0.6.2-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.13-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe help2man-native-1.49.3-r0: task do_fetch: Started
NOTE: recipe autoconf-2.72c-r0: task do_fetch: Succeeded
NOTE: Running task 563 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_unpack)
NOTE: recipe help2man-native-1.49.3-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_fetch: Succeeded
NOTE: recipe meson-native-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 565 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb:do_fetch)
NOTE: Running task 566 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.38.bb:do_unpack)
NOTE: Running task 570 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_fetch)
NOTE: Running task 572 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_fetch)
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libmd-native-1.1.0-r0: task do_fetch: Started
NOTE: recipe libmd-native-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_unpack: Started
NOTE: recipe autoconf-2.72c-r0: task do_unpack: Started
NOTE: recipe gnu-config-20230216+git-r0: task do_fetch: Started
NOTE: recipe psmisc-23.6-r0: task do_fetch: Started
NOTE: recipe shadow-native-4.13-r0: task do_unpack: Succeeded
NOTE: recipe dpkg-native-1.22.0-r0: task do_fetch: Started
NOTE: Running task 573 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_patch)
NOTE: recipe gnu-config-20230216+git-r0: task do_fetch: Succeeded
NOTE: Running task 574 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_unpack)
NOTE: recipe psmisc-23.6-r0: task do_fetch: Succeeded
NOTE: recipe rpm-native-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 575 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_unpack)
NOTE: recipe dpkg-native-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 577 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb:do_unpack)
NOTE: recipe gnu-config-20230216+git-r0: task do_unpack: Started
NOTE: recipe m4-1.4.19-r0: task do_unpack: Succeeded
NOTE: recipe shadow-native-4.13-r0: task do_patch: Started
NOTE: recipe psmisc-23.6-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-native-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 578 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_patch)
NOTE: recipe autoconf-2.72c-r0: task do_unpack: Succeeded
NOTE: recipe dpkg-native-1.22.0-r0: task do_unpack: Started
NOTE: recipe perl-5.38.0-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-native-0.6.2-r0: task do_patch: Started
NOTE: recipe opkg-utils-native-0.6.2-r0: task do_patch: Succeeded
NOTE: recipe shadow-native-4.13-r0: task do_patch: Succeeded
NOTE: recipe gnu-config-20230216+git-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_unpack: Succeeded
NOTE: recipe gettext-0.22.4-r0: task do_unpack: Succeeded
NOTE: recipe dpkg-native-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 581 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb:do_patch)
NOTE: recipe dpkg-native-1.22.0-r0: task do_patch: Started
NOTE: recipe dpkg-native-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe gettext-minimal-native-0.22-r0: task do_fetch: Failed
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 582 tasks of which 286 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201060344.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201060344.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gettext-minimal-native-0.22-r0 do_fetch: Checksum failure fetching https://ftp.gnu.org/gnu/gettext/gettext-0.22.tar.gz
ERROR: gettext-minimal-native-0.22-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.tar.gz\' has sha256 checksum \'49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab\' when \'c1e0bb2a4427a9024390c662cd532d664c4b36b8ff444ed5e54b115fdb7a1aea\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://ftp.gnu.org/gnu/gettext/gettext-0.22.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gettext-minimal-native/0.22/temp/log.do_fetch.3644156
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_fetch) failed with exit code '1'

--===============8349514558468122345==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gettext-upgrade-0.22-0.22.4.patch"

RnJvbSA0NGMxM2M1ZmY3MWMwMjg0MmYzMjA2NzM1MGM0NDcwYjJhOGYwZDIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwNjowNDoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdl
dHRleHQ6IHVwZ3JhZGUgMC4yMiAtPiAwLjIyLjQKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUvZ2V0
dGV4dC9nZXR0ZXh0LXNvdXJjZXMuaW5jICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL3Jl
Y2lwZXMtY29yZS9nZXR0ZXh0L3tnZXR0ZXh0XzAuMjIuYmIgPT4gZ2V0dGV4dF8wLjIyLjQuYmJ9
IHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1jb3JlL2dldHRleHQve2dldHRleHRfMC4yMi5iYiA9PiBnZXR0ZXh0
XzAuMjIuNC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2V0dGV4
dC9nZXR0ZXh0LXNvdXJjZXMuaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2V0dGV4dC9nZXR0ZXh0
LXNvdXJjZXMuaW5jCmluZGV4IGI0ZmI2NDc5MTYuLjhiNGUyNDAxMDEgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb3JlL2dldHRleHQvZ2V0dGV4dC1zb3VyY2VzLmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nZXR0ZXh0L2dldHRleHQtc291cmNlcy5pbmMKQEAgLTEsNCArMSw0IEBACiBI
T01FUEFHRSA9ICJodHRwOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvZ2V0dGV4dC9nZXR0ZXh0Lmh0
bWwiCiBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vZ2V0dGV4dC9nZXR0ZXh0LSR7UFZ9LnRhci5n
eiBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0OWYwODliZTExYjQ5MDE3
MGJiZjA5ZWQyZjUxZTVmNTE3N2Y1NWJlNGNjNjY1MDRhNTg2MTgyMGUwZmIwNmFiIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImMxZTBiYjJhNDQyN2E5MDI0MzkwYzY2MmNkNTMyZDY2NGM0YjM2Yjhm
ZjQ0NGVkNWU1NGIxMTVmZGI3YTFhZWEiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9n
ZXR0ZXh0L2dldHRleHRfMC4yMi5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2dldHRleHQvZ2V0dGV4
dF8wLjIyLjQuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1jb3JlL2dldHRleHQvZ2V0dGV4dF8wLjIyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29y
ZS9nZXR0ZXh0L2dldHRleHRfMC4yMi40LmJiCi0tIAoyLjM5LjIKCg==

--===============8349514558468122345==--

