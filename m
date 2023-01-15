Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E85BC7619A
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:32 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.145822.1673805742529754417
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ni2n8nID;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010185b698c2aa-9372e30d-5c45-43dc-8976-e40a8201011b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eMAiPaHsv6ubgSX1nuL0aeycKhk/X9irJXr+o2368rw=;
	b=Ni2n8nID0ZwVeor/xxSdVeB/RnliqwF2Rd3nmtENkml2TR7myZ8RVlCQkNaqqgob
	g9ayPpXwCzkqlkz7CzCgUamMMSyBjAwYpjttUHc6eu4j9W+sDPYBClsb4HhlBXqxcQ6
	n6buWf+d4esMt2VjQLPvC88rRhUHVo4fqNt4kPGw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eMAiPaHsv6ubgSX1nuL0aeycKhk/X9irJXr+o2368rw=;
	b=ZV8GRmDSFTrj15uGXK3ZeojX+fcnrYvlOFTnZDTsKjsFZGIB9HCr7Ehp548IgoYu
	suxXJDBvz/FOWNWpSlzLyvgydKGWu9QzNX08CybbrSJZmvy2a12FWHAChFfEr/9x0/H
	FzuBNajzmZB3VDq4aj/1t55CewBjnWz3ceBGzdc4=
Content-Type: multipart/mixed; boundary="===============3833215496949267358=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography: upgrading to 39.0.0 FAILED
Message-ID: <01010185b698c2aa-9372e30d-5c45-43dc-8976-e40a8201011b-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175898

--===============3833215496949267358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography* to *39.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-cryptography-upgrade-38.0.4-39.0.0.patch
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
--===============3833215496949267358==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-upgrade-38.0.4-39.0.0.patch"

RnJvbSA4ZTgyNTkxZDk3MzYyZGNkZmExNTkwMzY0Zjc0N2Y2NGVmODllYjI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTA6NTc6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeTogdXBncmFkZSAzOC4wLjQgLT4gMzkuMC4wCgotLS0KIC4uLm4z
LWNyeXB0b2dyYXBoeV8zOC4wLjQuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHlfMzkuMC4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY3J5cHRvZ3JhcGh5
XzM4LjAuNC5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeV8zOS4wLjAuYmJ9ICg5NSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eV8zOC4wLjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRv
Z3JhcGh5XzM5LjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5XzM4LjAuNC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeV8z
OS4wLjAuYmIKaW5kZXggNWQyNzllN2RiMS4uY2NhMTkyYmM4NCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeV8zOC4wLjQuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeV8zOS4w
LjAuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PWJmNDA1YTgwNTZhNjY0N2U3ZDA3N2IwZTdiYzM2YWJhIFwKICAgICAgICAgICAgICAgICAg
ICAiCiBMRFNIQVJFRCArPSAiLXB0aHJlYWQiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxNzVj
MWE4MThiODdjOWFjODBiYjczNzdmNTUyMGI3ZjMxYjNlZjJhMDAwNGUyNDIwMzE5YmVhZGVkYjY3
MjkwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY5NjRjN2RjZjc4MDJkMTMzZThkYmQxNTY1OTE0
ZmEwMTk0ZjlkNjgzZDgyNDExOTg5ODg5ZWNkNzAxZThhZGYiCiAKIFNSQ19VUkkgKz0gIlwKICAg
ICBmaWxlOi8vMDAwMi1DYXJnby50b21sLWVkaXRpb24tMjAxOC0yMDIxLnBhdGNoIFwKLS0gCjIu
MzcuMwoK

