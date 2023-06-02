Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A04BCA9ECD
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.7629.1685693432005786442
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OqTozzUf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101887b288415-09f7e7c0-4aa5-4838-b395-f8b690760c8c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZN/1b8zNToLTjBuY5xn4VaTkNLd3n32fJN1T+MVGNo4=;
	b=OqTozzUfJmKnPRXgQXAbPVMsWhq5bFzOaylonFW3jj4KVKxk/WzFcXTVJqo3GfKO
	UAF0qpoemKfKqnihblPVfE9NLAYZDSYI7s8abk9loxRt/No57SQEcYkbj3PhbY9oF3z
	fKx/CX38WFfdVBSnPWDuLeftOJcdUP1+wCRjWvPM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZN/1b8zNToLTjBuY5xn4VaTkNLd3n32fJN1T+MVGNo4=;
	b=DCn1b+UeAL+3HRQAX4lZyRI/OOaCXIHcVj4hoANJSxzIF/U4wfQ67M+Hegm89rA+
	2kAItcKOfp3ywnDc3UFiJQChJ88qC7sw23OfxA5E2ewcLrhycm242kGymYBLhSN6FnE
	iafDYZGIMyYRbWasLCCeyIfNGOJXp1TOs/cYxV7s=
Content-Type: multipart/mixed; boundary="===============8435699861126532299=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-requests: upgrading to 2.31.0 SUCCEEDED
Message-ID: <010101887b288415-09f7e7c0-4aa5-4838-b395-f8b690760c8c-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182201

--===============8435699861126532299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-requests* to *2.31.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-requests-upgrade-2.30.0-2.31.0.patch
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
--===============8435699861126532299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:08c11a56be1cae9c42973c3dc8e29b6c096d0ca0"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 59 Local 12 Mirrors 0 Missed 47 Current 372 (20% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 429 of 431 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 431 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.69.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 989 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_patch)
NOTE: Running task 1074 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1142 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 1168 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_fetch)
NOTE: Running task 1172 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1186 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_fetch)
NOTE: Running task 1187 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1188 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 1189 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1350 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe libstd-rs-1.69.0-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe cargo-native-1.69.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: Running task 1500 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 1501 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1502 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_unpack)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1503 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1504 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_unpack)
NOTE: Running task 1505 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1506 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1507 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1508 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1509 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1510 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1511 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: Running task 1512 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1513 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1514 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1515 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1516 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_patch)
NOTE: Running task 1517 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1518 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_patch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1519 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: Running task 1520 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: Running task 1521 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1522 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: Running task 1523 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe cargo-native-1.69.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 431 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.69.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: Running task 1530 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1531 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.69.0-r0: task do_patch: Succeeded
NOTE: Running task 1532 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1533 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_rust_gen_targets)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1534 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1535 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rust-native-1.69.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 1536 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1537 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: Running task 1538 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1539 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_populate_lic)
NOTE: Running task 1540 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: Running task 1541 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1542 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_lic: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1543 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_populate_lic unihash changed to a18ea55440a25f91158df1d31b0b796781bd716a77a15ed1fd7cb1722f7ba5f4
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1544 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: Running task 1545 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Started
NOTE: recipe rust-native-1.69.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1564 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1571 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: Running task 1572 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: Running task 1573 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1574 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe libstd-rs-1.69.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: Running task 1575 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1576 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe libstd-rs-1.69.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1577 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: Running task 1578 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: Running task 1579 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: Running task 1581 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_compile)
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1582 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1583 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1584 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe libstd-rs-1.69.0-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_configure: Succeeded
NOTE: Running task 1585 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_compile)
NOTE: recipe libstd-rs-1.69.0-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1586 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1587 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1588 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_install)
NOTE: Running task 1589 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_install)
NOTE: Running task 1590 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1591 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1592 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: Running task 1593 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: Running task 1594 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Succeeded
NOTE: Running task 1595 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_package)
NOTE: Running task 1596 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_populate_sysroot)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1597 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: Running task 1598 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_package)
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: Running task 1599 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1600 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1601 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1602 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 1603 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1604 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: Running task 1606 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: Running task 1607 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Succeeded
NOTE: Running task 1608 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1609 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1610 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Failed
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1610 tasks of which 1519 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-certifi/2022.12.7-r0/temp/log.do_packagedata.2457798
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata) failed with exit code '1'

