Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D29CA9EA9
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.3718.1684186748976030128
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gSpSceQq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188215a555b-c30f5d6e-3105-4213-8c04-6e0247b100a9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XHOzCZcSitduatn3rx/yqLwK1ED4ctZJqjFKjwHTxuo=;
	b=gSpSceQqB4vFTI267Nb7YDSFKB3MvJV8MLOdXVKxJTO8aUoC5xfadmX4YuoguVeN
	55LpYe2Ii6gdWSRyAkmooXe7GEMqJSHAp7DHGHa9QTba6iebBwj6xmbgmDq7/6ERIkJ
	xKU5BskeFzE3Fa/h96SdZROO9ANZi1RUWlbvuJH4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XHOzCZcSitduatn3rx/yqLwK1ED4ctZJqjFKjwHTxuo=;
	b=SKEH1KN+ygWNT3mkAvtnvZKcMEMcEmxnW9uT7mdwEfvDvToiGbA+ooELfgnuGoef
	U+gyfnB7PuSNxZ4mDUDRxTOEHHyqpxZMs668lxmYVFCvOlPsylF+9Fw4fFTxX80uSpv
	60Ca/VD6abV3RUUD4N7WTzW5ZiLIfQLDfemppfps=
Content-Type: multipart/mixed; boundary="===============3670950734029873285=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 7.0.1 SUCCEEDED
Message-ID: <01010188215a555b-c30f5d6e-3105-4213-8c04-6e0247b100a9-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181332

--===============3670950734029873285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinx* to *7.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-6.1.3-7.0.1.patch
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
--===============3670950734029873285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 51 skipped, 0 masked, 0 errors.
Removing 49 recipes from the core2-32 sysroot...done.
Removing 65 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:129601361074f457e0a89a0fbdb54ac62410f487"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 286 Local 190 Mirrors 0 Missed 96 Current 213 (66% match, 80% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 214 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 225 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 245 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 328 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 329 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 831 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 832 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 834 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 835 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 837 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_fetch)
NOTE: Running task 838 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_fetch)
NOTE: Running task 839 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 840 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_fetch)
NOTE: Running task 841 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 842 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_fetch)
NOTE: Running task 843 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 844 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 845 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_fetch)
NOTE: Running task 846 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 847 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 848 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 849 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 850 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 852 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 894 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 895 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 896 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 897 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 898 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_fetch)
NOTE: Running task 899 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 1034 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_unpack)
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: Running task 1035 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1036 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1037 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1038 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 1039 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: Running task 1040 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1041 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_unpack)
NOTE: Running task 1042 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1043 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: Running task 1044 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1045 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1046 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_unpack)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1047 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: Running task 1048 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1049 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1050 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 1051 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1052 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1053 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1054 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1055 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running task 1056 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1057 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1058 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_unpack)
NOTE: recipe libstd-rs-1.69.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 348 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: Running setscene task 350 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: Running task 1067 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1068 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Started
NOTE: Running task 1069 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1070 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: Running task 1071 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1072 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: Running task 1073 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1074 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1075 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 1076 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1077 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1078 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1079 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1080 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_patch)
NOTE: Running task 1081 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1082 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: Running task 1083 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1084 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: Running task 1085 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1086 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: Running task 1087 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1088 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 362 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: Running task 1101 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 369 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: Running task 1116 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 1117 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_patch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1118 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: Running setscene task 376 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_package_setscene: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1154 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1155 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 1156 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1157 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1158 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1159 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1160 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1161 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1162 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1163 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1164 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1165 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1166 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1167 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1172 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Started
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1173 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1174 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1179 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1180 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1185 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1186 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1187 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_lic)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 388 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: Running task 1192 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1193 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1194 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 393 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 394 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 396 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 397 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_lic unihash changed to fcb32b3c21b0d58b47f5d95fa2f64a061eb7b45ead232aee5fc738e9dc7f010a
NOTE: recipe python3-packaging-23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 404 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 431 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 443 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 469 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 477 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 483 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 493 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 496 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 497 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1559 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1560 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1581 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1582 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1595 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1608 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1609 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1610 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1611 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1612 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1613 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1614 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1615 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1616 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1617 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.30.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1618 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1619 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1621 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1624 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1666 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1667 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1668 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1669 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1670 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1704 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1706 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: Running task 1707 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: Running task 1708 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1709 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1710 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1711 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-requests-2.30.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1712 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: Running task 1713 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1714 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_configure)
NOTE: Running task 1715 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1716 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1717 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1718 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_configure: Started
NOTE: Running task 1719 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1720 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: Running task 1721 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1722 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1723 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1724 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: Running task 1725 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1726 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: Running task 1727 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: Running task 1728 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_configure: Succeeded
NOTE: Running task 1729 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1730 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Started
NOTE: Running task 1731 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1732 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1733 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: Running task 1734 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1735 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1736 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1737 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Started
NOTE: Running task 1738 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1739 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe python3-requests-2.30.0-r0: task do_compile: Started
NOTE: Running task 1740 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1741 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile)
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1742 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1743 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Started
NOTE: Running task 1744 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: Running task 1745 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: Running task 1746 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_compile)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: Running task 1747 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: Running task 1748 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: Running task 1749 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Started
NOTE: Running task 1750 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: Running task 1751 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: Running task 1752 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: Running task 1753 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1754 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: Running task 1755 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1756 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_compile)
NOTE: Running task 1757 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1758 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1759 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1760 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-requests-2.30.0-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1761 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: Running task 1762 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_install)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1763 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: Running task 1764 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1765 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1766 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 1767 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: Running task 1768 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_install: Started
NOTE: Running task 1769 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: Running task 1770 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Started
NOTE: Running task 1771 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: Running task 1772 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1773 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Started
NOTE: Running task 1774 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: Running task 1775 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1776 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: Running task 1777 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Started
NOTE: Running task 1778 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: Running task 1779 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: Running task 1780 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Started
NOTE: Running task 1781 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1782 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1783 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-requests-2.30.0-r0: task do_install: Succeeded
NOTE: Running task 1784 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: Running task 1785 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 1786 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: Running task 1787 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1788 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1789 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_package)
NOTE: Running task 1790 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 1791 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_populate_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 1792 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1793 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: Running task 1794 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_install)
NOTE: Running task 1795 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: Running task 1796 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Started
NOTE: Running task 1797 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Started
NOTE: Running task 1798 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_install)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Succeeded
NOTE: Running task 1799 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: Running task 1800 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_package)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: Running task 1801 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1802 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: Running task 1803 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: Running task 1804 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: Running task 1805 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1806 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 1807 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: Running task 1808 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package)
NOTE: Running task 1809 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1810 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1811 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Started
NOTE: Running task 1812 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Succeeded
NOTE: Running task 1813 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: Running task 1814 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_package: Succeeded
NOTE: Running task 1815 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1816 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Succeeded
NOTE: Running task 1817 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1818 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_sysroot)
NOTE: Running task 1819 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 1820 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_install)
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1821 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Succeeded
NOTE: Running task 1822 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: Running task 1823 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package_write_rpm)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Succeeded
NOTE: Running task 1824 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Started
NOTE: Running task 1825 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1826 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: Running task 1827 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: Running task 1828 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Succeeded
NOTE: Running task 1829 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: Running task 1830 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1831 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: Running task 1832 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1833 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: Running task 1834 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1835 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: Running task 1836 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: Running task 1837 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1838 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1839 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1840 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1841 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1842 of 1863 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1842 tasks of which 1579 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-src went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dbg went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-ptest went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-staticdev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-doc went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-locale went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1 went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-pyasn1/0.4.8-r0/temp/log.do_packagedata.1828510
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata) failed with exit code '1'

