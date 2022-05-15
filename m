Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B390C4707F
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.18947.1652634913350209009
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=R9Ceq/Rf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010180c8b78715-c38ff4f4-3fee-443e-80ff-b599af8a693f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=D7HnAWjSAYCJUSo/mnyAzXz+K64JiG0XRg2Pjy41kP0=;
	b=R9Ceq/Rfqg9aXlpH6dedzKXo8S/Wi0qiB18aQooRA8vDTRLmxrPXgne3SYwoPefI
	sAcyk3nGnuQ/8bnoXAbQSeHh/JmbqMvGBvYZcgi1wRUKmI2UA79i/6+TrDNIwNaVVYu
	nG7onIEEIQWVknZwGIz4YucrDyrEzkV1aworQjLw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=D7HnAWjSAYCJUSo/mnyAzXz+K64JiG0XRg2Pjy41kP0=;
	b=R6z0achAZHN2pX89O7P9/3otA3HkNI/z0r8ddqqJiEoKjO7mXXkBoA8JOzhrBhlo
	UJlHiVgVG4GEGvkJsFC8LGAXHZV5+BrjF1Oq+EXP2j1JjfTxOBNaljsPB2iSIRB9akU
	0nJuxbkgKxvsJTvcxZESSvsIo+Dr/deLw20rrj58=
Content-Type: multipart/mixed; boundary="===============7403902065850420608=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography: upgrading to 37.0.2 SUCCEEDED
Message-ID: 
 <01010180c8b78715-c38ff4f4-3fee-443e-80ff-b599af8a693f-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:12 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165620

--===============7403902065850420608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography* to *37.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-upgrade-37.0.1-37.0.2.patch
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
--===============7403902065850420608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-37.0.1.tar.gz file://run-ptest file://check-memfree.py file://0001-Cargo.toml-specify-pem-version.patch file://0002-Cargo.toml-edition-2018-2021.patch crate://crates.io/Inflector/0.11.4 crate://crates.io/aliasable/0.1.3 crate://crates.io/asn1/0.8.7 crate://crates.io/asn1_derive/0.8.7 crate://crates.io/autocfg/1.1.0 crate://crates.io/base64/0.13.0 crate://crates.io/bitflags/1.3.2 crate://crates.io/cfg-if/1.0.0 crate://crates.io/chrono/0.4.19 crate://crates.io/indoc-impl/0.3.6 crate://crates.io/indoc/0.3.6 crate://crates.io/instant/0.1.12 crate://crates.io/lazy_static/1.4.0 crate://crates.io/libc/0.2.124 crate://crates.io/lock_api/0.4.7 crate://crates.io/num-integer/0.1.44 crate://crates.io/num-traits/0.2.14 crate://crates.io/once_cell/1.10.0 crate://crates.io/ouroboros/0.15.0 crate://crates.io/ouroboros_macro/0.15.0 crate://crates.io/parki
 ng_lot/0.11.2 crate://crates.io/parking_lot_core/0.8.5 crate://crates.io/paste-impl/0.1.18 crate://crates.io/paste/0.1.18 crate://crates.io/pem/1.0.2 crate://crates.io/proc-macro-error-attr/1.0.4 crate://crates.io/proc-macro-error/1.0.4 crate://crates.io/proc-macro-hack/0.5.19 crate://crates.io/proc-macro2/1.0.37 crate://crates.io/pyo3-build-config/0.15.2 crate://crates.io/pyo3-macros-backend/0.15.2 crate://crates.io/pyo3-macros/0.15.2 crate://crates.io/pyo3/0.15.2 crate://crates.io/quote/1.0.18 crate://crates.io/redox_syscall/0.2.13 crate://crates.io/scopeguard/1.1.0 crate://crates.io/smallvec/1.8.0 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/syn/1.0.91 crate://crates.io/unicode-xid/0.2.2 crate://crates.io/unindent/0.1.8 crate://crates.io/version_check/0.9.4 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/winapi/0.3.9" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptogr
 aphy-37.0.2.tar.gz file://run-ptest file://check-memfree.py file://0001-Cargo.toml-specify-pem-version.patch file://0002-Cargo.toml-edition-2018-2021.patch crate://crates.io/Inflector/0.11.4 crate://crates.io/aliasable/0.1.3 crate://crates.io/asn1/0.8.7 crate://crates.io/asn1_derive/0.8.7 crate://crates.io/autocfg/1.1.0 crate://crates.io/base64/0.13.0 crate://crates.io/bitflags/1.3.2 crate://crates.io/cfg-if/1.0.0 crate://crates.io/chrono/0.4.19 crate://crates.io/indoc-impl/0.3.6 crate://crates.io/indoc/0.3.6 crate://crates.io/instant/0.1.12 crate://crates.io/lazy_static/1.4.0 crate://crates.io/libc/0.2.124 crate://crates.io/lock_api/0.4.7 crate://crates.io/num-integer/0.1.44 crate://crates.io/num-traits/0.2.14 crate://crates.io/once_cell/1.10.0 crate://crates.io/ouroboros/0.15.0 crate://crates.io/ouroboros_macro/0.15.0 crate://crates.io/parking_lot/0.11.2 crate://crates.io/parking_lot_core/0.8.5 crate://crates.io/paste-impl/0.1.18 crate://crates.io/paste/0.1.18 crate://crates.io/pe
 m/1.0.2 crate://crates.io/proc-macro-error-attr/1.0.4 crate://crates.io/proc-macro-error/1.0.4 crate://crates.io/proc-macro-hack/0.5.19 crate://crates.io/proc-macro2/1.0.37 crate://crates.io/pyo3-build-config/0.15.2 crate://crates.io/pyo3-macros-backend/0.15.2 crate://crates.io/pyo3-macros/0.15.2 crate://crates.io/pyo3/0.15.2 crate://crates.io/quote/1.0.18 crate://crates.io/redox_syscall/0.2.13 crate://crates.io/scopeguard/1.1.0 crate://crates.io/smallvec/1.8.0 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/syn/1.0.91 crate://crates.io/unicode-xid/0.2.2 crate://crates.io/unindent/0.1.8 crate://crates.io/version_check/0.9.4 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/winapi/0.3.9"
