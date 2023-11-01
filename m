Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FEDC25B0C
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:16 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8639.1698848702607659161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JjOpbVKk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=O3sA428t;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.31, mailfrom: 0101018b8b4605b0-2a85a21e-7810-49c8-8c61-94f3aae005fa-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RFwTV65Gt2pzApNUCBCK4jKqZ8ecjXlSOuxqo6T5mpY=;
	b=JjOpbVKkndWXSgK7uj0XeL5v2TSCTzmXsPQDl9Rd1zlcKeXc62wzkKGLFw5EpCT8
	fNp21LcP80kKPflabaWDTnua7xc5LUQTislujFwlfoR/DMKQeX12NriVlu+f7UuXMCj
	tOAWPpbG9R/XE50yNTewjW8GpBc7C1fEls5xfKX0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RFwTV65Gt2pzApNUCBCK4jKqZ8ecjXlSOuxqo6T5mpY=;
	b=O3sA428tBa7XJhdSOp37g2Xa4fPSfDKmB1GagOU0pXJlE4aAimMfrNtCdZ/4MHb8
	txOt6rf2mclUXVCPCjxydtCuLKSUHlhe9pjOegiePqjMPOJ8jBiMrpTSn62V/qNVplG
	IsX38vRIJiZo0P//HBSBxquQF6OpMvZuca4xboi4=
Content-Type: multipart/mixed; boundary="===============5242500150031154744=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.8.1 SUCCEEDED
Message-ID: <0101018b8b4605b0-2a85a21e-7810-49c8-8c61-94f3aae005fa-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189962

--===============5242500150031154744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools-rust* to *1.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.7.0-1.8.1.patch
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
From fa450c336f9265321c82944a33fa253cef7c2c5c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 09:29:49 +0000
Subject: [PATCH] python3-setuptools-rust: upgrade 1.7.0 -> 1.8.1

---
 ...etuptools-rust_1.7.0.bb => python3-setuptools-rust_1.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.7.0.bb => python3-setuptools-rust_1.8.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb
index 6392a4dead..db5c6c449c 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 SRC_URI = "${PYPI_SRC_URI} \
            https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "c7100999948235a38ae7e555fe199aa66c253dc384b125f5d85473bf81eae3a3"
+SRC_URI[sha256sum] = "94b1dd5d5308b3138d5b933c3a2b55e6d6927d1a22632e509fcea9ddd0f7e486"
 
 inherit cargo pypi python_setuptools_build_meta
 
-- 
2.39.2


--===============5242500150031154744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-setuptools-rust: PV changed from "1.7.0" to "1.8.1"
packages/core2-64-poky-linux/python3-setuptools-rust: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.7.0.tar.gz;downloadfilename=setuptools-rust-1.7.0.tar.gz https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.7.0.tar.gz;downloadfilename=setuptools-rust-1.7.0.tar.gz https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-1.7.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.8.1.tar.gz;downloadfilename=setuptools-rust-1.8.1.tar.gz https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.8.1.tar.gz;downloadfilename=setuptools-rust-1.8.1.tar.gz https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-1.8.1.tar.gz"
packages/core2-64-poky-linux/python3-setuptools-rust: PKGV changed from 1.7.0 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PV changed from "1.7.0" to "1.8.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PKGV changed from 1.7.0 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PV changed from "1.7.0" to "1.8.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PKGV changed from 1.7.0 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PV changed from "1.7.0" to "1.8.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PKGV changed from 1.7.0 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PV changed from "1.7.0" to "1.8.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PKGV changed from 1.7.0 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PV changed from "1.7.0" to "1.8.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PKGV changed from 1.7.0 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PV changed from "1.7.0" to "1.8.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PKGV changed from 1.7.0 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PV changed from "1.7.0" to "1.8.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 163814 to 168073 (+3%)
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGV changed from 1.7.0 [default] to 1.8.1 [default]
Changes to packages/core2-64-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.11/site-packages/setuptools_rust-1.7.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools_rust-1.8.1.dist-info

