Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42845C54ED4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:38 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.20326.1708018344524229734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=USYgGLSM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iXzzGGEZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018dadd3a3f5-ba777d53-a4ab-4af0-9353-a1c314f0e77f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xRHIKUt+mls8CYL8BPQk0XSxPlEUma8gyhdcF9Ic948=;
	b=USYgGLSMQwBUUDFSSQ6bTHEk9U3daeCBvuXajkvj3hRvrOpOckVrQsWP8fGVly9n
	PchMhQAk2JzC8QF4DjQTDTzCvFdM09IBz3ekmNhN+uNKtBl7FRWvNNseGKXevLkP+ci
	6jglYtLrGsRWMffFUw23A9tIHPD6xdXulijEGuJg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xRHIKUt+mls8CYL8BPQk0XSxPlEUma8gyhdcF9Ic948=;
	b=iXzzGGEZk40PSQX369wwL76SshorW4KIOp0S6pOI1hGD5HHsN9rF0g08u35ajzOS
	nxJb/gMEXcGJPtpI8O2OzIyEvTobw5c7YE1DprY09UWEHp8ABagxXVM05DjmoG75z+7
	d+b0eUZG0q+vA5yAHaNOnh8e7cybqascWdqB6D6Q=
Content-Type: multipart/mixed; boundary="===============3026507620542604086=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2024.1.31 SUCCEEDED
Message-ID: <0101018dadd3a3f5-ba777d53-a4ab-4af0-9353-a1c314f0e77f-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195593

--===============3026507620542604086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-trove-classifiers* to *2024.1.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2024.1.8-2024.1.31.patch
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
From 24d2c6f853bfa82e411fb00a2bfbff91e9bd5e4f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 08:32:34 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2024.1.8 -> 2024.1.31

---
 ...fiers_2024.1.8.bb => python3-trove-classifiers_2024.1.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.1.8.bb => python3-trove-classifiers_2024.1.31.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb
index 9e7e61a37e..332ab3bf40 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "6e36caf430ff6485c4b57a4c6b364a13f6a898d16b9417c6c37467e59c14b05a"
+SRC_URI[sha256sum] = "bfdfe60bbf64985c524416afb637ecc79c558e0beb4b7f52b0039e01044b0229"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.42.0


--===============3026507620542604086==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2024.1.8-2024.1.31.patch"

RnJvbSAyNGQyYzZmODUzYmZhODJlNDExZmIwMGEyYmZiZmY5MWU5YmQ1ZTRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDg6MzI6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjQuMS44IC0+IDIwMjQuMS4zMQoK
LS0tCiAuLi5maWVyc18yMDI0LjEuOC5iYiA9PiBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIw
MjQuMS4zMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXRy
b3ZlLWNsYXNzaWZpZXJzXzIwMjQuMS44LmJiID0+IHB5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNf
MjAyNC4xLjMxLmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI0LjEuOC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI0LjEuMzEuYmIK
c2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjQuMS44LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNC4x
LjMxLmJiCmluZGV4IDllN2U2MWEzN2UuLjMzMmFiM2JmNDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI0LjEuOC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3Np
ZmllcnNfMjAyNC4xLjMxLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dp
dGh1Yi5jb20vcHlwYS90cm92ZS1jbGFzc2lmaWVycyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3
OWJkODk4Njk2OGY0MzI3IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmUzNmNhZjQzMGZmNjQ4
NWM0YjU3YTRjNmIzNjRhMTNmNmE4OThkMTZiOTQxN2M2YzM3NDY3ZTU5YzE0YjA1YSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJiZmRmZTYwYmJmNjQ5ODVjNTI0NDE2YWZiNjM3ZWNjNzljNTU4ZTBi
ZWI0YjdmNTJiMDAzOWUwMTA0NGIwMjI5IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9v
bHNfYnVpbGRfbWV0YSBwdGVzdAogCi0tIAoyLjQyLjAKCg==