packages/core2-32-poky-linux/python3-cryptography: PV changed from "37.0.1" to "37.0.2"
packages/core2-32-poky-linux/python3-cryptography: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "37.0.1" to "37.0.2"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1410800 to 1411284 (+0%)
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "37.0.1" to "37.0.2"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "37.0.1" to "37.0.2"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "37.0.1" to "37.0.2"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "37.0.1" to "37.0.2"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "37.0.1" to "37.0.2"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-src: PKGSIZE changed from 1583455 to 1584698 (+0%)
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "37.0.1" to "37.0.2"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography: PV changed from "37.0.1" to "37.0.2"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography: PKGSIZE changed from 3580747 to 3581222 (+0%)
Changes to packages/core2-32-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.10/site-packages/cryptography-37.0.1.dist-info moved to /usr/lib/python3.10/site-packages/cryptography-37.0.2.dist-info

--===============7403902065850420608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 70 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-d89ee67289048292de2cbe2b23a17e6de1c5f52a"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d89ee67289048292de2cbe2b23a17e6de1c5f52a"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 2 Mirrors 0 Missed 55 Current 389 (3% match, 87% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 996 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_fetch)
NOTE: Running task 1145 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_fetch)
NOTE: Running task 1146 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_fetch)
NOTE: Running task 1147 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_fetch)
NOTE: Running task 1200 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_fetch)
NOTE: Running task 1201 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_fetch)
NOTE: Running task 1202 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1203 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_fetch)
NOTE: Running task 1204 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_fetch)
NOTE: Running task 1205 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1206 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_fetch)
NOTE: Running task 1207 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1329 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_fetch: Started
NOTE: Running task 1522 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.3-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: Running task 1525 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_unpack)
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1526 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1527 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_unpack)
NOTE: Running task 1528 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_unpack)
NOTE: Running task 1529 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_unpack)
NOTE: Running task 1530 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1531 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1532 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1533 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_unpack)
NOTE: Running task 1534 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_unpack)
NOTE: Running task 1535 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1536 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_unpack)
NOTE: Running task 1537 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_unpack)
NOTE: Running task 1538 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1539 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_unpack)
NOTE: Running task 1540 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1541 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1542 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1543 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-59.5.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1544 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_unpack: Started
NOTE: Running task 1545 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_unpack: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1546 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.3-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: Running task 1547 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_unpack: Started
NOTE: Running task 1548 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: Running task 1549 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1551 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_patch)
NOTE: recipe python3-idna-3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1552 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_patch)
NOTE: Running task 1554 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_patch)
NOTE: Running task 1555 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1556 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_patch)
NOTE: recipe python3-psutil-5.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1557 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_patch)
NOTE: Running task 1558 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1559 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-psutil-5.9.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1560 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-idna-3.3-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: Running task 1561 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1562 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1563 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1564 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1565 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1566 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1567 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1568 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1569 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1570 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1571 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1572 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1573 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_patch: Started
NOTE: recipe python3-idna-3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1574 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1575 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_configure)
NOTE: Running task 1576 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1577 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure)
NOTE: Running task 1578 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1579 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_configure: Started
NOTE: Running task 1580 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-psutil-5.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure: Started
NOTE: Running task 1581 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 1582 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure: Started
NOTE: Running task 1583 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1584 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: Running task 1585 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Started
NOTE: Running task 1586 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1587 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 1588 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure: Succeeded
NOTE: Running task 1589 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_compile)
NOTE: Running task 1590 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_configure_ptest_base)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_patch: Started
NOTE: recipe python3-idna-3.3-r0: task do_compile: Started
NOTE: Running task 1591 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure_ptest_base)
NOTE: Running task 1592 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1593 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1594 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1595 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1596 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_compile)
NOTE: Running task 1597 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_compile)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1598 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1599 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_compile)
NOTE: Running task 1600 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1601 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_rust_create_wrappers)
NOTE: Running task 1602 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile: Started
NOTE: Running task 1603 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_populate_lic)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_populate_lic unihash changed to d38781bbb923c1bff0642e3a8329d510feb0b0b160ab34c18906202c57bbd4f0
NOTE: Running task 1604 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure: Started
NOTE: Running task 1605 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1606 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_configure_ptest_base)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1607 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_install)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1608 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1609 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_install: Started
NOTE: Running task 1610 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-idna-3.3-r0: task do_compile: Succeeded
NOTE: Running task 1611 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1612 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-setuptools-59.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_install: Succeeded
NOTE: Running task 1613 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1614 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: Running task 1615 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1616 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-idna-3.3-r0: task do_install: Succeeded
NOTE: Running task 1617 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile_ptest_base)
NOTE: Running task 1618 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_install)
NOTE: Running task 1619 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1620 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_install: Started
NOTE: recipe python3-idna-3.3-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1621 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1622 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_install)
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1623 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1624 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_package)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1625 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1626 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: Running task 1627 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_compile: Succeeded
NOTE: Running task 1628 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Succeeded
NOTE: Running task 1629 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1630 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install_ptest_base)
NOTE: Running task 1631 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package_write_rpm)
NOTE: Running task 1632 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.0-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install: Succeeded
NOTE: Running task 1633 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_install_ptest_base)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_package: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install: Succeeded
NOTE: Running task 1634 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_packagedata)
NOTE: Running task 1635 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_install_ptest_base)
NOTE: Running task 1636 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_packagedata)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1637 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_package)
NOTE: recipe python3-idna-3.3-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1638 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1639 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_package)
NOTE: Running task 1640 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Started
NOTE: Running task 1641 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1642 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_package_write_rpm)
NOTE: Running task 1643 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-idna-3.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_package: Started
NOTE: Running task 1644 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package_write_rpm)
NOTE: recipe python3-psutil-5.9.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package: Succeeded
NOTE: Running task 1645 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_package)
NOTE: Running task 1646 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_packagedata)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_packagedata: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1647 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_package: Succeeded
NOTE: Running task 1648 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_packagedata: Failed
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1648 tasks of which 1511 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-src went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-dbg went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-ptest went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-staticdev went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-dev went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-doc went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-locale went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-bcrypt/3.2.0-r0/temp/log.do_packagedata.3139823
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_packagedata) failed with exit code '1'

