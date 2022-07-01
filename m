Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB25FC19F55
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.39736.1656687063282640130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Rjm5lJlx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010181ba3e6c0a-1db75fcc-b45e-411f-873c-a9b512b43393-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PACOiMcvl8bAx7Cp+GDmD21+oxH95Zw6LeOwpV69LTQ=;
	b=Rjm5lJlxVuh4K0VMlKgLKZUyCgaAFur1vivSLqqxTw6555TnZOYsKyCov4+9J8dn
	ux17BTlB/vhoA2DgXknI0BYX5sG70yun+Y9sMHnALnclkFLsYhwdhqX1j+Wo02f6u90
	ZmOUCrlSJJfK1H9e/dE0A8cKn0Vw/R34kVzR8HBo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PACOiMcvl8bAx7Cp+GDmD21+oxH95Zw6LeOwpV69LTQ=;
	b=ju+98wsEvn0AR70iwGG5pUOBcO+G1l+zVE+L7w8sEcfX6C/hXyC5cJZRoF2sPTPc
	4727pN3HjEnC7OwG07FrS9HEWMzjar3J45Iap6GuTs51PB3B93576Z9QK3Cgs3jmCA7
	pwFZgl4RQ0E/q1+lmP9T1Ccyry+ftMKBgA+l/k3Y=
Content-Type: multipart/mixed; boundary="===============1871607962944238433=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography: upgrading to 37.0.3 SUCCEEDED
Message-ID: 
 <01010181ba3e6c0a-1db75fcc-b45e-411f-873c-a9b512b43393-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167497

--===============1871607962944238433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography* to *37.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-upgrade-37.0.2-37.0.3.patch
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
--===============1871607962944238433==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-cryptography-upgrade-37.0.2-37.0.3.patch"

From d913d026be39bd2da23b7a288b6bb4dcf1ea9a49 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 08:36:33 +0000
Subject: [PATCH] python3-cryptography: upgrade 37.0.2 -> 37.0.3

---
 ...n3-cryptography_37.0.2.bb => python3-cryptography_37.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography_37.0.2.bb => python3-cryptography_37.0.3.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-cryptography_37.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography_37.0.3.bb
index 9ef3a61e9f..53c8ea7477 100644
--- a/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "f224ad253cc9cea7568f49077007d2263efa57396a2f2f78114066fd54b5c68e"
+SRC_URI[sha256sum] = "ae430d51c67ac638dfbb42edf56c669ca9c74744f4d225ad11c6f3d355858187"
 
 SRC_URI += "file://run-ptest \
            file://check-memfree.py \
-- 
2.31.1