--===============5242500150031154744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1843 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d883958f15c02c4972e2c0d28f61a173fe535cfd"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d883958f15c02c4972e2c0d28f61a173fe535cfd"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 77 Local 32 Mirrors 0 Missed 45 Current 691 (41% match, 94% complete)
Removing 2 stale sstate objects for arch qemuarm...done.
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 757 of 768 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 768 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1493 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_recipe_qa)
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1624 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_recipe_qa)
NOTE: Running task 1625 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_recipe_qa)
NOTE: Running task 1626 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.2.bb:do_recipe_qa)
NOTE: Running task 1627 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_recipe_qa)
NOTE: Running task 1782 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.2.1.bb:do_recipe_qa)
NOTE: Running task 1784 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_recipe_qa)
NOTE: Running task 1855 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-wheel-0.41.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-pip-23.2.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-wheel-0.41.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1857 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pip-23.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1881 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_fetch)
NOTE: Running task 1882 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_fetch)
NOTE: Running task 1883 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.2.bb:do_fetch)
NOTE: Running task 1884 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1890 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.2.1.bb:do_fetch)
NOTE: Running task 1891 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Started
NOTE: recipe python3-wheel-0.41.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pip-23.2.1-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_fetch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-wheel-0.41.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pip-23.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2066 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_unpack)
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 2067 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_unpack)
NOTE: Running task 2068 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.2.bb:do_unpack)
NOTE: Running task 2069 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2070 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_unpack)
NOTE: Running task 2071 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2072 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 2073 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2074 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2075 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2076 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.2.1.bb:do_unpack)
NOTE: Running task 2077 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 2078 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_unpack: Started
NOTE: recipe python3-wheel-0.41.2-r0: task do_unpack: Started
NOTE: Running task 2079 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wheel-0.41.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wheel-0.41.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pip-23.2.1-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: Running task 2080 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_patch)
NOTE: Running task 2081 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_patch)
NOTE: Running task 2082 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.2.bb:do_patch)
NOTE: Running task 2083 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: Running task 2084 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2085 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: Running task 2086 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_collect_spdx_deps)
NOTE: Running task 2087 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2088 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_patch)
NOTE: Running task 2089 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-pip-23.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2090 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.2.1.bb:do_patch)
NOTE: Running task 2091 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-pip-23.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_patch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Started
NOTE: recipe python3-wheel-0.41.2-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe python3-wheel-0.41.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2095 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_patch: Started
NOTE: recipe python3-pip-23.2.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2098 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wheel-0.41.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2099 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-wheel-0.41.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wheel-0.41.2-r0: task do_patch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Succeeded
NOTE: Running task 2100 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2101 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 2102 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pip-23.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wheel-0.41.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2103 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2104 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2105 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2106 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_rust_gen_targets)
NOTE: Running task 2107 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_populate_lic)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_populate_lic: Started
NOTE: recipe python3-wheel-0.41.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2108 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.2.bb:do_configure)
NOTE: Running task 2109 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_configure)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2110 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pip-23.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2111 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: Running task 2112 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2113 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_configure: Started
NOTE: recipe python3-wheel-0.41.2-r0: task do_configure: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2114 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-pip-23.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-wheel-0.41.2-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2115 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.2.bb:do_compile)
NOTE: Running task 2116 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_compile)
NOTE: Running task 2117 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_configure: Started
NOTE: Running task 2118 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: Running task 2119 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-pip-23.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2120 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.2.1.bb:do_configure)
NOTE: recipe python3-wheel-0.41.2-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_compile: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2121 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_compile)
NOTE: recipe python3-pip-23.2.1-r0: task do_configure: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_compile: Started
NOTE: recipe python3-pip-23.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2122 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.2.1.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3f47b5ed9eb8441973c4ab548f6730c1607013d772c0621215c8eb30a3b8334f
NOTE: recipe python3-pip-23.2.1-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2126 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-wheel-0.41.2-r0: task do_compile: Succeeded
NOTE: Running task 2127 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.2.bb:do_install)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2128 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_install)
NOTE: recipe python3-wheel-0.41.2-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 2129 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 2130 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-wheel-0.41.2-r0: task do_install: Succeeded
NOTE: Running task 2131 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.2.bb:do_package)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Succeeded
NOTE: Running task 2132 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 2133 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-wheel-0.41.2-r0: task do_package: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2134 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_install)
NOTE: recipe python3-pip-23.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2135 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.2.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 2136 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_install: Started
NOTE: recipe python3-pip-23.2.1-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Succeeded
NOTE: Running task 2137 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 2138 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wheel-0.41.2-r0: task do_package: Succeeded
NOTE: Running task 2139 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.2.bb:do_packagedata)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: Running task 2140 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_package)
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_compile: Succeeded
NOTE: Running task 2141 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_install)
NOTE: recipe python3-wheel-0.41.2-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_install: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2142 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_create_spdx)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2143 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_rpm)
NOTE: Running task 2144 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_create_spdx)
NOTE: Running task 2145 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm)
NOTE: recipe python3-wheel-0.41.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2146 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.2.bb:do_create_spdx)
NOTE: Running task 2147 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.2.bb:do_package_write_rpm)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_spdx: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_create_spdx: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wheel-0.41.2-r0: task do_create_spdx: Started
NOTE: recipe python3-wheel-0.41.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_install: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2148 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2149 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_populate_sysroot)
NOTE: recipe python3-wheel-0.41.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-wheel-0.41.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_package: Succeeded
NOTE: Running task 2150 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2151 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_create_spdx)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pip-23.2.1-r0: task do_install: Succeeded
NOTE: Running task 2152 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.2.1.bb:do_package)
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_package: Succeeded
NOTE: recipe python3-pip-23.2.1-r0: task do_package: Started
NOTE: Running task 2153 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_packagedata)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2154 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_create_spdx)
NOTE: Running task 2155 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_package_write_rpm)
NOTE: Running task 2156 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_package_qa)
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_create_spdx: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2157 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_create_runtime_spdx)
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-rust-1.8.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-pip-23.2.1-r0: task do_package: Succeeded
NOTE: Running task 2158 of 2160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.2.1.bb:do_packagedata)
NOTE: recipe python3-pip-23.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-pip-23.2.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2158 tasks of which 2058 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.2.1.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pip-23.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-src went backwards which would break package feeds (from 0:23.3.1-r0 to 0:23.2.1-r0) [version-going-backwards]
ERROR: python3-pip-23.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-dbg went backwards which would break package feeds (from 0:23.3.1-r0 to 0:23.2.1-r0) [version-going-backwards]
ERROR: python3-pip-23.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-staticdev went backwards which would break package feeds (from 0:23.3.1-r0 to 0:23.2.1-r0) [version-going-backwards]
ERROR: python3-pip-23.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-dev went backwards which would break package feeds (from 0:23.3.1-r0 to 0:23.2.1-r0) [version-going-backwards]
ERROR: python3-pip-23.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-doc went backwards which would break package feeds (from 0:23.3.1-r0 to 0:23.2.1-r0) [version-going-backwards]
ERROR: python3-pip-23.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-locale went backwards which would break package feeds (from 0:23.3.1-r0 to 0:23.2.1-r0) [version-going-backwards]
ERROR: python3-pip-23.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pip went backwards which would break package feeds (from 0:23.3.1-r0 to 0:23.2.1-r0) [version-going-backwards]
ERROR: python3-pip-23.2.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pip/23.2.1/temp/log.do_packagedata.3749208
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.2.1.bb:do_packagedata) failed with exit code '1'