--===============3026507620542604086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2024.1.8.tar.gz;downloadfilename=trove-classifiers-2024.1.8.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2024.1.31.tar.gz;downloadfilename=trove-classifiers-2024.1.31.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 91544 to 91610 (+0%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/WHEEL was removed

--===============3026507620542604086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (0 cached, 914 parsed). 1858 targets, 46 skipped, 0 masked, 0 errors.
Removing 27 recipes from the core2-64 sysroot...done.
Removing 70 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-9e066d1f4f26c711b569f3229071590ef966297b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9e066d1f4f26c711b569f3229071590ef966297b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 557 Local 537 Mirrors 0 Missed 20 Current 242 (96% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 251 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 255 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 259 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-more-itertools_10.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 275 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_populate_lic_setscene)
NOTE: Running setscene task 277 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 278 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 279 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-importlib-metadata-7.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-23.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-more-itertools-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-69.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-7.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 280 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 281 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 282 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 283 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-importlib-metadata-7.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 284 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-7.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 288 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 290 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-23.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 297 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 298 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 308 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 311 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 312 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pluggy-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 320 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-setuptools/69.0.3/temp/log.do_packagedata_setscene.2692807
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 321 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb:do_package_setscene)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-7.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 322 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 329 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_package_setscene)
NOTE: Running setscene task 336 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 468 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: Running task 734 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_fetch)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 799 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_fetch)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 484 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 881 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_fetch)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_fetch: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_fetch: Succeeded
NOTE: Running task 960 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_unpack)
NOTE: recipe python3-setuptools-69.0.3-r0: task do_package_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 961 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_unpack)
NOTE: recipe python3-pytest-7.4.4-r0: task do_package_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 962 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_unpack)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_unpack: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 532 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1168 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_patch)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1245 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_patch)
NOTE: Running task 1268 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_patch)
NOTE: recipe python3-pytest-7.4.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 543 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 547 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: Running task 1288 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_patch: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-69.0.3-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 568 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 569 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1306 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1307 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-23.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-7.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 571 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-69.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-69.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running task 1343 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-pytest-7.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1364 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running setscene task 613 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: Running task 1385 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 626 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 637 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 642 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 643 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running setscene task 645 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 647 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 684 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 686 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 688 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 690 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 698 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 714 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 717 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 718 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1462 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 726 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 727 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 736 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1523 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 765 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1545 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running setscene task 788 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 789 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 5cbf1a65b46661f16e6624866f3055646723a70ae4cc4b12f3d5875ffa086775 to hashserv.yocto.io:8686 ({'taskhash': '5a90fd54a5c3db034eaf7b18236e2ecbbb4494184c352cacf8e219fdbb81ffa8', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5cbf1a65b46661f16e6624866f3055646723a70ae4cc4b12f3d5875ffa086775'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 5a90fd54a5c3db034eaf7b18236e2ecbbb4494184c352cacf8e219fdbb81ffa8 -> 5cbf1a65b46661f16e6624866f3055646723a70ae4cc4b12f3d5875ffa086775 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 794 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1888 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1964 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2116 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2199 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb:do_packagedata)
NOTE: Running task 2212 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_collect_spdx_deps)
NOTE: recipe python3-attrs-23.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-69.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-setuptools-69.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2238 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_configure)
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_configure: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2239 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_configure)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2240 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_configure: Succeeded
NOTE: Running task 2241 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_configure_ptest_base)
NOTE: recipe python3-attrs-23.2.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2242 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-attrs-23.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2243 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_compile)
NOTE: Running task 2244 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_configure_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_compile: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2245 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_compile)
NOTE: recipe python3-attrs-23.2.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2246 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_compile: Succeeded
NOTE: Running task 2247 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_compile_ptest_base)
NOTE: recipe python3-attrs-23.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2248 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_compile_ptest_base)
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2249 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_install)
NOTE: recipe python3-attrs-23.2.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2250 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_install)
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_install: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_install: Started
NOTE: Running task 2251 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_install: Succeeded
NOTE: Running task 2252 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_install_ptest_base)
NOTE: recipe python3-attrs-23.2.0-r0: task do_install: Succeeded
NOTE: Running task 2253 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_install_ptest_base)
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_install_ptest_base: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2254 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_package)
NOTE: Running task 2255 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_populate_sysroot)
NOTE: recipe python3-attrs-23.2.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2256 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_package)
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_populate_sysroot: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_package: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package unihash changed to 60e7739e0acb386fa35cf15d7ce9e010c1f1de57603231d921036d18ef4a53aa
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata became valid
NOTE: Running setscene task 799 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_package: Succeeded
NOTE: Running task 2258 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_packagedata)
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_packagedata: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_package unihash changed to 52326a26eafc5576948af6c508059ba50447019811e4ec39641282d7ae633830
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_package_write_ipk became valid
NOTE: Running setscene task 796 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 797 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 798 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_packagedata unihash changed to e8e336825f0c04b1d680cdb254032876ba77e087083fad16776c472adf25cc31
NOTE: recipe python3-pytest-7.4.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-7.4.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-7.4.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 2259 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_create_spdx)
NOTE: Running task 2260 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_package_write_ipk)
NOTE: Running task 2261 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_package_write_deb)
NOTE: Running task 2262 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_package_write_rpm)
NOTE: Running task 2263 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_package_qa)
NOTE: recipe python3-pytest-7.4.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 799 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_create_spdx: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_package_write_ipk: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_package_write_deb: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_package_write_rpm: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_package_qa: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_create_spdx: Succeeded
NOTE: Running task 2268 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_create_runtime_spdx)
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_package_qa unihash changed to c8d0cbee1469b3203e56b0e9e62ed532c59ef8edada1a15ca724c9b0c6bb7d01
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_package_write_ipk unihash changed to 20dc5ec0ea91ee1bd8ed02c9d09d96b3dc15516064ff4d3dd81010040b8f5b54
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_package_write_deb unihash changed to dbbffa48f4f68d60ff733a38b9333aa7a58f3be6b26cf18b53054b5f3584f800
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-trove-classifiers-2024.1.31-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_package_write_rpm unihash changed to ac95990849a0897d9929c6660544d7fc7edac48643a1bbbd9c2879bb6db202e8
NOTE: Running noexec task 2269 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb:do_build)
NOTE: Tasks Summary: Attempted 2269 tasks of which 2219 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-69.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:69.1.0-r0 to 0:69.0.3-r0) [version-going-backwards]
ERROR: python3-setuptools-69.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:69.1.0-r0 to 0:69.0.3-r0) [version-going-backwards]
ERROR: python3-setuptools-69.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:69.1.0-r0 to 0:69.0.3-r0) [version-going-backwards]
ERROR: python3-setuptools-69.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:69.1.0-r0 to 0:69.0.3-r0) [version-going-backwards]
ERROR: python3-setuptools-69.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:69.1.0-r0 to 0:69.0.3-r0) [version-going-backwards]
ERROR: python3-setuptools-69.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:69.1.0-r0 to 0:69.0.3-r0) [version-going-backwards]
ERROR: python3-setuptools-69.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:69.1.0-r0 to 0:69.0.3-r0) [version-going-backwards]
ERROR: python3-setuptools-69.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:69.1.0-r0 to 0:69.0.3-r0) [version-going-backwards]
ERROR: python3-setuptools-69.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3026507620542604086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/WHEEL was removed

--===============3026507620542604086==--