--===============1871607962944238433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 70 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-87c72eace09515a3b82caeb2efa406494dbdd7ea"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:87c72eace09515a3b82caeb2efa406494dbdd7ea"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 94 Local 1 Mirrors 0 Missed 93 Current 338 (1% match, 78% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 985 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_fetch)
NOTE: Running task 1096 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 1097 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_fetch)
NOTE: Running task 1098 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: Running task 1131 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_fetch)
NOTE: Running task 1132 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_fetch)
NOTE: Running task 1133 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_fetch)
NOTE: Running task 1134 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 1140 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_fetch)
NOTE: Running task 1158 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_fetch)
NOTE: Running task 1162 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1163 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1164 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_fetch)
NOTE: Running task 1165 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1166 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1167 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_fetch)
NOTE: Running task 1212 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1213 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_fetch)
NOTE: Running task 1242 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_fetch)
NOTE: Running task 1243 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1244 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_fetch)
NOTE: Running task 1245 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 1246 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_fetch)
NOTE: Running task 1247 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_fetch)
NOTE: Running task 1248 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_fetch)
NOTE: Running task 1250 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_fetch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_fetch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1355 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 1356 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_unpack)
NOTE: Running task 1357 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: Running task 1358 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: Running task 1359 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1360 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1361 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_unpack)
NOTE: Running task 1362 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1363 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_unpack)
NOTE: Running task 1364 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_unpack)
NOTE: Running task 1365 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_unpack)
NOTE: Running task 1366 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: Running task 1367 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_unpack)
NOTE: Running task 1368 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_unpack)
NOTE: Running task 1369 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1370 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1371 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: Running task 1372 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: Running task 1373 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1374 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_patch)
NOTE: Running task 1375 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: Running task 1376 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1377 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1378 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_unpack)
NOTE: Running task 1379 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1380 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1381 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_unpack)
NOTE: Running task 1382 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1383 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1384 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1385 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_unpack)
NOTE: Running task 1386 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_unpack: Started
NOTE: Running task 1387 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1388 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: Running task 1389 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: Running task 1390 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_patch)
NOTE: Running task 1391 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_patch)
NOTE: Running task 1392 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_patch)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 1393 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: Running task 1394 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_unpack: Started
NOTE: Running task 1395 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_patch)
NOTE: Running task 1396 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: Running task 1397 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1398 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_patch)
NOTE: Running task 1399 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1400 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_unpack)
NOTE: Running task 1401 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1402 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_unpack)
NOTE: Running task 1403 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: Running task 1404 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_unpack)
NOTE: Running task 1405 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_unpack)
NOTE: Running task 1406 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_unpack)
NOTE: Running task 1407 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: Running task 1408 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1409 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 1410 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1411 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_patch)
NOTE: Running task 1412 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: Running task 1413 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_patch)
NOTE: Running task 1414 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Started
NOTE: Running task 1415 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_patch: Started
NOTE: Running task 1416 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_unpack: Started
NOTE: Running task 1417 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Started
NOTE: Running task 1418 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: Running task 1419 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_patch)
NOTE: Running task 1420 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1421 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_patch: Started
NOTE: Running task 1422 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1423 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1424 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1425 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_patch)
NOTE: Running task 1426 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_patch)
NOTE: Running task 1427 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_patch)
NOTE: Running task 1428 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: Running task 1429 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1430 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_patch)
NOTE: Running task 1431 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: Running task 1432 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_patch: Started
NOTE: Running task 1433 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1434 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1435 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_patch: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_patch: Succeeded
NOTE: Running task 1436 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1437 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1438 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1439 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1440 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1441 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1442 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1443 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1444 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1445 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1446 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1447 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-7.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1448 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1449 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1450 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1451 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1452 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1453 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1454 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-attrs-21.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_patch: Started
NOTE: Running task 1455 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_configure)
NOTE: recipe python3-pytest-7.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1456 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1457 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1458 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: Running task 1459 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1460 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1461 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1462 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1463 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1464 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_configure)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1465 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1466 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_configure)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Started
NOTE: Running task 1467 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_patch)
NOTE: Running task 1468 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1469 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1470 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-7.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1471 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_configure: Started
NOTE: Running task 1472 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_configure)
NOTE: Running task 1473 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: Running task 1474 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_configure: Started
NOTE: Running task 1475 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 1476 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: Running task 1477 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1478 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure_ptest_base)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1479 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_compile)
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: Running task 1480 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Started
NOTE: Running task 1481 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_configure_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: Running task 1482 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1483 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1484 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1485 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_compile: Started
NOTE: Running task 1486 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1487 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1488 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1489 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1490 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure_ptest_base)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Succeeded
NOTE: Running task 1491 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: Running task 1492 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Started
NOTE: Running task 1493 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_compile)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: Running task 1494 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-cffi-1.15.0-r0: task do_compile: Started
NOTE: Running task 1495 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_compile)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1496 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: Running task 1497 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1498 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_rust_create_wrappers)
NOTE: Running task 1499 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: Running task 1500 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_configure)
NOTE: Running task 1501 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_configure)
NOTE: Running task 1502 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: Running task 1503 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: Running task 1504 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_compile)
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1505 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_populate_lic)
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1506 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile: Started
NOTE: Running task 1507 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Started
NOTE: Running task 1508 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_populate_lic: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1509 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1510 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_compile)
NOTE: Running task 1511 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_compile)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1512 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_compile)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1513 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_configure: Started
NOTE: Running task 1514 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_configure)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Started
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_populate_lic unihash changed to eee27c8d1f69e3ff71651cdc4f08b93287474547b1c5b13f02799602ebf5cc91
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: Running task 1515 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_compile)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_compile: Started
NOTE: Running task 1516 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1517 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_configure_ptest_base)
NOTE: Running task 1518 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: Running task 1519 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_compile_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1520 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_compile)
NOTE: Running task 1521 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_install)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1522 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: Running task 1523 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install: Succeeded
NOTE: Running task 1524 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_install_ptest_base)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1525 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_package)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1526 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1527 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: Running task 1528 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1529 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1530 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_install)
NOTE: Running task 1531 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: Running task 1532 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1533 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: Running task 1534 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile_ptest_base)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: Running task 1535 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: Running task 1536 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1537 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Succeeded
NOTE: Running task 1538 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: Running task 1539 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1540 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1541 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: Running task 1542 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Started
NOTE: Running task 1543 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1544 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-packaging-21.3-r0: task do_install: Started
NOTE: Running task 1545 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_package: Succeeded
NOTE: Running task 1546 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Started
NOTE: Running task 1547 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_install)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1548 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 1549 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_install: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1550 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_package)
NOTE: Running task 1551 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_install)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1552 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1553 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1554 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_install: Started
NOTE: Running task 1555 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install_ptest_base)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1556 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1557 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1558 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: Running task 1559 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install_ptest_base)
NOTE: Running task 1560 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_package)
NOTE: Running task 1561 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-packaging-21.3-r0: task do_package: Started
NOTE: Running task 1562 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_install)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_install: Succeeded
NOTE: Running task 1563 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_package)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: Running task 1564 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package)
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1565 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package: Started
NOTE: Running task 1566 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Started
NOTE: Running task 1567 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 1568 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Succeeded
NOTE: Running task 1569 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: Running task 1570 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_install)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: Running task 1571 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install_ptest_base)
NOTE: Running task 1572 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 1573 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: Running task 1574 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Started
NOTE: Running task 1575 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package)
NOTE: Running task 1576 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_package)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_package: Started
NOTE: Running task 1577 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: Running task 1578 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1579 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 1580 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: Running task 1581 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: Running task 1582 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: Running task 1583 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Started
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_package: Succeeded
NOTE: Running task 1584 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1585 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_install)
NOTE: recipe python3-packaging-21.3-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Succeeded
NOTE: Running task 1586 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata)
NOTE: recipe python3-attrs-21.4.0-r0: task do_packagedata: Started
NOTE: Running task 1587 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package)
NOTE: Running task 1588 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_install: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Started
NOTE: Running task 1589 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 1590 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1591 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata)
NOTE: Running task 1592 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_packagedata)
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Started
NOTE: Running task 1593 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1594 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 1595 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_package: Succeeded
NOTE: Running task 1596 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_packagedata)
NOTE: Running task 1597 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata)
NOTE: Running task 1598 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1599 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_package)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_package: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1600 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1601 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_packagedata)
NOTE: Running task 1602 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1603 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1604 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package_write_rpm)
NOTE: Running task 1605 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.0-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1606 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 1607 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_package)
NOTE: recipe python3-pytz-2022.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1608 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1609 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1610 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 1611 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pytest-7.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1611 tasks of which 1328 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-src went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-dbg went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-staticdev went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-dev went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-doc went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-locale went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-cffi/1.15.0-r0/temp/log.do_packagedata.3070115
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_packagedata) failed with exit code '1'

