Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3E6C47086
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.2283.1651434543102246945
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=6mFvQXFH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010180812b544e-89e2f1a2-c75e-43d3-8aca-1338d6665f47-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a8LgDuSuE3thahNGrZxcyTFRsmIjUYD/4ii8lZXgyOc=;
	b=6mFvQXFHnAXJ/QhGQVb2ByLxO489uMSCnvGD4+wV9Optq07EJ9ypaJB23P39RtS0
	McxPvzAmqo9CEaaj/PeVe3z+eGOsbW/6hM+Bq7QX+/GMZRE51R9sbDTWzNohCtfJohc
	H6qAI2dREiVPy+/tND88RPyRlgm36B2HWHgFRCMY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a8LgDuSuE3thahNGrZxcyTFRsmIjUYD/4ii8lZXgyOc=;
	b=NGGDS9R1yoUbAiUUGCG1wmRp963jw9pAPDUjxff2xcXyn+82udp5rGqurcDjTplr
	PUGMc+5KUTcoZ3QYI01TXqSWcHXbZWtTJC4/y8oixljlZqaPIUM1M78CZi+hzZlnJVv
	TEl0QtYh9cRIW5ITDLd3A3qaoB6WMNKfUUEB2rgQ=
Content-Type: multipart/mixed; boundary="===============6053227886415845281=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography: upgrading to 37.0.1 FAILED
Message-ID: 
 <01010180812b544e-89e2f1a2-c75e-43d3-8aca-1338d6665f47-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165112