--===============7403902065850420608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.10/site-packages/cryptography-37.0.1.dist-info moved to /usr/lib/python3.10/site-packages/cryptography-37.0.2.dist-info

--===============7403902065850420608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1643 targets, 50 skipped, 0 masked, 0 errors.
Removing 38 recipes from the core2-32 sysroot...done.
Removing 63 recipes from the qemux86 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-d89ee67289048292de2cbe2b23a17e6de1c5f52a"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d89ee67289048292de2cbe2b23a17e6de1c5f52a"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 264 Local 209 Mirrors 0 Missed 55 Current 196 (79% match, 88% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 199 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 258 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 737 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_fetch)
NOTE: Running task 838 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_fetch)
NOTE: Running task 839 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_fetch)
NOTE: Running task 840 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_fetch)
NOTE: Running task 843 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_fetch)
NOTE: Running task 844 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_fetch)
NOTE: Running task 845 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 846 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_fetch)
NOTE: Running task 847 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_fetch)
NOTE: Running task 848 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_fetch)
NOTE: Running task 849 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 850 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 867 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: recipe python3-cffi-1.15.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 906 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_unpack)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 907 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_unpack)
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: Running task 908 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_unpack)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.3-r0: task do_fetch: Succeeded
NOTE: Running task 909 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 910 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 911 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_unpack)
NOTE: Running task 912 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: recipe python3-pytest-7.1.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 913 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: recipe python3-cffi-1.15.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: Running setscene task 261 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata_setscene)
NOTE: Running task 914 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.60.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_unpack: Started
NOTE: Running setscene task 276 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata_setscene)
NOTE: Running task 915 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_unpack)
NOTE: Running task 916 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_unpack)
NOTE: Running task 917 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 918 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_unpack: Started
NOTE: Running setscene task 278 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-4.11.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.3-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 919 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_patch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-21.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 920 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-59.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 921 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-psutil-5.9.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-8.12.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 922 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 923 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_patch)
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: Running task 924 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_patch)
NOTE: Running task 925 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_patch)
NOTE: Running task 926 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_patch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_unpack: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_unpack: Started
NOTE: recipe psmisc-23.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 279 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 927 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 928 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-4.11.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: Running setscene task 290 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata_setscene)
NOTE: Running task 935 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_patch)
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_patch: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-59.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 300 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb:do_package_setscene)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-8.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_patch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 318 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 954 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 955 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 956 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 991 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 992 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 993 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 994 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 995 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 996 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 997 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1023 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rust-cross-core2-32-musl-1.60.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 335 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rust-cross-core2-32-musl-1.60.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 344 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1039 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_patch)
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 348 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 355 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1061 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1066 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_patch)
NOTE: recipe python3-setuptools-59.5.0-r0: task do_package_setscene: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-59.5.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 361 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 362 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1067 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1068 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_populate_lic)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-59.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-59.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_populate_lic unihash changed to d38781bbb923c1bff0642e3a8329d510feb0b0b160ab34c18906202c57bbd4f0
NOTE: recipe python3-cryptography-37.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 375 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 379 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.3.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 397 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 400 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 404 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 414 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 438 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 447 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 458 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1366 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1414 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1415 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1416 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1506 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1507 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1508 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1509 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1510 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1511 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1512 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1549 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1623 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-59.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1625 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1626 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1627 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_configure)
NOTE: Running task 1628 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure)
NOTE: Running task 1629 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-psutil-5.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure: Started
NOTE: Running task 1630 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_configure)
NOTE: recipe python3-idna-3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1631 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1632 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1633 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_rust_create_wrappers)
NOTE: Running task 1634 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_configure_ptest_base)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_configure: Started
NOTE: Running task 1635 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1636 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1637 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-idna-3.3-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure: Succeeded
NOTE: Running task 1638 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Succeeded
NOTE: Running task 1639 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_configure_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: Running task 1640 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_compile)
NOTE: Running task 1641 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure_ptest_base)
NOTE: recipe python3-psutil-5.9.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_rust_create_wrappers: Started
NOTE: Running task 1642 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_configure: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-idna-3.3-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: Running task 1643 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1644 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_compile)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1645 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_compile: Started
NOTE: Running task 1646 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_configure)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1647 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-psutil-5.9.0-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1648 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_compile)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1649 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_compile)
NOTE: recipe python3-idna-3.3-r0: task do_compile: Started
NOTE: Running task 1650 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile)
NOTE: Running task 1651 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1652 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1653 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1654 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1655 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1656 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-idna-3.3-r0: task do_compile: Succeeded
NOTE: Running task 1657 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1658 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1659 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_install)
NOTE: recipe python3-idna-3.3-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: Running task 1660 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: Running task 1661 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_compile_ptest_base)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1662 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1663 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_install)
NOTE: Running task 1664 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1665 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install: Started
NOTE: recipe python3-idna-3.3-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Succeeded
NOTE: Running task 1666 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile_ptest_base)
NOTE: Running task 1667 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_install: Succeeded
NOTE: Running task 1668 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_compile: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_package: Started
NOTE: Running task 1669 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_install)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package: Started
NOTE: Running task 1670 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_install: Started
NOTE: Running task 1671 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-59.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1672 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_package)
NOTE: Running task 1673 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1674 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_compile_ptest_base)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install: Succeeded
NOTE: Running task 1675 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: Running task 1676 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1677 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_install)
NOTE: recipe python3-psutil-5.9.0-r0: task do_install: Succeeded
NOTE: Running task 1678 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1679 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1680 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Succeeded
NOTE: Running task 1681 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_package)
NOTE: Running task 1682 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: Running task 1683 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_package: Started
NOTE: recipe python3-idna-3.3-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1684 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package: Succeeded
NOTE: Running task 1685 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_package)
NOTE: recipe python3-idna-3.3-r0: task do_packagedata: Started
NOTE: Running task 1686 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_install_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1687 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_packagedata)
NOTE: Running task 1688 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: Running task 1689 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1690 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1691 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package_write_rpm)
NOTE: Running task 1692 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_package: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1693 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_package_write_rpm)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1694 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_package: Succeeded
NOTE: Running task 1695 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_package: Succeeded
NOTE: Running task 1696 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1697 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1698 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1699 of 1718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1699 tasks of which 1558 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-src went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-dbg went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-ptest went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-staticdev went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-dev went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-doc went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-locale went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-bcrypt/3.2.0-r0/temp/log.do_packagedata.3275081
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_packagedata) failed with exit code '1'