--===============1871607962944238433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cryptography: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
packages/core2-32-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-37.0.2.tar.gz file://run-ptest file://check-memfree.py file://0001-Cargo.toml-specify-pem-version.patch file://0002-Cargo.toml-edition-2018-2021.patch file://0001-pyproject.toml-remove-benchmark-disable-option.patch crate://crates.io/Inflector/0.11.4 crate://crates.io/aliasable/0.1.3 crate://crates.io/asn1/0.8.7 crate://crates.io/asn1_derive/0.8.7 crate://crates.io/autocfg/1.1.0 crate://crates.io/base64/0.13.0 crate://crates.io/bitflags/1.3.2 crate://crates.io/cfg-if/1.0.0 crate://crates.io/chrono/0.4.19 crate://crates.io/indoc-impl/0.3.6 crate://crates.io/indoc/0.3.6 crate://crates.io/instant/0.1.12 crate://crates.io/lazy_static/1.4.0 crate://crates.io/libc/0.2.124 crate://crates.io/lock_api/0.4.7 crate://crates.io/num-integer/0.1.44 crate://crates.io/num-traits/0.2.14 crate://crates.io/once_cell/1.10.0 crate://crates.io/ouroboros/0.15.0
  crate://crates.io/ouroboros_macro/0.15.0 crate://crates.io/parking_lot/0.11.2 crate://crates.io/parking_lot_core/0.8.5 crate://crates.io/paste-impl/0.1.18 crate://crates.io/paste/0.1.18 crate://crates.io/pem/1.0.2 crate://crates.io/proc-macro-error-attr/1.0.4 crate://crates.io/proc-macro-error/1.0.4 crate://crates.io/proc-macro-hack/0.5.19 crate://crates.io/proc-macro2/1.0.37 crate://crates.io/pyo3-build-config/0.15.2 crate://crates.io/pyo3-macros-backend/0.15.2 crate://crates.io/pyo3-macros/0.15.2 crate://crates.io/pyo3/0.15.2 crate://crates.io/quote/1.0.18 crate://crates.io/redox_syscall/0.2.13 crate://crates.io/scopeguard/1.1.0 crate://crates.io/smallvec/1.8.0 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/syn/1.0.91 crate://crates.io/unicode-xid/0.2.2 crate://crates.io/unindent/0.1.8 crate://crates.io/version_check/0.9.4 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/winapi/0.3.9" to "https
 ://files.pythonhosted.org/packages/source/c/cryptography/cryptography-37.0.3.tar.gz file://run-ptest file://check-memfree.py file://0001-Cargo.toml-specify-pem-version.patch file://0002-Cargo.toml-edition-2018-2021.patch file://0001-pyproject.toml-remove-benchmark-disable-option.patch crate://crates.io/Inflector/0.11.4 crate://crates.io/aliasable/0.1.3 crate://crates.io/asn1/0.8.7 crate://crates.io/asn1_derive/0.8.7 crate://crates.io/autocfg/1.1.0 crate://crates.io/base64/0.13.0 crate://crates.io/bitflags/1.3.2 crate://crates.io/cfg-if/1.0.0 crate://crates.io/chrono/0.4.19 crate://crates.io/indoc-impl/0.3.6 crate://crates.io/indoc/0.3.6 crate://crates.io/instant/0.1.12 crate://crates.io/lazy_static/1.4.0 crate://crates.io/libc/0.2.124 crate://crates.io/lock_api/0.4.7 crate://crates.io/num-integer/0.1.44 crate://crates.io/num-traits/0.2.14 crate://crates.io/once_cell/1.10.0 crate://crates.io/ouroboros/0.15.0 crate://crates.io/ouroboros_macro/0.15.0 crate://crates.io/parking_lot/0.11.
 2 crate://crates.io/parking_lot_core/0.8.5 crate://crates.io/paste-impl/0.1.18 crate://crates.io/paste/0.1.18 crate://crates.io/pem/1.0.2 crate://crates.io/proc-macro-error-attr/1.0.4 crate://crates.io/proc-macro-error/1.0.4 crate://crates.io/proc-macro-hack/0.5.19 crate://crates.io/proc-macro2/1.0.37 crate://crates.io/pyo3-build-config/0.15.2 crate://crates.io/pyo3-macros-backend/0.15.2 crate://crates.io/pyo3-macros/0.15.2 crate://crates.io/pyo3/0.15.2 crate://crates.io/quote/1.0.18 crate://crates.io/redox_syscall/0.2.13 crate://crates.io/scopeguard/1.1.0 crate://crates.io/smallvec/1.8.0 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/syn/1.0.91 crate://crates.io/unicode-xid/0.2.2 crate://crates.io/unindent/0.1.8 crate://crates.io/version_check/0.9.4 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/winapi/0.3.9"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1411296 to 1411208 (-0%)
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography: PKGSIZE changed from 3581202 to 3581363 (+0%)
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
Changes to packages/core2-32-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.10/site-packages/cryptography-37.0.2.dist-info moved to /usr/lib/python3.10/site-packages/cryptography-37.0.3.dist-info