--===============8435699861126532299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:08c11a56be1cae9c42973c3dc8e29b6c096d0ca0"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 56 Local 9 Mirrors 0 Missed 47 Current 375 (16% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1013 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_patch)
NOTE: Running task 1105 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1173 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 1199 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_fetch)
NOTE: Running task 1203 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1217 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1218 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 1219 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_fetch)
NOTE: Running task 1220 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1381 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe libstd-rs-1.69.0-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1531 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 1532 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1533 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: Running task 1534 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_unpack)
NOTE: Running task 1535 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1536 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1537 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1538 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_unpack)
NOTE: Running task 1539 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: Running task 1540 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1541 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1542 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: Running task 1543 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1544 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1545 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1546 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1547 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1548 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: Running task 1549 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_patch)
NOTE: Running task 1550 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: Running task 1551 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: Running task 1552 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: Running task 1554 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: Running task 1555 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_patch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: Running task 1556 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_rust_create_wrappers)
NOTE: Running task 1557 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1558 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_rust_gen_targets)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1559 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1560 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.69.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1561 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_configure)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Succeeded
NOTE: Running task 1562 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1563 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_populate_lic)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1564 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1565 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: Running task 1566 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1567 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1568 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1569 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_lic: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_configure: Succeeded
NOTE: Running task 1570 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_populate_lic unihash changed to a18ea55440a25f91158df1d31b0b796781bd716a77a15ed1fd7cb1722f7ba5f4
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1571 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_compile: Started
NOTE: Running task 1572 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1573 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1574 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1575 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: Running task 1576 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1577 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1578 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_compile)
NOTE: Running task 1579 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: Running task 1581 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: Running task 1582 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1583 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_compile)
NOTE: Running task 1584 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1585 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1586 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1587 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1588 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_install)
NOTE: Running task 1589 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1590 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_install)
NOTE: Running task 1591 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: Running task 1592 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: Running task 1593 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: Running task 1594 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Succeeded
NOTE: Running task 1595 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1596 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_populate_sysroot)
NOTE: Running task 1597 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: Running task 1598 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_package)
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: Running task 1599 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1600 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1601 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1602 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: Running task 1603 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: Running task 1604 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: Running task 1606 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: Running task 1607 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Succeeded
NOTE: Running task 1608 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1609 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Failed
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1609 tasks of which 1520 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-certifi/2022.12.7-r0/temp/log.do_packagedata.2468571
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata) failed with exit code '1'

--===============8435699861126532299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.11/site-packages/requests-2.30.0.dist-info moved to /usr/lib/python3.11/site-packages/requests-2.31.0.dist-info