--===============6053227886415845281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography* to *37.0.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-cryptography-upgrade-36.0.2-37.0.1.patch
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
--===============6053227886415845281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1642 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-6e6c1479c45d113d8d0da45376a750d3e5ba72a9"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6e6c1479c45d113d8d0da45376a750d3e5ba72a9"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 101 Local 91 Mirrors 0 Missed 10 Current 345 (90% match, 97% complete)
Removing 2 stale sstate objects for arch core2-32...done.
Removing 1 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 382 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 394 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 984 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb:do_fetch)
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-vectors-36.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-vectors-36.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1350 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb:do_fetch)
NOTE: recipe python3-cryptography-37.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-37.0.1-r0: task do_fetch: Succeeded
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1557 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb:do_unpack)
NOTE: Running task 1563 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-36.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-36.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1646 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb:do_unpack)
NOTE: recipe python3-cryptography-37.0.1-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-37.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-36.0.2-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-37.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-36.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1647 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-36.0.2-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-36.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-37.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1649 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb:do_patch)
NOTE: recipe python3-cryptography-37.0.1-r0: task do_patch: Started
NOTE: recipe python3-cryptography-37.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1650 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1651 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb:do_rust_create_wrappers)
NOTE: Running task 1652 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb:do_populate_lic)
NOTE: recipe python3-cryptography-37.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-37.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-37.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-37.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-cryptography-37.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-37.0.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 1653 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-37.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-37.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1654 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-37.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-37.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1655 of 1671 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-37.0.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| running bdist_wheel
| running build
| running build_py
| creating build
| creating build/lib.linux-x86_64-3.10
| creating build/lib.linux-x86_64-3.10/cryptography
| copying src/cryptography/__about__.py -> build/lib.linux-x86_64-3.10/cryptography
| copying src/cryptography/exceptions.py -> build/lib.linux-x86_64-3.10/cryptography
| copying src/cryptography/fernet.py -> build/lib.linux-x86_64-3.10/cryptography
| copying src/cryptography/utils.py -> build/lib.linux-x86_64-3.10/cryptography
| copying src/cryptography/__init__.py -> build/lib.linux-x86_64-3.10/cryptography
| creating build/lib.linux-x86_64-3.10/cryptography/x509
| copying src/cryptography/x509/ocsp.py -> build/lib.linux-x86_64-3.10/cryptography/x509
| copying src/cryptography/x509/base.py -> build/lib.linux-x86_64-3.10/cryptography/x509
| copying src/cryptography/x509/extensions.py -> build/lib.linux-x86_64-3.10/cryptography/x509
| copying src/cryptography/x509/__init__.py -> build/lib.linux-x86_64-3.10/cryptography/x509
| copying src/cryptography/x509/name.py -> build/lib.linux-x86_64-3.10/cryptography/x509
| copying src/cryptography/x509/oid.py -> build/lib.linux-x86_64-3.10/cryptography/x509
| copying src/cryptography/x509/general_name.py -> build/lib.linux-x86_64-3.10/cryptography/x509
| copying src/cryptography/x509/certificate_transparency.py -> build/lib.linux-x86_64-3.10/cryptography/x509
| creating build/lib.linux-x86_64-3.10/cryptography/hazmat
| copying src/cryptography/hazmat/__init__.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat
| copying src/cryptography/hazmat/_oid.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat
| creating build/lib.linux-x86_64-3.10/cryptography/hazmat/backends
| copying src/cryptography/hazmat/backends/__init__.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends
| creating build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/padding.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/cmac.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/_serialization.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/_cipheralgorithm.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/hmac.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/__init__.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/keywrap.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/hashes.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/poly1305.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/constant_time.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives
| copying src/cryptography/hazmat/primitives/_asymmetric.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives
| creating build/lib.linux-x86_64-3.10/cryptography/hazmat/bindings
| copying src/cryptography/hazmat/bindings/__init__.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/bindings
| creating build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/cmac.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/x25519.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/x509.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/rsa.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/utils.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/hmac.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/__init__.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/hashes.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/aead.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/decode_asn1.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/ed448.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/backend.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/dh.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/ed25519.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/poly1305.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/ec.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/ciphers.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/dsa.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/x448.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| copying src/cryptography/hazmat/backends/openssl/encode_asn1.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/backends/openssl
| creating build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/kdf
| copying src/cryptography/hazmat/primitives/kdf/kbkdf.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/kdf
| copying src/cryptography/hazmat/primitives/kdf/x963kdf.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/kdf
| copying src/cryptography/hazmat/primitives/kdf/__init__.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/kdf
| copying src/cryptography/hazmat/primitives/kdf/scrypt.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/kdf
| copying src/cryptography/hazmat/primitives/kdf/concatkdf.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/kdf
| copying src/cryptography/hazmat/primitives/kdf/pbkdf2.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/kdf
| copying src/cryptography/hazmat/primitives/kdf/hkdf.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/kdf
| creating build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/ciphers
| copying src/cryptography/hazmat/primitives/ciphers/base.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/ciphers
| copying src/cryptography/hazmat/primitives/ciphers/__init__.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/ciphers
| copying src/cryptography/hazmat/primitives/ciphers/aead.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/ciphers
| copying src/cryptography/hazmat/primitives/ciphers/modes.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/ciphers
| copying src/cryptography/hazmat/primitives/ciphers/algorithms.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/ciphers
| creating build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/twofactor
| copying src/cryptography/hazmat/primitives/twofactor/totp.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/twofactor
| copying src/cryptography/hazmat/primitives/twofactor/__init__.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/twofactor
| copying src/cryptography/hazmat/primitives/twofactor/hotp.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/twofactor
| creating build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/padding.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/x25519.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/rsa.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/utils.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/__init__.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/ed448.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/dh.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/types.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/ed25519.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/ec.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/dsa.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/asymmetric
| copying src/cryptography/hazmat/primitives/asymmetric/x448.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/asymmetric
| creating build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/serialization
| copying src/cryptography/hazmat/primitives/serialization/base.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/serialization
| copying src/cryptography/hazmat/primitives/serialization/pkcs7.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/serialization
| copying src/cryptography/hazmat/primitives/serialization/__init__.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/serialization
| copying src/cryptography/hazmat/primitives/serialization/pkcs12.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/serialization
| copying src/cryptography/hazmat/primitives/serialization/ssh.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/primitives/serialization
| creating build/lib.linux-x86_64-3.10/cryptography/hazmat/bindings/openssl
| copying src/cryptography/hazmat/bindings/openssl/_conditional.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/bindings/openssl
| copying src/cryptography/hazmat/bindings/openssl/binding.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/bindings/openssl
| copying src/cryptography/hazmat/bindings/openssl/__init__.py -> build/lib.linux-x86_64-3.10/cryptography/hazmat/bindings/openssl
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
| warning: no previously-included files found matching '.coveragerc'
| warning: no previously-included files found matching 'codecov.yml'
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
| copying src/cryptography/py.typed -> build/lib.linux-x86_64-3.10/cryptography
| creating build/lib.linux-x86_64-3.10/cryptography/hazmat/bindings/_rust
| copying src/cryptography/hazmat/bindings/_rust/__init__.pyi -> build/lib.linux-x86_64-3.10/cryptography/hazmat/bindings/_rust
| copying src/cryptography/hazmat/bindings/_rust/asn1.pyi -> build/lib.linux-x86_64-3.10/cryptography/hazmat/bindings/_rust
| copying src/cryptography/hazmat/bindings/_rust/ocsp.pyi -> build/lib.linux-x86_64-3.10/cryptography/hazmat/bindings/_rust
| copying src/cryptography/hazmat/bindings/_rust/x509.pyi -> build/lib.linux-x86_64-3.10/cryptography/hazmat/bindings/_rust
| running build_ext
| running build_rust
| warning: target json file contains unused fields: has-elf-tls
| 
| warning: target json file contains unused fields: has-elf-tls
| 
| warning: build_rust: Forced Rust target `i686-poky-linux` is not compatible with deduced Rust target `i686-unknown-linux-gnu` - the built package  may not import successfully once installed.
| 
| warning: target json file contains unused fields: has-elf-tls
| 
| warning: target json file contains unused fields: has-elf-tls
| 
| error: failed to select a version for the requirement `ouroboros = "^0.15"`
| candidate versions found which didn't match: 0.13.0
| location searched: directory source `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/cargo_home/bitbake` (which is replacing registry `crates-io`)
| required by package `cryptography-rust v0.1.0 (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/cryptography-37.0.1/src/rust)`
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
|     Python: 3.10.4
|     platform: Linux-4.18.0-348.23.1.el8_5.x86_64-x86_64-with-glibc2.35
|     pip: n/a
|     setuptools: 59.5.0
|     setuptools_rust: 1.1.2
|     =============================DEBUG ASSISTANCE=============================
| 
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/cryptography-37.0.1/setup.py", line 39, in <module>
|     setup(
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/__init__.py", line 153, in setup
|     return distutils.core.setup(**attrs)
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/core.py", line 148, in setup
|     dist.run_commands()
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/dist.py", line 966, in run_commands
|     self.run_command(cmd)
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/dist.py", line 985, in run_command
|     cmd_obj.run()
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/wheel/bdist_wheel.py", line 299, in run
|     self.run_command('build')
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/cmd.py", line 313, in run_command
|     self.distribution.run_command(command)
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/dist.py", line 985, in run_command
|     cmd_obj.run()
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/command/build.py", line 135, in run
|     self.run_command(cmd_name)
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/cmd.py", line 313, in run_command
|     self.distribution.run_command(command)
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/dist.py", line 985, in run_command
|     cmd_obj.run()
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools_rust/setuptools_ext.py", line 132, in run
|     build_rust.run()
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools_rust/command.py", line 101, in run
|     self.run_for_extension(ext)
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools_rust/build.py", line 108, in run_for_extension
|     dylib_paths = self.build_extension(ext, self.target)
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools_rust/build.py", line 139, in build_extension
|     target_dir = _base_cargo_target_dir(ext)
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools_rust/build.py", line 673, in _base_cargo_target_dir
|     target_directory = ext._metadata()["target_directory"]
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools_rust/extension.py", line 200, in _metadata
|     self._cargo_metadata = json.loads(subprocess.check_output(metadata_command))
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/subprocess.py", line 420, in check_output
|     return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/subprocess.py", line 524, in run
|     raise CalledProcessError(retcode, process.args,
| subprocess.CalledProcessError: Command '['cargo', 'metadata', '--manifest-path', 'src/rust/Cargo.toml', '--format-version', '1']' returned non-zero exit status 101.
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/temp/run.do_compile.2804558:192 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/temp/run.do_compile.2804558, line 192
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/temp/run.do_compile.2804558, line 182
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/temp/run.do_compile.2804558, line 171
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/temp/run.do_compile.2804558, line 196
NOTE: recipe python3-cryptography-37.0.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1655 tasks of which 1642 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-cryptography-37.0.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-cryptography-37.0.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/temp/run.do_compile.2804558', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/37.0.1-r0/temp/log.do_compile.2804558
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb:do_compile) failed with exit code '1'

--===============6053227886415845281==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-cryptography-upgrade-36.0.2-37.0.1.patch"

From 0a5c4eaf576b43e7d981a11a8aa1b4c86260cda2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 10:13:24 +0000
Subject: [PATCH] python3-cryptography: upgrade 36.0.2 -> 37.0.1

---
 .../0001-Cargo.toml-specify-pem-version.patch |  12 +-
 .../fix-leak-metric.patch                     |  36 ------
 ....0.2.bb => python3-cryptography_37.0.1.bb} | 107 +++++++++---------
 3 files changed, 56 insertions(+), 99 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-cryptography/fix-leak-metric.patch
 rename meta/recipes-devtools/python/{python3-cryptography_36.0.2.bb => python3-cryptography_37.0.1.bb} (42%)

diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch b/meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
index d7ab757bb5..7266fd7bef 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
@@ -1,4 +1,4 @@
-From ec8d3f3c61280c8140b34ed1479baef5e706f064 Mon Sep 17 00:00:00 2001
+From d41203b9b79f5edc2d33b0d62921822294dfaa6b Mon Sep 17 00:00:00 2001
 From: Tim Orling <tim.orling@konsulko.com>
 Date: Fri, 14 Jan 2022 22:02:25 -0800
 Subject: [PATCH] Cargo.toml: specify pem version
@@ -9,23 +9,21 @@ pem = { version: "1.0.2"}
 Upstream-Status: Pending
 
 Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+
 ---
  src/rust/Cargo.toml | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/rust/Cargo.toml b/src/rust/Cargo.toml
-index 617167d0..174eaa80 100644
+index d17245d..f8f6416 100644
 --- a/src/rust/Cargo.toml
 +++ b/src/rust/Cargo.toml
 @@ -9,7 +9,7 @@ publish = false
  lazy_static = "1"
- pyo3 = { version = "0.15.1" }
+ pyo3 = { version = "0.15.2" }
  asn1 = { version = "0.8.7", default-features = false, features = ["derive"] }
 -pem = "1.0"
 +pem = { version = "1.0.2" }
  chrono = { version = "0.4", default-features = false, features = ["alloc", "clock"] }