--===============7403902065850420608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 63 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-d89ee67289048292de2cbe2b23a17e6de1c5f52a"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d89ee67289048292de2cbe2b23a17e6de1c5f52a"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 2 Mirrors 0 Missed 55 Current 389 (3% match, 87% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 996 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_fetch)
NOTE: Running task 1145 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_fetch)
NOTE: Running task 1146 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_fetch)
NOTE: Running task 1147 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_fetch)
NOTE: Running task 1200 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_fetch)
NOTE: Running task 1201 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1202 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_fetch)
NOTE: Running task 1203 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_fetch)
NOTE: Running task 1204 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1205 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1206 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_fetch)
NOTE: Running task 1207 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_fetch)
NOTE: Running task 1335 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: Running task 1521 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_fetch: Started
NOTE: Running task 1522 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_unpack)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Succeeded
NOTE: Running task 1523 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.3-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1524 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_unpack)
NOTE: Running task 1525 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_fetch: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1526 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_unpack)
NOTE: Running task 1527 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1528 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_unpack)
NOTE: Running task 1529 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1530 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_unpack)
NOTE: Running task 1531 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1532 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_unpack)
NOTE: Running task 1533 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_unpack)
NOTE: Running task 1534 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1535 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1536 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_unpack)
NOTE: Running task 1537 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_unpack)
NOTE: Running task 1538 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1539 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1540 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-59.5.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1541 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1542 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_unpack: Started
NOTE: Running task 1543 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: Running task 1544 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_unpack: Started
NOTE: Running task 1545 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: Running task 1546 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.3-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_unpack: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1551 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_patch)
NOTE: Running task 1552 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1553 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_patch)
NOTE: Running task 1554 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_patch)
NOTE: recipe python3-idna-3.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1555 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-psutil-5.9.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1556 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_patch)
NOTE: Running task 1557 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_patch)
NOTE: Running task 1558 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1559 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_patch)
NOTE: Running task 1560 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_patch: Started
NOTE: recipe python3-idna-3.3-r0: task do_patch: Started
NOTE: Running task 1561 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Succeeded
NOTE: Running task 1562 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1563 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1564 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1565 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1566 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1567 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1568 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1569 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1570 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1571 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1572 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1573 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_patch)
NOTE: recipe python3-idna-3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_patch: Started
NOTE: Running task 1574 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1575 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1576 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1577 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure: Started
NOTE: recipe python3-idna-3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1578 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1579 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_configure)
NOTE: recipe python3-psutil-5.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1580 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Started
NOTE: Running task 1581 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_configure)
NOTE: Running task 1582 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_configure)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1583 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure: Started
NOTE: Running task 1584 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1585 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_configure)
NOTE: Running task 1586 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.3-r0: task do_configure: Started
NOTE: Running task 1587 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: Running task 1588 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_patch)
NOTE: Running task 1589 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_configure: Succeeded
NOTE: Running task 1590 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: Running task 1591 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: Running task 1592 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1593 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1594 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_compile)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1595 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1596 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_compile)
NOTE: Running task 1597 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: Running task 1598 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_compile: Started
NOTE: Running task 1599 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: Running task 1600 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1601 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1602 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_rust_create_wrappers)
NOTE: Running task 1603 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_populate_lic)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_populate_lic unihash changed to d38781bbb923c1bff0642e3a8329d510feb0b0b160ab34c18906202c57bbd4f0
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1604 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: Running task 1605 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-setuptools-59.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1606 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1607 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1608 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1609 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1610 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_compile: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_compile: Succeeded
NOTE: Running task 1611 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_install)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_compile: Started
NOTE: Running task 1612 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1613 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-idna-3.3-r0: task do_install: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1614 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile: Succeeded
NOTE: Running task 1615 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1616 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Succeeded
NOTE: Running task 1617 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1618 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_install)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_install: Succeeded
NOTE: Running task 1619 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: Running task 1620 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1621 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_package)
NOTE: Running task 1622 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1623 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_install)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package: Started
NOTE: recipe python3-idna-3.3-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_install: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1624 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_compile_ptest_base)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1625 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_install: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1626 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_package)
NOTE: Running task 1627 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install: Started
NOTE: Running task 1628 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: Running task 1629 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Succeeded
NOTE: Running task 1630 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_install_ptest_base)
NOTE: Running task 1631 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install_ptest_base)
NOTE: recipe python3-psutil-5.9.0-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1632 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1633 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1634 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_install_ptest_base)
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1635 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_package: Succeeded
NOTE: Running task 1636 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1637 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_package)
NOTE: Running task 1638 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: Running task 1639 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_package: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Started
NOTE: recipe python3-idna-3.3-r0: task do_packagedata: Started
NOTE: Running task 1640 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_package)
NOTE: Running task 1641 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.0-r0: task do_install: Succeeded
NOTE: Running task 1642 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_package)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1643 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-psutil-5.9.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1644 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package_write_rpm)
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1645 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_package_write_rpm)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package: Succeeded
NOTE: Running task 1646 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1647 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_package_write_rpm)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_package: Succeeded
NOTE: Running task 1648 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_package: Succeeded
NOTE: Running task 1649 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_packagedata)
NOTE: Running task 1650 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_packagedata: Failed
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1650 tasks of which 1511 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-src went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-dbg went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-ptest went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-staticdev went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-dev went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-doc went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-locale went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-bcrypt/3.2.0-r0/temp/log.do_packagedata.3033630
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_packagedata) failed with exit code '1'