--===============5242500150031154744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.11/site-packages/setuptools_rust-1.7.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools_rust-1.8.1.dist-info

--===============5242500150031154744==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.7.0-1.8.1.patch"

RnJvbSBmYTQ1MGMzMzZmOTI2NTMyMWM4Mjk0NGEzM2ZhMjUzY2VmN2MyYzVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwOToyOTo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29scy1ydXN0OiB1cGdyYWRlIDEuNy4wIC0+IDEuOC4xCgotLS0KIC4uLmV0
dXB0b29scy1ydXN0XzEuNy4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuOC4xLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2V0dXB0b29scy1y
dXN0XzEuNy4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuOC4xLmJifSAoOTMlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRv
b2xzLXJ1c3RfMS43LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy1ydXN0XzEuOC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXJ1c3RfMS43
LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLXJ1c3RfMS44LjEuYmIKaW5kZXggNjM5MmE0ZGVhZC4uZGI1YzZjNDQ5YyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtcnVz
dF8xLjcuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29scy1ydXN0XzEuOC4xLmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTAxMWNkOTJlNzAyZGQ5ZTZiMWEyNjE1N2I2ZmQ1M2Y1Igog
U1JDX1VSSSA9ICIke1BZUElfU1JDX1VSSX0gXAogICAgICAgICAgICBodHRwczovL2ZpbGVzLnB5
dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvNjcvMDgvZTFhYTJjNTgyYzYyYWM3NmU0ZDYwZjhlNDU0
YmQzYmJhOTMzNzgxYTA2YTg4YjRlMzg3OTc0NDU4MjJhL3NldHVwdG9vbHMtcnVzdC0ke1BWfS50
YXIuZ3ogXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzcxMDA5OTk5NDgy
MzVhMzhhZTdlNTU1ZmUxOTlhYTY2YzI1M2RjMzg0YjEyNWY1ZDg1NDczYmY4MWVhZTNhMyIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICI5NGIxZGQ1ZDUzMDhiMzEzOGQ1YjkzM2MzYTJiNTVlNmQ2OTI3
ZDFhMjI2MzJlNTA5ZmNlYTlkZGQwZjdlNDg2IgogCiBpbmhlcml0IGNhcmdvIHB5cGkgcHl0aG9u
X3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi0tIAoyLjM5LjIKCg==

--===============5242500150031154744==--