--===============8435699861126532299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 48 skipped, 0 masked, 0 errors.
Removing 34 recipes from the core2-32 sysroot...done.
Removing 60 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:08c11a56be1cae9c42973c3dc8e29b6c096d0ca0"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 228 Local 172 Mirrors 0 Missed 56 Current 217 (75% match, 87% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 218 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 226 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 267 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 282 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 710 of 1695 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.69.0.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 746 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: Running task 747 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 300 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 770 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 795 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_fetch)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 849 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 862 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 866 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_fetch)
NOTE: Running task 868 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 880 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 881 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 882 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_fetch)
NOTE: Running task 883 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 994 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 304 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.69.0-r0: task do_patch: Started
NOTE: Running setscene task 305 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 1055 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: recipe rust-native-1.69.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Started
NOTE: Running task 1056 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1057 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: Running task 1058 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_unpack)
NOTE: Running task 1059 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1060 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1061 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_unpack)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1062 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1063 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1064 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1065 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_unpack)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: Running task 1066 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1067 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1068 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_patch)
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1069 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_patch)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1070 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1071 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: Running task 1072 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: Running task 1073 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_patch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: Running task 1074 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1075 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: Running task 1076 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: Running task 1077 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: Running setscene task 313 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: Running task 1086 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1087 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_rust_gen_targets)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1088 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1094 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1095 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1100 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1101 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_populate_lic)
NOTE: Running task 1102 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1103 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: Running task 1104 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_gen_targets: Started
NOTE: Running task 1105 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: Running setscene task 329 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1117 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_populate_lic unihash changed to a18ea55440a25f91158df1d31b0b796781bd716a77a15ed1fd7cb1722f7ba5f4
NOTE: recipe libstd-rs-1.69.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 336 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 351 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 360 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 367 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 370 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 376 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 380 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 402 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 413 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 416 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 422 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1220 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_patch)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 427 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 432 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1228 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_rust_gen_targets)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 439 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.69.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1243 of 1695 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.69.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cargo-native-1.69.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-native-1.69.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1244 of 1695 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.69.0.bb:do_rust_create_wrappers)
NOTE: recipe cargo-native-1.69.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe cargo-native-1.69.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1245 of 1695 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.69.0.bb:do_configure)
NOTE: recipe cargo-native-1.69.0-r0: task do_configure: Started
NOTE: recipe cargo-native-1.69.0-r0: task do_configure: Succeeded
NOTE: Running task 1246 of 1695 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.69.0.bb:do_compile)
NOTE: recipe cargo-native-1.69.0-r0: task do_compile: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 442 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 443 of 445 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1420 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1446 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1508 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1509 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1522 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1523 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1524 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1552 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1593 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_configure)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1594 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1595 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_configure)
NOTE: Running task 1596 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe cargo-native-1.69.0-r0: task do_compile: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1597 of 1695 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.69.0.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1598 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1599 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: Running task 1600 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_configure)
NOTE: Running task 1601 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Started
NOTE: recipe cargo-native-1.69.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Succeeded
NOTE: Running task 1602 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1603 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_compile)
NOTE: Running task 1604 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1605 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: Running task 1606 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: Running task 1607 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1608 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe cargo-native-1.69.0-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: Running task 1609 of 1695 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.69.0.bb:do_populate_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1610 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Started
NOTE: recipe cargo-native-1.69.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1611 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe cargo-native-1.69.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1612 of 1695 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1613 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1614 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_install)
NOTE: Running task 1615 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_install)
NOTE: Running task 1616 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1617 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: Running task 1618 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1619 of 1695 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_rust_create_wrappers)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1620 of 1695 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: Running task 1621 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Succeeded
NOTE: Running task 1622 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: Running task 1623 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_package)
NOTE: Running task 1624 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_populate_sysroot)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_configure: Started
NOTE: Running task 1625 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1626 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_package)
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: Running task 1627 of 1695 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Started
NOTE: Running task 1628 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1629 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1630 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1631 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 1632 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1633 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: Running task 1634 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: Running task 1635 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: Running task 1636 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Succeeded
NOTE: Running task 1637 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1638 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Failed
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1638 tasks of which 1529 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-certifi/2022.12.7-r0/temp/log.do_packagedata.2509795
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata) failed with exit code '1'

--===============8435699861126532299==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-requests-upgrade-2.30.0-2.31.0.patch"

