Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E6ECD98F0
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 05:12:16 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14377.1782191529047865336
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 22:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cxLwJ8ai;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JQeLICHr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ef2e49822-0a6a1fc8-234a-4669-853c-88898de95f53-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782191528;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=c/Ip9hxofhNu9LuosIbX9K8hhU1akvJhmOx+szDA5Xg=;
	b=cxLwJ8aihOJttPx4958UCktfmEwmEUHr8cElv0HqItzDcaLyTOFIKxaUYn+xgahx
	LODA8yFgkHa4uFaaHpjZQteDij44FSTmSTepC2PF+54i7LLTP2rAGEj/zkKZJrn4a4e
	u/AZ6M0T32telneTAvWi3zvug8I7aEJDvDi4iuuc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782191528;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=c/Ip9hxofhNu9LuosIbX9K8hhU1akvJhmOx+szDA5Xg=;
	b=JQeLICHroxQ+vsZLHb07AYnpzDGnLOkDOZIQIPz0tmXpAE9+IBT4Q/VEv71GUvMK
	h125A71gYOy8YeFwG9t1Y/oOVG0d3nZAEYu1NA7QirbRvfSZVwges8YyypTLCD7DuTO
	F/lKgmE+Gnm3j90GP5H5i7ag/WHZLHtDLjVCfAII=
Content-Type: multipart/mixed; boundary="===============0548614394399727253=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-vcs-versioning: upgrading to 2.1.0 FAILED
Message-ID: <0101019ef2e49822-0a6a1fc8-234a-4669-853c-88898de95f53-000000@us-west-2.amazonses.com>
Date: Tue, 23 Jun 2026 05:12:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.23-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 05:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239332

--===============0548614394399727253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-vcs-versioning* to *2.1.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-vcs-versioning-upgrade-1.1.1-2.1.0.patch
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
From 7bdc045dd3dc475fb295de0f78c7a096597a12c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 23 Jun 2026 05:12:01 +0000
Subject: [PATCH] python3-vcs-versioning: upgrade 1.1.1 -> 2.1.0

---
 ...-vcs-versioning_1.1.1.bb => python3-vcs-versioning_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_1.1.1.bb => python3-vcs-versioning_2.1.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb
index 4d2f5007b4..b6ecfd861f 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "fabd75a3cab7dd8ac02fe24a3a9ba936bf258667b5a62ed468c9a1da0f5775bc"
+SRC_URI[sha256sum] = "66d9e2c2afd792090bc381aec985d6cd82cb935be35910a742e0af31ca4be61e"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.47.1


--===============0548614394399727253==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-vcs-versioning-upgrade-1.1.1-2.1.0.patch"

RnJvbSA3YmRjMDQ1ZGQzZGM0NzVmYjI5NWRlMGY3OGM3YTA5NjU5N2ExMmMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjMgSnVuIDIwMjYgMDU6MTI6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXZjcy12ZXJzaW9uaW5nOiB1cGdyYWRlIDEuMS4xIC0+IDIuMS4wCgotLS0KIC4uLi12
Y3MtdmVyc2lvbmluZ18xLjEuMS5iYiA9PiBweXRob24zLXZjcy12ZXJzaW9uaW5nXzIuMS4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdmNzLXZlcnNpb25p
bmdfMS4xLjEuYmIgPT4gcHl0aG9uMy12Y3MtdmVyc2lvbmluZ18yLjEuMC5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNp
b25pbmdfMS4xLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNz
LXZlcnNpb25pbmdfMi4xLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzEuMS4xLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNp
b25pbmdfMi4xLjAuYmIKaW5kZXggNGQyZjUwMDdiNC4uYjZlY2ZkODYxZiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzEuMS4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy12Y3MtdmVyc2lv
bmluZ18yLjEuMC5iYgpAQCAtNSw3ICs1LDcgQEAgbGlicmFyeSB0aGF0IGNhbiBiZSB1c2VkIGlu
ZGVwZW5kZW50bHkgb2Ygc2V0dXB0b29scy4iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT1jOWIwNmFkMmViZDdlMmU4MmQzNGIzY2Fm
MzUzZTdkNSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImZhYmQ3NWEzY2FiN2RkOGFjMDJmZTI0
YTNhOWJhOTM2YmYyNTg2NjdiNWE2MmVkNDY4YzlhMWRhMGY1Nzc1YmMiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNjZkOWUyYzJhZmQ3OTIwOTBiYzM4MWFlYzk4NWQ2Y2Q4MmNiOTM1YmUzNTkxMGE3
NDJlMGFmMzFjYTRiZTYxZSIKIAogU1JDX1VSSSArPSAiXAogICAgIGZpbGU6Ly9ydW4tcHRlc3Qg
XAotLSAKMi40Ny4xCgo=

