Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BD7C64EC5
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.844.1667349632518358541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Dx8i6bgz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018435c85721-aa7d6e3e-d779-4a82-92f1-339318a79476-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7Z7jGzwIPnJ/7sTjvul4yWk8tk6FgnjOWmmc55CjsVk=;
	b=Dx8i6bgzLtMaQlzG/fFrXpyC2IHdWqy7g9+UxtqxBdukar48AJeVrt4qJHSy9PNS
	QhL4E1X4xccTw6tVZkNw/wp0Wzk8q2jevbq7hqKcYH/3aNKf+jt02lUOhEYjI/0j1XS
	s9A+XtHV6+jonJjYACi5dj4WX/omaojHB19ZRD1w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7Z7jGzwIPnJ/7sTjvul4yWk8tk6FgnjOWmmc55CjsVk=;
	b=V2QA9kseB26sOhSTtGPDYDu2kcro2wrSXxVhyd2/RKGMq/xbIr58DnMfA1vmXecd
	9UCizb2vp+nfKCUWnFtcJF5NGiqsYo1z42i0GldVMgjHPhtT+Nn0k/5kKghx19J2dDF
	s+WbY4JIB7beq4T1fzwciYPCJ0BHLEsJX74sZ4To=
Content-Type: multipart/mixed; boundary="===============5972367498499285611=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography: upgrading to 38.0.2 SUCCEEDED
Message-ID: <0101018435c85721-aa7d6e3e-d779-4a82-92f1-339318a79476-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172430

--===============5972367498499285611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography* to *38.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-upgrade-38.0.1-38.0.2.patch
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
--===============5972367498499285611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cryptography: PV changed from "38.0.1" to "38.0.2"
packages/core2-32-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-38.0.1.tar.gz file://0002-Cargo.toml-edition-2018-2021.patch file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/Inflector/0.11.4 crate://crates.io/aliasable/0.1.3 crate://crates.io/android_system_properties/0.1.5 crate://crates.io/asn1/0.12.2 crate://crates.io/asn1_derive/0.12.2 crate://crates.io/autocfg/1.1.0 crate://crates.io/base64/0.13.0 crate://crates.io/bitflags/1.3.2 crate://crates.io/bumpalo/3.10.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/chrono/0.4.22 crate://crates.io/core-foundation-sys/0.8.3 crate://crates.io/iana-time-zone/0.1.47 crate://crates.io/indoc-impl/0.3.6 crate://crates.io/indoc/0.3.6 crate://crates.io/instant/0.1.12 crate://crates.io/js-sys/0.3.59 crate://crates.io/libc/0.2.132 crate://crates.io/lock_api/0.4.8 crate://crates.io/log/0.4.
 17 crate://crates.io/num-integer/0.1.45 crate://crates.io/num-traits/0.2.15 crate://crates.io/once_cell/1.14.0 crate://crates.io/ouroboros/0.15.4 crate://crates.io/ouroboros_macro/0.15.4 crate://crates.io/parking_lot/0.11.2 crate://crates.io/parking_lot_core/0.8.5 crate://crates.io/paste-impl/0.1.18 crate://crates.io/paste/0.1.18 crate://crates.io/pem/1.1.0 crate://crates.io/proc-macro-error-attr/1.0.4 crate://crates.io/proc-macro-error/1.0.4 crate://crates.io/proc-macro-hack/0.5.19 crate://crates.io/proc-macro2/1.0.43 crate://crates.io/pyo3-build-config/0.15.2 crate://crates.io/pyo3-macros-backend/0.15.2 crate://crates.io/pyo3-macros/0.15.2 crate://crates.io/pyo3/0.15.2 crate://crates.io/quote/1.0.21 crate://crates.io/redox_syscall/0.2.16 crate://crates.io/scopeguard/1.1.0 crate://crates.io/smallvec/1.9.0 crate://crates.io/syn/1.0.99 crate://crates.io/unicode-ident/1.0.3 crate://crates.io/unindent/0.1.10 crate://crates.io/version_check/0.9.4 crate://crates.io/wasm-bindgen/0.2.82 cr
 ate://crates.io/wasm-bindgen-backend/0.2.82 crate://crates.io/wasm-bindgen-macro-support/0.2.82 crate://crates.io/wasm-bindgen-macro/0.2.82 crate://crates.io/wasm-bindgen-shared/0.2.82 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-38.0.2.tar.gz file://0002-Cargo.toml-edition-2018-2021.patch file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/Inflector/0.11.4 crate://crates.io/aliasable/0.1.3 crate://crates.io/android_system_properties/0.1.5 crate://crates.io/asn1/0.12.2 crate://crates.io/asn1_derive/0.12.2 crate://crates.io/autocfg/1.1.0 crate://crates.io/base64/0.13.0 crate://crates.io/bitflags/1.3.2 crate://crates.io/bumpalo/3.10.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/chrono/0.4.22 crate://crates.io/core-foundation-sys/0.8.3 crate:/
 /crates.io/iana-time-zone/0.1.47 crate://crates.io/indoc-impl/0.3.6 crate://crates.io/indoc/0.3.6 crate://crates.io/instant/0.1.12 crate://crates.io/js-sys/0.3.59 crate://crates.io/libc/0.2.132 crate://crates.io/lock_api/0.4.8 crate://crates.io/log/0.4.17 crate://crates.io/num-integer/0.1.45 crate://crates.io/num-traits/0.2.15 crate://crates.io/once_cell/1.14.0 crate://crates.io/ouroboros/0.15.4 crate://crates.io/ouroboros_macro/0.15.4 crate://crates.io/parking_lot/0.11.2 crate://crates.io/parking_lot_core/0.8.5 crate://crates.io/paste-impl/0.1.18 crate://crates.io/paste/0.1.18 crate://crates.io/pem/1.1.0 crate://crates.io/proc-macro-error-attr/1.0.4 crate://crates.io/proc-macro-error/1.0.4 crate://crates.io/proc-macro-hack/0.5.19 crate://crates.io/proc-macro2/1.0.43 crate://crates.io/pyo3-build-config/0.15.2 crate://crates.io/pyo3-macros-backend/0.15.2 crate://crates.io/pyo3-macros/0.15.2 crate://crates.io/pyo3/0.15.2 crate://crates.io/quote/1.0.21 crate://crates.io/redox_syscall/0
 .2.16 crate://crates.io/scopeguard/1.1.0 crate://crates.io/smallvec/1.9.0 crate://crates.io/syn/1.0.99 crate://crates.io/unicode-ident/1.0.3 crate://crates.io/unindent/0.1.10 crate://crates.io/version_check/0.9.4 crate://crates.io/wasm-bindgen/0.2.82 crate://crates.io/wasm-bindgen-backend/0.2.82 crate://crates.io/wasm-bindgen-macro-support/0.2.82 crate://crates.io/wasm-bindgen-macro/0.2.82 crate://crates.io/wasm-bindgen-shared/0.2.82 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0"
