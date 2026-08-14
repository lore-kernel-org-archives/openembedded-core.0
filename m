Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B08C5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:36:47 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7500.1786689403812042261
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 23:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aetg6iyu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BOLisDZP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ffefcb8c6-11cb1f64-9ce3-482d-8d0e-e03152af2c8e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786689403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pyDR6v3nqf6sPvblg6Kl5gv8/h1+MCe5n+Qu6kbikmQ=;
	b=aetg6iyueDKB0/IJ5xQn5K+PMxwWjFrP9REUlNUBqTQ0WdKTwHQp6L2IYF+SaEXy
	Z2xFJ2kv6LavFH0SPLXtLVBVCNxF5j/F6vjRpt3W3VjikYuLm/nvHsk0RNwU+AkGNCb
	llYT01XwtcuDBBADMSvoYvwhQ1eb8JBFJvWFWCoY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786689403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pyDR6v3nqf6sPvblg6Kl5gv8/h1+MCe5n+Qu6kbikmQ=;
	b=BOLisDZPJ3mNLkQyPJgN/7IRhj45LenIi9hw/d81AWrJQr2p7d6qE/RBOOlH+l2j
	9PahI0cXUtrQPDueMkxDiPs84RWSoBlAED7veFU2KxE0jXMpJE5qW/YX2iQnO9FJdQ9
	0letN13tDD9EEb5f+bnit17vQsQsVSipYqW52UG4=
Content-Type: multipart/mixed; boundary="===============1595469296292561333=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pbr: upgrading to 7.1.0 FAILED
Message-ID: <0101019ffefcb8c6-11cb1f64-9ce3-482d-8d0e-e03152af2c8e-000000@us-west-2.amazonses.com>
Date: Fri, 14 Aug 2026 06:36:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.14-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 06:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243409

--===============1595469296292561333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pbr* to *7.1.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pbr-upgrade-7.0.3-7.1.0.patch
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
From b89625e1e864de9564feba2edeec4acb89952205 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 14 Aug 2026 05:29:39 +0000
Subject: [PATCH] python3-pbr: upgrade 7.0.3 -> 7.1.0

Source: ChangeLog

7.1.0
-----

* Move pyproject.toml to the top of usage docs
* Docs and release note for setup.cfg/py removal
* Use PEP 508 inline markers for wheel builds
* Add support for local version as defined in PEP 440
* Add testing on resolute 3.15 (dev)
* Add python 3.14 support and testing
* functional tests: extend PYTHONPATH rather than replace it
* Hook in LocalSDist override
* Convert CapturedSubprocess, Venv fixtures to context managers
* Remove need for setup.cfg, setup.py
* Remove more unused code
* Avoid warning about setup.py deprecation
* Fix misspelled tests\_require in REMOVED\_KEYWORDS
* Fix tests
* Drop Jammy testing
* Add classifiers for latest Python

