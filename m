Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29F5C2BA16
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:23 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.18631.1718475801166549521
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KyKdgevW;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=eh/7y4Cs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101901d23c064-e1c39293-5397-4e66-9a20-b6166af7a74b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KGvb0LpMihLKs1DgUbur2BtHGsSWCUC+svFsjEG1OcE=;
	b=KyKdgevW4RCVaP9kayTtKX2FeJjUFJph4t1blhLsk9Pmk2bSk3Nk9iwGmOT9VsuW
	DdMwV94ITEo39QnSc/o57LeLaAer3KEMDGfdwVPHwA1PxqyztbHlpSHfDHA6hEfVepi
	a9UWJMqLITCnvLQKe09jEhcfOMU0pfBqrnWGKlk0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KGvb0LpMihLKs1DgUbur2BtHGsSWCUC+svFsjEG1OcE=;
	b=eh/7y4CsD1McwyyMeHwrHQfhSUxNA4i0hSPhxf9sS9PJwEIwIa9pQTn/RuSnL/oV
	nm87dkmVlKHsqXN74BOvSRawZrwNZJVjJfq8+jloU9Ch0oj/3U1dQEeqDUmnIKnAsVG
	UZQ4dPnowQWwZ7O14n9065Hf1sgADWxjdIKNnijQ=
Content-Type: multipart/mixed; boundary="===============0608632199757130885=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rng-tools: upgrading to 6.17 SUCCEEDED
Message-ID: <010101901d23c064-e1c39293-5397-4e66-9a20-b6166af7a74b-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200761

--===============0608632199757130885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rng-tools* to *6.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rng-tools-upgrade-6.16-6.17.patch
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
From b33a59ec8c43ab3ba8afbbfeaefea3005ff0c440 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 18:00:12 +0000
Subject: [PATCH] rng-tools: upgrade 6.16 -> 6.17