--===============3670950734029873285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 73 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:129601361074f457e0a89a0fbdb54ac62410f487"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 108 Local 12 Mirrors 0 Missed 96 Current 377 (11% match, 80% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1161 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1163 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1178 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 1179 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 1201 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_fetch)
NOTE: Running task 1206 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1207 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_fetch)
NOTE: Running task 1209 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1210 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 1211 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_fetch)
NOTE: Running task 1212 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_fetch)
NOTE: Running task 1213 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1214 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1215 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1216 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_fetch)
NOTE: Running task 1217 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 1218 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1219 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1223 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 1324 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_fetch)
NOTE: Running task 1325 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1326 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1327 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1328 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 1330 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: Running task 1557 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: Running task 1559 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: Running task 1560 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1561 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1562 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1563 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1564 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: Running task 1565 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_unpack)
NOTE: Running task 1566 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1567 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1568 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1569 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_unpack)
NOTE: Running task 1570 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1571 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 1572 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_unpack)
NOTE: Running task 1573 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_unpack)
NOTE: Running task 1574 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1575 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1576 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1577 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_unpack)
NOTE: Running task 1578 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1579 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1580 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1581 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: Running task 1582 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1583 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1584 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: Running task 1585 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Started
NOTE: Running task 1586 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1587 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: Running task 1588 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1589 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: Running task 1590 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: Running task 1591 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: Running task 1592 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: Running task 1593 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1594 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1595 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: Running task 1596 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_patch)
NOTE: Running task 1597 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 1598 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1599 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1600 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1601 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1602 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_patch)
NOTE: Running task 1603 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1604 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1605 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: Running task 1606 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: Running task 1607 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1608 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1609 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1610 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: Running task 1611 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: Running task 1612 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_patch: Started
NOTE: Running task 1613 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_patch)
NOTE: Running task 1614 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_unpack)
NOTE: Running task 1615 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1616 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1617 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1618 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1619 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1620 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: Running task 1621 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1622 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: Running task 1623 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1624 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1625 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1626 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: Running task 1627 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_patch)
NOTE: recipe python3-requests-2.30.0-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1628 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1629 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1630 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: Running task 1631 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1632 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1633 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: Running task 1634 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1635 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1636 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1637 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1638 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1639 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1640 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1641 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1642 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1643 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1644 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1645 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1646 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_lic)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1647 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1648 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1649 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1650 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1651 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.30.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1652 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_configure)
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1653 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1654 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1655 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1656 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1657 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_lic unihash changed to fcb32b3c21b0d58b47f5d95fa2f64a061eb7b45ead232aee5fc738e9dc7f010a
NOTE: Running task 1658 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1659 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1660 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1661 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: Running task 1662 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: Running task 1663 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_configure)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1664 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: Running task 1665 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1666 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: Running task 1667 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1668 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1669 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: Running task 1670 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: Running task 1671 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Started
NOTE: Running task 1672 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1673 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: Running task 1674 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1675 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1676 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: Running task 1677 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: Running task 1678 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Started
NOTE: Running task 1679 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1680 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_compile: Started
NOTE: Running task 1681 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: Running task 1682 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: Running task 1683 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: Running task 1684 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_compile)
NOTE: Running task 1685 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Started
NOTE: Running task 1686 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: Running task 1687 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: Running task 1688 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1689 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1690 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1691 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1692 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: Running task 1693 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1694 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: Running task 1695 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1696 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_configure)
NOTE: Running task 1697 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1698 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1699 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Started
NOTE: Running task 1700 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: Running task 1701 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1702 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: Running task 1703 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Started
NOTE: Running task 1704 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Started
NOTE: Running task 1705 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: Running task 1706 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1707 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1708 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_compile)
NOTE: Running task 1709 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1710 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1711 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1712 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1713 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_compile: Succeeded
NOTE: Running task 1714 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: Running task 1715 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1716 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: Running task 1717 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Succeeded
NOTE: Running task 1718 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_install: Started
NOTE: Running task 1719 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: Running task 1720 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1721 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1722 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1723 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1724 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1725 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1726 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1727 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1728 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: Running task 1729 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Started
NOTE: Running task 1730 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: Running task 1731 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: Running task 1732 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: Running task 1733 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: Running task 1734 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Succeeded
NOTE: Running task 1735 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 1736 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_package)
NOTE: Running task 1737 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_populate_sysroot)
NOTE: recipe python3-requests-2.30.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1738 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: Running task 1739 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: Running task 1740 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1741 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: Running task 1742 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: Running task 1743 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1744 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1745 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: Running task 1746 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: Running task 1747 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1748 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_install)
NOTE: Running task 1749 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_package)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1750 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: Running task 1751 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_install)
NOTE: Running task 1752 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 1753 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1754 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1755 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: Running task 1756 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: Running task 1757 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: Running task 1758 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1759 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: Running task 1760 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: Running task 1761 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 1762 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1763 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_package: Succeeded
NOTE: Running task 1764 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1765 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: Running task 1766 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_packagedata)
NOTE: Running task 1767 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 1768 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1769 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: Running task 1770 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: Running task 1771 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: Running task 1772 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_package)
NOTE: Running task 1773 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_packagedata)
NOTE: Running task 1774 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1775 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: Running task 1776 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1777 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_install)
NOTE: Running task 1778 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1779 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Succeeded
NOTE: Running task 1780 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: Running task 1781 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: Running task 1782 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_packagedata)
NOTE: Running task 1783 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: Running task 1784 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1785 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1786 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1787 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: Running task 1788 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: Running task 1789 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1790 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package_write_rpm)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1791 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1792 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Started
NOTE: Running task 1793 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1794 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1795 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 1796 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_packagedata)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Failed
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1796 tasks of which 1532 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-src went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dbg went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-ptest went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-staticdev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-doc went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-locale went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1 went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-pyasn1/0.4.8-r0/temp/log.do_packagedata.1797240
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata) failed with exit code '1'