* Run py27 job with default ansible
---
 .../python/{python3-pbr_7.0.3.bb => python3-pbr_7.1.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pbr_7.0.3.bb => python3-pbr_7.1.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pbr_7.0.3.bb b/meta/recipes-devtools/python/python3-pbr_7.1.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pbr_7.0.3.bb
rename to meta/recipes-devtools/python/python3-pbr_7.1.0.bb
index 80092999fa..7fc227e6bb 100644
--- a/meta/recipes-devtools/python/python3-pbr_7.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pbr_7.1.0.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += "python3-setuptools"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "b46004ec30a5324672683ec848aed9e8fc500b0d261d40a3229c2d2bbfcedc29"
+SRC_URI[sha256sum] = "66ece3a2f5c4f05e5f37569213e755193f6e00b8aa361bfb190533ea8ee8b10c"
-- 
2.47.1


--===============1595469296292561333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pbr-7.0.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pbr-7.0.3.dist-info -> /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info, added "/usr/lib/python3.14/site-packages/pbr/__pycache__/pyprojecttoml.cpython-314.pyc /usr/lib/python3.14/site-packages/pbr/pyprojecttoml.py"
Changes to packages/x86-64-v3-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.14/site-packages/pbr-7.0.3.dist-info moved to /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info
  /usr/lib/python3.14/site-packages/pbr/__pycache__/pyprojecttoml.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pbr/pyprojecttoml.py was added

--===============1595469296292561333==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pbr-upgrade-7.0.3-7.1.0.patch"

RnJvbSBiODk2MjVlMWU4NjRkZTk1NjRmZWJhMmVkZWVjNGFjYjg5OTUyMjA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTQgQXVnIDIwMjYgMDU6Mjk6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBicjogdXBncmFkZSA3LjAuMyAtPiA3LjEuMAoKU291cmNlOiBDaGFuZ2VMb2cKCjcu
MS4wCi0tLS0tCgoqIE1vdmUgcHlwcm9qZWN0LnRvbWwgdG8gdGhlIHRvcCBvZiB1c2FnZSBkb2Nz
CiogRG9jcyBhbmQgcmVsZWFzZSBub3RlIGZvciBzZXR1cC5jZmcvcHkgcmVtb3ZhbAoqIFVzZSBQ
RVAgNTA4IGlubGluZSBtYXJrZXJzIGZvciB3aGVlbCBidWlsZHMKKiBBZGQgc3VwcG9ydCBmb3Ig
bG9jYWwgdmVyc2lvbiBhcyBkZWZpbmVkIGluIFBFUCA0NDAKKiBBZGQgdGVzdGluZyBvbiByZXNv
bHV0ZSAzLjE1IChkZXYpCiogQWRkIHB5dGhvbiAzLjE0IHN1cHBvcnQgYW5kIHRlc3RpbmcKKiBm
dW5jdGlvbmFsIHRlc3RzOiBleHRlbmQgUFlUSE9OUEFUSCByYXRoZXIgdGhhbiByZXBsYWNlIGl0
CiogSG9vayBpbiBMb2NhbFNEaXN0IG92ZXJyaWRlCiogQ29udmVydCBDYXB0dXJlZFN1YnByb2Nl
c3MsIFZlbnYgZml4dHVyZXMgdG8gY29udGV4dCBtYW5hZ2VycwoqIFJlbW92ZSBuZWVkIGZvciBz
ZXR1cC5jZmcsIHNldHVwLnB5CiogUmVtb3ZlIG1vcmUgdW51c2VkIGNvZGUKKiBBdm9pZCB3YXJu
aW5nIGFib3V0IHNldHVwLnB5IGRlcHJlY2F0aW9uCiogRml4IG1pc3NwZWxsZWQgdGVzdHNcX3Jl
cXVpcmUgaW4gUkVNT1ZFRFxfS0VZV09SRFMKKiBGaXggdGVzdHMKKiBEcm9wIEphbW15IHRlc3Rp
bmcKKiBBZGQgY2xhc3NpZmllcnMgZm9yIGxhdGVzdCBQeXRob24KCiogUnVuIHB5Mjcgam9iIHdp
dGggZGVmYXVsdCBhbnNpYmxlCi0tLQogLi4uL3B5dGhvbi97cHl0aG9uMy1wYnJfNy4wLjMuYmIg
PT4gcHl0aG9uMy1wYnJfNy4xLjAuYmJ9ICAgICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi97cHl0aG9uMy1wYnJfNy4wLjMuYmIgPT4gcHl0aG9uMy1wYnJfNy4xLjAuYmJ9ICg4
MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBi
cl83LjAuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYnJfNy4x
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBicl83LjAuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBicl83LjEuMC5iYgppbmRleCA4MDA5Mjk5OWZhLi43ZmMy
MjdlNmJiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cGJyXzcuMC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
YnJfNy4xLjAuYmIKQEAgLTEzLDQgKzEzLDQgQEAgUkRFUEVORFM6JHtQTn0gKz0gInB5dGhvbjMt
c2V0dXB0b29scyIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiYjQ2MDA0ZWMzMGE1MzI0NjcyNjgzZWM4NDhhZWQ5ZThmYzUwMGIw
ZDI2MWQ0MGEzMjI5YzJkMmJiZmNlZGMyOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2NmVjZTNh
MmY1YzRmMDVlNWYzNzU2OTIxM2U3NTUxOTNmNmUwMGI4YWEzNjFiZmIxOTA1MzNlYThlZThiMTBj
IgotLSAKMi40Ny4xCgo=

--===============1595469296292561333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pbr: PV changed from "7.0.3" to "7.1.0"
packages/x86-64-v3-poky-linux/python3-pbr: PKGV changed from 7.0.3 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pbr: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pbr/pbr-7.0.3.tar.gz;downloadfilename=pbr-7.0.3.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pbr/pbr-7.1.0.tar.gz;downloadfilename=pbr-7.1.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dbg: PV changed from "7.0.3" to "7.1.0"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dbg: PKGV changed from 7.0.3 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dev: PV changed from "7.0.3" to "7.1.0"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dev: PKGV changed from 7.0.3 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-doc: PV changed from "7.0.3" to "7.1.0"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-doc: PKGV changed from 7.0.3 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-locale: PV changed from "7.0.3" to "7.1.0"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-locale: PKGV changed from 7.0.3 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-src: PV changed from "7.0.3" to "7.1.0"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-src: PKGV changed from 7.0.3 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-staticdev: PV changed from "7.0.3" to "7.1.0"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-staticdev: PKGV changed from 7.0.3 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PV changed from "7.0.3" to "7.1.0"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pbr-7.0.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pbr-7.0.3.dist-info -> /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info, added "/usr/lib/python3.14/site-packages/pbr/pyprojecttoml.py /usr/lib/python3.14/site-packages/pbr/__pycache__/pyprojecttoml.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PKGV changed from 7.0.3 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PKGSIZE changed from 712352 to 740279 (+4%)
Changes to packages/x86-64-v3-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.14/site-packages/pbr-7.0.3.dist-info moved to /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info
  /usr/lib/python3.14/site-packages/pbr/__pycache__/pyprojecttoml.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pbr/pyprojecttoml.py was added

--===============1595469296292561333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pbr-changelog.txt"

Changelog for python3-pbr: 7.0.3 -> 7.1.0
Source: ChangeLog

7.1.0
-----

* Move pyproject.toml to the top of usage docs
* Docs and release note for setup.cfg/py removal
* Use PEP 508 inline markers for wheel builds
* Add support for local version as defined in PEP 440
* Add testing on resolute 3.15 (dev)
* Add python 3.14 support and testing
* functional tests: extend PYTHONPATH rather than replace it
* Hook in LocalSDist override
* Convert CapturedSubprocess, Venv fixtures to context managers
* Remove need for setup.cfg, setup.py
* Remove more unused code
* Avoid warning about setup.py deprecation
* Fix misspelled tests\_require in REMOVED\_KEYWORDS
* Fix tests
* Drop Jammy testing
* Add classifiers for latest Python

* Run py27 job with default ansible

--===============1595469296292561333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 955 .bb files complete (0 cached, 955 parsed). 1984 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-969db2abd044178c687603cfe6344b8f541f30d1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:969db2abd044178c687603cfe6344b8f541f30d1"
meta-yocto-bsp       
meta-poky            = "master:30756f716a1f527a74a9e12bad8f6e0e756ed9a4"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 514 Local 353 Mirrors 0 Missed 161 Current 220 (68% match, 78% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 233 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pbr_7.1.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 352 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 391 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 393 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 397 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 405 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 408 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 418 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 423 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 427 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 429 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 432 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 433 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pbr-7.1.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pbr-7.1.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 434 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 435 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 438 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 439 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 441 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 444 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 445 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 448 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 451 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 456 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe expat-2.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 458 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 461 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 462 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 469 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 471 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 473 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 476 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 478 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 479 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 480 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 483 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 484 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 485 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 492 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 493 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 496 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 498 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 504 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 506 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 510 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 514 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 517 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 521 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 525 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 527 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 530 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 531 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 532 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 537 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 538 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 539 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 540 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 542 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 545 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 550 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 552 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 554 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 557 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 559 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 565 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 567 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 570 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 572 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 574 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 575 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 576 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 577 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 578 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 579 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 587 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 589 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 591 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 592 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 594 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 596 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 598 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 600 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 601 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 602 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 606 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 608 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 609 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 610 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 612 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 614 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 615 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 616 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 617 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 618 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 629 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 630 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 631 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 634 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 635 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 636 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 637 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 638 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 642 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 643 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 644 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 645 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 646 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 647 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 648 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 656 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 659 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 660 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 661 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 662 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 665 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 667 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 668 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 669 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 670 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 671 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 672 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 673 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 675 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 676 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 678 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 679 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 680 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 681 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 682 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 683 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 696 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 697 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 698 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 671 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_fetch)
NOTE: Running task 677 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_fetch)
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 701 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: Running task 795 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_fetch)
NOTE: Running task 799 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 813 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 815 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_write_config)
NOTE: Running task 851 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 853 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_fetch)
NOTE: Running task 856 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_fetch)
NOTE: Running task 859 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: Running task 861 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 865 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: Running task 868 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_fetch)
NOTE: Running setscene task 703 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.6.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Started
NOTE: recipe attr-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 704 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: Running task 869 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_unpack)
NOTE: recipe openssl-3.5.7-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 870 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe xz-5.8.3-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.7-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_fetch: Started
NOTE: Running setscene task 706 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 871 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_unpack)
NOTE: Running task 872 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_unpack)
NOTE: recipe xz-5.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 873 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_unpack)
NOTE: recipe acl-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: Running task 876 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_unpack)
NOTE: Running task 878 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_fetch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 879 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_fetch)
NOTE: Running task 880 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_fetch)
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Succeeded
NOTE: Running task 882 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 888 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_patch)
NOTE: Running task 893 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe openssl-3.5.7-r0: task do_unpack: Started
NOTE: recipe xz-5.8.3-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Started
NOTE: recipe expat-2.8.3-r0: task do_unpack: Started
NOTE: recipe nettle-4.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Succeeded
NOTE: recipe nettle-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 895 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 896 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_unpack)
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Started
NOTE: Running task 897 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 709 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe attr-2.6.0-r0: task do_patch: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: recipe xz-5.8.3-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 710 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running task 898 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_patch: Started
NOTE: recipe expat-2.8.3-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_unpack: Started
NOTE: Running task 899 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: Running task 900 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: Running task 901 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: Running task 903 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: recipe acl-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 904 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 711 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_patch: Started
NOTE: Running task 906 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 907 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_unpack)
NOTE: Running task 908 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_unpack)
NOTE: recipe expat-2.8.3-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: Running task 909 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_unpack)
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_patch: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_patch: Started
NOTE: recipe xz-5.8.3-r0: task do_patch: Succeeded
NOTE: Running task 913 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: Running task 921 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Started
NOTE: recipe expat-2.8.3-r0: task do_patch: Succeeded
NOTE: Running task 923 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_generate_toolchain_file)
NOTE: recipe nettle-4.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 927 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: Running task 932 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: recipe acl-2.4.0-r0: task do_patch: Succeeded
NOTE: Running task 935 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_fetch)
NOTE: Running task 944 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_fetch)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe nettle-4.0-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: Running setscene task 719 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_fetch: Started
NOTE: recipe expat-2.8.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Started
NOTE: Running task 945 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Succeeded
NOTE: Running task 947 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_fetch)
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 948 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Succeeded
NOTE: Running task 949 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_patch)
NOTE: recipe nettle-4.0-r0: task do_patch: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 958 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_fetch)
NOTE: recipe json-c-0.19-r0: task do_fetch: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 722 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Started
NOTE: recipe curl-8.21.0-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 723 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 724 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 970 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running task 971 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 973 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 979 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Succeeded
NOTE: Running task 981 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_fetch)
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 732 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running task 982 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_patch)
NOTE: recipe curl-8.21.0-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 984 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_fetch)
NOTE: recipe openssl-3.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 985 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_patch)
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 990 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_fetch)
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1004 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_patch: Started
NOTE: Running task 1008 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1014 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: Running task 1065 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.14.7-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1066 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe python3-3.14.7-r0: task do_fetch: Succeeded
NOTE: Running task 1067 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.12.2-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.23.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1074 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1075 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 1076 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Started
WARNING: libunistring-1.4.2-r0 do_fetch: Failed to fetch URL https://ftpmirror.gnu.org/gnu/libunistring/libunistring-1.4.2.tar.gz, attempting MIRRORS if available
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe expat-2.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1077 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_patch: Succeeded
NOTE: Running task 1080 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1081 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1082 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1083 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: Running task 1084 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1085 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe expat-2.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: Running task 1086 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_configure)
NOTE: recipe libpam-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_configure: Started
NOTE: Running task 1087 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-c-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 1088 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: Running task 1089 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_unpack)
NOTE: Running task 1090 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1092 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe expat-2.8.3-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_fetch: Succeeded
NOTE: Running task 1093 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Succeeded
WARNING: libidn2-2.3.8-r0 do_fetch: Failed to fetch URL https://ftpmirror.gnu.org/gnu/libidn/libidn2-2.3.8.tar.gz, attempting MIRRORS if available
NOTE: Running task 1104 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: recipe libpsl-0.23.1-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_configure: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1105 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1106 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 1107 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure_ptest_base)
NOTE: Running task 1108 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_unpack)
NOTE: Running task 1109 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: Running task 1110 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1111 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_patch)
NOTE: Running task 1112 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_unpack)
NOTE: Running task 1114 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.1-r0: task do_patch: Started
NOTE: recipe json-c-0.19-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe json-c-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1115 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_patch)
NOTE: Running task 1116 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_patch: Succeeded
NOTE: Running task 1117 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_patch)
NOTE: Running task 1119 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1120 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_compile: Started
NOTE: recipe json-c-0.19-r0: task do_patch: Started
NOTE: Running task 1122 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1123 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1124 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1125 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1126 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_patch)
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1127 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Started
NOTE: Running task 1129 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 1131 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_configure)
NOTE: recipe libgpg-error-1.61-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_configure: Started
NOTE: Running task 1132 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_configure)
NOTE: Running task 1133 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe openssl-3.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1134 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_configure)
NOTE: recipe xz-5.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1135 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_configure)
NOTE: recipe attr-2.6.0-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 1136 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.61-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1137 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_configure)
NOTE: recipe openssl-3.5.7-r0: task do_configure: Started
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1138 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_configure)
NOTE: recipe xz-5.8.3-r0: task do_configure: Started
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.61-r0: task do_configure: Started
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1139 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_unpack)
NOTE: recipe ncurses-6.6-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1141 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe zlib-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1142 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile_ptest_base)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_configure: Succeeded
NOTE: Running task 1143 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_install)
NOTE: Running task 1144 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.3.2-r0: task do_install: Started
NOTE: recipe expat-2.8.3-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.8.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1145 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_compile)
NOTE: recipe expat-2.8.3-r0: task do_compile: Started
NOTE: recipe zlib-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1146 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_install_ptest_base)
NOTE: recipe zlib-1.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1148 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 1149 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_patch)
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Started
NOTE: recipe libffi-3.8.0-r0: task do_patch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Succeeded
NOTE: Running task 1150 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_patch)
NOTE: recipe libffi-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1154 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1155 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_configure: Succeeded
NOTE: Running task 1156 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_patch: Succeeded
NOTE: Running task 1157 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_compile: Started
NOTE: recipe python3-3.14.7-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1158 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.2-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.8.3-r0: task do_compile: Succeeded
NOTE: Running task 1159 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.7.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1160 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_compile)
NOTE: recipe expat-2.8.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_compile: Started
NOTE: recipe expat-2.8.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1161 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_install)
NOTE: recipe expat-2.8.3-r0: task do_install: Started
NOTE: recipe python3-3.14.7-r0: task do_unpack: Succeeded
NOTE: Running task 1162 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch)
NOTE: recipe python3-3.14.7-r0: task do_patch: Started
NOTE: recipe expat-2.8.3-r0: task do_install: Succeeded
NOTE: Running task 1163 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_unpack)
NOTE: recipe libgcrypt-1.12.2-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 1164 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe python3-3.14.7-r0: task do_patch: Succeeded
NOTE: Running task 1165 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_patch)
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1166 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.12.2-r0: task do_patch: Succeeded
NOTE: Running task 1167 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_write_config)
NOTE: recipe libpam-1.7.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpsl-0.23.1-r0: task do_write_config: Started
NOTE: recipe libpam-1.7.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_write_config: Succeeded
NOTE: Running task 1168 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_install)
NOTE: Running task 1181 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_install: Started
NOTE: Running task 1182 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1183 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_configure)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Succeeded
NOTE: Running task 1187 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1188 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe libffi-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1189 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe libffi-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: Running task 1190 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 1191 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_install_ptest_base)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.2-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1192 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_configure)
NOTE: recipe libpam-1.7.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_configure: Started
NOTE: Running task 1193 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1194 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.6.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1195 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_compile)
NOTE: recipe libseccomp-2.6.1-r0: task do_compile: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot unihash changed to 7137196b12d8ec9138eb8985b54c644a913808003499aeb60ef4525589ab2c27
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_populate_sysroot became valid
NOTE: Running setscene task 718 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running setscene task 729 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_configure: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_configure: Succeeded
NOTE: Running task 1196 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure_ptest_base)
NOTE: recipe shadow-4.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1197 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: Running task 1198 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_compile)
NOTE: recipe libgcrypt-1.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_compile: Started
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1199 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: Running task 1200 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile)
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1201 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_configure_ptest_base)
NOTE: recipe openssl-3.5.7-r0: task do_configure: Succeeded
NOTE: Running task 1202 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1203 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_configure_ptest_base: Started
NOTE: Running task 1204 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_compile)
NOTE: recipe libcap-2.78-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1205 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_compile)
NOTE: recipe attr-2.6.0-r0: task do_compile: Started
NOTE: recipe libcap-2.78-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_compile: Started
NOTE: Running task 1206 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_configure)
NOTE: recipe libcap-2.78-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1207 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe libcap-2.78-r0: task do_configure: Succeeded
NOTE: Running task 1208 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe libcap-2.78-r0: task do_configure_ptest_base: Started
NOTE: recipe libcap-2.78-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1209 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_compile)
NOTE: recipe libcap-2.78-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1211 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_configure)
NOTE: recipe attr-2.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1212 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_compile_ptest_base)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_configure: Started
NOTE: recipe attr-2.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1213 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_install)
NOTE: recipe attr-2.6.0-r0: task do_install: Started
NOTE: recipe gdbm-1.26-r0: task do_compile: Succeeded
NOTE: Running task 1214 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.6.0-r0: task do_install: Succeeded
NOTE: Running task 1215 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_install_ptest_base)
NOTE: recipe attr-2.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe attr-2.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1217 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1218 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install)
NOTE: recipe acl-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.26-r0: task do_install: Started
NOTE: recipe acl-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.78-r0: task do_compile: Succeeded
NOTE: Running task 1219 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_configure)
NOTE: Running task 1220 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_compile_ptest_base)
NOTE: recipe acl-2.4.0-r0: task do_configure: Started
NOTE: recipe libcap-2.78-r0: task do_compile_ptest_base: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1221 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.6.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.61-r0: task do_configure: Succeeded
NOTE: Running task 1222 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.61-r0: task do_configure_ptest_base: Started
NOTE: recipe libcap-2.78-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1223 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_install)
NOTE: Running task 1224 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_compile)
NOTE: recipe gdbm-1.26-r0: task do_install: Succeeded
NOTE: Running task 1225 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.61-r0: task do_compile: Started
NOTE: recipe libcap-2.78-r0: task do_install: Started
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1226 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_install)
NOTE: recipe xz-5.8.3-r0: task do_configure: Succeeded
NOTE: Running task 1227 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.6.1-r0: task do_install: Started
NOTE: recipe xz-5.8.3-r0: task do_configure_ptest_base: Started
NOTE: recipe xz-5.8.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1228 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_compile)
NOTE: recipe xz-5.8.3-r0: task do_compile: Started
NOTE: recipe libcap-2.78-r0: task do_install: Succeeded
NOTE: Running task 1229 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.6.1-r0: task do_install: Succeeded
NOTE: Running task 1232 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_install_ptest_base)
NOTE: recipe expat-2.8.3-r0: task do_install_ptest_base: Started
NOTE: recipe libcap-2.78-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.8.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1233 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_populate_sysroot)
NOTE: recipe libcap-2.78-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1236 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_install_ptest_base)
NOTE: recipe expat-2.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1240 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_generate_toolchain_file)
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1243 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1245 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: recipe json-c-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe json-c-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1246 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_configure)
NOTE: recipe json-c-0.19-r0: task do_configure: Started
NOTE: recipe libffi-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1247 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_compile)
NOTE: recipe libffi-3.8.0-r0: task do_compile: Started
NOTE: recipe xz-5.8.3-r0: task do_compile: Succeeded
NOTE: Running task 1248 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_compile_ptest_base)
NOTE: recipe xz-5.8.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libffi-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1249 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_install)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to bb3e956d2e2de1bc0af29a00e547e39e7ad4d6b624459afeb633ad02c5b0bcd6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx became valid
NOTE: Running setscene task 733 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_install: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 734 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1265 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_fetch)
NOTE: recipe lzlib-1.16-r0: task do_fetch: Started
NOTE: recipe libffi-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1268 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_fetch)
NOTE: recipe file-5.48-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1269 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe xz-5.8.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: Running task 1270 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_install)
NOTE: recipe xz-5.8.3-r0: task do_install: Started
NOTE: recipe acl-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1271 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.61-r0: task do_compile: Succeeded
NOTE: Running task 1272 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_compile_ptest_base)
NOTE: recipe acl-2.4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1273 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_compile)
NOTE: recipe libgpg-error-1.61-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.61-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1274 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_install)
NOTE: recipe acl-2.4.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.61-r0: task do_install: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1281 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1282 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_configure_ptest_base)
NOTE: recipe json-c-0.19-r0: task do_configure_ptest_base: Started
NOTE: recipe file-5.48-r0: task do_fetch: Succeeded
NOTE: Running task 1283 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: recipe json-c-0.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1284 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_compile: Started
NOTE: recipe acl-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1285 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_compile_ptest_base)
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1286 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: recipe acl-2.4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.61-r0: task do_install: Succeeded
NOTE: Running task 1287 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_install_ptest_base)
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_install_ptest_base: Started
NOTE: recipe json-c-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1288 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1289 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_fetch)
NOTE: recipe acl-2.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1291 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_fetch)
NOTE: Running task 1293 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1294 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_install)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.195-r0: task do_fetch: Started
NOTE: recipe acl-2.4.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1295 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_configure)
NOTE: recipe libgcrypt-1.12.2-r0: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 1300 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_unpack)
NOTE: recipe acl-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1301 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_install_ptest_base)
NOTE: recipe file-5.48-r0: task do_unpack: Started
NOTE: recipe acl-2.4.0-r0: task do_install_ptest_base: Started
NOTE: recipe acl-2.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1310 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe file-5.48-r0: task do_unpack: Succeeded
NOTE: Running task 1311 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_patch)
NOTE: recipe file-5.48-r0: task do_patch: Started
NOTE: recipe file-5.48-r0: task do_patch: Succeeded
NOTE: Running task 1312 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1313 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe xz-5.8.3-r0: task do_install: Succeeded
NOTE: Running task 1314 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_install_ptest_base)
NOTE: recipe xz-5.8.3-r0: task do_install_ptest_base: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1315 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1316 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: Running task 1317 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1318 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1319 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 1320 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.195-r0: task do_fetch: Succeeded
NOTE: Running task 1321 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Started
NOTE: recipe json-c-0.19-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.195-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1328 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_fetch)
NOTE: Running task 1329 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_install)
NOTE: recipe coreutils-9.11-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_install: Started
NOTE: recipe json-c-0.19-r0: task do_install: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1330 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_fetch)
NOTE: Running task 1332 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: recipe sed-4.10-r0: task do_fetch: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe elfutils-0.195-r0: task do_unpack: Succeeded
NOTE: Running task 1333 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_patch)
NOTE: recipe elfutils-0.195-r0: task do_patch: Started
NOTE: recipe elfutils-0.195-r0: task do_patch: Succeeded
NOTE: Running task 1335 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package)
NOTE: recipe zlib-1.3.2-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1336 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1338 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile: Succeeded
NOTE: Running task 1339 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_install)
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1340 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_install: Started
NOTE: recipe nettle-4.0-r0: task do_configure: Started
NOTE: recipe zlib-1.3.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package unihash changed to acda393c51222b148ad286fa76659af875e8e89595057328763f9790687fd2a0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata became valid
NOTE: Running setscene task 726 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_configure: Succeeded
NOTE: Running task 1341 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_compile)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 734 of 734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_compile: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1345 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1347 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1349 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1351 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1352 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1353 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1354 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1355 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1357 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_configure)
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Started
NOTE: recipe libunistring-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 1358 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_compile)
NOTE: recipe libunistring-1.4.2-r0: task do_compile: Started
NOTE: recipe nettle-4.0-r0: task do_configure: Succeeded
NOTE: Running task 1359 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure_ptest_base)
NOTE: recipe nettle-4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1360 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_compile)
NOTE: recipe nettle-4.0-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_configure: Succeeded
NOTE: Running task 1361 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_compile: Started
WARNING: libarchive-3.8.9-r0 do_fetch: Failed to fetch URL https://libarchive.org/downloads/libarchive-3.8.9.tar.gz, attempting MIRRORS if available
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_compile: Succeeded
NOTE: Running task 1362 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_install)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_configure: Succeeded
NOTE: Running task 1363 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.12.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1364 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_compile)
NOTE: recipe libgcrypt-1.12.2-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_install: Succeeded
NOTE: Running task 1366 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1367 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Failed
NOTE: Running noexec task 1368 of 1884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_configure)
NOTE: recipe ncurses-6.6-r0: task do_compile: Succeeded
NOTE: recipe nettle-4.0-r0: task do_compile: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_install: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_compile: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_compile: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.10-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
WARNING: coreutils-9.11-r0 do_fetch: Failed to fetch URL https://ftpmirror.gnu.org/gnu/coreutils/coreutils-9.11.tar.xz, attempting MIRRORS if available
NOTE: recipe coreutils-9.11-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_compile: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1368 tasks of which 1112 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260814052814.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260814052814.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.9/temp/log.do_fetch.3928093
Summary: There were 4 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libarchive-3.8.9-r0 do_fetch: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/libarchive-3.8.9.tar.gz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz', '--progress=dot', '--verbose'] failed with exit code 4, see logfile for output
ERROR: libarchive-3.8.9-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.9/temp/log.do_fetch.3928093
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch) failed with exit code '1'

--===============1595469296292561333==--