RnJvbSBlMjFiZTUzMDc4MWU5NjYyYjNlMjQ0OTRkZDZmY2Q1NzZlNDc1ODM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNjozNToyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcmVxdWVzdHM6IHVwZ3JhZGUgMi4zMC4wIC0+IDIuMzEuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtcmVxdWVzdHNfMi4zMC4wLmJiID0+IHB5dGhvbjMtcmVxdWVzdHNfMi4zMS4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJlcXVlc3RzXzIuMzAuMC5i
YiA9PiBweXRob24zLXJlcXVlc3RzXzIuMzEuMC5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVxdWVzdHNfMi4zMC4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlcXVlc3RzXzIuMzEuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcmVxdWVzdHNfMi4zMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcmVxdWVzdHNfMi4zMS4wLmJiCmluZGV4IDEyODZlYmE3ODYuLjdh
YzQzZjJlYjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1yZXF1ZXN0c18yLjMwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXJlcXVlc3RzXzIuMzEuMC5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0
cDovL3B5dGhvbi1yZXF1ZXN0cy5vcmciCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zNDQwMGI2ODA3MmQ3MTBmZWNkMGEyOTQw
YTBkMTY1OCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIzOWQ3ZDQ0NThhZmNiMjhhNjkyY2Rk
Mjk4ZDg3NTQyMjM1ZjRjYThkMzZkMDNhMTViZmMxMjhhNjU1OWEyZjQiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiOTQyYzVhNzU4Zjk4ZDc5MGVhZWQxYTI5Y2I2ZWVmYzdmZmIwZDFjZjdhZjA1YzNk
Mjc5MTY1NmRiZDZhZDFlMSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0gCjIuMzku
MgoK

--===============8435699861126532299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:08c11a56be1cae9c42973c3dc8e29b6c096d0ca0"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 56 Local 9 Mirrors 0 Missed 47 Current 375 (16% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1013 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_patch)
NOTE: Running task 1105 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1173 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 1199 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_fetch)
NOTE: Running task 1203 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1217 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1218 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_fetch)
NOTE: Running task 1219 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1220 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 1381 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe libstd-rs-1.69.0-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Succeeded
NOTE: Running task 1531 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: Running task 1532 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1533 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1534 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_unpack)
NOTE: Running task 1535 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1536 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1537 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_unpack)
NOTE: Running task 1538 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1539 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1540 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1541 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: Running task 1542 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: Running task 1543 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1544 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1545 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1546 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1547 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1548 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1549 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_patch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1550 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: Running task 1551 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: Running task 1552 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: Running task 1553 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1554 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: Running task 1555 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_patch: Succeeded
NOTE: Running task 1556 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_rust_create_wrappers)
NOTE: Running task 1557 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1558 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_rust_gen_targets)
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1559 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1560 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.69.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1561 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_configure)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Succeeded
NOTE: Running task 1562 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1563 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_populate_lic)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: Running task 1564 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 1565 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1566 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: Running task 1567 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1568 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1569 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1570 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_populate_lic unihash changed to a18ea55440a25f91158df1d31b0b796781bd716a77a15ed1fd7cb1722f7ba5f4
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1571 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_configure)
NOTE: recipe libstd-rs-1.69.0-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1572 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1573 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: Running task 1574 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1575 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: Running task 1576 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: Running task 1577 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Succeeded
NOTE: Running task 1578 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_compile)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1579 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1581 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: Running task 1582 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: Running task 1583 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: Running task 1584 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1585 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1586 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1587 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1588 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_install)
NOTE: Running task 1589 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_install)
NOTE: Running task 1590 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1591 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1592 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1593 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: Running task 1594 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Succeeded
NOTE: Running task 1595 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_package)
NOTE: Running task 1596 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_populate_sysroot)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1597 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: Running task 1598 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: Running task 1599 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1600 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1601 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1602 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 1603 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: Running task 1604 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: Running task 1606 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: Running task 1607 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Succeeded
NOTE: Running task 1608 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1609 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Failed
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1609 tasks of which 1520 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-certifi/2022.12.7-r0/temp/log.do_packagedata.2480511
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata) failed with exit code '1'