--===============3670950734029873285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 57 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:129601361074f457e0a89a0fbdb54ac62410f487"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 108 Local 12 Mirrors 0 Missed 96 Current 377 (11% match, 80% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1161 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1163 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1178 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 1179 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 1201 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_fetch)
NOTE: Running task 1206 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_fetch)
NOTE: Running task 1207 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1208 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 1209 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1210 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1211 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1212 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_fetch)
NOTE: Running task 1213 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_fetch)
NOTE: Running task 1215 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 1216 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_fetch)
NOTE: Running task 1217 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1218 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1219 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1223 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 1325 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1327 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1328 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1329 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1330 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 1331 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_fetch)
NOTE: Running task 1557 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1559 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1560 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 1561 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1562 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1563 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: Running task 1564 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1565 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_unpack)
NOTE: Running task 1566 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1567 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1568 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_unpack)
NOTE: Running task 1569 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1570 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1571 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1572 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1573 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1574 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_unpack)
NOTE: Running task 1575 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_unpack)
NOTE: Running task 1576 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 1577 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_unpack)
NOTE: Running task 1578 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1579 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1580 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1581 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: Running task 1582 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1583 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1584 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1585 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: Running task 1586 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: Running task 1587 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1588 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: Running task 1589 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1590 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1591 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1592 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1593 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: recipe python3-requests-2.30.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1594 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 1595 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1596 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_patch)
NOTE: Running task 1597 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1598 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: Running task 1599 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1600 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_patch)
NOTE: Running task 1601 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1602 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1603 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: Running task 1604 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1605 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1606 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1607 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1608 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1609 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: Running task 1610 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Started
NOTE: Running task 1611 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: Running task 1612 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.30.0-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Started
NOTE: Running task 1613 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_patch)
NOTE: Running task 1614 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1615 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1616 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1617 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1618 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1619 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_unpack)
NOTE: Running task 1620 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: Running task 1621 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1622 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1623 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1624 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 1625 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1626 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_patch)
NOTE: Running task 1627 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_patch: Succeeded
NOTE: Running task 1628 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1629 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: Running task 1630 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: Running task 1631 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1632 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1633 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1634 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1635 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1636 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: Running task 1637 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1638 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1639 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: Running task 1640 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1641 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1642 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1643 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_lic)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1644 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1645 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1646 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1647 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 1648 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1649 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1650 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1651 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1652 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1653 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_lic unihash changed to fcb32b3c21b0d58b47f5d95fa2f64a061eb7b45ead232aee5fc738e9dc7f010a
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1654 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1655 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1656 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1657 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1658 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1659 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: Running task 1660 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1661 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1662 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: Running task 1663 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1664 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_configure: Started
NOTE: Running task 1665 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1666 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: Running task 1667 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1668 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1669 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: Running task 1670 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: Running task 1671 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: Running task 1672 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1673 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1674 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1675 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Started
NOTE: Running task 1676 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1677 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: Running task 1678 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_compile)
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_configure: Succeeded
NOTE: Running task 1679 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Started
NOTE: Running task 1680 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Succeeded
NOTE: Running task 1681 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1682 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1683 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_compile)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1684 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1685 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: Running task 1686 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1687 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1688 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Started
NOTE: Running task 1689 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile)
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1690 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: Running task 1691 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe python3-requests-2.30.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1692 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_compile)
NOTE: Running task 1693 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1694 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Started
NOTE: Running task 1695 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: Running task 1696 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1697 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1698 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: Running task 1699 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Started
NOTE: Running task 1700 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: Running task 1701 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1702 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Started
NOTE: Running task 1703 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: Running task 1704 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1705 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1706 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1707 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1708 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: Running task 1709 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1710 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1711 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Succeeded
NOTE: Running task 1712 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1713 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1714 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1715 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: Running task 1716 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: recipe python3-requests-2.30.0-r0: task do_compile: Succeeded
NOTE: Running task 1717 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_install)
NOTE: Running task 1718 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: Running task 1719 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: Running task 1720 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1721 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1722 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1723 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: Running task 1724 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1725 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Started
NOTE: Running task 1726 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: Running task 1727 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: Running task 1728 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: Running task 1729 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_install)
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: Running task 1730 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 1731 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1732 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1733 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1734 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: Running task 1735 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Started
NOTE: Running task 1736 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Succeeded
NOTE: Running task 1737 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_package)
NOTE: Running task 1738 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1739 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: Running task 1740 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: Running task 1741 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: Running task 1742 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_package: Started
NOTE: Running task 1743 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 1744 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1745 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: Running task 1746 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_install)
NOTE: Running task 1747 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: Running task 1748 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: Running task 1749 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1750 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_install)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Succeeded
NOTE: Running task 1751 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: Running task 1752 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1753 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Started
NOTE: Running task 1754 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 1755 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: Running task 1756 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1757 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package)
NOTE: Running task 1758 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1759 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: Running task 1760 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1761 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: Running task 1762 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: Running task 1763 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: Running task 1764 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_packagedata)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Started
NOTE: Running task 1765 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.30.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 1766 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Started
NOTE: Running task 1767 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Succeeded
NOTE: Running task 1768 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_package)
NOTE: Running task 1769 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Succeeded
NOTE: Running task 1770 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1771 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: Running task 1772 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1773 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Started
NOTE: Running task 1774 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1775 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: Running task 1776 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Started
NOTE: Running task 1777 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: Running task 1778 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package_write_rpm)
NOTE: Running task 1779 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: Running task 1780 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1781 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_install)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1782 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1783 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1784 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Succeeded
NOTE: Running task 1785 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: Running task 1786 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1787 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1788 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: Running task 1789 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1790 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1791 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1792 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Started
NOTE: Running task 1793 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: Running task 1794 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1794 tasks of which 1532 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-src went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dbg went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-ptest went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-staticdev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-doc went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-locale went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1 went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-pyasn1/0.4.8-r0/temp/log.do_packagedata.1746001
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata) failed with exit code '1'