--===============1871607962944238433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1656 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1654 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-87c72eace09515a3b82caeb2efa406494dbdd7ea"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:87c72eace09515a3b82caeb2efa406494dbdd7ea"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 94 Local 1 Mirrors 0 Missed 93 Current 338 (1% match, 78% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 985 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_fetch)
NOTE: Running task 1096 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: Running task 1097 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 1098 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_fetch)
NOTE: Running task 1131 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 1132 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_fetch)
NOTE: Running task 1133 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_fetch)
NOTE: Running task 1134 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_fetch)
NOTE: Running task 1140 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_fetch)
NOTE: Running task 1158 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_fetch)
NOTE: Running task 1162 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1163 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1164 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1165 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1166 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_fetch)
NOTE: Running task 1167 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_fetch)
NOTE: Running task 1212 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_fetch)
NOTE: Running task 1213 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1242 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_fetch)
NOTE: Running task 1243 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_fetch)
NOTE: Running task 1244 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_fetch)
NOTE: Running task 1245 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1246 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_fetch)
NOTE: Running task 1247 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_fetch)
NOTE: Running task 1248 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 1249 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Started
NOTE: Running task 1355 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: Running task 1356 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 1357 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_unpack)
NOTE: Running task 1358 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: Running task 1359 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_fetch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1360 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1361 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_unpack)
NOTE: Running task 1362 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Started
NOTE: Running task 1363 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: Running task 1364 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_unpack)
NOTE: Running task 1365 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_unpack)
NOTE: Running task 1366 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_unpack)
NOTE: Running task 1367 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_unpack)
NOTE: Running task 1368 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_unpack)
NOTE: Running task 1369 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1370 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1371 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1373 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1374 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1375 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1376 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1377 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_unpack)
NOTE: Running task 1378 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_unpack)
NOTE: Running task 1379 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: Running task 1380 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: Running task 1381 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1382 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: Running task 1383 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_patch)
NOTE: Running task 1384 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_unpack)
NOTE: Running task 1385 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1386 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_unpack: Started
NOTE: Running task 1387 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1388 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1389 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_unpack: Started
NOTE: Running task 1390 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: Running task 1391 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1392 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: Running task 1393 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_patch)
NOTE: recipe python3-pytest-7.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1394 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: Running task 1395 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_patch)
NOTE: Running task 1396 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1397 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_unpack: Started
NOTE: Running task 1398 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: Running task 1399 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1400 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1401 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_unpack)
NOTE: Running task 1402 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_unpack)
NOTE: Running task 1403 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_unpack)
NOTE: Running task 1404 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1405 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_unpack)
NOTE: Running task 1406 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_unpack)
NOTE: Running task 1407 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: Running task 1408 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: Running task 1409 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-21.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1410 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_patch)
NOTE: Running task 1411 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: Running task 1412 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1413 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1414 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_patch: Started
NOTE: Running task 1415 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: Running task 1416 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Started
NOTE: Running task 1417 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: Running task 1418 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Started
NOTE: Running task 1419 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_patch)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_unpack: Started
NOTE: Running task 1420 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: Running task 1421 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1422 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_patch)
NOTE: Running task 1423 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_patch)
NOTE: Running task 1424 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-21.4.0-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1425 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_patch)
NOTE: Running task 1426 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1427 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: Running task 1428 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_patch)
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1430 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1431 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1432 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1433 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1434 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1435 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1436 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-7.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1437 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1438 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Succeeded
NOTE: Running task 1439 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1440 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1441 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1442 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1443 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Succeeded
NOTE: Running task 1444 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1445 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1446 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_patch)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1447 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1448 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1449 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1450 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_patch: Succeeded
NOTE: Running task 1451 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1452 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1453 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1454 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1455 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: Running task 1456 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1457 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: Running task 1458 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1459 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: Running task 1460 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1461 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-7.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1462 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_configure)
NOTE: Running task 1463 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure)
NOTE: Running task 1464 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1465 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1466 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_patch)
NOTE: Running task 1467 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure: Started
NOTE: Running task 1468 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1469 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_configure)
NOTE: Running task 1470 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1471 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 1472 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-7.1.2-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Succeeded
NOTE: Running task 1473 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: Running task 1474 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1475 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Started
NOTE: Running task 1476 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: Running task 1477 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_compile)
NOTE: recipe python3-cffi-1.15.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: Running task 1478 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1479 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1480 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: Running task 1481 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_configure)
NOTE: recipe python3-pytest-7.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: Running task 1482 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 1483 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_compile)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1484 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1485 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure_ptest_base)
NOTE: recipe python3-attrs-21.4.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1486 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: Running task 1487 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_compile)
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1488 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: Running task 1489 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1490 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_compile: Started
NOTE: Running task 1491 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile)
NOTE: Running task 1492 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1493 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_compile)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1494 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: Running task 1495 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1496 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_rust_create_wrappers)
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_configure: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: Running task 1497 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: Running task 1498 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: Running task 1499 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: Running task 1500 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_compile)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: Running task 1501 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_configure)
NOTE: Running task 1502 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1503 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_configure)
NOTE: Running task 1504 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Started
NOTE: Running task 1505 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: Running task 1506 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 1507 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_compile)
NOTE: Running task 1508 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_compile)
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Started
NOTE: Running task 1509 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_populate_lic)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_populate_lic: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1510 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_compile)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_configure)
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1512 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: Running task 1513 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_compile)
NOTE: Running task 1514 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: Running task 1515 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_populate_lic unihash changed to eee27c8d1f69e3ff71651cdc4f08b93287474547b1c5b13f02799602ebf5cc91
NOTE: recipe python3-setuptools-62.5.0-r0: task do_compile: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1516 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1517 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_configure_ptest_base)
NOTE: Running task 1518 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_compile_ptest_base)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1519 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1520 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_compile)
NOTE: Running task 1521 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1522 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1523 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install: Succeeded
NOTE: Running task 1524 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_install_ptest_base)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1525 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_package)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_package: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1526 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1527 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 1528 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1529 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: Running task 1530 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-attrs-21.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1531 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile_ptest_base)
NOTE: Running task 1532 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 1533 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 1534 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_install)
NOTE: Running task 1535 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1536 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_install)
NOTE: Running task 1537 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1538 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1539 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: Running task 1540 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Started
NOTE: Running task 1541 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile_ptest_base)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: Running task 1542 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package_write_rpm)
NOTE: Running task 1543 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: Running task 1544 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_install)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1545 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1546 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1547 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: Running task 1548 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_install: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_package: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_compile: Succeeded
NOTE: Running task 1549 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_install)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: Running task 1550 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_packagedata)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: Running task 1551 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1552 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: recipe python3-attrs-21.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 1553 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_install: Started
NOTE: Running task 1554 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install_ptest_base)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1555 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install_ptest_base)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_packagedata: Started
NOTE: Running task 1556 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-packaging-21.3-r0: task do_install: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 1557 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: Running task 1558 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_package: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Started
NOTE: Running task 1559 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-packaging-21.3-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 1560 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_install)
NOTE: Running task 1561 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1562 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1563 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1564 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_install: Succeeded
NOTE: Running task 1565 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Started
NOTE: Running task 1566 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Started
NOTE: Running task 1567 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package: Started
NOTE: Running task 1568 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-pytest-7.1.2-r0: task do_install: Succeeded
NOTE: Running task 1569 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1570 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe python3-pytest-7.1.2-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: Running task 1571 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1572 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1573 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_install)
NOTE: Running task 1574 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Succeeded
NOTE: Running task 1575 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: Running task 1576 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Started
NOTE: Running task 1577 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_compile: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1578 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_install)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: Running task 1579 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: Running task 1580 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1581 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_package)
NOTE: Running task 1582 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Succeeded
NOTE: Running task 1583 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_install: Started
NOTE: Running task 1584 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_package: Succeeded
NOTE: Running task 1585 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_packagedata)
NOTE: Running task 1586 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-packaging-21.3-r0: task do_package: Succeeded
NOTE: Running task 1587 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata)
NOTE: recipe python3-attrs-21.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Succeeded
NOTE: Running task 1588 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: Running task 1589 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1590 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 1591 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Started
NOTE: Running task 1592 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata)
NOTE: recipe python3-attrs-21.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1593 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1594 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 1595 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata)
NOTE: recipe python3-pytest-7.1.2-r0: task do_package: Succeeded
NOTE: Running task 1596 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_install: Succeeded
NOTE: Running task 1597 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1598 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_package)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1599 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_packagedata)
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Started
NOTE: Running task 1600 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_package: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1601 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Succeeded
NOTE: Running task 1602 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Succeeded
NOTE: Running task 1603 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1604 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_install)
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1605 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Succeeded
NOTE: Running task 1606 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 1607 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_package)
NOTE: recipe python3-pytz-2022.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1608 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_package: Succeeded
NOTE: Running task 1609 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1610 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 1611 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pytest-7.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1611 tasks of which 1328 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-src went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-dbg went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-staticdev went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-dev went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-doc went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-locale went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-cffi/1.15.0-r0/temp/log.do_packagedata.2988357
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_packagedata) failed with exit code '1'