---
 .../rng-tools/{rng-tools_6.16.bb => rng-tools_6.17.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/rng-tools/{rng-tools_6.16.bb => rng-tools_6.17.bb} (98%)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/recipes-support/rng-tools/rng-tools_6.17.bb
similarity index 98%
rename from meta/recipes-support/rng-tools/rng-tools_6.16.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.17.bb
index ed755ae705..fc141a984c 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.16.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.17.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
            file://default \
            file://rng-tools.service \
            "
-SRCREV = "e061c313b95890eb5fa0ada0cd6eec619dafdfe2"
+SRCREV = "bd00c08b0c3c6a880b0988befe97fd35b315468c"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============0608632199757130885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1882 targets, 46 skipped, 0 masked, 0 errors.
Removing 15 recipes from the core2-64 sysroot...done.
Removing 14 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-fcce54fc8dd54b81052d93a5be9d94efabde4a76"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fcce54fc8dd54b81052d93a5be9d94efabde4a76"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 194 Local 182 Mirrors 0 Missed 12 Current 200 (93% match, 96% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 208 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 209 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 210 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 211 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 212 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_create_spdx_setscene)
NOTE: Running setscene task 213 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 222 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 223 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 224 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 225 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 226 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjitterentropy-3.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjitterentropy-3.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 292 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 293 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjitterentropy-3.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 297 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 299 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 300 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running task 658 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_recipe_qa)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 301 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjitterentropy-3.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjitterentropy-3.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe rng-tools-6.17-r0: task do_recipe_qa: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 304 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 309 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libjitterentropy/3.4.1/temp/log.do_packagedata_setscene.3032167
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 313 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb:do_package_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rng-tools-6.17-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_recipe_qa unihash changed to 94c5bf3d827b627a9a3532519e63c82e649b5dab61d6dcf53a91621223ed7ba5
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 308 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 314 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 757 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_fetch)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 325 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libjitterentropy-3.4.1-r0: task do_package_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rng-tools-6.17-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 332 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 335 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rng-tools-6.17-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 780 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjitterentropy-3.4.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 342 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rng-tools-6.17-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 344 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libjitterentropy-3.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjitterentropy-3.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 350 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 352 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 353 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rng-tools-6.17-r0: task do_unpack: Succeeded
NOTE: Running task 899 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_patch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rng-tools-6.17-r0: task do_patch: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 357 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe rng-tools-6.17-r0: task do_patch: Succeeded
NOTE: Running task 910 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 911 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_populate_lic)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 359 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 360 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe rng-tools-6.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rng-tools-6.17-r0: task do_populate_lic: Started
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 362 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 365 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe rng-tools-6.17-r0: task do_populate_lic: Succeeded
NOTE: recipe rng-tools-6.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_populate_lic unihash changed to 3621f3a58bfc475fb17d42d3d73d338faa0e53429ce0210134c2e3d3c836b5e9
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_deploy_source_date_epoch unihash changed to 93eaa8a49e3827b31258e51b99397e7b24755a8b82ebd43337ca8d72720f5b09
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 359 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 383 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 384 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 389 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 390 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 394 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1096 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb:do_packagedata)
NOTE: Running task 1105 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjitterentropy-3.4.1-r0: task do_packagedata: Started
NOTE: recipe rng-tools-6.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rng-tools-6.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1123 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_configure)
NOTE: recipe libjitterentropy-3.4.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1125 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_collect_spdx_deps)
NOTE: recipe rng-tools-6.17-r0: task do_configure: Started
NOTE: recipe rng-tools-6.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe rng-tools-6.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rng-tools-6.17-r0: task do_configure: Succeeded
NOTE: Running task 1126 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_compile)
NOTE: recipe rng-tools-6.17-r0: task do_compile: Started
NOTE: recipe rng-tools-6.17-r0: task do_compile: Succeeded
NOTE: Running task 1127 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_install)
NOTE: recipe rng-tools-6.17-r0: task do_install: Started
NOTE: recipe rng-tools-6.17-r0: task do_install: Succeeded
NOTE: Running task 1128 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_package)
NOTE: Running task 1129 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_populate_sysroot)
NOTE: recipe rng-tools-6.17-r0: task do_package: Started
NOTE: recipe rng-tools-6.17-r0: task do_populate_sysroot: Started
NOTE: recipe rng-tools-6.17-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rng-tools-6.17-r0: task do_package: Succeeded
NOTE: Running task 1130 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_packagedata)
NOTE: recipe rng-tools-6.17-r0: task do_packagedata: Started
NOTE: recipe rng-tools-6.17-r0: task do_packagedata: Succeeded
NOTE: Running task 1131 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_create_spdx)
NOTE: Running task 1132 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_package_write_ipk)
NOTE: Running task 1133 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_package_write_deb)
NOTE: Running task 1134 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_package_write_rpm)
NOTE: Running task 1135 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_package_qa)
NOTE: recipe rng-tools-6.17-r0: task do_create_spdx: Started
NOTE: recipe rng-tools-6.17-r0: task do_package_write_ipk: Started
NOTE: recipe rng-tools-6.17-r0: task do_package_write_deb: Started
NOTE: recipe rng-tools-6.17-r0: task do_package_write_rpm: Started
NOTE: recipe rng-tools-6.17-r0: task do_package_qa: Started
NOTE: recipe rng-tools-6.17-r0: task do_create_spdx: Succeeded
NOTE: Running task 1136 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_create_runtime_spdx)
NOTE: recipe rng-tools-6.17-r0: task do_package_qa: Succeeded
NOTE: recipe rng-tools-6.17-r0: task do_create_runtime_spdx: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_package_qa unihash changed to f93e77bc608d3044414e02cf65c94572695eb485e447c29a364621a6ca059b28
NOTE: recipe rng-tools-6.17-r0: task do_package_write_ipk: Succeeded
NOTE: recipe rng-tools-6.17-r0: task do_package_write_deb: Succeeded
NOTE: recipe rng-tools-6.17-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe rng-tools-6.17-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1137 of 1137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/rng-tools/rng-tools_6.17.bb:do_build)
NOTE: Tasks Summary: Attempted 1137 tasks of which 1115 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libjitterentropy-3.4.1-r0 do_packagedata_setscene: QA Issue: Package version for package libjitterentropy-src went backwards which would break package feeds (from 0:3.5.0-r0 to 0:3.4.1-r0) [version-going-backwards]
ERROR: libjitterentropy-3.4.1-r0 do_packagedata_setscene: QA Issue: Package version for package libjitterentropy-dbg went backwards which would break package feeds (from 0:3.5.0-r0 to 0:3.4.1-r0) [version-going-backwards]
ERROR: libjitterentropy-3.4.1-r0 do_packagedata_setscene: QA Issue: Package version for package libjitterentropy-staticdev went backwards which would break package feeds (from 0:3.5.0-r0 to 0:3.4.1-r0) [version-going-backwards]
ERROR: libjitterentropy-3.4.1-r0 do_packagedata_setscene: QA Issue: Package version for package libjitterentropy-dev went backwards which would break package feeds (from 0:3.5.0-r0 to 0:3.4.1-r0) [version-going-backwards]
ERROR: libjitterentropy-3.4.1-r0 do_packagedata_setscene: QA Issue: Package version for package libjitterentropy-doc went backwards which would break package feeds (from 0:3.5.0-r0 to 0:3.4.1-r0) [version-going-backwards]
ERROR: libjitterentropy-3.4.1-r0 do_packagedata_setscene: QA Issue: Package version for package libjitterentropy-locale went backwards which would break package feeds (from 0:3.5.0-r0 to 0:3.4.1-r0) [version-going-backwards]
ERROR: libjitterentropy-3.4.1-r0 do_packagedata_setscene: QA Issue: Package version for package libjitterentropy went backwards which would break package feeds (from 0:3.5.0-r0 to 0:3.4.1-r0) [version-going-backwards]
ERROR: libjitterentropy-3.4.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0608632199757130885==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rng-tools-upgrade-6.16-6.17.patch"