--===============3670950734029873285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-sphinx: PKGV changed from 6.1.3 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-6.1.3.tar.gz;downloadfilename=Sphinx-6.1.3.tar.gz" to "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-7.0.1.tar.gz;downloadfilename=Sphinx-7.0.1.tar.gz"
packages/core2-32-poky-linux/python3-sphinx: PV changed from "6.1.3" to "7.0.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 6.1.3 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "6.1.3" to "7.0.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 6.1.3 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "6.1.3" to "7.0.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 6.1.3 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "6.1.3" to "7.0.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 6.1.3 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "6.1.3" to "7.0.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 6.1.3 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "6.1.3" to "7.0.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 6.1.3 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "6.1.3" to "7.0.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 6.1.3 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.11/site-packages/sphinx-6.1.3.dist-info -> /usr/lib/python3.11/site-packages/sphinx-7.0.1.dist-info, removed "/usr/lib/python3.11/site-packages/sphinx/ext/napoleon/__pycache__/iterators.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/iterators.py /usr/lib/python3.11/site-packages/sphinx/util/jsdump.py /usr/lib/python3.11/site-packages/sphinx/writers/__pycache__/_html4.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/__pycache__/setup_command.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/writers/_html4.py /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/jsdump.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__init__.py /usr/lib/python3.11/site-packages/sphinx/setup_command.py /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__/__init__.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/sph
 inx/themes/basic/searchfield.html"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PV changed from "6.1.3" to "7.0.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 14957001 to 14755671 (-1%)
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.11/site-packages/sphinx-6.1.3.dist-info moved to /usr/lib/python3.11/site-packages/sphinx-7.0.1.dist-info
  /usr/lib/python3.11/site-packages/sphinx/themes/basic/searchfield.html was added
  /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/iterators.py was removed
  /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/__pycache__/iterators.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/__pycache__/setup_command.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/setup_command.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/jsdump.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/jsdump.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__init__.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__ was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/writers/_html4.py was removed
  /usr/lib/python3.11/site-packages/sphinx/writers/__pycache__/_html4.cpython-311.pyc was removed

--===============3670950734029873285==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-6.1.3-7.0.1.patch"