packages/core2-32-poky-linux/python3-cryptography: PKGV changed from 38.0.1 [default] to 38.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "38.0.1" to "38.0.2"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1415440 to 1415540 (+0%)
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 38.0.1 [default] to 38.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "38.0.1" to "38.0.2"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 38.0.1 [default] to 38.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "38.0.1" to "38.0.2"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 38.0.1 [default] to 38.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "38.0.1" to "38.0.2"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 38.0.1 [default] to 38.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "38.0.1" to "38.0.2"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 38.0.1 [default] to 38.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "38.0.1" to "38.0.2"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 38.0.1 [default] to 38.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "38.0.1" to "38.0.2"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 38.0.1 [default] to 38.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography: PV changed from "38.0.1" to "38.0.2"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography: PKGSIZE changed from 4101297 to 4101152 (-0%)
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 38.0.1 [default] to 38.0.2 [default]
Changes to packages/core2-32-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.11/site-packages/cryptography-38.0.1.dist-info moved to /usr/lib/python3.11/site-packages/cryptography-38.0.2.dist-info

--===============5972367498499285611==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-upgrade-38.0.1-38.0.2.patch"

RnJvbSBkMjdiZDk2YTJmMDAwOWE0MzJkMWViMDNlYmQ0NzJlOWNiMTM2MWQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwOTo0MDozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5OiB1cGdyYWRlIDM4LjAuMSAtPiAzOC4wLjIKCi0tLQogLi4ubjMt
Y3J5cHRvZ3JhcGh5XzM4LjAuMS5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeV8zOC4wLjIuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jcnlwdG9ncmFwaHlf
MzguMC4xLmJiID0+IHB5dGhvbjMtY3J5cHRvZ3JhcGh5XzM4LjAuMi5iYn0gKDk4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5
XzM4LjAuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9n
cmFwaHlfMzguMC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHlfMzguMC4xLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5XzM4
LjAuMi5iYgppbmRleCA5MDUyOTNhNDNlLi4zMjIwZjY1MDIxIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5XzM4LjAuMS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5XzM4LjAu
Mi5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTtt
ZDU9YmY0MDVhODA1NmE2NjQ3ZTdkMDc3YjBlN2JjMzZhYmEgXAogICAgICAgICAgICAgICAgICAg
ICIKIExEU0hBUkVEICs9ICItcHRocmVhZCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFkYjNk
ODA3YTE0OTMxZmEzMTdmOTY0MzU2OTVkOWVjMzg2YmU3Yjg0YjYxOGNjNjFjZmE1ZDA4YjBhZTMz
ZDciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2EwMjJlYzg3YzdhOGJkYWQ5OWY1MTZhNGVlNmZm
Y2IzYTJiYzMxNDg3NTc3ZjllY2NiYzliMmVkYjFhOGZkNCIKIAogU1JDX1VSSSArPSAiXAogICAg
IGZpbGU6Ly8wMDAyLUNhcmdvLnRvbWwtZWRpdGlvbi0yMDE4LTIwMjEucGF0Y2ggXAotLSAKMi4z
MS4xCgo=

--===============5972367498499285611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.11/site-packages/cryptography-38.0.1.dist-info moved to /usr/lib/python3.11/site-packages/cryptography-38.0.2.dist-info