--===============1871607962944238433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1655 targets, 49 skipped, 0 masked, 0 errors.
Removing 47 recipes from the core2-32 sysroot...done.
Removing 61 recipes from the qemux86 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-87c72eace09515a3b82caeb2efa406494dbdd7ea"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:87c72eace09515a3b82caeb2efa406494dbdd7ea"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 254 Local 161 Mirrors 0 Missed 93 Current 194 (63% match, 79% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 230 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 735 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_fetch)
NOTE: Running task 820 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 821 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_fetch)
NOTE: Running task 822 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: Running task 823 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_fetch)
NOTE: Running task 824 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_fetch)
NOTE: Running task 825 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 826 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_fetch)
NOTE: Running task 827 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_fetch)
NOTE: Running task 828 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_fetch)
NOTE: Running task 832 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 833 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 834 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_fetch)
NOTE: Running task 835 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_fetch)
NOTE: Running task 836 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 837 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 844 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_fetch)
NOTE: Running task 845 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 863 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: Running task 864 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_fetch)
NOTE: Running task 865 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_fetch)
NOTE: Running task 866 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 867 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_fetch)
NOTE: Running task 868 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_fetch)
NOTE: Running task 869 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 870 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_fetch)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: Running task 910 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_unpack)
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 911 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 912 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: Running task 913 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_unpack)
NOTE: Running task 914 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_unpack)
NOTE: Running task 915 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 916 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: Running task 917 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_unpack)
NOTE: Running task 918 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_unpack)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_fetch: Started
NOTE: Running task 919 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_unpack)
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_fetch: Started
NOTE: Running task 920 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_unpack)
NOTE: Running task 921 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 922 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 923 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_unpack)
NOTE: Running task 924 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_unpack)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 925 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 926 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Started
NOTE: Running setscene task 296 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: Running task 927 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_unpack)
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Succeeded
NOTE: Running task 928 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Started
NOTE: Running task 929 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_unpack)
NOTE: Running task 930 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_unpack)
NOTE: Running task 931 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 932 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_unpack)
NOTE: Running task 933 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_unpack)
NOTE: Running task 934 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: recipe libstd-rs-1.60.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 935 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_unpack)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: Running setscene task 299 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pytest-7.1.2-r0: task do_unpack: Started
NOTE: Running setscene task 301 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: Running task 940 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 941 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 942 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_patch)
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_unpack: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running setscene task 302 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_unpack: Started
NOTE: Running setscene task 303 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-21.4.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 304 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 943 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: Running task 944 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_patch)
NOTE: Running task 945 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: Running task 946 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_unpack: Started
NOTE: Running task 947 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_patch)
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 948 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_patch)
NOTE: recipe python3-cffi-1.15.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_unpack: Succeeded
NOTE: Running task 949 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 950 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Started
NOTE: Running task 951 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_patch)
NOTE: Running task 952 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_patch)
NOTE: Running task 953 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 954 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_patch)
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Succeeded
NOTE: Running task 955 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: Running task 956 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Started
NOTE: Running task 957 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_patch)
NOTE: Running task 958 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_patch)
NOTE: Running task 959 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: Running task 960 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_patch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: Running task 961 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: Running task 962 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_patch: Started
NOTE: Running task 963 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_patch)
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_patch: Started
NOTE: Running setscene task 309 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata_setscene)
NOTE: Running task 964 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 965 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.60.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: Running setscene task 312 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 970 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Started
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 972 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 976 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 977 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 981 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rust-cross-core2-32-musl-1.60.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 990 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 992 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 993 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 994 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_patch: Succeeded
NOTE: Running task 995 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 996 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: Running task 997 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 998 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Succeeded
NOTE: Running task 999 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1004 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1005 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1006 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Succeeded
NOTE: Running task 1007 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1008 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1009 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1010 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 328 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: recipe rust-cross-core2-32-musl-1.60.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 335 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1025 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 339 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 354 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pytest-7.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 361 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1038 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_patch)
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 366 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 374 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_patch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 378 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 381 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1064 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1093 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_patch)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 398 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 403 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1110 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1111 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_populate_lic)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_populate_lic unihash changed to eee27c8d1f69e3ff71651cdc4f08b93287474547b1c5b13f02799602ebf5cc91
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 417 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 423 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 426 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 432 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 441 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 445 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1349 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1397 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1398 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1399 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1430 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1431 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1432 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1433 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1441 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1450 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1457 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1458 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1459 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1460 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1461 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1467 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1468 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1477 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1479 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1480 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1481 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1482 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-21.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1483 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1484 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1485 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1515 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: Running task 1516 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1517 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Started
NOTE: Running task 1518 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure)
NOTE: Running task 1519 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_configure)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1520 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_rust_create_wrappers)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1521 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Succeeded
NOTE: Running task 1522 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1523 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1524 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure_ptest_base)
NOTE: Running task 1525 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_configure)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure: Started
NOTE: Running task 1526 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_configure)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: Running task 1527 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: Running task 1528 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1529 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: Running task 1530 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_configure)
NOTE: Running task 1531 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1532 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure_ptest_base)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_configure: Started
NOTE: Running task 1533 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: Running task 1534 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_configure)
NOTE: recipe python3-cffi-1.15.0-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1535 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1536 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: Running task 1537 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Started
NOTE: Running task 1538 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1539 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1540 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure_ptest_base)
NOTE: recipe python3-attrs-21.4.0-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1541 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_compile)
NOTE: Running task 1542 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1543 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: Running task 1544 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Succeeded
NOTE: Running task 1545 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1546 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1547 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_compile)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1548 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_compile)
NOTE: recipe python3-attrs-21.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1549 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_compile: Started
NOTE: Running task 1550 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: Running task 1551 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: Running task 1552 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: Running task 1553 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: Running task 1554 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1555 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: Running task 1556 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Started
NOTE: Running task 1557 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile)
NOTE: Running task 1558 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: Running task 1559 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_configure)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: Running task 1560 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_configure)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: Running task 1561 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: recipe python3-attrs-21.4.0-r0: task do_compile: Started
NOTE: Running task 1562 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_configure_ptest_base)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Started
NOTE: Running task 1563 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_configure: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: Running task 1564 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Started
NOTE: Running task 1565 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_compile)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_configure: Succeeded
NOTE: Running task 1566 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1567 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_compile)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1568 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1569 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: Running task 1570 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_compile)
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Started
NOTE: Running task 1571 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_compile)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: Running task 1572 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_compile: Started
NOTE: Running task 1573 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_compile: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1574 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1575 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: Running task 1576 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_compile_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1577 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_install)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1578 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: Running task 1579 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install: Succeeded
NOTE: Running task 1580 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_install_ptest_base)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1581 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_package)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1582 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1583 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile_ptest_base)
NOTE: Running task 1584 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1585 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1586 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1587 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: Running task 1588 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Succeeded
NOTE: Running task 1589 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1590 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1591 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_install)
NOTE: Running task 1592 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-attrs-21.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1593 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: Running task 1594 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Started
NOTE: Running task 1595 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_install)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1596 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1597 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package_write_rpm)
NOTE: Running task 1598 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1599 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package_write_rpm)
NOTE: Running task 1600 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-pytest-7.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1601 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_install)
NOTE: Running task 1602 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_install)
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1603 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_package: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1604 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: Running task 1605 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_packagedata)
NOTE: recipe python3-pytest-7.1.2-r0: task do_install: Started
NOTE: Running task 1606 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe python3-packaging-21.3-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 1607 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_package)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_packagedata: Started
NOTE: Running task 1608 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1609 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install_ptest_base)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: Running task 1610 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1611 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: Running task 1612 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: Running task 1613 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_install)
NOTE: recipe python3-attrs-21.4.0-r0: task do_install: Succeeded
NOTE: Running task 1614 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_package)
NOTE: Running task 1615 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install_ptest_base)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Started
NOTE: Running task 1616 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_package: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1617 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_install)
NOTE: Running task 1618 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_install: Succeeded
NOTE: Running task 1619 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package)
NOTE: Running task 1620 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1621 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package)
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1622 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Started
NOTE: recipe python3-packaging-21.3-r0: task do_package: Started
NOTE: Running task 1623 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 1624 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: Running task 1625 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_package)
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Succeeded
NOTE: Running task 1626 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: Running task 1627 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: Running task 1628 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install_ptest_base)
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_install: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: Running task 1629 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_package)
NOTE: Running task 1630 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1631 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1632 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1633 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1634 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package)
NOTE: Running task 1635 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_package)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1636 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_install)
NOTE: Running task 1637 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package)
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1638 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 1639 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Succeeded
NOTE: Running task 1640 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 1641 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata)
NOTE: Running task 1642 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: Running task 1643 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_package: Succeeded
NOTE: Running task 1644 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_packagedata)
NOTE: recipe python3-attrs-21.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_package: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1645 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1646 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata)
NOTE: Running task 1647 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_packagedata)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package: Succeeded
NOTE: Running task 1648 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: Running task 1649 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata)
NOTE: recipe python3-attrs-21.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1650 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1651 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1652 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: Running task 1653 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_install: Succeeded
NOTE: Running task 1654 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_package)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_package: Started
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1655 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Succeeded
NOTE: Running task 1656 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata)
NOTE: Running task 1657 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Started
NOTE: Running task 1658 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1659 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package_write_rpm)
NOTE: recipe python3-psutil-5.9.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Succeeded
NOTE: Running task 1660 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Succeeded
NOTE: Running task 1661 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1662 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_install)
NOTE: recipe python3-cffi-1.15.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1663 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 1664 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_package)
NOTE: recipe python3-cffi-1.15.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_package: Succeeded
NOTE: Running task 1665 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1666 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 1667 of 1685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pytest-7.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1667 tasks of which 1384 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-src went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-dbg went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-staticdev went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-dev went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-doc went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-locale went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-cffi/1.15.0-r0/temp/log.do_packagedata.3102679
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_packagedata) failed with exit code '1'