RnJvbSBjZDhiZGVmMGY3MzcwODhlOWY3NTgxM2ZjZjc0OWFjNWNmODVlODJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTI6MjY6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueDogdXBncmFkZSA2LjEuMyAtPiA3LjAuMQoKLS0tCiAuLi5waGlueF82LjEu
My5iYiA9PiBweXRob24zLXNwaGlueF83LjAuMS5iYn0gfCA5NyArKysrKysrKysrKysrKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgOTUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNwaGlueF82LjEuMy5iYiA9
PiBweXRob24zLXNwaGlueF83LjAuMS5iYn0gKDE3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzYuMS4zLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF83LjAuMS5iYgpzaW1pbGFyaXR5IGluZGV4
IDE3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3Bo
aW54XzYuMS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc3BoaW54XzcuMC4xLmJiCmluZGV4IDBkZTE5YWY4ZDkuLjg0ODYxMzk5NDYgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfNi4xLjMuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF83LjAuMS5i
YgpAQCAtMSwxMiArMSwxMDUgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVl
cyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2lu
ZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0
ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1
bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNl
LVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHll
YXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFCisjICsr
KyBMSUNFTlNFCisjIEBAIC0zNCw3OSArMzQsNiBAQAorIyAgTGljZW5zZXMgZm9yIGluY29ycG9y
YXRlZCBzb2Z0d2FyZQorIyAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQorIyAg
CisjIC1UaGUgaW5jbHVkZWQgc21hcnR5cGFudHMgbW9kdWxlLCBpbmNsdWRlZCBhcyBzcGhpbngu
dXRpbC5zbWFydHlwYW50cywKKyMgLWlzIGF2YWlsYWJsZSB1bmRlciB0aGUgZm9sbG93aW5nIGxp
Y2Vuc2U6CisjIC0KKyMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgLVNtYXJ0eVBhbnRzXyBsaWNlbnNlOjoK
KyMgLQorIyAtICAgIENvcHlyaWdodCAoYykgMjAwMyBKb2huIEdydWJlcgorIyAtICAgIChodHRw
czovL2RhcmluZ2ZpcmViYWxsLm5ldC9wcm9qZWN0cy9zbWFydHlwYW50cy8pCisjIC0gICAgQWxs
IHJpZ2h0cyByZXNlcnZlZC4KKyMgLQorIyAtICAgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4g
c291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyAtICAgIG1vZGlmaWNh
dGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92aWRlZCB0aGF0IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9u
cworIyAtICAgIGFyZSBtZXQ6CisjIC0KKyMgLSAgICAqICAgUmVkaXN0cmlidXRpb25zIG9mIHNv
dXJjZSBjb2RlIG11c3QgcmV0YWluIHRoZSBhYm92ZSBjb3B5cmlnaHQKKyMgLSAgICAgICAgbm90
aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVy
LgorIyAtCisjIC0gICAgKiAgIFJlZGlzdHJpYnV0aW9ucyBpbiBiaW5hcnkgZm9ybSBtdXN0IHJl
cHJvZHVjZSB0aGUgYWJvdmUKKyMgLSAgICAgICAgY29weXJpZ2h0IG5vdGljZSwgdGhpcyBsaXN0
IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcKKyMgLSAgICAgICAgZGlzY2xhaW1lciBp
biB0aGUgZG9jdW1lbnRhdGlvbiBhbmQvb3Igb3RoZXIgbWF0ZXJpYWxzCisjIC0gICAgICAgIHBy
b3ZpZGVkIHdpdGggdGhlIGRpc3RyaWJ1dGlvbi4KKyMgLQorIyAtICAgICogICBOZWl0aGVyIHRo
ZSBuYW1lICJTbWFydHlQYW50cyIgbm9yIHRoZSBuYW1lcyBvZiBpdHMKKyMgLSAgICAgICAgY29u
dHJpYnV0b3JzIG1heSBiZSB1c2VkIHRvIGVuZG9yc2Ugb3IgcHJvbW90ZSBwcm9kdWN0cworIyAt
ICAgICAgICBkZXJpdmVkIGZyb20gdGhpcyBzb2Z0d2FyZSB3aXRob3V0IHNwZWNpZmljIHByaW9y
IHdyaXR0ZW4KKyMgLSAgICAgICAgcGVybWlzc2lvbi4KKyMgLQorIyAtICAgIFRoaXMgc29mdHdh
cmUgaXMgcHJvdmlkZWQgYnkgdGhlIGNvcHlyaWdodCBob2xkZXJzIGFuZAorIyAtICAgIGNvbnRy
aWJ1dG9ycyAiYXMgaXMiIGFuZCBhbnkgZXhwcmVzcyBvciBpbXBsaWVkIHdhcnJhbnRpZXMsCisj
IC0gICAgaW5jbHVkaW5nLCBidXQgbm90IGxpbWl0ZWQgdG8sIHRoZSBpbXBsaWVkIHdhcnJhbnRp
ZXMgb2YKKyMgLSAgICBtZXJjaGFudGFiaWxpdHkgYW5kIGZpdG5lc3MgZm9yIGEgcGFydGljdWxh
ciBwdXJwb3NlIGFyZQorIyAtICAgIGRpc2NsYWltZWQuIEluIG5vIGV2ZW50IHNoYWxsIHRoZSBj
b3B5cmlnaHQgb3duZXIgb3IgY29udHJpYnV0b3JzCisjIC0gICAgYmUgbGlhYmxlIGZvciBhbnkg
ZGlyZWN0LCBpbmRpcmVjdCwgaW5jaWRlbnRhbCwgc3BlY2lhbCwKKyMgLSAgICBleGVtcGxhcnks
IG9yIGNvbnNlcXVlbnRpYWwgZGFtYWdlcyAoaW5jbHVkaW5nLCBidXQgbm90IGxpbWl0ZWQKKyMg
LSAgICB0bywgcHJvY3VyZW1lbnQgb2Ygc3Vic3RpdHV0ZSBnb29kcyBvciBzZXJ2aWNlczsgbG9z
cyBvZiB1c2UsCisjIC0gICAgZGF0YSwgb3IgcHJvZml0czsgb3IgYnVzaW5lc3MgaW50ZXJydXB0
aW9uKSBob3dldmVyIGNhdXNlZCBhbmQgb24KKyMgLSAgICBhbnkgdGhlb3J5IG9mIGxpYWJpbGl0
eSwgd2hldGhlciBpbiBjb250cmFjdCwgc3RyaWN0IGxpYWJpbGl0eSwgb3IKKyMgLSAgICB0b3J0
IChpbmNsdWRpbmcgbmVnbGlnZW5jZSBvciBvdGhlcndpc2UpIGFyaXNpbmcgaW4gYW55IHdheSBv
dXQgb2YKKyMgLSAgICB0aGUgdXNlIG9mIHRoaXMgc29mdHdhcmUsIGV2ZW4gaWYgYWR2aXNlZCBv
ZiB0aGUgcG9zc2liaWxpdHkgb2YKKyMgLSAgICBzdWNoIGRhbWFnZS4KKyMgLQorIyAtCisjIC1z
bWFydHlwYW50cy5weSBsaWNlbnNlOjoKKyMgLQorIyAtICAgIHNtYXJ0eXBhbnRzLnB5IGlzIGEg
ZGVyaXZhdGl2ZSB3b3JrIG9mIFNtYXJ0eVBhbnRzLgorIyAtCisjIC0gICAgUmVkaXN0cmlidXRp
b24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0Cisj
IC0gICAgbW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxv
d2luZyBjb25kaXRpb25zCisjIC0gICAgYXJlIG1ldDoKKyMgLQorIyAtICAgICogICBSZWRpc3Ry
aWJ1dGlvbnMgb2Ygc291cmNlIGNvZGUgbXVzdCByZXRhaW4gdGhlIGFib3ZlIGNvcHlyaWdodAor
IyAtICAgICAgICBub3RpY2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93
aW5nIGRpc2NsYWltZXIuCisjIC0KKyMgLSAgICAqICAgUmVkaXN0cmlidXRpb25zIGluIGJpbmFy
eSBmb3JtIG11c3QgcmVwcm9kdWNlIHRoZSBhYm92ZQorIyAtICAgICAgICBjb3B5cmlnaHQgbm90
aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZworIyAtICAgICAg
ICBkaXNjbGFpbWVyIGluIHRoZSBkb2N1bWVudGF0aW9uIGFuZC9vciBvdGhlciBtYXRlcmlhbHMK
KyMgLSAgICAgICAgcHJvdmlkZWQgd2l0aCB0aGUgZGlzdHJpYnV0aW9uLgorIyAtCisjIC0gICAg
VGhpcyBzb2Z0d2FyZSBpcyBwcm92aWRlZCBieSB0aGUgY29weXJpZ2h0IGhvbGRlcnMgYW5kCisj
IC0gICAgY29udHJpYnV0b3JzICJhcyBpcyIgYW5kIGFueSBleHByZXNzIG9yIGltcGxpZWQgd2Fy
cmFudGllcywKKyMgLSAgICBpbmNsdWRpbmcsIGJ1dCBub3QgbGltaXRlZCB0bywgdGhlIGltcGxp
ZWQgd2FycmFudGllcyBvZgorIyAtICAgIG1lcmNoYW50YWJpbGl0eSBhbmQgZml0bmVzcyBmb3Ig
YSBwYXJ0aWN1bGFyIHB1cnBvc2UgYXJlCisjIC0gICAgZGlzY2xhaW1lZC4gSW4gbm8gZXZlbnQg
c2hhbGwgdGhlIGNvcHlyaWdodCBvd25lciBvciBjb250cmlidXRvcnMKKyMgLSAgICBiZSBsaWFi
bGUgZm9yIGFueSBkaXJlY3QsIGluZGlyZWN0LCBpbmNpZGVudGFsLCBzcGVjaWFsLAorIyAtICAg
IGV4ZW1wbGFyeSwgb3IgY29uc2VxdWVudGlhbCBkYW1hZ2VzIChpbmNsdWRpbmcsIGJ1dCBub3Qg
bGltaXRlZAorIyAtICAgIHRvLCBwcm9jdXJlbWVudCBvZiBzdWJzdGl0dXRlIGdvb2RzIG9yIHNl
cnZpY2VzOyBsb3NzIG9mIHVzZSwKKyMgLSAgICBkYXRhLCBvciBwcm9maXRzOyBvciBidXNpbmVz
cyBpbnRlcnJ1cHRpb24pIGhvd2V2ZXIgY2F1c2VkIGFuZCBvbgorIyAtICAgIGFueSB0aGVvcnkg
b2YgbGlhYmlsaXR5LCB3aGV0aGVyIGluIGNvbnRyYWN0LCBzdHJpY3QgbGlhYmlsaXR5LCBvcgor
IyAtICAgIHRvcnQgKGluY2x1ZGluZyBuZWdsaWdlbmNlIG9yIG90aGVyd2lzZSkgYXJpc2luZyBp
biBhbnkgd2F5IG91dCBvZgorIyAtICAgIHRoZSB1c2Ugb2YgdGhpcyBzb2Z0d2FyZSwgZXZlbiBp
ZiBhZHZpc2VkIG9mIHRoZSBwb3NzaWJpbGl0eSBvZgorIyAtICAgIHN1Y2ggZGFtYWdlLgorIyAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQorIyAtCisjICBUaGUgaW5jbHVkZWQgaW1wbGVtZW50YXRpb24gb2YgTnVt
cHlEb2NzdHJpbmcuX3BhcnNlX251bXB5ZG9jX3NlZV9hbHNvX3NlY3Rpb24KKyMgIHdhcyBkZXJp
dmVkIGZyb20gY29kZSB1bmRlciB0aGUgZm9sbG93aW5nIGxpY2Vuc2U6CisjICAKKyMgCisjCisK
IFNVTU1BUlkgPSAiUHl0aG9uIGRvY3VtZW50YXRpb24gZ2VuZXJhdG9yIgogSE9NRVBBR0UgPSAi
aHR0cDovL3NwaGlueC1kb2Mub3JnLyIKIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5T
RSA9ICJCU0QtMi1DbGF1c2UgJiBNSVQgJiBCU0QtMy1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wNjZkYTUxYWI3MzIzMTlhMDZiZWFlNGYxMDc4ODU3NyIK
K0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTVlYjZhYzFiMTE1YTFlZDI0
YTEyZDlmMTViNjMzOTkzIgogCiBQWVBJX1BBQ0tBR0UgPSAiU3BoaW54IgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiMGRhYzNiNjk4NTM4ZmZlZjQxNzE2Y2Y5N2JhMjZjMWM3Nzg4ZGJhNzNjZTZm
MTUwYzFmZjViNDcyMDc4NmRkMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2MWUwMjVmNzg4YzU5
NzdkOTQxMjU4N2U3MzM3MzNhMjg5ZTJiOWZkYzJmZWY4ODY4ZGRmYmZjNGNjZmU4ODFkIgogCiBp
bmhlcml0IHB5dGhvbl9mbGl0X2NvcmUgcHlwaQogCi0tIAoyLjM5LjIKCg==