--===============5972367498499285611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 53 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0b81cbc5a5b8b28cf806c530d698face30e91739"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 102 Local 5 Mirrors 0 Missed 97 Current 330 (4% match, 77% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1000 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_fetch)
NOTE: Running task 1078 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_fetch)
NOTE: Running task 1106 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_fetch)
NOTE: Running task 1107 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_fetch)
NOTE: Running task 1139 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1140 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_fetch)
NOTE: Running task 1141 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_fetch)
NOTE: Running task 1142 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 1143 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_fetch)
NOTE: Running task 1149 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_fetch)
NOTE: Running task 1165 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1170 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1171 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_fetch)
NOTE: Running task 1172 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_fetch)
NOTE: Running task 1173 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1174 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1175 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1211 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_fetch)
NOTE: Running task 1212 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1233 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: Running task 1234 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_fetch)
NOTE: Running task 1235 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_fetch)
NOTE: Running task 1236 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 1237 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_fetch)
NOTE: Running task 1238 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1239 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_fetch)
NOTE: Running task 1240 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_fetch)
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1345 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_unpack)
NOTE: Running task 1346 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_unpack)
NOTE: Running task 1347 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1348 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 1349 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1350 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_unpack)
NOTE: Running task 1351 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_unpack)
NOTE: Running task 1352 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1353 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_unpack)
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1354 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_unpack)
NOTE: Running task 1355 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1356 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_unpack)
NOTE: Running task 1357 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1358 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1359 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1360 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_unpack)
NOTE: Running task 1361 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_unpack: Started
NOTE: Running task 1362 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: Running task 1363 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Started
NOTE: Running task 1364 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1365 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1366 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_unpack)
NOTE: Running task 1367 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_unpack)
NOTE: Running task 1368 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1369 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1370 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1371 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_unpack)
NOTE: Running task 1373 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1374 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1375 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1376 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1377 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_patch)
NOTE: Running task 1378 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_patch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1379 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: Running task 1380 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_patch)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1381 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_patch)
NOTE: Running task 1382 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: Running task 1383 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_patch)
NOTE: Running task 1384 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_patch)
NOTE: Running task 1385 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 1386 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_unpack: Started
NOTE: Running task 1387 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: Running task 1388 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: Running task 1389 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_unpack)
NOTE: Running task 1390 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_unpack)
NOTE: Running task 1391 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: Running task 1392 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_unpack)
NOTE: Running task 1393 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1394 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_unpack)
NOTE: Running task 1395 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_unpack)
NOTE: Running task 1396 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: Running task 1397 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1398 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Succeeded
NOTE: Running task 1399 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 1400 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1401 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: Running task 1402 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_patch: Started
NOTE: Running task 1403 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: Running task 1404 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_patch: Started
NOTE: Running task 1405 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: Running task 1406 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: Running task 1407 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1408 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_patch)
NOTE: Running task 1409 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_unpack: Started
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1410 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 1411 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Succeeded
NOTE: Running task 1412 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1413 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: Running task 1414 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1415 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1416 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: Running task 1417 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: Running task 1418 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1419 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: Running task 1420 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1421 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1422 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_patch: Started
NOTE: Running task 1423 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1424 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Started
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1425 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1426 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1427 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1428 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1429 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1430 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1431 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1432 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1433 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1434 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1435 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1436 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1437 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1438 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-attrs-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1439 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1440 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1441 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1442 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1443 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1444 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.4-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1445 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1446 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1447 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1448 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1449 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1450 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_configure)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure: Started
NOTE: Running task 1451 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1452 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: Running task 1453 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1454 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_configure)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_configure: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1455 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_configure_ptest_base)
NOTE: Running task 1456 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1457 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_configure_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1458 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure)
NOTE: Running task 1459 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1460 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Started
NOTE: Running task 1461 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-7.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: Running task 1462 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_configure_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_configure)
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Started
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1464 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_patch)
NOTE: Running task 1465 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_configure: Started
NOTE: Running task 1466 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Succeeded
NOTE: Running task 1467 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1468 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1469 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1470 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_compile)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1471 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-pytest-7.1.3-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Succeeded
NOTE: Running task 1472 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: Running task 1473 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_configure)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1474 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1475 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_patch)
NOTE: Running task 1476 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_compile)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1477 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 1478 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1479 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1480 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1481 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-attrs-22.1.0-r0: task do_configure: Started
NOTE: Running task 1482 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_rust_gen_targets)
NOTE: Running task 1483 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_compile)
NOTE: Running task 1484 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_compile)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Started
NOTE: Running task 1485 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: Running task 1486 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Started
NOTE: Running task 1487 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1488 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1489 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1490 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_compile)
NOTE: recipe python3-pytest-7.1.3-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_gen_targets: Started
NOTE: Running task 1491 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: Running task 1492 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1493 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: Running task 1494 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1495 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Started
NOTE: Running task 1496 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: Running task 1497 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 1498 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_compile)
NOTE: Running task 1499 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_configure: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: Running task 1500 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1501 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_rust_create_wrappers)
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Started
NOTE: Running task 1502 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_rust_gen_targets)
NOTE: Running task 1503 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_populate_lic)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_compile: Started
NOTE: Running task 1504 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_configure)
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1505 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Succeeded
NOTE: Running task 1506 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1507 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: Running task 1508 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_compile)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1509 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_populate_lic unihash changed to 8f2d92203b5d80a0e97cbd076e6c8e18d490a01fba1d6cf8e36db07659ad2a7f
NOTE: Running task 1510 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1511 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_compile: Succeeded
NOTE: Running task 1512 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_configure_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1513 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_compile)
NOTE: Running task 1514 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1515 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_compile_ptest_base)
NOTE: Running task 1516 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_compile_ptest_base)
NOTE: Running task 1517 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1518 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 1519 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: Running task 1520 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_compile_ptest_base)
NOTE: Running task 1521 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: Running task 1522 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile_ptest_base)
NOTE: Running task 1523 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1524 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile: Started
NOTE: Running task 1525 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_install)
NOTE: Running task 1526 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-pytz-2022.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1527 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: Running task 1528 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_install)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1529 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: Running task 1530 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Started
NOTE: Running task 1531 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: Running task 1532 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1533 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_install: Started
NOTE: Running task 1534 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Started
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Succeeded
NOTE: Running task 1535 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1536 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_install)
NOTE: recipe python3-attrs-22.1.0-r0: task do_install: Started
NOTE: Running task 1537 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: Running task 1538 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1539 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: Running task 1540 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 1541 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: Running task 1542 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 1543 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-packaging-21.3-r0: task do_install: Started
NOTE: Running task 1544 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1545 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: Running task 1546 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: Running task 1547 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_install_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1548 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install_ptest_base)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1549 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Started
NOTE: Running task 1550 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_install)
NOTE: recipe python3-attrs-22.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1551 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: Running task 1552 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_package)
NOTE: recipe python3-pytest-7.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1553 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_install)
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-packaging-21.3-r0: task do_install: Succeeded
NOTE: Running task 1554 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_install: Started
NOTE: Running task 1555 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: Running task 1556 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package)
NOTE: recipe python3-attrs-22.1.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_install: Succeeded
NOTE: Running task 1557 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_install_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_install: Started
NOTE: Running task 1558 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_install_ptest_base)
NOTE: Running task 1559 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_package)
NOTE: Running task 1560 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: Running task 1561 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-21.3-r0: task do_package: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1562 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_install)
NOTE: recipe python3-pytz-2022.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 1563 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_install)
NOTE: Running task 1564 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Succeeded
NOTE: Running task 1565 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_package)
NOTE: Running task 1566 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: Running task 1567 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_package)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Started
NOTE: Running task 1568 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1569 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1570 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: Running task 1571 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1572 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_install: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1573 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: Running task 1574 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: Running task 1575 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: Running task 1576 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: Running task 1577 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package)
NOTE: Running task 1578 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_install: Succeeded
NOTE: Running task 1579 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 1580 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_package: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Started
NOTE: Running task 1581 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1582 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: Running task 1583 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package: Started
NOTE: Running task 1584 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1585 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: Running task 1586 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package_write_rpm)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_install: Succeeded
NOTE: Running task 1587 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_package)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package: Succeeded
NOTE: Running task 1588 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata)
NOTE: recipe python3-attrs-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_package: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 1589 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_packagedata)
NOTE: Running task 1590 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata)
NOTE: Running task 1591 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata)
NOTE: Running task 1592 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1593 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 1594 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Succeeded
NOTE: Running task 1595 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: Running task 1596 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_packagedata)
NOTE: Running task 1597 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package: Succeeded
NOTE: Running task 1598 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_package: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1599 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1600 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_package: Succeeded
NOTE: Running task 1601 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata)
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1602 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package_write_rpm)
NOTE: Running task 1603 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1604 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1606 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Running task 1607 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Running task 1608 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1609 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1610 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1611 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1612 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install: Succeeded
NOTE: Running task 1613 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1614 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_package)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package: Succeeded
NOTE: Running task 1615 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1616 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1617 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1618 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_install)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install: Succeeded
NOTE: Running task 1619 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1620 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_package)
NOTE: Running task 1621 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_package: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1622 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1623 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1624 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_package: Succeeded
NOTE: Running task 1625 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_packagedata)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1626 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_install)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_install: Succeeded
NOTE: Running task 1627 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_package)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_package: Succeeded
NOTE: Running task 1628 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1628 tasks of which 1317 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-cryptography-vectors/38.0.1-r0/temp/log.do_packagedata.67955
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_packagedata) failed with exit code '1'