--===============1871607962944238433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 63 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-87c72eace09515a3b82caeb2efa406494dbdd7ea"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:87c72eace09515a3b82caeb2efa406494dbdd7ea"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 94 Local 1 Mirrors 0 Missed 93 Current 338 (1% match, 78% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 985 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_fetch)
NOTE: Running task 1096 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_fetch)
NOTE: Running task 1097 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 1098 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: Running task 1131 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_fetch)
NOTE: Running task 1132 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_fetch)
NOTE: Running task 1133 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 1134 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_fetch)
NOTE: Running task 1141 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_fetch)
NOTE: Running task 1158 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_fetch)
NOTE: Running task 1162 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1163 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_fetch)
NOTE: Running task 1164 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1165 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1166 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_fetch)
NOTE: Running task 1167 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1212 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1213 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_fetch)
NOTE: Running task 1243 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_fetch)
NOTE: Running task 1244 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_fetch)
NOTE: Running task 1245 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 1246 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1247 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_fetch)
NOTE: Running task 1248 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_fetch)
NOTE: Running task 1249 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_fetch)
NOTE: Running task 1250 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_fetch: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_fetch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Started
NOTE: Running task 1355 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_unpack)
NOTE: Running task 1356 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 1357 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 1358 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: Running task 1359 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1360 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1361 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_unpack)
NOTE: Running task 1362 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_unpack)
NOTE: Running task 1363 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1364 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_unpack)
NOTE: Running task 1365 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_unpack)
NOTE: Running task 1366 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_unpack)
NOTE: Running task 1367 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: Running task 1368 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_unpack)
NOTE: Running task 1369 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1370 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1371 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_patch)
NOTE: Running task 1373 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: Running task 1374 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: Running task 1375 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1376 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_unpack)
NOTE: Running task 1377 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1378 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1379 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_unpack)
NOTE: Running task 1380 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1381 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1382 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: Running task 1383 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1384 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1385 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_unpack)
NOTE: Running task 1386 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1387 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_unpack: Started
NOTE: Running task 1388 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1389 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1390 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: Running task 1391 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_patch)
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: Running task 1392 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: recipe python3-pytest-7.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: Running task 1393 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_patch)
NOTE: Running task 1394 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_patch)
NOTE: Running task 1395 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_patch)
NOTE: Running task 1396 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1397 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_unpack)
NOTE: Running task 1398 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_unpack)
NOTE: Running task 1399 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: Running task 1400 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1401 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_unpack)
NOTE: Running task 1402 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_unpack)
NOTE: Running task 1403 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_unpack)
NOTE: Running task 1404 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: Running task 1405 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_unpack: Started
NOTE: Running task 1406 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1407 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1408 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: Running task 1409 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: Running task 1410 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1411 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_patch)
NOTE: Running task 1412 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 1413 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: Running task 1414 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: Running task 1415 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_patch)
NOTE: recipe python3-pytest-7.1.2-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1416 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_unpack: Started
NOTE: Running task 1417 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_unpack: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: Running task 1418 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 1419 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: Running task 1420 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_patch)
NOTE: Running task 1421 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_patch)
NOTE: Running task 1422 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_patch)
NOTE: Running task 1423 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1424 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: Running task 1425 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_patch)
NOTE: Running task 1426 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: Running task 1427 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1428 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1429 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1430 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_patch)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Started
NOTE: Running task 1431 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1432 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1433 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1434 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1435 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Succeeded
NOTE: Running task 1436 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_patch: Succeeded
NOTE: Running task 1437 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1438 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Succeeded
NOTE: Running task 1439 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1440 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1441 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1442 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1443 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1444 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1445 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_patch)
NOTE: Running task 1446 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1447 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1448 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-attrs-21.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_patch: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1449 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1450 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1451 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1452 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: Running task 1453 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1454 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_patch: Started
NOTE: Running task 1455 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1456 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1457 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_configure)
NOTE: recipe python3-pytest-7.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Succeeded
NOTE: Running task 1458 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1459 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure_ptest_base)
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1460 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_configure)
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1461 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1462 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1463 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure)
NOTE: Running task 1464 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1465 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_configure)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1466 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_patch)
NOTE: Running task 1467 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1468 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1469 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1470 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_configure)
NOTE: Running task 1471 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1472 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1473 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: Running task 1474 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1475 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_configure_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: Running task 1476 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_patch: Started
NOTE: Running task 1477 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Started
NOTE: Running task 1478 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_configure: Started
NOTE: Running task 1479 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_configure)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Started
NOTE: Running task 1480 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: Running task 1481 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_configure)
NOTE: recipe python3-cffi-1.15.0-r0: task do_configure: Started
NOTE: Running task 1482 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1483 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Started
NOTE: Running task 1484 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: Running task 1485 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: Running task 1486 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1487 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_configure: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_configure: Started
NOTE: Running task 1488 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Started
NOTE: Running task 1489 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_compile)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_configure: Started
NOTE: Running task 1490 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure_ptest_base)
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: Running task 1491 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_compile)
NOTE: Running task 1492 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1493 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: Running task 1494 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1495 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1496 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1497 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1498 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_rust_create_wrappers)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_compile: Started
NOTE: Running task 1499 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_compile: Started
NOTE: Running task 1501 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: Running task 1502 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_compile)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 1503 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_configure)
NOTE: Running task 1504 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: Running task 1505 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_compile)
NOTE: Running task 1506 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1507 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_compile)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: Running task 1508 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: Running task 1509 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: Running task 1510 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_compile)
NOTE: recipe python3-attrs-21.4.0-r0: task do_compile: Started
NOTE: Running task 1511 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_compile)
NOTE: Running task 1512 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_populate_lic)
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1513 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_compile)
NOTE: Running task 1514 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1515 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_configure)
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_populate_lic unihash changed to eee27c8d1f69e3ff71651cdc4f08b93287474547b1c5b13f02799602ebf5cc91
NOTE: Running task 1516 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1517 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_configure_ptest_base)
NOTE: Running task 1518 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_compile_ptest_base)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1519 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1520 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_compile)
NOTE: Running task 1521 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_install)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1522 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: Running task 1523 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install: Succeeded
NOTE: Running task 1524 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_install_ptest_base)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1525 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_package)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1526 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1527 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1528 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: Running task 1529 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1530 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: Running task 1531 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: Running task 1532 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Succeeded
NOTE: Running task 1533 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile_ptest_base)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1534 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: Running task 1535 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: Running task 1536 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile_ptest_base)
NOTE: Running task 1537 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: Running task 1538 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1539 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 1540 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1541 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Started
NOTE: Running task 1542 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_install)
NOTE: Running task 1543 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 1544 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: Running task 1545 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_install)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_compile: Succeeded
NOTE: Running task 1546 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1547 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_install)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_package: Succeeded
NOTE: Running task 1548 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Succeeded
NOTE: Running task 1549 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_install)
NOTE: Running task 1550 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: Running task 1551 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_package)
NOTE: Running task 1552 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-pytest-7.1.2-r0: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: Running task 1553 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Started
NOTE: recipe python3-packaging-21.3-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1554 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-attrs-21.4.0-r0: task do_install: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_install: Started
NOTE: Running task 1555 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1556 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install_ptest_base)
NOTE: Running task 1557 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_install)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1558 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1559 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: Running task 1560 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: Running task 1561 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install_ptest_base)
NOTE: recipe python3-packaging-21.3-r0: task do_install: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1562 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_install: Succeeded
NOTE: Running task 1563 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package)
NOTE: recipe python3-attrs-21.4.0-r0: task do_install: Succeeded
NOTE: Running task 1564 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: Running task 1565 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_package)
NOTE: Running task 1566 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_package: Started
NOTE: Running task 1567 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_install: Succeeded
NOTE: Running task 1568 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package)
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Succeeded
NOTE: Running task 1569 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_package)
NOTE: Running task 1570 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_install)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1571 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: Running task 1572 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1573 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1574 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: Running task 1575 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_package: Started
NOTE: Running task 1576 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1577 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1578 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_package)
NOTE: Running task 1579 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1580 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1581 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_install)
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Succeeded
NOTE: Running task 1582 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Started
NOTE: Running task 1583 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_install: Started
NOTE: Running task 1584 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Started
NOTE: Running task 1585 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: Running task 1586 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package)
NOTE: Running task 1587 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_package: Succeeded
NOTE: Running task 1588 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1589 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: Running task 1590 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_packagedata)
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Started
NOTE: Running task 1591 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1592 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_packagedata)
NOTE: Running task 1593 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata)
NOTE: Running task 1594 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata)
NOTE: recipe python3-attrs-21.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1595 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_package: Succeeded
NOTE: Running task 1596 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: Running task 1597 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata)
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata: Started
NOTE: Running task 1598 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_install: Succeeded
NOTE: Running task 1599 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_package: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1600 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Succeeded
NOTE: Running task 1601 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: Running task 1602 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Succeeded
NOTE: Running task 1603 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package_write_rpm)
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1604 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package_write_rpm: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1606 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_install)
NOTE: recipe python3-cffi-1.15.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1607 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 1608 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_package)
NOTE: recipe python3-cffi-1.15.0-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_package: Succeeded
NOTE: Running task 1609 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1610 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 1611 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pytest-7.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1611 tasks of which 1328 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-src went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-dbg went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-staticdev went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-dev went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-doc went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-locale went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-cffi/1.15.0-r0/temp/log.do_packagedata.3043065
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_packagedata) failed with exit code '1'