- ouroboros = "0.13"
+ ouroboros = "0.15"
  
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/python/python3-cryptography/fix-leak-metric.patch b/meta/recipes-devtools/python/python3-cryptography/fix-leak-metric.patch
deleted file mode 100644
index 904984f43d..0000000000
--- a/meta/recipes-devtools/python/python3-cryptography/fix-leak-metric.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Trigger hashlib initialisation so that the test_create_certificate_with_extensions
-test doesn't fail.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From dc989d563ab6a078651160e5e6d4ee3df8cb08d7 Mon Sep 17 00:00:00 2001
-From: Alex Gaynor <alex.gaynor@gmail.com>
-Date: Thu, 7 Apr 2022 03:15:09 -0400
-Subject: [PATCH] Added Ubuntu Jammy to CI (#7047)
-
-* Added Ubuntu Jammy to CI
-
-* try thing
----
- .github/workflows/ci.yml                      | 1 +
- docs/installation.rst                         | 2 +-
- tests/hazmat/backends/test_openssl_memleak.py | 3 +++
- 3 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/tests/hazmat/backends/test_openssl_memleak.py b/tests/hazmat/backends/test_openssl_memleak.py
-index 835c9256a6..2605566bd5 100644
---- a/tests/hazmat/backends/test_openssl_memleak.py
-+++ b/tests/hazmat/backends/test_openssl_memleak.py
-@@ -82,8 +82,11 @@ def free(ptr, path, line):
-     assert result == 1
- 
-     # Trigger a bunch of initialization stuff.
-+    import hashlib
-     from cryptography.hazmat.backends.openssl.backend import backend
- 
-+    hashlib.sha256()
-+
-     start_heap = set(heap)
- 
-     try:
diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb
similarity index 42%
rename from meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography_37.0.1.bb
index 9ef5ff39c8..f078d31a95 100644
--- a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb
@@ -9,15 +9,58 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "70f8f4f7bb2ac9f340655cbac89d68c527af5bb4387522a8413e841e3e6628c9"
+SRC_URI[sha256sum] = "d610d0ee14dd9109006215c7c0de15eee91230b70a9bce2263461cf7c3720b83"
 
-SRC_URI += " \
-    file://run-ptest \
-    file://check-memfree.py \
-    file://0001-Cargo.toml-specify-pem-version.patch \
-    file://0002-Cargo.toml-edition-2018-2021.patch \
-    file://fix-leak-metric.patch \
-"
+SRC_URI += "file://run-ptest \
+           file://check-memfree.py \
+           file://0001-Cargo.toml-specify-pem-version.patch \
+           file://0002-Cargo.toml-edition-2018-2021.patch \
+           crate://crates.io/Inflector/0.11.4 \
+           crate://crates.io/aliasable/0.1.3 \
+           crate://crates.io/asn1/0.8.7 \
+           crate://crates.io/asn1_derive/0.8.7 \
+           crate://crates.io/autocfg/1.0.1 \
+           crate://crates.io/base64/0.13.0 \
+           crate://crates.io/bitflags/1.3.2 \
+           crate://crates.io/cfg-if/1.0.0 \
+           crate://crates.io/chrono/0.4.19 \
+           crate://crates.io/indoc-impl/0.3.6 \
+           crate://crates.io/indoc/0.3.6 \
+           crate://crates.io/instant/0.1.12 \
+           crate://crates.io/lazy_static/1.4.0 \
+           crate://crates.io/libc/0.2.120 \
+           crate://crates.io/lock_api/0.4.5 \
+           crate://crates.io/num-integer/0.1.44 \
+           crate://crates.io/num-traits/0.2.14 \
+           crate://crates.io/once_cell/1.9.0 \
+           crate://crates.io/ouroboros/0.13.0 \
+           crate://crates.io/ouroboros_macro/0.13.0 \
+           crate://crates.io/parking_lot/0.11.2 \
+           crate://crates.io/parking_lot_core/0.8.5 \
+           crate://crates.io/paste-impl/0.1.18 \
+           crate://crates.io/paste/0.1.18 \
+           crate://crates.io/pem/1.0.2 \
+           crate://crates.io/proc-macro-error-attr/1.0.4 \
+           crate://crates.io/proc-macro-error/1.0.4 \
+           crate://crates.io/proc-macro-hack/0.5.19 \
+           crate://crates.io/proc-macro2/1.0.36 \
+           crate://crates.io/pyo3-build-config/0.15.1 \
+           crate://crates.io/pyo3-macros-backend/0.15.1 \
+           crate://crates.io/pyo3-macros/0.15.1 \
+           crate://crates.io/pyo3/0.15.1 \
+           crate://crates.io/quote/1.0.14 \
+           crate://crates.io/redox_syscall/0.2.10 \
+           crate://crates.io/scopeguard/1.1.0 \
+           crate://crates.io/smallvec/1.7.0 \
+           crate://crates.io/stable_deref_trait/1.2.0 \
+           crate://crates.io/syn/1.0.85 \
+           crate://crates.io/unicode-xid/0.2.2 \
+           crate://crates.io/unindent/0.1.7 \
+           crate://crates.io/version_check/0.9.4 \
+           crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+           crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+           crate://crates.io/winapi/0.3.9 \
+           "
 
 inherit pypi python_setuptools3_rust
 
@@ -28,54 +71,6 @@ DEPENDS += " \
     ${PYTHON_PN}-six-native \
 "
 
-SRC_URI += " \
-    crate://crates.io/Inflector/0.11.4 \
-    crate://crates.io/aliasable/0.1.3 \
-    crate://crates.io/asn1/0.8.7 \
-    crate://crates.io/asn1_derive/0.8.7 \
-    crate://crates.io/autocfg/1.0.1 \
-    crate://crates.io/base64/0.13.0 \
-    crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/chrono/0.4.19 \
-    crate://crates.io/indoc-impl/0.3.6 \
-    crate://crates.io/indoc/0.3.6 \
-    crate://crates.io/instant/0.1.12 \
-    crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/libc/0.2.120 \
-    crate://crates.io/lock_api/0.4.5 \
-    crate://crates.io/num-integer/0.1.44 \
-    crate://crates.io/num-traits/0.2.14 \
-    crate://crates.io/once_cell/1.9.0 \
-    crate://crates.io/ouroboros/0.13.0 \
-    crate://crates.io/ouroboros_macro/0.13.0 \
-    crate://crates.io/parking_lot/0.11.2 \
-    crate://crates.io/parking_lot_core/0.8.5 \
-    crate://crates.io/paste-impl/0.1.18 \
-    crate://crates.io/paste/0.1.18 \
-    crate://crates.io/pem/1.0.2 \
-    crate://crates.io/proc-macro-error-attr/1.0.4 \
-    crate://crates.io/proc-macro-error/1.0.4 \
-    crate://crates.io/proc-macro-hack/0.5.19 \
-    crate://crates.io/proc-macro2/1.0.36 \
-    crate://crates.io/pyo3-build-config/0.15.1 \
-    crate://crates.io/pyo3-macros-backend/0.15.1 \
-    crate://crates.io/pyo3-macros/0.15.1 \
-    crate://crates.io/pyo3/0.15.1 \
-    crate://crates.io/quote/1.0.14 \
-    crate://crates.io/redox_syscall/0.2.10 \
-    crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/smallvec/1.7.0 \
-    crate://crates.io/stable_deref_trait/1.2.0 \
-    crate://crates.io/syn/1.0.85 \
-    crate://crates.io/unicode-xid/0.2.2 \
-    crate://crates.io/unindent/0.1.7 \
-    crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi/0.3.9 \
-"
-
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-asn1crypto \
     ${PYTHON_PN}-cffi \
-- 
2.27.0


--===============6053227886415845281==--