--===============3670950734029873285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:129601361074f457e0a89a0fbdb54ac62410f487"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 108 Local 12 Mirrors 0 Missed 96 Current 377 (11% match, 80% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1161 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1163 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1178 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 1179 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 1201 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_fetch)
NOTE: Running task 1206 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1207 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_fetch)
NOTE: Running task 1208 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1209 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1210 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 1211 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_fetch)
NOTE: Running task 1212 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_fetch)
NOTE: Running task 1213 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_fetch)
NOTE: Running task 1214 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1216 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1217 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1218 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1219 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 1223 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 1324 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1325 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1326 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 1327 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1328 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_fetch)
NOTE: Running task 1329 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1557 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1559 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1560 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 1561 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1562 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1563 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1564 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: Running task 1565 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_unpack)
NOTE: Running task 1566 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1567 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1568 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1569 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_unpack)
NOTE: Running task 1570 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1571 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1572 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1573 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_unpack)
NOTE: Running task 1574 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_unpack)
NOTE: Running task 1575 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_unpack)
NOTE: Running task 1576 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1577 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1578 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1579 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1580 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 1581 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: Running task 1582 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1583 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1584 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1585 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Started
NOTE: Running task 1586 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: Running task 1587 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: Running task 1588 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Started
NOTE: Running task 1589 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: Running task 1590 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1591 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: Running task 1592 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_unpack: Succeeded
NOTE: Running task 1593 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1594 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1595 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 1596 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_patch)
NOTE: Running task 1597 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1598 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 1599 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1600 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: Running task 1601 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_patch)
NOTE: Running task 1602 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 1603 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_patch)
NOTE: Running task 1604 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1605 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1606 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: Running task 1607 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1608 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1609 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1610 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.30.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1611 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1612 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1613 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1614 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1615 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1616 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1617 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_unpack)
NOTE: Running task 1618 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1619 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: Running task 1620 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: Running task 1621 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1622 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1623 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_patch)
NOTE: Running task 1624 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1625 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: Running task 1626 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1627 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: Running task 1628 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1629 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1630 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: Running task 1631 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1632 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1633 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: Running task 1634 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1635 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_patch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1636 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1637 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1638 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1639 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1640 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1641 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1642 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: Running task 1643 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1644 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1645 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1646 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_lic)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1647 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1648 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1649 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1650 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1651 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1652 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.30.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1653 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1654 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1655 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_lic unihash changed to fcb32b3c21b0d58b47f5d95fa2f64a061eb7b45ead232aee5fc738e9dc7f010a
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1656 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1657 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1658 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1659 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: Running task 1660 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1661 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: Running task 1662 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1663 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1664 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1665 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1666 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1667 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1668 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: Running task 1669 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1670 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Started
NOTE: Running task 1671 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1672 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: Running task 1673 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1674 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1675 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: Running task 1676 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: Running task 1677 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1678 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: Running task 1679 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1680 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1681 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1682 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1683 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Succeeded
NOTE: Running task 1684 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-requests-2.30.0-r0: task do_configure: Started
NOTE: Running task 1685 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Started
NOTE: Running task 1686 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_compile)
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: Running task 1687 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1688 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1689 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_compile)
NOTE: Running task 1690 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1691 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1692 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: Running task 1693 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile)
NOTE: recipe python3-requests-2.30.0-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1694 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Started
NOTE: Running task 1695 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1696 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_compile)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Started
NOTE: Running task 1697 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1698 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Started
NOTE: Running task 1699 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Started
NOTE: Running task 1700 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: Running task 1701 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1702 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe python3-requests-2.30.0-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1703 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: Running task 1704 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: Running task 1705 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_configure)
NOTE: Running task 1706 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1707 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1708 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1709 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: Running task 1710 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1711 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1712 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Succeeded
NOTE: Running task 1713 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_install)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: Running task 1714 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1715 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1716 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: Running task 1717 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1718 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1719 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: Running task 1720 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1721 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1722 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1723 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_install)
NOTE: Running task 1724 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1725 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 1726 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1727 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-requests-2.30.0-r0: task do_install: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Started
NOTE: Running task 1728 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1729 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package)
NOTE: Running task 1730 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1731 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: Running task 1732 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: Running task 1733 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: Running task 1734 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Succeeded
NOTE: Running task 1735 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: Running task 1736 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_package)
NOTE: Running task 1737 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_populate_sysroot)
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Started
NOTE: Running task 1738 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: Running task 1739 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: Running task 1740 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1741 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Started
NOTE: Running task 1742 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: Running task 1743 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_install: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1744 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: Running task 1745 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1746 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: Running task 1747 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1748 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_install)
NOTE: Running task 1749 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: Running task 1750 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: Running task 1751 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: Running task 1752 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 1753 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1754 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_package)
NOTE: Running task 1755 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1756 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1757 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1758 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: Running task 1759 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1760 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Started
NOTE: Running task 1761 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Succeeded
NOTE: Running task 1762 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1763 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Started
NOTE: Running task 1764 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1765 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Succeeded
NOTE: Running task 1766 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: Running task 1767 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1768 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1769 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1770 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Succeeded
NOTE: Running task 1771 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_package)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1772 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Started
NOTE: Running task 1773 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: Running task 1774 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package_write_rpm)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_sysroot: Started
NOTE: Running task 1775 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: recipe python3-requests-2.30.0-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Started
NOTE: Running task 1776 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 1777 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Started
NOTE: Running task 1778 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: Running task 1779 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1780 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata: Started
NOTE: Running task 1781 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: Running task 1782 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: Running task 1783 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1784 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1785 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1786 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Succeeded
NOTE: Running task 1787 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: Running task 1788 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: Running task 1789 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Started
NOTE: Running task 1790 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1791 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1792 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: Running task 1793 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1794 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1795 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 1796 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Failed
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1796 tasks of which 1532 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-src went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dbg went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-ptest went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-staticdev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-doc went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-locale went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1 went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-pyasn1/0.4.8-r0/temp/log.do_packagedata.1771870
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata) failed with exit code '1'