--===============3833215496949267358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1696 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1696 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0a3d2c0563e3d8772259245ff12fc1002e8eb0c9"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 95 Local 85 Mirrors 0 Missed 10 Current 336 (89% match, 97% complete)
Removing 2 stale sstate objects for arch core2-32...done.
Removing 1 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 373 of 431 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1008 of 1631 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_fetch)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1602 of 1631 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_unpack)
NOTE: Running task 1603 of 1631 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1604 of 1631 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_fetch)
NOTE: recipe python3-cryptography-39.0.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1605 of 1631 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1606 of 1631 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1608 of 1631 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_patch)
NOTE: recipe python3-cryptography-39.0.0-r0: task do_patch: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1609 of 1631 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1610 of 1631 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_rust_create_wrappers)
NOTE: Running task 1611 of 1631 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_rust_gen_targets)
NOTE: Running task 1612 of 1631 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_populate_lic)
NOTE: recipe python3-cryptography-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1613 of 1631 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_configure)
NOTE: recipe python3-cryptography-39.0.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1614 of 1631 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-39.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1615 of 1631 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| running bdist_wheel
| running build
| running build_py
| creating build
| creating build/lib.linux-x86_64-cpython-311
| creating build/lib.linux-x86_64-cpython-311/cryptography
| copying src/cryptography/exceptions.py -> build/lib.linux-x86_64-cpython-311/cryptography
| copying src/cryptography/utils.py -> build/lib.linux-x86_64-cpython-311/cryptography
| copying src/cryptography/__init__.py -> build/lib.linux-x86_64-cpython-311/cryptography
| copying src/cryptography/fernet.py -> build/lib.linux-x86_64-cpython-311/cryptography
| copying src/cryptography/__about__.py -> build/lib.linux-x86_64-cpython-311/cryptography
| creating build/lib.linux-x86_64-cpython-311/cryptography/hazmat
| copying src/cryptography/hazmat/_oid.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat
| copying src/cryptography/hazmat/__init__.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat
| creating build/lib.linux-x86_64-cpython-311/cryptography/x509
| copying src/cryptography/x509/general_name.py -> build/lib.linux-x86_64-cpython-311/cryptography/x509
| copying src/cryptography/x509/extensions.py -> build/lib.linux-x86_64-cpython-311/cryptography/x509
| copying src/cryptography/x509/oid.py -> build/lib.linux-x86_64-cpython-311/cryptography/x509
| copying src/cryptography/x509/name.py -> build/lib.linux-x86_64-cpython-311/cryptography/x509
| copying src/cryptography/x509/__init__.py -> build/lib.linux-x86_64-cpython-311/cryptography/x509
| copying src/cryptography/x509/ocsp.py -> build/lib.linux-x86_64-cpython-311/cryptography/x509
| copying src/cryptography/x509/certificate_transparency.py -> build/lib.linux-x86_64-cpython-311/cryptography/x509
| copying src/cryptography/x509/base.py -> build/lib.linux-x86_64-cpython-311/cryptography/x509
| creating build/lib.linux-x86_64-cpython-311/cryptography/hazmat/bindings
| copying src/cryptography/hazmat/bindings/__init__.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/bindings
| creating build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends
| copying src/cryptography/hazmat/backends/__init__.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends
| creating build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/padding.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/_serialization.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/cmac.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/hmac.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/_cipheralgorithm.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/poly1305.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/hashes.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/keywrap.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/constant_time.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/_asymmetric.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/__init__.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives
| creating build/lib.linux-x86_64-cpython-311/cryptography/hazmat/bindings/openssl
| copying src/cryptography/hazmat/bindings/openssl/_conditional.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/bindings/openssl
| copying src/cryptography/hazmat/bindings/openssl/binding.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/bindings/openssl
| copying src/cryptography/hazmat/bindings/openssl/__init__.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/bindings/openssl
| creating build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/dsa.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/rsa.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/ed25519.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/cmac.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/ciphers.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/hmac.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/ed448.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/x448.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/x25519.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/backend.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/dh.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/poly1305.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/hashes.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/utils.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/aead.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/decode_asn1.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/__init__.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/ec.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/backends/openssl
| creating build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/kdf
| copying src/cryptography/hazmat/primitives/kdf/kbkdf.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/kdf
| copying src/cryptography/hazmat/primitives/kdf/scrypt.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/kdf
| copying src/cryptography/hazmat/primitives/kdf/concatkdf.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/kdf
| copying src/cryptography/hazmat/primitives/kdf/x963kdf.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/kdf
| copying src/cryptography/hazmat/primitives/kdf/hkdf.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/kdf
| copying src/cryptography/hazmat/primitives/kdf/pbkdf2.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/kdf
| copying src/cryptography/hazmat/primitives/kdf/__init__.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/kdf
| creating build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/dsa.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/rsa.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/ed25519.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/padding.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/ed448.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/x448.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/x25519.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/dh.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/types.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/utils.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/__init__.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/ec.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/asymmetric
| creating build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/twofactor
| copying src/cryptography/hazmat/primitives/twofactor/hotp.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/twofactor
| copying src/cryptography/hazmat/primitives/twofactor/totp.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/twofactor
| copying src/cryptography/hazmat/primitives/twofactor/__init__.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/twofactor
| creating build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/serialization
| copying src/cryptography/hazmat/primitives/serialization/ssh.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/serialization
| copying src/cryptography/hazmat/primitives/serialization/pkcs7.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/serialization
| copying src/cryptography/hazmat/primitives/serialization/pkcs12.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/serialization
| copying src/cryptography/hazmat/primitives/serialization/__init__.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/serialization
| copying src/cryptography/hazmat/primitives/serialization/base.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/serialization
| creating build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/ciphers
| copying src/cryptography/hazmat/primitives/ciphers/algorithms.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/ciphers
| copying src/cryptography/hazmat/primitives/ciphers/modes.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/ciphers
| copying src/cryptography/hazmat/primitives/ciphers/aead.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/ciphers
| copying src/cryptography/hazmat/primitives/ciphers/__init__.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/ciphers
| copying src/cryptography/hazmat/primitives/ciphers/base.py -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/primitives/ciphers
| running egg_info
| writing src/cryptography.egg-info/PKG-INFO
| writing dependency_links to src/cryptography.egg-info/dependency_links.txt
| writing requirements to src/cryptography.egg-info/requires.txt
| writing top-level names to src/cryptography.egg-info/top_level.txt
| reading manifest file 'src/cryptography.egg-info/SOURCES.txt'
| reading manifest template 'MANIFEST.in'
| no previously-included directories found matching 'docs/_build'
| warning: no previously-included files found matching 'vectors'
| warning: no previously-included files matching '*' found under directory 'vectors'
| warning: no previously-included files matching '*' found under directory '.github'
| warning: no previously-included files found matching 'release.py'
| warning: no previously-included files found matching '.readthedocs.yml'
| warning: no previously-included files found matching 'dev-requirements.txt'
| warning: no previously-included files found matching 'tox.ini'
| warning: no previously-included files found matching 'mypy.ini'
| warning: no previously-included files matching '*' found under directory '.circleci'
| adding license file 'LICENSE'
| adding license file 'LICENSE.APACHE'
| adding license file 'LICENSE.BSD'
| adding license file 'LICENSE.PSF'
| writing manifest file 'src/cryptography.egg-info/SOURCES.txt'
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/39.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/command/build_py.py:202: SetuptoolsDeprecationWarning:     Installing 'cryptography.hazmat.bindings._rust' as data is deprecated, please list it in `packages`.
|     !!
| 
| 
|     ############################
|     # Package would be ignored #
|     ############################
|     Python recognizes 'cryptography.hazmat.bindings._rust' as an importable package,
|     but it is not listed in the `packages` configuration of setuptools.
| 
|     'cryptography.hazmat.bindings._rust' has been automatically added to the distribution only
|     because it may contain data files, but this behavior is likely to change
|     in future versions of setuptools (and therefore is considered deprecated).
| 
|     Please make sure that 'cryptography.hazmat.bindings._rust' is included as a package by using
|     the `packages` configuration field or the proper discovery methods
|     (for example by using `find_namespace_packages(...)`/`find_namespace:`
|     instead of `find_packages(...)`/`find:`).
| 
|     You can read more about "package discovery" and "data files" on setuptools
|     documentation page.
| 
| 
| !!
| 
|   check.warn(importable)
| copying src/cryptography/py.typed -> build/lib.linux-x86_64-cpython-311/cryptography
| copying src/cryptography/hazmat/bindings/_openssl.pyi -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/bindings
| creating build/lib.linux-x86_64-cpython-311/cryptography/hazmat/bindings/_rust
| copying src/cryptography/hazmat/bindings/_rust/__init__.pyi -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/bindings/_rust
| copying src/cryptography/hazmat/bindings/_rust/asn1.pyi -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/bindings/_rust
| copying src/cryptography/hazmat/bindings/_rust/ocsp.pyi -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/bindings/_rust
| copying src/cryptography/hazmat/bindings/_rust/pkcs7.pyi -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/bindings/_rust
| copying src/cryptography/hazmat/bindings/_rust/x509.pyi -> build/lib.linux-x86_64-cpython-311/cryptography/hazmat/bindings/_rust
| running build_ext
| running build_rust
| cargo rustc --lib --message-format=json-render-diagnostics --manifest-path src/rust/Cargo.toml --target i686-poky-linux-gnu --release -v --features pyo3/extension-module pyo3/abi3-py36 -- --crate-type cdylib
| error: failed to select a version for the requirement `asn1 = "^0.13.0"` (locked to 0.13.0)
| candidate versions found which didn't match: 0.12.2
| location searched: directory source `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/39.0.0-r0/cargo_home/bitbake` (which is replacing registry `crates-io`)
| required by package `cryptography-rust v0.1.0 (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/39.0.0-r0/cryptography-39.0.0/src/rust)`
| perhaps a crate was updated and forgotten to be re-vendored?
| 
|     =============================DEBUG ASSISTANCE=============================
|     If you are seeing a compilation error please try the following steps to
|     successfully install cryptography:
|     1) Upgrade to the latest pip and try again. This will fix errors for most
|        users. See: https://pip.pypa.io/en/stable/installing/#upgrading-pip
|     2) Read https://cryptography.io/en/latest/installation/ for specific
|        instructions for your platform.
|     3) Check our frequently asked questions for more information:
|        https://cryptography.io/en/latest/faq/
|     4) Ensure you have a recent Rust toolchain installed:
|        https://cryptography.io/en/latest/installation/#rust
| 
|     Python: 3.11.1
|     platform: Linux-4.18.0-425.3.1.el8.x86_64-x86_64-with-glibc2.36
|     pip: 22.3.1
|     setuptools: 65.6.3
|     setuptools_rust: 1.5.2
|     rustc: 1.66.0 (69f9c33d7 2022-12-12) (built from a source tarball)
|     =============================DEBUG ASSISTANCE=============================
| 
| error: `cargo rustc --lib --message-format=json-render-diagnostics --manifest-path src/rust/Cargo.toml --target i686-poky-linux-gnu --release -v --features 'pyo3/extension-module pyo3/abi3-py36' -- --crate-type cdylib` failed with code 101
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/39.0.0-r0/temp/run.do_compile.1106776:193 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/39.0.0-r0/temp/run.do_compile.1106776, line 193
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/39.0.0-r0/temp/run.do_compile.1106776, line 183
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/39.0.0-r0/temp/run.do_compile.1106776, line 165
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/39.0.0-r0/temp/run.do_compile.1106776, line 197
NOTE: recipe python3-cryptography-39.0.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1615 tasks of which 1601 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-39.0.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-cryptography-39.0.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/39.0.0-r0/temp/run.do_compile.1106776', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/39.0.0-r0/temp/log.do_compile.1106776
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_compile) failed with exit code '1'

--===============3833215496949267358==--