RnJvbSBiMzNhNTllYzhjNDNhYjNiYThhZmJiZmVhZWZlYTMwMDVmZjBjNDQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTg6MDA6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
bmctdG9vbHM6IHVwZ3JhZGUgNi4xNiAtPiA2LjE3CgotLS0KIC4uLi9ybmctdG9vbHMve3JuZy10
b29sc182LjE2LmJiID0+IHJuZy10b29sc182LjE3LmJifSAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L3JuZy10b29scy97cm5nLXRvb2xzXzYuMTYuYmIgPT4gcm5nLXRvb2xzXzYu
MTcuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcm5nLXRvb2xz
L3JuZy10b29sc182LjE2LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcm5nLXRvb2xzL3JuZy10
b29sc182LjE3LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L3JuZy10b29scy9ybmctdG9vbHNfNi4xNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvcm5nLXRvb2xzL3JuZy10b29sc182LjE3LmJiCmluZGV4IGVkNzU1YWU3MDUu
LmZjMTQxYTk4NGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3JuZy10b29scy9y
bmctdG9vbHNfNi4xNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ybmctdG9vbHMvcm5n
LXRvb2xzXzYuMTcuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL25ob3JtYW4vcm5nLXRvb2xzLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwK
ICAgICAgICAgICAgZmlsZTovL2RlZmF1bHQgXAogICAgICAgICAgICBmaWxlOi8vcm5nLXRvb2xz
LnNlcnZpY2UgXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiZTA2MWMzMTNiOTU4OTBlYjVmYTBh
ZGEwY2Q2ZWVjNjE5ZGFmZGZlMiIKK1NSQ1JFViA9ICJiZDAwYzA4YjBjM2M2YTg4MGIwOTg4YmVm
ZTk3ZmQzNWIzMTU0NjhjIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjQ0LjAKCg==

--===============0608632199757130885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/rng-tools/rng-tools: PKGSIZE changed from 100168 to 136136 (+36%)

--===============0608632199757130885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/rng-tools: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools/rng-tools-dbg: PKGSIZE changed from 228296 to 245920 (+8%)
packages/core2-64-poky-linux/rng-tools/rng-tools-dbg: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools-dbg: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools/rng-tools-dev: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools-dev: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools/rng-tools-doc: PKGSIZE changed from 12940 to 13989 (+8%)
packages/core2-64-poky-linux/rng-tools/rng-tools-doc: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools-doc: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools/rng-tools-locale: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools-locale: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools/rng-tools-service: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools-service: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools/rng-tools-src: PKGSIZE changed from 107992 to 115375 (+7%)
packages/core2-64-poky-linux/rng-tools/rng-tools-src: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools-src: FILELIST: directory renamed /usr/src/debug/rng-tools/6.16/contrib -> /usr/src/debug/rng-tools/6.17/contrib, removed "/usr/src/debug/rng-tools/6.16/ossl_helpers.c /usr/src/debug/rng-tools/6.16/rngd_linux.h /usr/src/debug/rng-tools/6.16/rngd_entsource.c /usr/src/debug/rng-tools/6.16/fips.c /usr/src/debug/rng-tools/6.16/rngd_jitter.c /usr/src/debug/rng-tools/6.16/rngd.c /usr/src/debug/rng-tools/6.16/stats.c /usr/src/debug/rng-tools/6.16/fips.h /usr/src/debug/rng-tools/6.16/rngd_entsource.h /usr/src/debug/rng-tools/6.16/rngd_rdrand.c /usr/src/debug/rng-tools/6.16/ossl_helpers.h /usr/src/debug/rng-tools/6.16/rngd_linux.c /usr/src/debug/rng-tools/6.16/stats.h /usr/src/debug/rng-tools/6.16/rngd.h /usr/src/debug/rng-tools/6.16/rngtest.c /usr/src/debug/rng-tools/6.16/util.c", added "/usr/src/debug/rng-tools/6.17/ossl_helpers.c /usr/src/debug/rng-tools/6.17/rngd_linux.h /usr/src/debug/rng-tools/6.17/rngd_entsource.c /usr/src/debug/rng-tools
 /6.17/fips.c /usr/src/debug/rng-tools/6.17/rngd_jitter.c /usr/src/debug/rng-tools/6.17/rngd.c /usr/src/debug/rng-tools/6.17/stats.c /usr/src/debug/rng-tools/6.17/fips.h /usr/src/debug/rng-tools/6.17/rngd_entsource.h /usr/src/debug/rng-tools/6.17/rngd_rdrand.c /usr/src/debug/rng-tools/6.17/ossl_helpers.h /usr/src/debug/rng-tools/6.17/rngd_linux.c /usr/src/debug/rng-tools/6.17/stats.h /usr/src/debug/rng-tools/6.17/rngd.h /usr/src/debug/rng-tools/6.17/rngtest.c /usr/src/debug/rng-tools/6.17/rngd_namedpipe.c /usr/src/debug/rng-tools/6.17/util.c"
packages/core2-64-poky-linux/rng-tools/rng-tools-src: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools/rng-tools-staticdev: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools-staticdev: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools/rng-tools: PKGSIZE changed from 100168 to 136136 (+36%)
packages/core2-64-poky-linux/rng-tools/rng-tools: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools: PV changed from "6.16" to "6.17"

--===============0608632199757130885==--