--===============5972367498499285611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1665 targets, 49 skipped, 0 masked, 0 errors.
Removing 34 recipes from the core2-32 sysroot...done.
Removing 61 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0b81cbc5a5b8b28cf806c530d698face30e91739"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 256 Local 159 Mirrors 0 Missed 97 Current 192 (62% match, 78% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 290 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.64.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.64.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 781 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_fetch)
NOTE: Running task 828 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_fetch)
NOTE: Running task 841 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_fetch)
NOTE: Running task 842 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_fetch)
NOTE: Running task 843 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 844 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 845 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_fetch)
NOTE: Running task 846 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_fetch)
NOTE: Running task 847 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_fetch)
NOTE: Running task 848 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_fetch)
NOTE: Running task 849 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 852 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_fetch)
NOTE: Running task 853 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_fetch)
NOTE: Running task 854 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 855 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 856 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 857 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 862 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 863 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_fetch)
NOTE: Running task 876 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_fetch)
NOTE: Running task 877 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_fetch)
NOTE: Running task 878 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_fetch)
NOTE: Running task 879 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_fetch)
NOTE: Running task 880 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_fetch)
NOTE: Running task 881 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 882 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 883 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libstd-rs-1.64.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.64.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 922 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 923 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_unpack)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 924 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 925 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_unpack)
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: Running task 926 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_unpack)
NOTE: Running task 927 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_unpack)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 928 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 929 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 930 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 931 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_unpack)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 932 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 933 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 934 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_unpack)
NOTE: Running task 935 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_unpack)
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 936 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_unpack)
NOTE: Running task 937 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_unpack)
NOTE: Running task 938 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_unpack)
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 939 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_unpack)
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: Running setscene task 301 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_packagedata_setscene)
NOTE: Running task 940 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_unpack)
NOTE: Running task 941 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 942 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_unpack)
NOTE: Running task 943 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_unpack)
NOTE: Running task 944 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_unpack)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.64.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_unpack: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: Running setscene task 303 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Started
NOTE: Running task 945 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_unpack)
NOTE: Running task 946 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: Running task 947 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 948 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: recipe python3-pytz-2022.4-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 949 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Started
NOTE: Running task 950 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 951 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 952 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_patch)
NOTE: Running task 953 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 954 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Succeeded
NOTE: Running task 955 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 956 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 957 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: recipe python3-pytz-2022.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 958 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_patch)
NOTE: Running task 959 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_patch)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Started
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 960 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_patch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 961 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 962 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_patch)
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: Running task 963 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: Running setscene task 304 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 964 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_patch)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 965 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_patch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 966 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 967 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_patch)
NOTE: Running task 968 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_patch)
NOTE: Running task 969 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: Running task 970 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_patch: Started
NOTE: Running task 971 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 311 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 972 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_patch)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.64.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Started
NOTE: Running setscene task 314 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 978 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Started
NOTE: Running task 979 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: Running task 980 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 981 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 982 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 983 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 984 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_patch: Succeeded
NOTE: Running task 985 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_patch: Succeeded
NOTE: Running task 986 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 987 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 988 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 989 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 990 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 994 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 996 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_patch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 997 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1003 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1006 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1007 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1009 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1010 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1011 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1016 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-7.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 325 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 330 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1025 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 339 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 354 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1034 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_patch)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 366 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_patch: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 371 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 374 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 378 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1068 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 381 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1097 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_patch)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 396 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_patch: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1106 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1107 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1108 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_rust_gen_targets)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 403 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1117 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1118 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_rust_gen_targets)
NOTE: Running task 1119 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_populate_lic)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_lic: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_populate_lic unihash changed to 8f2d92203b5d80a0e97cbd076e6c8e18d490a01fba1d6cf8e36db07659ad2a7f
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 417 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 423 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 426 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 432 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 442 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 445 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1351 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1395 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1400 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1401 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1425 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1429 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1430 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1431 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1432 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1439 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1452 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1453 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1454 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1455 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1456 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1462 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1463 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1472 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1473 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1474 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1475 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1476 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1477 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1478 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1480 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1510 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1511 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: Running task 1512 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1513 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure)
NOTE: Running task 1514 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1515 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1516 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1517 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_configure)
NOTE: Running task 1518 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_configure)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_configure: Started
NOTE: Running task 1519 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-attrs-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1520 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_rust_create_wrappers)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: Running task 1521 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: Running task 1522 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure: Started
NOTE: Running task 1523 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1524 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1525 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_configure: Succeeded
NOTE: Running task 1526 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_configure_ptest_base)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1527 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1528 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_configure_ptest_base)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: Running task 1529 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_create_wrappers: Started
NOTE: Running task 1530 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: Running task 1531 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_configure)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: Running task 1532 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 1533 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: Running task 1534 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_configure)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1535 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: Running task 1536 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_configure)
NOTE: Running task 1537 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_configure)
NOTE: recipe python3-pytest-7.1.3-r0: task do_configure: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1538 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_configure)
NOTE: Running task 1539 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_configure: Started
NOTE: Running task 1540 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_configure: Started
NOTE: Running task 1541 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_compile)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1542 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_compile)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Started
NOTE: Running task 1543 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_compile)
NOTE: Running task 1544 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1545 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_compile)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Started
NOTE: Running task 1546 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: Running task 1547 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1548 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1549 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_compile)
NOTE: Running task 1550 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_compile: Started
NOTE: Running task 1551 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Succeeded
NOTE: Running task 1552 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: Running task 1553 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_compile: Started
NOTE: Running task 1554 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: Running task 1555 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_compile)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1556 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: Running task 1557 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: Running task 1558 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile: Started
NOTE: Running task 1559 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: Running task 1560 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_compile)
NOTE: Running task 1561 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Started
NOTE: Running task 1562 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: Running task 1563 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: Running task 1564 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_configure_ptest_base)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Started
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_compile: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1565 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1566 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: Running task 1567 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: Running task 1568 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_compile)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1569 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1570 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1571 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1572 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_compile_ptest_base)
NOTE: Running task 1573 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_compile_ptest_base)
NOTE: Running task 1574 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: Running task 1575 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 1576 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: Running task 1577 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile_ptest_base)
NOTE: Running task 1578 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_compile_ptest_base)
NOTE: Running task 1579 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile_ptest_base)
NOTE: Running task 1580 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: Running task 1581 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_install)
NOTE: recipe python3-pytz-2022.4-r0: task do_compile_ptest_base: Started
NOTE: Running task 1582 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1583 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1584 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_install)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: Running task 1585 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_install)
NOTE: Running task 1586 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1587 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install)
NOTE: recipe python3-attrs-22.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1588 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_install)
NOTE: Running task 1589 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_install)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: Running task 1590 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install)
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Succeeded
NOTE: Running task 1591 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_install)
NOTE: recipe python3-packaging-21.3-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_install: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1592 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: Running task 1593 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1594 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: Running task 1595 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: Running task 1596 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_install)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1597 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 1598 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 1599 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: Running task 1600 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: Running task 1601 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-packaging-21.3-r0: task do_install: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_install: Started
NOTE: Running task 1602 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1603 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1604 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1605 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_install)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: Running task 1606 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: Running task 1607 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: Running task 1608 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_package)
NOTE: Running task 1609 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_install_ptest_base)
NOTE: recipe python3-packaging-21.3-r0: task do_package: Started
NOTE: Running task 1610 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install_ptest_base)
NOTE: Running task 1611 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-pytest-7.1.3-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1612 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_package)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_install: Succeeded
NOTE: Running task 1613 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_install_ptest_base)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1614 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_install)
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Started
NOTE: Running task 1615 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_package)
NOTE: Running task 1616 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_install_ptest_base)
NOTE: Running task 1617 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_package)
NOTE: Running task 1618 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1619 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_install)
NOTE: recipe python3-pytz-2022.4-r0: task do_install_ptest_base: Started
NOTE: Running task 1620 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1621 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_package)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 1622 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1623 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package)
NOTE: recipe python3-pytz-2022.4-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package: Started
NOTE: Running task 1624 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: recipe python3-pytest-7.1.3-r0: task do_install: Succeeded
NOTE: Running task 1625 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1626 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: Running task 1627 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package)
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_install: Succeeded
NOTE: Running task 1628 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_package)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1629 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: Running task 1630 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: Running task 1631 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 1632 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: Running task 1633 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: Running task 1634 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 1635 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: Running task 1636 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: Running task 1637 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: Running task 1638 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Started
NOTE: Running task 1639 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1640 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_package: Started
NOTE: recipe python3-packaging-21.3-r0: task do_package: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1641 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1642 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1643 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1644 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package_write_rpm)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1645 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_packagedata)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 1646 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata)
NOTE: Running task 1647 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata)
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package: Succeeded
NOTE: Running task 1648 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Started
NOTE: Running task 1649 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_packagedata)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1650 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata)
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 1651 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1652 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Started
NOTE: Running task 1653 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1654 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_package_write_rpm)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package: Succeeded
NOTE: Running task 1655 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata)
NOTE: Running task 1656 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1657 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1658 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_package: Succeeded
NOTE: Running task 1659 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_package: Succeeded
NOTE: Running task 1660 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_package_write_rpm)
NOTE: Running task 1661 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1662 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Running task 1663 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Running task 1664 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1665 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1666 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1667 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1668 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install: Succeeded
NOTE: Running task 1669 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1670 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_package)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package: Succeeded
NOTE: Running task 1671 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1672 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1673 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1674 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_install)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install: Succeeded
NOTE: Running task 1675 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1676 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_package)
NOTE: Running task 1677 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_package: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1678 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1679 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1680 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_package: Succeeded
NOTE: Running task 1681 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_packagedata)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1682 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_install)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_install: Succeeded
NOTE: Running task 1683 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_package)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_package: Succeeded
NOTE: Running task 1684 of 1688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1684 tasks of which 1373 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-cryptography-vectors/38.0.1-r0/temp/log.do_packagedata.174037
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_packagedata) failed with exit code '1'

