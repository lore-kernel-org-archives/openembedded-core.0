Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398B5C55174
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 06:05:28 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.916.1785564318639609928
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 23:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TS1Os7/J;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eyrKL0Rs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019fbbed48b1-7b47af56-4690-4a24-8771-62261f97bf4d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785564318;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mo9Qn0yyWpWRbuYFOjIXPktRu7busgF5K0SBDgd33LU=;
	b=TS1Os7/J8ze+Hh7FK2YedlFKH/adgixHLTR6HcbEVV4pP454QeF4A+ltE/ijQVxG
	5cecSCJXNmpA7+pyZM2FeDCqvfmtqFQeTe/CEOq9pXglZCdZVOngWFiWnqDyDPRCT17
	wQIqnTbVx1Feueu23LN0anOSjkKmwZEvAn1KMTbE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785564318;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mo9Qn0yyWpWRbuYFOjIXPktRu7busgF5K0SBDgd33LU=;
	b=eyrKL0Rsw/Y8CP7mzNzgr5CYLRjdOaVNQF2tsqQHyBVFF9MkCWHVlvU5GJRbJVFX
	37mZ2/Sw9xcJa1BCElD1DccHbm1ilXrzUdluXVTxxE6dmEiK2f33nGlpGwhWDsrNACB
	STUcatB52bJby+ALXDEDF8yBAUuVr5Dhbe0VozGw=
Content-Type: multipart/mixed; boundary="===============2606839226438266767=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography,python3-cryptography-vectors: upgrading to
 50.0.0,50.0.0 FAILED
Message-ID: <0101019fbbed48b1-7b47af56-4690-4a24-8771-62261f97bf4d-000000@us-west-2.amazonses.com>
Date: Sat, 1 Aug 2026 06:05:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 06:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242459

--===============2606839226438266767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography,python3-cryptography-vectors* to *50.0.0,50.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-cryptography failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1988 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-69cf2fedb5a550366ccaafff994d3c98b0f18034"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:69cf2fedb5a550366ccaafff994d3c98b0f18034"
meta-yocto-bsp       
meta-poky            = "master:9c6cf36c3511b94957aba04002d98bec665e9f1e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...WARNING: /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/recipetool/tmp-recipetool-p8ezf6lk.bb: tmp-recipetool-p8ezf6lk: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-p8ezf6lk-CLOSED"
done.
Parsing of 957 .bb files complete (0 cached, 957 parsed). 1989 targets, 40 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-69cf2fedb5a550366ccaafff994d3c98b0f18034"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:69cf2fedb5a550366ccaafff994d3c98b0f18034"
meta-yocto-bsp       
meta-poky            = "master:9c6cf36c3511b94957aba04002d98bec665e9f1e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-p8ezf6lk: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-p8ezf6lk-CLOSED"
WARNING: tmp-recipetool-p8ezf6lk: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-p8ezf6lk-CLOSED"
WARNING: tmp-recipetool-p8ezf6lk: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-p8ezf6lk-CLOSED"
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: tmp-recipetool-p8ezf6lk: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-p8ezf6lk-CLOSED"
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  58% |#####################               | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-69cf2fedb5a550366ccaafff994d3c98b0f18034"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:69cf2fedb5a550366ccaafff994d3c98b0f18034"
meta-yocto-bsp       
meta-poky            = "master:9c6cf36c3511b94957aba04002d98bec665e9f1e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 29 Local 29 Mirrors 0 Missed 0 Current 58 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 292 tasks of which 291 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-50.0.0.tar.gz;downloadfilename=cryptography-50.0.0.tar.gz...
INFO: Rebasing devtool onto 883a837fd2addb1a32394e499fdfb053e2da8691
WARNING: Command 'git rebase 883a837fd2addb1a32394e499fdfb053e2da8691' failed:
Auto-merging pyproject.toml
CONFLICT (content): Merge conflict in pyproject.toml

You will need to resolve conflicts in order to complete the upgrade.
INFO: Running extra recipe upgrade task: do_update_crates
ERROR: When reparsing /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/python3-cryptography/python3-cryptography.bb:do_update_crates, the basehash value changed from fef8ca18792992c562db4247a5a95cc4fe145d2306d5ddb176f238d1809d4747 to b5ec6dcd10f171e3b81f748cd6dc8aa22e8a52fca539714ea303420f16a4dec0. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake python3-cryptography -cdo_update_crates -Snone
ERROR: Then:
ERROR: $ bitbake python3-cryptography -cdo_update_crates -Sprintdiff