--===============0548614394399727253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1978 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
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
DISTRO_VERSION       = "6.0.99+snapshot-724050d9cca09c4bc9b9bc9a94a906570bdcf0ce"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:724050d9cca09c4bc9b9bc9a94a906570bdcf0ce"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 621 Local 565 Mirrors 0 Missed 56 Current 300 (90% match, 93% complete)
done.
Removing 12 stale sstate objects for arch x86-64-v3...done.
Removing 6 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 453 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 472 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 489 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 494 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 513 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 549 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 572 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 582 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 585 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 596 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 605 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 610 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 612 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 618 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe git-2.54.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 621 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe git-2.54.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 636 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 642 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 671 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 808 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 847 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-typing-extensions-native-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 850 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 851 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 854 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 858 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 860 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 861 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 864 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-typing-extensions-native-4.15.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 872 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-editables-native-0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-typing-extensions-native-4.15.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-editables-native-0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1411 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_recipe_qa)
NOTE: Running task 1436 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_recipe_qa)
NOTE: Running task 1454 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_fetch)
NOTE: Running task 1524 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_fetch)
NOTE: Running task 1609 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_fetch)
NOTE: Running task 1611 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb:do_fetch)
NOTE: Running task 1620 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_fetch)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_recipe_qa: Started
NOTE: Running task 1839 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Started
NOTE: Running task 1854 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_fetch)
NOTE: Running task 1855 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_fetch)
NOTE: Running task 1856 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_fetch)
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_fetch: Started
NOTE: Running task 1920 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_unpack)
NOTE: Running task 1929 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1981 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_unpack)
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_fetch: Started
NOTE: Running task 2064 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-pygments-2.20.0-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_fetch: Started
NOTE: Running task 2122 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_unpack)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_unpack: Started
NOTE: Running task 2123 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_unpack)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_fetch: Succeeded
NOTE: Running task 2124 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_fetch)
NOTE: Running task 2125 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb:do_unpack)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 2126 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_patch)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 2127 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_patch)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2128 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_unpack)
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2129 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_unpack)
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2130 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_unpack)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_unpack: Started
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_patch: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 2131 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_patch)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_unpack: Started
NOTE: Running task 2132 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_unpack)
NOTE: Running task 2133 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_patch: Started
NOTE: Running task 2134 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_patch)
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2135 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb:do_patch)
NOTE: Running task 2136 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_patch)
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_unpack: Started
NOTE: Running task 2137 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_patch: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2139 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_patch)
NOTE: Running task 2140 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_patch)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 2142 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_unpack)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_unpack: Started
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Started
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2143 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_patch)
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_patch: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Started
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_unpack: Started
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_patch: Started
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2146 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_unpack)
NOTE: Running task 2147 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_patch: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_patch: Started
NOTE: Running task 2150 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_create_recipe_spdx)
NOTE: Running task 2151 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_create_recipe_spdx)
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_unpack: Started
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2154 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_patch)
NOTE: recipe python3-pygments-2.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 2155 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_patch)
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_patch: Started
NOTE: Running task 2156 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-pytest-9.1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_patch: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2158 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2159 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2160 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_populate_lic)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_populate_lic: Started
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pytest-9.1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2161 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_configure)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_configure: Started
NOTE: Running task 2162 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_configure)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_configure: Started
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2163 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_compile)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2164 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_configure_ptest_base)
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_compile: Started
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2165 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_compile)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_compile: Started
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2166 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_install)
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_install: Started
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2167 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_compile_ptest_base)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2168 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_install)
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_install: Succeeded
NOTE: Running task 2169 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_install: Started
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2170 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2171 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2172 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_create_spdx)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_create_spdx: Started
NOTE: Running task 2173 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_install_ptest_base)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-vcs-versioning-native-2.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2174 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_package)
NOTE: Running task 2175 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2176 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_configure)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2177 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_configure)
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_configure: Started
NOTE: Running task 2178 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile)
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2179 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_compile: Started
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_package: Succeeded
NOTE: Running task 2180 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_packagedata)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2181 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.1.0.bb:do_create_spdx)
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_create_spdx: Started
NOTE: recipe python3-vcs-versioning-2.1.0-r0: task do_create_spdx: Succeeded
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 333, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 48, in <module>
|   File "<string>", line 36, in _package_version
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/sources/setuptools_scm-10.0.5/src/setuptools_scm/_get_version.py", line 56, in get_version
|     return _get_version_public(
|         root=root,
|     ...<17 lines>...
|         scm=scm,
|     )
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_get_version_impl.py", line 304, in get_version
|     _version_missing(config)
|     ~~~~~~~~~~~~~~~~^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_get_version_impl.py", line 239, in _version_missing
|     raise LookupError(error_msg)
| LookupError: setuptools-scm was unable to detect version for /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/sources.
| 
| Make sure you're either building from a fully intact git repository or PyPI tarballs. Most other sources (such as GitHub's tarballs, a git checkout without the .git folder) don't contain the necessary metadata and will not work.
| 
| For example, if you're using pip, instead of https://github.com/user/proj/archive/master.zip use git+https://github.com/user/proj.git#egg=proj
| 
| Alternatively, set the version with the environment variable SETUPTOOLS_SCM_PRETEND_VERSION_FOR_${NORMALIZED_DIST_NAME} as described in https://setuptools-scm.readthedocs.io/en/latest/config/
| 
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/run.do_compile.1383162:154 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/sources/setuptools_scm-10.0.5'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/run.do_compile.1383162, line 154
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/run.do_compile.1383162, line 149
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/run.do_compile.1383162, line 158
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_compile: Failed
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 333, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 48, in <module>
|   File "<string>", line 36, in _package_version
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/sources/setuptools_scm-10.0.5/src/setuptools_scm/_get_version.py", line 56, in get_version
|     return _get_version_public(
|         root=root,
|     ...<17 lines>...
|         scm=scm,
|     )
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_get_version_impl.py", line 304, in get_version
|     _version_missing(config)
|     ~~~~~~~~~~~~~~~~^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_get_version_impl.py", line 239, in _version_missing
|     raise LookupError(error_msg)
| LookupError: setuptools-scm was unable to detect version for /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/sources.
| 
| Make sure you're either building from a fully intact git repository or PyPI tarballs. Most other sources (such as GitHub's tarballs, a git checkout without the .git folder) don't contain the necessary metadata and will not work.
| 
| For example, if you're using pip, instead of https://github.com/user/proj/archive/master.zip use git+https://github.com/user/proj.git#egg=proj
| 
| Alternatively, set the version with the environment variable SETUPTOOLS_SCM_PRETEND_VERSION_FOR_${NORMALIZED_DIST_NAME} as described in https://setuptools-scm.readthedocs.io/en/latest/config/
| 
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/run.do_compile.1383189:151 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/sources/setuptools_scm-10.0.5'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/run.do_compile.1383189, line 151
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/run.do_compile.1383189, line 146
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/run.do_compile.1383189, line 163
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2181 tasks of which 2115 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260623051139.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260623051139.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/log.do_compile.1383162
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/log.do_compile.1383189
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-scm-native-10.0.5-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/run.do_compile.1383162' failed with exit code 1
ERROR: python3-setuptools-scm-10.0.5-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/run.do_compile.1383189' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/log.do_compile.1383162
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/log.do_compile.1383189
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile) failed with exit code '1'

--===============0548614394399727253==--