--===============5972367498499285611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 63 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0b81cbc5a5b8b28cf806c530d698face30e91739"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 102 Local 5 Mirrors 0 Missed 97 Current 330 (4% match, 77% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1000 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_fetch)
NOTE: Running task 1078 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_fetch)
NOTE: Running task 1106 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_fetch)
NOTE: Running task 1107 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_fetch)
NOTE: Running task 1139 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1140 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 1141 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_fetch)
NOTE: Running task 1142 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_fetch)
NOTE: Running task 1143 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_fetch)
NOTE: Running task 1149 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_fetch)
NOTE: Running task 1165 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1170 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1171 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1172 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1173 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_fetch)
NOTE: Running task 1174 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1175 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_fetch)
NOTE: Running task 1211 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_fetch)
NOTE: Running task 1212 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1233 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: Running task 1234 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_fetch)
NOTE: Running task 1235 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_fetch)
NOTE: Running task 1236 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_fetch)
NOTE: Running task 1237 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_fetch)
NOTE: Running task 1238 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 1239 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_fetch)
NOTE: Running task 1240 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1345 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Started
NOTE: Running task 1346 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1347 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_unpack)
NOTE: Running task 1348 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_unpack)
NOTE: Running task 1349 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1350 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1351 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1352 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_unpack)
NOTE: Running task 1353 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_unpack)
NOTE: Running task 1354 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_unpack)
NOTE: Running task 1355 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_unpack)
NOTE: Running task 1356 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1357 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1358 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_unpack)
NOTE: Running task 1359 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1360 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_unpack)
NOTE: Running task 1361 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: Running task 1362 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1363 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.4-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_unpack: Started
NOTE: Running task 1364 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1365 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1366 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1367 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1368 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_unpack)
NOTE: Running task 1369 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1370 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_unpack)
NOTE: Running task 1371 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: Running task 1373 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_unpack)
NOTE: Running task 1374 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1375 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Started
NOTE: Running task 1376 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Started
NOTE: Running task 1377 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_unpack: Succeeded
NOTE: Running task 1378 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_unpack: Started
NOTE: Running task 1379 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1380 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_patch)
NOTE: Running task 1381 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_patch)
NOTE: Running task 1382 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_patch)
NOTE: Running task 1383 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: Running task 1384 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: Running task 1385 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_patch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1386 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1387 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1388 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1389 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Started
NOTE: Running task 1390 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 1391 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: Running task 1392 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: recipe python3-attrs-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: Running task 1393 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_patch)
NOTE: Running task 1394 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_unpack)
NOTE: Running task 1395 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_unpack)
NOTE: Running task 1396 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_unpack)
NOTE: Running task 1397 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_unpack)
NOTE: Running task 1398 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: Running task 1399 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_unpack)
NOTE: Running task 1400 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1401 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1402 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1403 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_patch: Started
NOTE: Running task 1404 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_patch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: Running task 1405 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: Running task 1406 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1407 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: Running task 1408 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Started
NOTE: Running task 1409 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Started
NOTE: Running task 1410 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Started
NOTE: Running task 1411 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Started
NOTE: Running task 1412 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: Running task 1413 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1414 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1415 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_patch)
NOTE: Running task 1416 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_patch)
NOTE: Running task 1417 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_patch)
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Succeeded
NOTE: Running task 1418 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1419 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_patch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1420 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1421 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1422 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1423 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_patch)
NOTE: recipe python3-pytz-2022.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Started
NOTE: Running task 1424 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1425 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1426 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1427 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Succeeded
NOTE: Running task 1428 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_patch: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1429 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1430 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1431 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1432 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1433 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1434 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1435 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: Running task 1436 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1437 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1438 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_patch)
NOTE: Running task 1439 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1440 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_configure)
NOTE: recipe python3-pytest-7.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1441 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1442 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1443 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_patch: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1444 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: Running task 1445 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1446 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1447 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1448 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1449 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-pytest-7.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1450 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1451 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1452 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_configure)
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1453 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1454 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_configure_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1455 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_configure_ptest_base)
NOTE: recipe python3-attrs-22.1.0-r0: task do_configure: Started
NOTE: Running task 1456 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: Running task 1457 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1458 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_configure)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1459 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1460 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1461 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: Running task 1462 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1463 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1464 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 1465 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1466 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe python3-pytz-2022.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 1467 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_patch)
NOTE: Running task 1468 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Started
NOTE: Running task 1469 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_compile)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1470 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pytz-2022.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1471 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: Running task 1472 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Started
NOTE: Running task 1473 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_compile)
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1474 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_configure_ptest_base)
NOTE: recipe python3-attrs-22.1.0-r0: task do_compile: Started
NOTE: Running task 1475 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure_ptest_base)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1476 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure_ptest_base)
NOTE: Running task 1477 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1478 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_patch)
NOTE: Running task 1479 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1480 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_compile: Started
NOTE: Running task 1481 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1482 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_rust_create_wrappers)
NOTE: Running task 1483 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_rust_gen_targets)
NOTE: Running task 1484 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1485 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: Running task 1486 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1487 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 1488 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: Running task 1489 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_configure)
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: Running task 1490 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_configure)
NOTE: Running task 1491 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_configure)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1492 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: Running task 1493 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_create_wrappers: Started
NOTE: Running task 1494 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Started
NOTE: Running task 1495 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile)
NOTE: Running task 1496 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_compile)
NOTE: Running task 1497 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile: Started
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1498 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Started
NOTE: Running task 1499 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1501 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_rust_create_wrappers)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_rust_gen_targets)
NOTE: Running task 1503 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_compile)
NOTE: Running task 1504 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1505 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_compile)
NOTE: Running task 1506 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_populate_lic)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Started
NOTE: Running task 1507 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_configure)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: Running task 1508 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1509 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_configure)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_populate_lic unihash changed to 8f2d92203b5d80a0e97cbd076e6c8e18d490a01fba1d6cf8e36db07659ad2a7f
NOTE: Running task 1510 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_compile)
NOTE: Running task 1512 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_configure_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1513 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_compile: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1514 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_compile)
NOTE: Running task 1515 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1516 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_compile_ptest_base)
NOTE: Running task 1517 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_compile_ptest_base)
NOTE: Running task 1518 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 1519 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: Running task 1520 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: Running task 1521 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_compile_ptest_base)
NOTE: Running task 1522 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: Running task 1523 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile_ptest_base)
NOTE: Running task 1524 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_install)
NOTE: Running task 1525 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Succeeded
NOTE: Running task 1526 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: Running task 1527 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_install)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1528 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: Running task 1529 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-pytz-2022.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1530 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_install)
NOTE: Running task 1531 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Started
NOTE: recipe python3-packaging-21.3-r0: task do_install: Started
NOTE: Running task 1532 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1533 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install)
NOTE: Running task 1534 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install: Started
NOTE: Running task 1535 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Started
NOTE: Running task 1536 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: Running task 1537 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: Running task 1538 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: Running task 1539 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1540 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 1541 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_install: Succeeded
NOTE: Running task 1542 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: Running task 1543 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: Running task 1544 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: recipe python3-pytest-7.1.3-r0: task do_compile: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1545 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 1546 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_install)
NOTE: Running task 1547 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: Running task 1548 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_package)
NOTE: Running task 1549 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package)
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Started
NOTE: Running task 1550 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: Running task 1551 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_install_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: Running task 1552 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_package: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_install: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Started
NOTE: Running task 1553 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install_ptest_base)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-packaging-21.3-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1554 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1555 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1556 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1557 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_package)
NOTE: recipe python3-pytz-2022.4-r0: task do_install: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: Running task 1558 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: Running task 1559 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package)
NOTE: Running task 1560 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_install_ptest_base)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Started
NOTE: Running task 1561 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Succeeded
NOTE: Running task 1562 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1563 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_package)
NOTE: recipe python3-pytz-2022.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1564 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_package)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1565 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1566 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_install)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_package: Started
NOTE: Running task 1567 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-pytest-7.1.3-r0: task do_install: Succeeded
NOTE: Running task 1568 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package)
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_install: Started
NOTE: Running task 1569 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1570 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1571 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1572 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: Running task 1573 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1574 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 1575 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: Running task 1576 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: Running task 1577 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: Running task 1578 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: Running task 1579 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_package)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: Running task 1581 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 1582 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: Running task 1583 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_package: Succeeded
NOTE: Running task 1584 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package: Started
NOTE: Running task 1585 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1586 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package_write_rpm)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1587 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_package: Succeeded
NOTE: Running task 1588 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_package)
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Started
NOTE: Running task 1589 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_packagedata)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package: Succeeded
NOTE: Running task 1590 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata)
NOTE: Running task 1591 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1592 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1593 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Started
NOTE: Running task 1594 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_packagedata)
NOTE: Running task 1595 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata)
NOTE: Running task 1596 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata)
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: Running task 1597 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_package: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Started
NOTE: Running task 1598 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Started
NOTE: Running task 1599 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1600 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1601 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.4-r0: task do_package: Succeeded
NOTE: Running task 1602 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1603 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1604 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_packagedata)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1606 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Running task 1607 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Running task 1608 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1609 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1610 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1611 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1612 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install: Succeeded
NOTE: Running task 1613 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1614 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_package)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package: Succeeded
NOTE: Running task 1615 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1616 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1617 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1618 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_install)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install: Succeeded
NOTE: Running task 1619 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1620 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_package)
NOTE: Running task 1621 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_package: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1622 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1623 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1624 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_package: Succeeded
NOTE: Running task 1625 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_packagedata)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1626 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_install)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_install: Succeeded
NOTE: Running task 1627 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_package)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_package: Succeeded
NOTE: Running task 1628 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1628 tasks of which 1317 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-cryptography-vectors/38.0.1-r0/temp/log.do_packagedata.101751
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_packagedata) failed with exit code '1'

