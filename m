Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271A7C44507
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 05:52:38 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14772.1782798750983026743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 22:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rxBc4iWM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vqNu88E0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019f17161255-34d177a9-9aa2-494c-8425-cebca28f480c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782798750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W1mwWRCBAggDqnV6vjgZJg4yUMlXH3nXWNb033rk868=;
	b=rxBc4iWM+RaDy1dP6pRm+z+3qfH1wwNTjF30aM8ey3vQWCUc8z6X/0q5JDlLJqs8
	hvmEyw9zGZ+d/sfUHnV22bcTaKMbUKp2A76aavUABRJLzztvGb6F0DxljlYLPksgewf
	/GAzyLqb6AQ0hCg5Qp1ZlSXwODADIlavVDqnbczk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782798750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W1mwWRCBAggDqnV6vjgZJg4yUMlXH3nXWNb033rk868=;
	b=vqNu88E0L9dOCjMgZEza86/GK0ijvr7gAWv7CyF2b4M7rWh5d4YedkyYbpiI7zys
	0V7UniVHs+ARFH/MOSH+5SaBSK9NaLSeXhppt4qehdJ6V2d3aEuMHjyw63uHuSKE5Nw
	Nm1Q/huFvksv5Z6uVeqN7MpvCTDA/a4MK2WHEVIg=
Content-Type: multipart/mixed; boundary="===============0354188387827984547=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-vcs-versioning: upgrading to 2.2.2 FAILED
Message-ID: <0101019f17161255-34d177a9-9aa2-494c-8425-cebca28f480c-000000@us-west-2.amazonses.com>
Date: Tue, 30 Jun 2026 05:52:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.30-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 05:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239845

--===============0354188387827984547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-vcs-versioning* to *2.2.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-vcs-versioning-upgrade-1.1.1-2.2.2.patch
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
From c8166b21fa7f9bbe73505fa86bc7f164c5093448 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 30 Jun 2026 05:19:44 +0000
Subject: [PATCH] python3-vcs-versioning: upgrade 1.1.1 -> 2.2.2

---
 ...-vcs-versioning_1.1.1.bb => python3-vcs-versioning_2.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_1.1.1.bb => python3-vcs-versioning_2.2.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb
index 4d2f5007b4..300284e4c0 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "fabd75a3cab7dd8ac02fe24a3a9ba936bf258667b5a62ed468c9a1da0f5775bc"
+SRC_URI[sha256sum] = "4ac4ded78720cdb4d0291ae58ace87e1e9201912e1023f3029c6cce5c9152cfb"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.47.1


--===============0354188387827984547==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-vcs-versioning-upgrade-1.1.1-2.2.2.patch"

RnJvbSBjODE2NmIyMWZhN2Y5YmJlNzM1MDVmYTg2YmM3ZjE2NGM1MDkzNDQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMzAgSnVuIDIwMjYgMDU6MTk6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXZjcy12ZXJzaW9uaW5nOiB1cGdyYWRlIDEuMS4xIC0+IDIuMi4yCgotLS0KIC4uLi12
Y3MtdmVyc2lvbmluZ18xLjEuMS5iYiA9PiBweXRob24zLXZjcy12ZXJzaW9uaW5nXzIuMi4yLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdmNzLXZlcnNpb25p
bmdfMS4xLjEuYmIgPT4gcHl0aG9uMy12Y3MtdmVyc2lvbmluZ18yLjIuMi5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNp
b25pbmdfMS4xLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNz
LXZlcnNpb25pbmdfMi4yLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzEuMS4xLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNp
b25pbmdfMi4yLjIuYmIKaW5kZXggNGQyZjUwMDdiNC4uMzAwMjg0ZTRjMCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzEuMS4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy12Y3MtdmVyc2lv
bmluZ18yLjIuMi5iYgpAQCAtNSw3ICs1LDcgQEAgbGlicmFyeSB0aGF0IGNhbiBiZSB1c2VkIGlu
ZGVwZW5kZW50bHkgb2Ygc2V0dXB0b29scy4iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT1jOWIwNmFkMmViZDdlMmU4MmQzNGIzY2Fm
MzUzZTdkNSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImZhYmQ3NWEzY2FiN2RkOGFjMDJmZTI0
YTNhOWJhOTM2YmYyNTg2NjdiNWE2MmVkNDY4YzlhMWRhMGY1Nzc1YmMiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNGFjNGRlZDc4NzIwY2RiNGQwMjkxYWU1OGFjZTg3ZTFlOTIwMTkxMmUxMDIzZjMw
MjljNmNjZTVjOTE1MmNmYiIKIAogU1JDX1VSSSArPSAiXAogICAgIGZpbGU6Ly9ydW4tcHRlc3Qg
XAotLSAKMi40Ny4xCgo=