--===============1871607962944238433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 53 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-87c72eace09515a3b82caeb2efa406494dbdd7ea"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:87c72eace09515a3b82caeb2efa406494dbdd7ea"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 94 Local 1 Mirrors 0 Missed 93 Current 338 (1% match, 78% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 985 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_fetch)
NOTE: Running task 1096 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_fetch)
NOTE: Running task 1097 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 1098 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: Running task 1131 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_fetch)
NOTE: Running task 1132 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_fetch)
NOTE: Running task 1133 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 1134 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_fetch)
NOTE: Running task 1141 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_fetch)
NOTE: Running task 1158 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_fetch)
NOTE: Running task 1162 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1163 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_fetch)
NOTE: Running task 1164 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1165 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1166 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1167 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_fetch)
NOTE: Running task 1212 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1213 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_fetch)
NOTE: Running task 1243 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_fetch)
NOTE: Running task 1244 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_fetch)
NOTE: Running task 1245 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 1246 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_fetch)
NOTE: Running task 1247 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_fetch)
NOTE: Running task 1248 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_fetch)
NOTE: Running task 1249 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1250 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_fetch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: Running task 1355 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Started
NOTE: Running task 1356 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: Running task 1357 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: Running task 1358 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_unpack)
NOTE: Running task 1359 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1360 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_unpack)
NOTE: Running task 1361 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: Running task 1362 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1363 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_unpack)
NOTE: Running task 1364 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_unpack)
NOTE: Running task 1365 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: Running task 1366 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_unpack)
NOTE: Running task 1367 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_unpack)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1368 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_unpack)
NOTE: Running task 1369 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1370 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1371 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1373 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1374 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_unpack)
NOTE: Running task 1375 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1376 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1377 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1378 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_unpack)
NOTE: Running task 1379 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: Running task 1380 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Started
NOTE: Running task 1381 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1382 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_unpack)
NOTE: Running task 1383 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_unpack: Started
NOTE: Running task 1384 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1385 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: Running task 1386 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_unpack: Started
NOTE: Running task 1387 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1388 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: Running task 1389 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1390 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_patch)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 1391 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_unpack)
NOTE: Running task 1392 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_unpack)
NOTE: Running task 1393 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: Running task 1394 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_unpack)
NOTE: Running task 1395 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_unpack)
NOTE: Running task 1396 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_unpack)
NOTE: Running task 1397 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1398 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: Running task 1399 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: Running task 1400 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1401 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_patch)
NOTE: Running task 1402 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_patch)
NOTE: recipe python3-pytest-7.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1403 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_patch)
NOTE: Running task 1404 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_patch)
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: Running task 1405 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_patch)
NOTE: Running task 1406 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: Running task 1407 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1408 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 1409 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: Running task 1410 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: recipe python3-attrs-21.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1411 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1412 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1413 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_patch)
NOTE: Running task 1414 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: Running task 1415 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Started
NOTE: Running task 1416 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: Running task 1417 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_patch)
NOTE: Running task 1418 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_patch)
NOTE: Running task 1419 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1420 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: Running task 1421 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_patch)
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: Running task 1422 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_patch: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1423 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_patch)
NOTE: Running task 1424 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: Running task 1425 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: Running task 1426 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1427 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1428 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1429 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_patch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: Running task 1430 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-attrs-21.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: Running task 1431 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: Running task 1432 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1433 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_patch: Started
NOTE: Running task 1434 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1435 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1436 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1437 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1438 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1439 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1440 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1441 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1442 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1443 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1444 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-7.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Succeeded
NOTE: Running task 1445 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1446 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_patch)
NOTE: recipe python3-pytest-7.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1447 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1448 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1449 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1450 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1451 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_patch: Succeeded
NOTE: Running task 1452 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_patch: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1453 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: recipe python3-attrs-21.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1454 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1455 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1456 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure)
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1457 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_configure)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1458 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1459 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1460 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1461 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1462 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_configure)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1463 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_configure)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: Running task 1464 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_configure)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Started
NOTE: Running task 1465 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1466 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_patch)
NOTE: Running task 1467 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1468 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1469 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1470 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Started
NOTE: Running task 1471 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Started
NOTE: Running task 1472 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure_ptest_base)
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: Running task 1473 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_configure)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Started
NOTE: Running task 1474 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1475 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-cffi-1.15.0-r0: task do_configure: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Started
NOTE: Running task 1476 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: Running task 1477 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure_ptest_base)
NOTE: Running task 1478 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_configure_ptest_base)
NOTE: Running task 1479 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Succeeded
NOTE: Running task 1480 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: Running task 1481 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 1482 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: Running task 1483 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1484 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 1485 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_compile)
NOTE: recipe python3-cffi-1.15.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1486 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1487 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1488 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile)
NOTE: Running task 1489 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: Running task 1490 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1491 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_compile: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1492 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1493 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile)
NOTE: recipe python3-pytest-7.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: Running task 1494 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Started
NOTE: Running task 1495 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_compile)
NOTE: Running task 1496 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_compile)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_compile: Started
NOTE: Running task 1497 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: Running task 1498 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_configure: Started
NOTE: Running task 1499 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1500 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_rust_create_wrappers)
NOTE: Running task 1501 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile)
NOTE: Running task 1502 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_compile)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: Running task 1503 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: Running task 1504 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: Running task 1505 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_compile: Started
NOTE: Running task 1506 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_compile)
NOTE: Running task 1507 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: Running task 1508 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 1509 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_configure: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: Running task 1510 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_populate_lic)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1511 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Started
NOTE: Running task 1512 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Started
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_populate_lic: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_compile: Started
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1513 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1514 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_configure)
NOTE: Running task 1515 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_compile)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_populate_lic unihash changed to eee27c8d1f69e3ff71651cdc4f08b93287474547b1c5b13f02799602ebf5cc91
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1516 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1517 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_configure_ptest_base)
NOTE: Running task 1518 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: Running task 1519 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_compile_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-cryptography-37.0.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1520 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb:do_compile)
NOTE: Running task 1521 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_install)
NOTE: recipe python3-cryptography-37.0.3-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1522 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: Running task 1523 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install: Succeeded
NOTE: Running task 1524 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_install_ptest_base)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1525 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_package)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1526 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1527 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1528 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1529 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 1530 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1531 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1532 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: Running task 1533 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile_ptest_base)
NOTE: Running task 1534 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-attrs-21.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_install: Started
NOTE: Running task 1535 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_install)
NOTE: Running task 1536 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_install)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: Running task 1537 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1538 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-attrs-21.4.0-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1539 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Succeeded
NOTE: Running task 1540 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: Running task 1541 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: Running task 1542 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 1543 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_install)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1544 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe python3-packaging-21.3-r0: task do_install: Succeeded
NOTE: Running task 1545 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Started
NOTE: Running task 1546 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1547 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 1548 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: Running task 1549 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_install: Started
NOTE: Running task 1550 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: Running task 1551 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: Running task 1552 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1553 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-packaging-21.3-r0: task do_package: Started
NOTE: Running task 1554 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1555 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Succeeded
NOTE: Running task 1556 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_package)
NOTE: Running task 1557 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_install: Started
NOTE: Running task 1558 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1559 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_packagedata)
NOTE: recipe python3-attrs-21.4.0-r0: task do_package: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Started
NOTE: Running task 1560 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1561 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package)
NOTE: Running task 1562 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: Running task 1563 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install_ptest_base)
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1564 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package)
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: Running task 1565 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_install: Succeeded
NOTE: Running task 1566 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: Running task 1567 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: Running task 1568 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_install: Succeeded
NOTE: Running task 1569 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: Running task 1570 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 1571 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_install)
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: Running task 1572 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: Running task 1573 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install_ptest_base)
NOTE: Running task 1574 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1575 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: Running task 1576 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: Running task 1577 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: Running task 1578 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe python3-packaging-21.3-r0: task do_package: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1579 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata)
NOTE: recipe python3-setuptools-62.5.0-r0: task do_compile: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1580 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: Running task 1581 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: Running task 1582 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_package)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: Running task 1583 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_install)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: Running task 1584 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Succeeded
NOTE: Running task 1585 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Started
NOTE: Running task 1586 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_install: Started
NOTE: Running task 1587 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1588 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_packagedata)
NOTE: Running task 1589 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1590 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_packagedata)
NOTE: Running task 1591 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package)
NOTE: recipe python3-attrs-21.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1592 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package: Succeeded
NOTE: Running task 1593 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: Running task 1594 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: Running task 1595 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 1596 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata)
NOTE: Running task 1597 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Started
NOTE: Running task 1598 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_install: Succeeded
NOTE: Running task 1599 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_package)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_package: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1600 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1601 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_packagedata)
NOTE: Running task 1602 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1603 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Succeeded
NOTE: Running task 1604 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1606 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_install)
NOTE: recipe python3-pytz-2022.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1607 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 1608 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_package)
NOTE: recipe python3-cffi-1.15.0-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_package: Succeeded
NOTE: Running task 1609 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-62.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-62.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1610 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 1611 of 1629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pytest-7.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-37.0.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1611 tasks of which 1328 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-src went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-dbg went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-staticdev went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-dev went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-doc went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi-locale went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: QA Issue: Package version for package python3-cffi went backwards which would break package feeds (from 0:1.15.1-r0 to 0:1.15.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.15.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-cffi/1.15.0-r0/temp/log.do_packagedata.3015624
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_packagedata) failed with exit code '1'

--===============1871607962944238433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.10/site-packages/cryptography-37.0.2.dist-info moved to /usr/lib/python3.10/site-packages/cryptography-37.0.3.dist-info

--===============1871607962944238433==--