--===============7403902065850420608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1644 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1642 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-d89ee67289048292de2cbe2b23a17e6de1c5f52a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d89ee67289048292de2cbe2b23a17e6de1c5f52a"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 2 Mirrors 0 Missed 55 Current 389 (3% match, 87% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 996 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_fetch)
NOTE: Running task 1145 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_fetch)
NOTE: Running task 1146 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_fetch)
NOTE: Running task 1147 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_fetch)
NOTE: Running task 1200 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_fetch)
NOTE: Running task 1201 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_fetch)
NOTE: Running task 1202 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_fetch)
NOTE: Running task 1203 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_fetch)
NOTE: Running task 1204 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1205 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_fetch)
NOTE: Running task 1206 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1207 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1328 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_fetch: Started
NOTE: Running task 1522 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-psutil-5.9.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1524 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_unpack)
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.3-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_fetch: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1525 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1526 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_unpack)
NOTE: Running task 1527 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_unpack)
NOTE: Running task 1528 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_unpack)
NOTE: Running task 1529 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1530 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1531 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1532 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_unpack)
NOTE: Running task 1533 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_unpack)
NOTE: Running task 1534 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_unpack)
NOTE: Running task 1535 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_unpack)
NOTE: Running task 1536 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1537 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_unpack)
NOTE: Running task 1538 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1539 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1540 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1541 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1542 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-59.5.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1543 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Started
NOTE: Running task 1544 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1545 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1546 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.3-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_unpack: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: Running task 1547 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: Running task 1548 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1551 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1552 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_patch)
NOTE: Running task 1553 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: Running task 1554 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1555 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_patch)
NOTE: Running task 1556 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_patch)
NOTE: Running task 1557 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1558 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_patch)
NOTE: Running task 1559 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_patch)
NOTE: Running task 1560 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_patch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.3-r0: task do_patch: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: Running task 1561 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_patch: Succeeded
NOTE: Running task 1562 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1563 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1564 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1565 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_patch: Succeeded
NOTE: Running task 1566 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1567 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1568 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1569 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1570 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1571 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_patch)
NOTE: Running task 1572 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1573 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1574 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure)
NOTE: Running task 1575 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1576 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_configure)
NOTE: recipe python3-idna-3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1577 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1578 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1579 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 1580 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1581 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_configure)
NOTE: Running task 1582 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_configure: Started
NOTE: Running task 1583 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_configure)
NOTE: recipe python3-idna-3.3-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: Running task 1584 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure: Succeeded
NOTE: Running task 1585 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1586 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_configure_ptest_base)
NOTE: Running task 1587 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_configure_ptest_base)
NOTE: recipe python3-psutil-5.9.0-r0: task do_configure: Started
NOTE: recipe python3-idna-3.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1588 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_patch)
NOTE: Running task 1589 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1590 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_compile)
NOTE: Running task 1591 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: Running task 1592 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: Running task 1593 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1594 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_patch: Started
NOTE: recipe python3-idna-3.3-r0: task do_compile: Started
NOTE: Running task 1595 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile)
NOTE: Running task 1596 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1597 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: Running task 1598 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Started
NOTE: Running task 1599 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_compile)
NOTE: recipe python3-psutil-5.9.0-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile: Started
NOTE: Running task 1600 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1601 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1602 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_rust_create_wrappers)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: Running task 1603 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_populate_lic)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_populate_lic: Succeeded
NOTE: Running task 1604 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_populate_lic unihash changed to d38781bbb923c1bff0642e3a8329d510feb0b0b160ab34c18906202c57bbd4f0
NOTE: recipe python3-cryptography-37.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1605 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1606 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-setuptools-59.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1607 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-idna-3.3-r0: task do_compile: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1608 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_install)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1609 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_install)
NOTE: Running task 1610 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: Running task 1611 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1612 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-idna-3.3-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_compile: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1613 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile: Succeeded
NOTE: Running task 1614 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Succeeded
NOTE: Running task 1615 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: Running task 1616 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1617 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1618 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_install)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_install: Succeeded
NOTE: Running task 1619 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 1620 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1621 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_package)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1622 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install)
NOTE: recipe python3-idna-3.3-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1623 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1624 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1625 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1626 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_compile_ptest_base)
NOTE: recipe python3-psutil-5.9.0-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install: Succeeded
NOTE: Running task 1627 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_install)
NOTE: Running task 1628 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Succeeded
NOTE: Running task 1629 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1630 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1631 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1632 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install: Started
NOTE: recipe python3-idna-3.3-r0: task do_package: Succeeded
NOTE: Running task 1633 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1634 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1635 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: Running task 1636 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_package: Started
NOTE: recipe python3-idna-3.3-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package: Succeeded
NOTE: Running task 1637 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: Running task 1638 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_packagedata: Started
NOTE: Running task 1639 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1640 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_install_ptest_base)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: Running task 1641 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package_write_rpm)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_install: Succeeded
NOTE: Running task 1642 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package: Succeeded
NOTE: Running task 1643 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: Running task 1644 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_packagedata: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1645 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_package_write_rpm)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1646 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_package)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1647 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_package: Succeeded
NOTE: Running task 1648 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_packagedata)
NOTE: Running task 1649 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_packagedata: Started
NOTE: Running task 1650 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1651 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1652 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_package_write_rpm)
NOTE: recipe python3-psutil-5.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_packagedata: Failed
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1652 tasks of which 1511 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-src went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-dbg went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-ptest went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-staticdev went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-dev went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-doc went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-locale went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-bcrypt/3.2.0-r0/temp/log.do_packagedata.2866532
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_packagedata) failed with exit code '1'