--===============3670950734029873285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.11/site-packages/sphinx-6.1.3.dist-info -> /usr/lib/python3.11/site-packages/sphinx-7.0.1.dist-info, removed "/usr/lib/python3.11/site-packages/sphinx/util/stemmer/__init__.py /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/jsdump.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/writers/_html4.py /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/__pycache__/iterators.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/setup_command.py /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/iterators.py /usr/lib/python3.11/site-packages/sphinx/writers/__pycache__/_html4.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/jsdump.py /usr/lib/python3.11/site-packages/sphinx/__pycache__/setup_command.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__/__init__.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/sph
 inx/themes/basic/searchfield.html"
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.11/site-packages/sphinx-6.1.3.dist-info moved to /usr/lib/python3.11/site-packages/sphinx-7.0.1.dist-info
  /usr/lib/python3.11/site-packages/sphinx/themes/basic/searchfield.html was added
  /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/iterators.py was removed
  /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/__pycache__/iterators.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/__pycache__/setup_command.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/setup_command.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/jsdump.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/jsdump.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__init__.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__ was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/writers/_html4.py was removed
  /usr/lib/python3.11/site-packages/sphinx/writers/__pycache__/_html4.cpython-311.pyc was removed

--===============3670950734029873285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (899 cached, 1 parsed). 1804 targets, 39 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:129601361074f457e0a89a0fbdb54ac62410f487"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 108 Local 12 Mirrors 0 Missed 96 Current 377 (11% match, 80% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1161 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1163 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1178 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 1179 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 1201 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_fetch)
NOTE: Running task 1207 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 1208 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_fetch)
NOTE: Running task 1209 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1210 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1211 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1212 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1213 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_fetch)
NOTE: Running task 1214 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_fetch)
NOTE: Running task 1215 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1216 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1217 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_fetch)
NOTE: Running task 1218 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 1219 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1223 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 1326 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1327 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 1328 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1329 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_fetch)
NOTE: Running task 1330 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1331 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: Running task 1557 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: Running task 1559 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1560 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1561 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1562 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1563 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: Running task 1564 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1565 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_unpack)
NOTE: Running task 1566 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1567 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1568 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 1569 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_unpack)
NOTE: Running task 1570 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1571 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1572 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1573 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1574 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_unpack)
NOTE: Running task 1575 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_unpack)
NOTE: Running task 1576 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1577 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1578 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_unpack)
NOTE: Running task 1579 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1580 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1581 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: Running task 1582 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1583 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1584 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1585 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Started
NOTE: Running task 1586 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: Running task 1587 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1588 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: Running task 1589 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1590 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1591 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: Running task 1592 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: recipe python3-requests-2.30.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1593 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 1594 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1595 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 1596 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1597 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 1598 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1599 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1600 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_patch)
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: Running task 1601 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1602 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: Running task 1603 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: Running task 1604 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1605 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1606 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1607 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1608 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: Running task 1609 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: Running task 1610 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: Running task 1611 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_patch: Started
NOTE: Running task 1612 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1613 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1614 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1615 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1616 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_unpack)
NOTE: Running task 1617 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1618 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1619 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: Running task 1620 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1621 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.30.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1622 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_patch)
NOTE: Running task 1623 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1624 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1625 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1626 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1627 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1628 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: Running task 1629 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_patch)
NOTE: Running task 1630 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1631 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1632 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: Running task 1633 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1634 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Started
NOTE: Running task 1635 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1636 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: Running task 1637 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1638 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_patch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1639 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1640 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: Running task 1641 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1642 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: Running task 1643 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1644 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1645 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1646 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1647 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1648 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_lic)
NOTE: Running task 1649 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1650 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1651 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1652 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1653 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1654 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_lic: Started
NOTE: Running task 1655 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1656 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1657 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1658 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1659 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1660 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1661 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: Running task 1662 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1663 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1664 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1665 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 1666 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_lic unihash changed to fcb32b3c21b0d58b47f5d95fa2f64a061eb7b45ead232aee5fc738e9dc7f010a
NOTE: Running task 1667 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Started
NOTE: Running task 1668 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1669 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: Running task 1670 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: Running task 1671 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1672 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: Running task 1673 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: Running task 1674 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1675 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1676 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1677 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1678 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Started
NOTE: Running task 1679 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: Running task 1680 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: Running task 1681 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1682 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1683 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_compile)
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Started
NOTE: Running task 1684 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1685 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1686 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1687 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1688 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_compile)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1689 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1690 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1691 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1692 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: Running task 1693 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1694 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: Running task 1695 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1696 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_compile)
NOTE: Running task 1697 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Started
NOTE: Running task 1698 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: Running task 1699 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1700 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Started
NOTE: Running task 1701 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1702 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: Running task 1703 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1704 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: Running task 1705 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1706 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_configure)
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Started
NOTE: Running task 1707 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: Running task 1708 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: Running task 1709 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1710 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1711 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1712 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1713 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1714 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Succeeded
NOTE: Running task 1715 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: Running task 1716 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_install)
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1717 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: Running task 1718 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_install)
NOTE: Running task 1719 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Started
NOTE: Running task 1720 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1721 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1722 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1723 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 1724 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: recipe python3-requests-2.30.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1725 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1726 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: Running task 1727 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: Running task 1728 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 1729 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Started
NOTE: Running task 1730 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: Running task 1731 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: Running task 1732 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Succeeded
NOTE: Running task 1733 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package)
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1734 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: Running task 1735 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: Running task 1736 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: Running task 1737 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_package)
NOTE: Running task 1738 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 1739 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: Running task 1740 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-requests-2.30.0-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: Running task 1741 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1742 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1743 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: Running task 1744 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-requests-2.30.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1745 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: Running task 1746 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1747 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: Running task 1748 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1749 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_install)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: Running task 1750 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_install)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: Running task 1751 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Started
NOTE: Running task 1752 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-urllib3-2.0.2-r0: task do_install: Succeeded
NOTE: Running task 1753 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: Running task 1754 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Started
NOTE: Running task 1755 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1756 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: Running task 1757 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1758 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1759 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package)
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1760 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 1761 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package)
NOTE: Running task 1762 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: Running task 1763 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1764 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 1765 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Succeeded
NOTE: Running task 1766 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-requests-2.30.0-r0: task do_package: Succeeded
NOTE: Running task 1767 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_packagedata)
NOTE: Running task 1768 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_packagedata)
NOTE: Running task 1769 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_packagedata)
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Started
NOTE: Running task 1770 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1771 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1772 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 1773 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_sysroot)
NOTE: Running task 1774 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: Running task 1775 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1776 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1777 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: Running task 1778 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: Running task 1779 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: Running task 1780 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package_write_rpm)
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1781 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1782 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: Running task 1783 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: Running task 1784 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1785 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: Running task 1786 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: Running task 1787 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1788 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1789 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1790 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1791 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1792 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: Running task 1793 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package_write_rpm)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: Running task 1794 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1795 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1796 of 1816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_packagedata)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1796 tasks of which 1532 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-src went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dbg went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-ptest went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-staticdev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-doc went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-locale went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1 went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-pyasn1/0.4.8-r0/temp/log.do_packagedata.1720856
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata) failed with exit code '1'

--===============3670950734029873285==--