ERROR: Taskhash mismatch dab261c4583f88d59aa8bffe348b3ba4274b92654b31dd63f936c626ef7ff2a1 versus c712e08ac8e7b361b840b901bd1a42d39624b0bdc35310c509af4687bef3cadf for /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/python3-cryptography/python3-cryptography.bb:do_update_crates
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/python3-cryptography
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/python3-cryptography/python3-cryptography.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/python3-cryptography.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2606839226438266767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-cryptography-changelog.txt"

Changelog for python3-cryptography: 49.0.0 -> 50.0.0
Source: CHANGELOG.rst

50.0.0 - 2026-07-31
~~~~~~~~~~~~~~~~~~~

* **SECURITY ISSUE**:
  :func:`~cryptography.hazmat.primitives.serialization.pkcs7.pkcs7_decrypt_der`
  and its PEM and S/MIME variants no longer expose distinguishable errors or
  timing when unwrapping a ``RecipientInfo``'s ``encryptedKey``, which could
  act as a Bleichenbacher oracle for callers that decrypt untrusted messages.
  A random key is now substituted on failure, as described in :rfc:`3218`.
  Credit to **@X1AOxiang** for reporting the issue
* Deprecated Diffie-Hellman key exchange over finite fields (FFDH).
  Everything FFDH is deprecated, including the types in
  ``cryptography.hazmat.primitives.asymmetric.dh`` and loading FFDH keys or
  parameters with the key loading APIs. Users should migrate to a more
  modern key exchange algorithm.
* Added ``xof()`` class methods to
  :class:`~cryptography.hazmat.primitives.hashes.SHAKE128` and
  :class:`~cryptography.hazmat.primitives.hashes.SHAKE256` for constructing
  algorithm instances configured for use with
  :class:`~cryptography.hazmat.primitives.hashes.XOFHash`.
* The :mod:`X.509 verification <cryptography.x509.verification>` APIs are now
  considered stable and are subject to our API stability policy.
* Added the :doc:`/cobblestone` recipe, an implementation of the
  Cobblestone-128 and Cobblestone-256 instantiations of the `C2SP
  chunked-encryption specification
  <https://c2sp.org/chunked-encryption>`_ for streaming authenticated
  encryption of large messages.
* Parsing a Signed Certificate Timestamp list now rejects encodings that
  carry trailing bytes after the list or after an individual SCT, instead of
  silently ignoring them.
* Added support for using :class:`~cryptography.x509.Name` as a field type in
  the :doc:`/hazmat/asn1/index` module.
* Loading a public key or an EC private key now rejects DER where the
  ``subjectPublicKey`` (or EC ``publicKey``) ``BIT STRING`` declares a non-zero
  number of unused bits, instead of silently ignoring it.
* Parsing a CRL entry's ``InvalidityDate`` extension now rejects a
  ``GeneralizedTime`` that carries fractional seconds or another non-DER form,
  matching the strict encoding already required for every other X.509 time
  field.
* :func:`~cryptography.x509.ocsp.load_der_ocsp_request` and
  :func:`~cryptography.x509.ocsp.load_der_ocsp_response` now reject a request
  or response whose ``version`` field is not ``v1``, the only version defined
  by RFC 6960, matching the version validation already performed when loading
  certificates, CSRs and CRLs.
* :class:`~cryptography.hazmat.primitives.hashes.XOFHash` is now supported
  when building against AWS-LC.
* HMAC (and therefore PBKDF2-HMAC) with SHA-3 hashes is now supported when
  building against AWS-LC.
* Diffie-Hellman (:doc:`/hazmat/primitives/asymmetric/dh`) is now supported
  when building against AWS-LC.
* :func:`~cryptography.hazmat.primitives.serialization.load_der_public_key` and
  :func:`~cryptography.hazmat.primitives.serialization.load_pem_public_key` now
  reject Diffie-Hellman public keys whose modulus is smaller than 512 bits,
  matching the minimum already enforced when loading DH private keys and when
  constructing :class:`~cryptography.hazmat.primitives.asymmetric.dh.DHParameterNumbers`.
* Added
  :class:`~cryptography.hazmat.primitives.asymmetric.mldsa.MLDSAMuHasher` for
  incrementally computing the ML-DSA ``mu`` (message representative) used by
  the external-mu signing and verification APIs.
* The builtin :class:`~cryptography.hazmat.primitives.hashes.HashAlgorithm`
  classes and the classes in
  :mod:`~cryptography.hazmat.primitives.asymmetric.padding` can now be
  compared with ``==``.
* :class:`~cryptography.x509.CertificateBuilder` now supports creating unsigned
  certificates (:rfc:`9925`) with the ``create_unsigned`` method.
* The :mod:`X.509 verification <cryptography.x509.verification>` APIs now
  permit ML-DSA-44, ML-DSA-65, and ML-DSA-87 (:rfc:`9881`) public keys and
  signatures by default.

--===============2606839226438266767==--