--===============7403902065850420608==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-cryptography-upgrade-37.0.1-37.0.2.patch"

From db740b3a032a94f774e4934a5f945c59a3c950ed Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 08:41:07 +0000
Subject: [PATCH] python3-cryptography: upgrade 37.0.1 -> 37.0.2

---
 ...n3-cryptography_37.0.1.bb => python3-cryptography_37.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography_37.0.1.bb => python3-cryptography_37.0.2.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-cryptography_37.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography_37.0.2.bb
index 1271954a08..d2de2960c2 100644
--- a/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "d610d0ee14dd9109006215c7c0de15eee91230b70a9bce2263461cf7c3720b83"
+SRC_URI[sha256sum] = "f224ad253cc9cea7568f49077007d2263efa57396a2f2f78114066fd54b5c68e"
 
 SRC_URI += "file://run-ptest \
            file://check-memfree.py \
-- 
2.31.1


--===============7403902065850420608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 53 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-d89ee67289048292de2cbe2b23a17e6de1c5f52a"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d89ee67289048292de2cbe2b23a17e6de1c5f52a"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 2 Mirrors 0 Missed 55 Current 389 (3% match, 87% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 996 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_fetch)
NOTE: Running task 1145 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_fetch)
NOTE: Running task 1146 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_fetch)
NOTE: Running task 1147 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_fetch)
NOTE: Running task 1200 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1201 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1202 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_fetch)
NOTE: Running task 1203 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_fetch)
NOTE: Running task 1204 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_fetch)
NOTE: Running task 1205 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_fetch)
NOTE: Running task 1206 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1207 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_fetch)
NOTE: Running task 1328 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: Running task 1521 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_fetch: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_fetch: Succeeded
NOTE: Running task 1524 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_unpack)
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.3-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 1525 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_unpack)
NOTE: Running task 1526 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1527 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_unpack)
NOTE: Running task 1528 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_unpack)
NOTE: Running task 1529 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1530 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1531 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1532 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1533 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1534 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_unpack)
NOTE: Running task 1535 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_unpack)
NOTE: Running task 1536 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_unpack)
NOTE: Running task 1537 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_unpack)
NOTE: Running task 1538 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1539 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_unpack)
NOTE: Running task 1540 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1541 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1542 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1543 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_unpack: Started
NOTE: Running task 1544 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1545 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1546 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-59.5.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1547 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: Running task 1548 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.0-r0: task do_unpack: Started
NOTE: Running task 1551 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_patch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.3-r0: task do_unpack: Started
NOTE: Running task 1552 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_patch)
NOTE: Running task 1553 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: Running task 1554 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_patch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1555 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1556 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-idna-3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1557 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_patch)
NOTE: Running task 1558 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_patch)
NOTE: Running task 1559 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1560 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_patch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: Running task 1561 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_patch: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_patch: Started
NOTE: recipe python3-idna-3.3-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1562 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_patch: Succeeded
NOTE: Running task 1563 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1564 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1565 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1566 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1567 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1568 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1569 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1570 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1571 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1572 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_patch)
NOTE: Running task 1573 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_patch: Started
NOTE: recipe python3-idna-3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1574 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure)
NOTE: recipe python3-psutil-5.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1575 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1576 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_configure)
NOTE: Running task 1577 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1578 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure: Started
NOTE: Running task 1579 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1580 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1581 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_configure)
NOTE: recipe python3-psutil-5.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1582 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_patch)
NOTE: Running task 1583 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 1584 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_configure: Succeeded
NOTE: Running task 1585 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1586 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1587 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_configure)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: Running task 1588 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_patch: Started
NOTE: Running task 1589 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-psutil-5.9.0-r0: task do_configure: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.3-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure: Succeeded
NOTE: Running task 1590 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-37.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1591 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1592 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: Running task 1593 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1594 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_configure: Succeeded
NOTE: Running task 1595 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1596 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_compile)
NOTE: Running task 1597 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1598 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_rust_create_wrappers)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1599 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_compile)
NOTE: Running task 1600 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_compile)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_compile: Started
NOTE: Running task 1601 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 1602 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_populate_lic)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile: Started
NOTE: Running task 1603 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_compile)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.3-r0: task do_compile: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1604 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1605 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_populate_lic unihash changed to d38781bbb923c1bff0642e3a8329d510feb0b0b160ab34c18906202c57bbd4f0
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-59.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1606 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1607 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1608 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1609 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1610 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-idna-3.3-r0: task do_compile: Succeeded
NOTE: Running task 1611 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1612 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile: Succeeded
NOTE: Running task 1613 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile: Succeeded
NOTE: Running task 1614 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_compile_ptest_base)
NOTE: recipe python3-idna-3.3-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1615 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_install)
NOTE: recipe python3-pytz-2022.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1616 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_install)
NOTE: Running task 1617 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install)
NOTE: Running task 1618 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1619 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1620 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1621 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_install)
NOTE: recipe python3-idna-3.3-r0: task do_install: Succeeded
NOTE: Running task 1622 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_install: Started
NOTE: recipe python3-idna-3.3-r0: task do_package: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_install: Succeeded
NOTE: Running task 1623 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_package)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1624 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_compile_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1625 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install: Succeeded
NOTE: Running task 1626 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_package)
NOTE: Running task 1627 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_install: Succeeded
NOTE: Running task 1628 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_install_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1629 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1630 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_package)
NOTE: recipe python3-psutil-5.9.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1631 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1632 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_package)
NOTE: Running task 1633 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_package: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1634 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.0-r0: task do_install: Started
NOTE: Running task 1635 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Started
NOTE: Running task 1636 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_install_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1637 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.3-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: Running task 1638 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-idna-3.3-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1639 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_package)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1640 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1641 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_package)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package: Succeeded
NOTE: Running task 1642 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1643 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_packagedata)
NOTE: recipe python3-idna-3.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_package: Started
NOTE: Running task 1644 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package_write_rpm)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1645 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_packagedata: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1646 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb:do_package_write_rpm)
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1647 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb:do_package_write_rpm)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_package: Succeeded
NOTE: Running task 1648 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_package: Succeeded
NOTE: Running task 1649 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-asn1crypto-1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-psutil-5.9.0-r0: task do_package: Succeeded
NOTE: Running task 1650 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1651 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-3.2.0-r0: task do_packagedata: Failed
NOTE: recipe python3-psutil-5.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-psutil-5.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.46.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-37.0.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1651 tasks of which 1511 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-src went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-dbg went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-ptest went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-staticdev went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-dev went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-doc went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-locale went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt went backwards which would break package feeds (from 0:3.2.2-r0 to 0:3.2.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-3.2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-bcrypt/3.2.0-r0/temp/log.do_packagedata.2971577
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb:do_packagedata) failed with exit code '1'

--===============7403902065850420608==--