--===============5972367498499285611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 70 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0b81cbc5a5b8b28cf806c530d698face30e91739"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 102 Local 5 Mirrors 0 Missed 97 Current 330 (4% match, 77% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1000 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_fetch)
NOTE: Running task 1078 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_fetch)
NOTE: Running task 1106 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_fetch)
NOTE: Running task 1107 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_fetch)
NOTE: Running task 1139 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1140 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_fetch)
NOTE: Running task 1141 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_fetch)
NOTE: Running task 1142 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_fetch)
NOTE: Running task 1143 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 1149 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_fetch)
NOTE: Running task 1165 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1170 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1171 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1172 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_fetch)
NOTE: Running task 1173 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1174 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_fetch)
NOTE: Running task 1175 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1211 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1212 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_fetch)
NOTE: Running task 1233 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_fetch)
NOTE: Running task 1234 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_fetch)
NOTE: Running task 1235 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_fetch)
NOTE: Running task 1236 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_fetch)
NOTE: Running task 1237 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1238 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_fetch)
NOTE: Running task 1239 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 1241 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1345 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: Running task 1346 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_unpack)
NOTE: Running task 1347 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1348 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_unpack)
NOTE: Running task 1349 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1350 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_unpack)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: Running task 1351 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_unpack)
NOTE: Running task 1352 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_unpack)
NOTE: Running task 1353 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: Running task 1354 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_unpack)
NOTE: Running task 1355 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1356 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_unpack)
NOTE: Running task 1357 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_unpack)
NOTE: Running task 1358 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1359 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1360 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1361 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: Running task 1362 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.4-r0: task do_unpack: Started
NOTE: Running task 1363 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1364 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1365 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1366 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1367 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_unpack)
NOTE: Running task 1368 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1369 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_unpack)
NOTE: Running task 1370 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1371 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1373 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_unpack)
NOTE: Running task 1374 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1375 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: Running task 1376 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1377 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_unpack: Started
NOTE: Running task 1378 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: Running task 1379 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_unpack: Succeeded
NOTE: Running task 1380 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_patch)
NOTE: Running task 1381 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_patch)
NOTE: Running task 1382 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_patch)
NOTE: Running task 1383 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_patch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1384 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: recipe python3-pytest-7.1.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1385 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_unpack)
NOTE: Running task 1386 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_unpack)
NOTE: Running task 1387 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_unpack)
NOTE: Running task 1388 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_unpack)
NOTE: Running task 1389 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1390 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_unpack)
NOTE: Running task 1391 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: Running task 1392 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_patch)
NOTE: Running task 1393 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: Running task 1394 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_unpack: Started
NOTE: Running task 1395 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_patch)
NOTE: Running task 1396 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1397 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-pytest-7.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: Running task 1398 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1399 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: Running task 1400 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_patch)
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1401 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: Running task 1402 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: Running task 1403 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_patch)
NOTE: Running task 1404 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.4-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Started
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Started
NOTE: Running task 1405 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_unpack: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: Running task 1406 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1407 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: Running task 1408 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_patch)
NOTE: Running task 1409 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_patch)
NOTE: Running task 1410 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_patch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1411 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: Running task 1412 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: Running task 1413 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: Running task 1414 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: Running task 1415 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: Running task 1416 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1417 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1418 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_patch)
NOTE: Running task 1419 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1420 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1421 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: Running task 1422 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1423 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1424 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: Running task 1425 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1426 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Succeeded
NOTE: Running task 1427 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-attrs-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1428 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1429 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1430 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1431 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1432 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1433 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1434 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1435 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1436 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1437 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1438 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1439 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1440 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1441 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1442 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_patch: Started
NOTE: Running task 1443 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1444 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_configure)
NOTE: recipe python3-pytest-7.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1445 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1446 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure)
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1447 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1448 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1449 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_configure)
NOTE: Running task 1450 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1451 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1452 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1453 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_configure_ptest_base)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1454 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure)
NOTE: recipe python3-pytest-7.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1455 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.4-r0: task do_configure: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1456 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1457 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1458 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_configure_ptest_base)
NOTE: Running task 1459 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1460 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1461 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: Running task 1462 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Started
NOTE: Running task 1463 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1464 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_patch)
NOTE: Running task 1465 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure_ptest_base)
NOTE: Running task 1466 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_configure_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1467 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: Running task 1468 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: Running task 1469 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1470 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_configure)
NOTE: Running task 1471 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_configure)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1472 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_compile)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1473 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure_ptest_base)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1474 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1475 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_compile)
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1476 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1477 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: Running task 1478 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Started
NOTE: Running task 1479 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1480 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile: Started
NOTE: Running task 1481 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_patch)
NOTE: Running task 1482 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile)
NOTE: Running task 1483 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1484 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_rust_create_wrappers)
NOTE: Running task 1485 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_rust_gen_targets)
NOTE: Running task 1486 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_compile: Started
NOTE: Running task 1487 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_compile)
NOTE: recipe python3-pytest-7.1.3-r0: task do_compile: Started
NOTE: Running task 1488 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1489 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_configure: Started
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Succeeded
NOTE: Running task 1490 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: Running task 1491 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1492 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile)
NOTE: Running task 1493 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_patch: Started
NOTE: Running task 1494 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_compile)
NOTE: Running task 1495 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1496 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: Running task 1497 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: Running task 1498 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_compile)
NOTE: Running task 1499 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_configure)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_compile)
NOTE: Running task 1501 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_configure: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1502 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1503 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1504 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_rust_create_wrappers)
NOTE: Running task 1505 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_rust_gen_targets)
NOTE: Running task 1506 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_populate_lic)
NOTE: Running task 1507 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_configure)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1508 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_compile)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1509 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_populate_lic unihash changed to 8f2d92203b5d80a0e97cbd076e6c8e18d490a01fba1d6cf8e36db07659ad2a7f
NOTE: recipe python3-cryptography-38.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1510 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure: Started
NOTE: Running task 1511 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1512 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_compile: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1513 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_configure_ptest_base)
NOTE: Running task 1514 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1515 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_compile_ptest_base)
NOTE: Running task 1516 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_compile_ptest_base)
NOTE: Running task 1517 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 1518 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: Running task 1519 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: Running task 1520 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile_ptest_base)
NOTE: Running task 1521 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: Running task 1522 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_compile_ptest_base)
NOTE: Running task 1523 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: Running task 1524 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_install)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1525 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_install)
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1526 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-pytz-2022.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: Running task 1527 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: Running task 1528 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1529 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1530 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_install)
NOTE: recipe python3-pytz-2022.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1531 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1532 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_install: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: Running task 1533 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install)
NOTE: recipe python3-packaging-21.3-r0: task do_install: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: Running task 1534 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_install)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Started
NOTE: Running task 1535 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Started
NOTE: Running task 1536 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install: Started
NOTE: Running task 1537 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: Running task 1538 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1539 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-packaging-21.3-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1540 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: Running task 1541 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: Running task 1542 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1543 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package)
NOTE: Running task 1544 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: Running task 1545 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: Running task 1546 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1547 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Succeeded
NOTE: Running task 1548 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_install)
NOTE: Running task 1549 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_install)
NOTE: Running task 1550 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install: Succeeded
NOTE: Running task 1551 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_install)
NOTE: Running task 1552 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install_ptest_base)
NOTE: Running task 1553 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_install_ptest_base)
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1554 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_install: Succeeded
NOTE: Running task 1555 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: Running task 1556 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_package)
NOTE: Running task 1557 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_install_ptest_base)
NOTE: Running task 1558 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_install_ptest_base)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1559 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package)
NOTE: Running task 1560 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_package)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Started
NOTE: Running task 1561 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1562 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1563 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_install)
NOTE: recipe python3-pytz-2022.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1564 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1565 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Succeeded
NOTE: Running task 1566 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: Running task 1567 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: Running task 1568 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: Running task 1569 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: Running task 1570 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package)
NOTE: Running task 1571 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Started
NOTE: Running task 1572 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package)
NOTE: Running task 1573 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_install: Succeeded
NOTE: Running task 1574 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 1575 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: Running task 1576 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_package: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Started
NOTE: Running task 1577 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 1578 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: Running task 1579 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: Running task 1580 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: Running task 1581 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-21.3-r0: task do_package: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1582 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: Running task 1583 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: Running task 1584 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1585 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1586 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package_write_rpm)
NOTE: Running task 1587 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: Running task 1588 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package_write_rpm)
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1589 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1590 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata)
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1591 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata)
NOTE: Running task 1592 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1593 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Started
NOTE: Running task 1594 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 1595 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Succeeded
NOTE: Running task 1596 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata)
NOTE: Running task 1597 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_packagedata)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_package: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1598 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata)
NOTE: Running task 1599 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1600 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_package_write_rpm)
NOTE: recipe python3-psutil-5.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1601 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_package: Succeeded
NOTE: Running task 1602 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package_write_rpm)
NOTE: Running task 1603 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1604 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_packagedata)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1606 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Running task 1607 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Running task 1608 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1609 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1610 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1611 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1612 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install: Succeeded
NOTE: Running task 1613 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1614 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_package)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package: Succeeded
NOTE: Running task 1615 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1616 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1617 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1618 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_install)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install: Succeeded
NOTE: Running task 1619 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1620 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_package)
NOTE: Running task 1621 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_package: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1622 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1623 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1624 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_package: Succeeded
NOTE: Running task 1625 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_packagedata)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1626 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_install)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_install: Succeeded
NOTE: Running task 1627 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_package)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_package: Succeeded
NOTE: Running task 1628 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1628 tasks of which 1317 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-cryptography-vectors/38.0.1-r0/temp/log.do_packagedata.135474
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_packagedata) failed with exit code '1'