--===============8435699861126532299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:08c11a56be1cae9c42973c3dc8e29b6c096d0ca0"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 56 Local 9 Mirrors 0 Missed 47 Current 375 (16% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1013 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_patch)
NOTE: Running task 1105 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1173 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 1199 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_fetch)
NOTE: Running task 1203 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1217 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1218 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 1219 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1220 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_fetch)
NOTE: Running task 1384 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe libstd-rs-1.69.0-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: Running task 1531 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1532 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 1533 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1534 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_unpack)
NOTE: Running task 1535 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1536 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1537 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1538 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1539 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1540 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_unpack)
NOTE: Running task 1541 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: Running task 1542 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1543 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: Running task 1544 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1545 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1546 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1547 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1548 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1549 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_patch)
NOTE: Running task 1550 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1551 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: Running task 1552 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: Running task 1553 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_patch)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: Running task 1554 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: Running task 1555 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1556 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_rust_create_wrappers)
NOTE: Running task 1557 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1558 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_rust_gen_targets)
NOTE: Running task 1559 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1560 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1561 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_configure)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1562 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1563 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Succeeded
NOTE: Running task 1564 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1565 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_populate_lic)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: Running task 1566 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: Running task 1567 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1568 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_compile)
NOTE: Running task 1570 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_lic: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_compile: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_populate_lic unihash changed to a18ea55440a25f91158df1d31b0b796781bd716a77a15ed1fd7cb1722f7ba5f4
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1571 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: Running task 1572 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1573 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1574 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1575 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1576 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1577 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Started
NOTE: Running task 1578 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Succeeded
NOTE: Running task 1579 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: Running task 1580 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1581 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: Running task 1582 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: Running task 1583 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Started
NOTE: Running task 1584 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1585 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1586 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1587 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1588 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_install)
NOTE: Running task 1589 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1590 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_install)
NOTE: Running task 1591 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: Running task 1592 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1593 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1594 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_package)
NOTE: Running task 1595 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: Running task 1596 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: Running task 1597 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_populate_sysroot)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: Running task 1598 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_package)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: Running task 1599 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1600 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-requests-2.31.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1601 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1602 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 1603 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: Running task 1604 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Succeeded
NOTE: Running task 1606 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: Running task 1607 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1608 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: Running task 1609 of 1648 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Failed
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1609 tasks of which 1520 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2023.5.7-r0 to 0:2022.12.7-r0) [version-going-backwards]
ERROR: python3-certifi-2022.12.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-certifi/2022.12.7-r0/temp/log.do_packagedata.2491813
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata) failed with exit code '1'

--===============8435699861126532299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-requests: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-32-poky-linux/python3-requests: PV changed from "2.30.0" to "2.31.0"
packages/core2-32-poky-linux/python3-requests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/requests/requests-2.30.0.tar.gz;downloadfilename=requests-2.30.0.tar.gz" to "https://files.pythonhosted.org/packages/source/r/requests/requests-2.31.0.tar.gz;downloadfilename=requests-2.31.0.tar.gz"
packages/core2-32-poky-linux/python3-requests/python3-requests-dbg: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-dbg: PV changed from "2.30.0" to "2.31.0"
packages/core2-32-poky-linux/python3-requests/python3-requests-dev: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-dev: PV changed from "2.30.0" to "2.31.0"
packages/core2-32-poky-linux/python3-requests/python3-requests-doc: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-doc: PV changed from "2.30.0" to "2.31.0"
packages/core2-32-poky-linux/python3-requests/python3-requests-locale: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-locale: PV changed from "2.30.0" to "2.31.0"
packages/core2-32-poky-linux/python3-requests/python3-requests-src: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-src: PV changed from "2.30.0" to "2.31.0"
packages/core2-32-poky-linux/python3-requests/python3-requests-staticdev: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-staticdev: PV changed from "2.30.0" to "2.31.0"
packages/core2-32-poky-linux/python3-requests/python3-requests: PKGSIZE changed from 415780 to 416047 (+0%)
packages/core2-32-poky-linux/python3-requests/python3-requests: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests: PV changed from "2.30.0" to "2.31.0"
Changes to packages/core2-32-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.11/site-packages/requests-2.30.0.dist-info moved to /usr/lib/python3.11/site-packages/requests-2.31.0.dist-info

--===============8435699861126532299==--