--===============0354188387827984547==
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
DISTRO_VERSION       = "6.0.99+snapshot-f3c9800f38b97e29504fcd09c64b71ced830e145"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f3c9800f38b97e29504fcd09c64b71ced830e145"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 501 Local 445 Mirrors 0 Missed 56 Current 420 (88% match, 93% complete)
done.
Removing 12 stale sstate objects for arch x86-64-v3...done.
Removing 6 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 574 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 645 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 671 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 674 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 689 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 703 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 753 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 786 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 808 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 815 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 817 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 821 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 827 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 828 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 830 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 833 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-82.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-26.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 834 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 837 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pytest-9.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-82.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 840 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 841 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 844 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 846 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 847 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-26.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 850 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_package_setscene)
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-typing-extensions-native-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 858 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 862 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 867 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 869 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 870 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 872 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 874 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 875 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 876 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 877 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 879 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 880 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 881 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-editables-native-0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.15.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-editables-native-0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-typing-extensions-native-4.15.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 885 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 886 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 902 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_recipe_qa_setscene)
NOTE: recipe python3-typing-extensions-native-4.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 906 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-build-native-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 910 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 911 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-typing-extensions-native-4.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-26.2-r0: task do_package_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-build-native-1.5.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 918 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1385 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_recipe_qa)
NOTE: Running task 1406 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_recipe_qa)
NOTE: Running task 1423 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_fetch)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-26.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 1517 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_fetch)
NOTE: Running setscene task 921 of 921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_recipe_qa: Started
NOTE: Running task 1585 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_fetch)
NOTE: Running task 1598 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_fetch)
NOTE: Running task 1603 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb:do_fetch)
NOTE: Running task 1610 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_fetch: Started
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-26.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_fetch: Started
NOTE: Running task 1823 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_fetch)
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_fetch: Started
NOTE: Running task 1837 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_fetch)
NOTE: Running task 1838 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_fetch)
NOTE: Running task 1839 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_fetch)
NOTE: recipe python3-packaging-26.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1924 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_create_recipe_spdx)
NOTE: Running task 1940 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_unpack)
NOTE: Running task 1941 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_unpack)
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2056 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_fetch)
NOTE: Running task 2062 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_create_recipe_spdx)
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Started
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_fetch: Started
NOTE: Running task 2120 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb:do_unpack)
NOTE: recipe python3-pytest-9.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Started
NOTE: Running task 2121 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_unpack)
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 2122 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_unpack)
NOTE: Running task 2123 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_unpack)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_unpack: Started
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_fetch: Started
NOTE: Running task 2124 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_patch)
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2125 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_unpack)
NOTE: Running task 2126 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_patch)
NOTE: Running task 2127 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_unpack)
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2128 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_unpack)
NOTE: Running task 2129 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2130 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_unpack)
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_unpack: Started
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_unpack: Succeeded
NOTE: Running task 2131 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb:do_patch)
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 2132 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_fetch)
NOTE: Running task 2133 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_patch)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_unpack: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Started
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 2134 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_patch)
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-9.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2135 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_patch)
NOTE: Running task 2136 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_patch)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_patch: Started
NOTE: Running task 2137 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_patch)
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_unpack: Started
NOTE: Running task 2138 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_patch)
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 2139 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_patch)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_patch: Started
NOTE: Running task 2140 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_unpack)
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_fetch: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Started
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-9.1.0-r0: task do_patch: Started
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Started
NOTE: recipe python3-hatchling-native-1.30.1-r0: task do_patch: Succeeded
NOTE: Running task 2143 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_unpack)
NOTE: Running task 2144 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_patch: Started
NOTE: Running task 2146 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_create_recipe_spdx)
NOTE: Running task 2147 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_create_recipe_spdx)
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_patch: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_patch: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_patch: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2154 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_patch)
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 2155 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_patch)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2156 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-pygments-2.20.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2157 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.20.0-r0: task do_patch: Succeeded
NOTE: Running task 2158 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2159 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_populate_lic)
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_populate_lic: Started
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2161 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_configure)
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_configure: Started
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2162 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_configure)
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2163 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_compile)
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_configure: Started
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_compile: Started
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2164 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2165 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_compile)
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_compile: Started
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2166 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_install)
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_install: Started
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2167 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_install: Succeeded
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 2168 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_populate_sysroot)
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2169 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_install)
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_install: Started
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2170 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2171 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2172 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_create_spdx)
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_install: Succeeded
NOTE: Running task 2173 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_create_spdx: Started
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2174 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_package)
NOTE: Running task 2175 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2176 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_configure)
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_package: Started
NOTE: recipe python3-vcs-versioning-native-2.2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2177 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_configure)
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2178 of 2257 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2179 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile)
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_compile: Started
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_package: Succeeded
NOTE: Running task 2180 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_packagedata)
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2181 of 2257 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb:do_create_spdx)
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_create_spdx: Started
NOTE: recipe python3-vcs-versioning-2.2.2-r0: task do_create_spdx: Succeeded
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
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_get_version_impl.py", line 339, in get_version
|     _version_missing(config)
|     ~~~~~~~~~~~~~~~~^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_get_version_impl.py", line 263, in _version_missing
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/run.do_compile.987706:154 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/sources/setuptools_scm-10.0.5'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/run.do_compile.987706, line 154
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/run.do_compile.987706, line 149
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/run.do_compile.987706, line 158
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
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_get_version_impl.py", line 339, in get_version
|     _version_missing(config)
|     ~~~~~~~~~~~~~~~~^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_get_version_impl.py", line 263, in _version_missing
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/run.do_compile.987756:151 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/sources/setuptools_scm-10.0.5'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/run.do_compile.987756, line 151
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/run.do_compile.987756, line 146
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/run.do_compile.987756, line 163
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2181 tasks of which 2112 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260630051922.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260630051922.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/log.do_compile.987706
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/log.do_compile.987756
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-scm-native-10.0.5-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/run.do_compile.987706' failed with exit code 1
ERROR: python3-setuptools-scm-10.0.5-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/run.do_compile.987756' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/log.do_compile.987706
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/log.do_compile.987756
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile) failed with exit code '1'

--===============0354188387827984547==--