--===============5972367498499285611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1666 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0b81cbc5a5b8b28cf806c530d698face30e91739"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 102 Local 5 Mirrors 0 Missed 97 Current 330 (4% match, 77% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1000 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_fetch)
NOTE: Running task 1078 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_fetch)
NOTE: Running task 1106 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_fetch)
NOTE: Running task 1107 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_fetch)
NOTE: Running task 1139 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1140 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 1141 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_fetch)
NOTE: Running task 1142 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_fetch)
NOTE: Running task 1143 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_fetch)
NOTE: Running task 1149 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_fetch)
NOTE: Running task 1165 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1170 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1171 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1172 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1173 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1174 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_fetch)
NOTE: Running task 1175 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_fetch)
NOTE: Running task 1211 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1212 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_fetch)
NOTE: Running task 1233 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: Running task 1234 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1235 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_fetch)
NOTE: Running task 1236 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_fetch)
NOTE: Running task 1237 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_fetch)
NOTE: Running task 1238 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 1239 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_fetch)
NOTE: Running task 1240 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_fetch)
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Started
NOTE: Running task 1345 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_unpack)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Started
NOTE: Running task 1346 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1347 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_unpack)
NOTE: Running task 1348 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 1349 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1350 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: Running task 1351 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_unpack)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1352 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1353 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_unpack)
NOTE: Running task 1354 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1355 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_unpack)
NOTE: Running task 1356 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_unpack)
NOTE: Running task 1357 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_unpack)
NOTE: Running task 1358 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_unpack)
NOTE: Running task 1359 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1360 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1361 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1362 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_unpack: Started
NOTE: Running task 1363 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: Running task 1364 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_unpack: Started
NOTE: Running task 1365 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1366 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1367 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1368 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1369 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_unpack)
NOTE: Running task 1370 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_unpack)
NOTE: Running task 1371 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1373 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_unpack)
NOTE: Running task 1374 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Started
NOTE: Running task 1375 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1376 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_patch)
NOTE: Running task 1377 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1378 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: Running task 1379 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1380 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_patch)
NOTE: Running task 1381 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1382 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: Running task 1383 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_patch)
NOTE: Running task 1384 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1385 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: Running task 1386 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1387 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_unpack)
NOTE: Running task 1388 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_unpack)
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Started
NOTE: Running task 1389 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_unpack)
NOTE: recipe python3-pytest-7.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1390 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_patch)
NOTE: Running task 1391 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: Running task 1392 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1393 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1394 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_unpack)
NOTE: Running task 1395 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_unpack)
NOTE: Running task 1396 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_unpack: Started
NOTE: Running task 1397 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: Running task 1398 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-attrs-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Succeeded
NOTE: Running task 1399 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 1400 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_patch: Started
NOTE: Running task 1401 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_patch)
NOTE: Running task 1402 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: Running task 1403 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: Running task 1404 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.4-r0: task do_patch: Started
NOTE: Running task 1405 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_patch)
NOTE: Running task 1406 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Started
NOTE: Running task 1407 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Started
NOTE: Running task 1408 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1409 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_patch)
NOTE: Running task 1410 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_unpack: Started
NOTE: Running task 1411 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1412 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: Running task 1413 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-21.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1414 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: Running task 1415 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_patch)
NOTE: Running task 1416 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: Running task 1417 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_patch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_patch: Started
NOTE: Running task 1418 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1419 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: Running task 1420 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_patch)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1421 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Started
NOTE: Running task 1422 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-attrs-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_patch: Succeeded
NOTE: Running task 1423 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1424 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_patch: Succeeded
NOTE: Running task 1425 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1426 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1427 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1428 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1429 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1430 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1431 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1432 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1433 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1434 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1435 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1436 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1437 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1438 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1439 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1440 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_patch)
NOTE: recipe python3-attrs-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1441 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1442 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1443 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1444 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1445 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1446 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1447 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1448 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure: Started
NOTE: Running task 1449 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1450 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1451 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.4-r0: task do_configure: Started
NOTE: Running task 1452 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure)
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: Running task 1453 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1454 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1455 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_configure)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1457 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_configure: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_configure: Started
NOTE: Running task 1458 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_patch)
NOTE: Running task 1459 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1460 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_configure_ptest_base)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1461 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: Running task 1462 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: Running task 1463 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1464 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Started
NOTE: Running task 1465 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1466 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1467 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: Running task 1468 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 1469 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe python3-pytest-7.1.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1470 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1471 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_patch)
NOTE: Running task 1472 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_compile)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1473 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_compile)
NOTE: Running task 1474 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1475 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: recipe python3-packaging-21.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 1476 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1477 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Started
NOTE: Running task 1478 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_configure)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: Running task 1479 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1480 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-pytest-7.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1481 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_rust_gen_targets)
NOTE: Running task 1482 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_compile: Started
NOTE: Running task 1483 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_compile)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_patch: Started
NOTE: Running task 1484 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: Running task 1485 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1486 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: Running task 1487 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Succeeded
NOTE: Running task 1488 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-pytz-2022.4-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1489 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_create_wrappers: Started
NOTE: Running task 1490 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_compile: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1491 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1492 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: Running task 1493 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_configure)
NOTE: Running task 1494 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 1495 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: Running task 1496 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_compile)
NOTE: Running task 1497 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1498 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1499 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Started
NOTE: Running task 1500 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_configure)
NOTE: Running task 1501 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_configure: Started
NOTE: Running task 1502 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1503 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_rust_create_wrappers)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: Running task 1504 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_rust_gen_targets)
NOTE: Running task 1505 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_populate_lic)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Started
NOTE: Running task 1506 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_configure: Started
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1507 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure: Started
NOTE: Running task 1508 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_compile)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1509 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_configure)
NOTE: Running task 1510 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_populate_lic unihash changed to 8f2d92203b5d80a0e97cbd076e6c8e18d490a01fba1d6cf8e36db07659ad2a7f
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1511 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1512 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_configure_ptest_base)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile: Started
NOTE: Running task 1513 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1514 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_compile)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1515 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_compile: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1516 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1517 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_compile_ptest_base)
NOTE: Running task 1518 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_compile_ptest_base)
NOTE: Running task 1519 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: Running task 1520 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 1521 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: Running task 1522 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile_ptest_base)
NOTE: Running task 1523 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile_ptest_base)
NOTE: Running task 1524 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_install)
NOTE: Running task 1525 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: Running task 1526 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_install)
NOTE: Running task 1527 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-packaging-21.3-r0: task do_compile: Succeeded
NOTE: Running task 1528 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-pytz-2022.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: Running task 1529 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_install)
NOTE: Running task 1530 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1531 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_install)
NOTE: Running task 1532 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_install)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1533 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install)
NOTE: recipe python3-attrs-22.1.0-r0: task do_install: Started
NOTE: Running task 1534 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Started
NOTE: recipe python3-packaging-21.3-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Started
NOTE: Running task 1535 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1536 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: Running task 1537 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: Running task 1538 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: Running task 1539 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1540 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 1541 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pytest-7.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1542 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: recipe python3-packaging-21.3-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: Running task 1543 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_install)
NOTE: Running task 1544 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_install_ptest_base)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1545 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1546 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: Running task 1547 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: Running task 1548 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_package)
NOTE: Running task 1549 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_package)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1550 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package)
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: Running task 1551 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: Running task 1552 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_install: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1553 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_install)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: Running task 1554 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_package: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_install: Started
NOTE: Running task 1555 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install_ptest_base)
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1556 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_package)
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1557 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_install_ptest_base)
NOTE: Running task 1558 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_install_ptest_base)
NOTE: Running task 1559 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_install)
NOTE: Running task 1560 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1561 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1562 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Started
NOTE: Running task 1563 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1564 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1565 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_package)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: Running task 1566 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_install)
NOTE: Running task 1567 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_package: Started
NOTE: Running task 1568 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package)
NOTE: Running task 1569 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: Running task 1570 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package)
NOTE: Running task 1571 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_package)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1572 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1573 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: Running task 1574 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: Running task 1575 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1576 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: Running task 1577 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: Running task 1578 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Succeeded
NOTE: Running task 1579 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: Running task 1580 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_package: Succeeded
NOTE: Running task 1581 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: Running task 1582 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: Running task 1583 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: Running task 1584 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Started
NOTE: Running task 1585 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1586 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_package)
NOTE: Running task 1587 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-attrs-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: Running task 1588 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_packagedata)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1589 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_package: Started
NOTE: Running task 1590 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata)
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1591 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package_write_rpm)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Started
NOTE: Running task 1592 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1593 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 1594 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Started
NOTE: Running task 1595 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1596 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_package: Succeeded
NOTE: Running task 1597 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_packagedata)
NOTE: Running task 1598 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1599 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.2-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1600 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1601 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package_write_rpm)
NOTE: Running task 1602 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-psutil-5.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1603 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1604 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_packagedata)
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1606 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Running task 1607 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Running task 1608 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1609 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1610 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1611 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1612 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install: Succeeded
NOTE: Running task 1613 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1614 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_package)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package: Succeeded
NOTE: Running task 1615 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1616 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1617 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1618 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_install)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install: Succeeded
NOTE: Running task 1619 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1620 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_package)
NOTE: Running task 1621 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_package: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1622 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1623 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1624 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_package: Succeeded
NOTE: Running task 1625 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.2.bb:do_packagedata)
NOTE: recipe python3-cryptography-38.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-38.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1626 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_install)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_install: Succeeded
NOTE: Running task 1627 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_package)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_package: Succeeded
NOTE: Running task 1628 of 1632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1628 tasks of which 1317 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-cryptography-vectors/38.0.1-r0/temp/log.do_packagedata.34209
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb:do_packagedata) failed with exit code '1'

--===============5972367498499285611==--

