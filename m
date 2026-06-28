Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB48BC44501
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 05:32:31 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67986.1782624740808816870
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 22:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bB9XP703;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=s+D3yIT4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019f0cb6e180-713bc49a-9348-42a6-85a6-2fe9e47d9bf4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782624739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/kAyWKewk3lnWO/YzYS5fZM/FuVQ/FU2j1yf5rj7OI8=;
	b=bB9XP703quO15tMYKPxeNPi6bjofDkj65m1lwC4fGCGSYhOoCDi6lX7saBKN4HrW
	5992fTs2xmuaySygUXHyH+VA1H5t7NQL+wRF+DYJeW3eDTrFZ2FwzG4YcSipnHv+12d
	UPPXvLDe90P5qvVgoLUeDNZ2aZe8X8mjyMaxz/Tw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782624739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/kAyWKewk3lnWO/YzYS5fZM/FuVQ/FU2j1yf5rj7OI8=;
	b=s+D3yIT4U0M05caANIaxT0lFq3hfZJ5nc/a2+UOM9vNbS0D8D4hFkIbvCJTZ1/G5
	FnRQ/A6LoRcF7XlEz9fmgx0jVlcMmgfYQvTR5m9RQv/pWdxuHmQaoRs8CDglsk43p+Q
	i1wrKfJUOmX+sO7bUIykcrPywzkq5366aXBfFHE0=
Content-Type: multipart/mixed; boundary="===============2392259071698791826=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.13.0 SUCCEEDED
Message-ID: <0101019f0cb6e180-713bc49a-9348-42a6-85a6-2fe9e47d9bf4-000000@us-west-2.amazonses.com>
Date: Sun, 28 Jun 2026 05:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.28-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 05:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239704

--===============2392259071698791826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-rust* to *1.13.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.12.1-1.13.0.patch
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
From 04a0c902bd4cfd83ea8a72f5ac57895ad74c31b4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 28 Jun 2026 05:22:27 +0000
Subject: [PATCH] python3-setuptools-rust: upgrade 1.12.1 -> 1.13.0

---
 ...uptools-rust_1.12.1.bb => python3-setuptools-rust_1.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.12.1.bb => python3-setuptools-rust_1.13.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.12.1.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.12.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb
index a1135794ba..0abebb67ed 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.12.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI[sha256sum] = "85ae70989d96c9cfeb5ef79cf3bac2d5200bc5564f720a06edceedbdf6664640"
+SRC_URI[sha256sum] = "f2afcf4baeee689910ce49cfa8aad4e08cce72f417449bcc32891b8664fdc726"
 
 PYPI_PACKAGE = "setuptools_rust"
 
-- 
2.47.1


--===============2392259071698791826==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.12.1-1.13.0.patch"

RnJvbSAwNGEwYzkwMmJkNGNmZDgzZWE4YTcyZjVhYzU3ODk1YWQ3NGMzMWI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjggSnVuIDIwMjYgMDU6MjI6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtcnVzdDogdXBncmFkZSAxLjEyLjEgLT4gMS4xMy4wCgotLS0KIC4u
LnVwdG9vbHMtcnVzdF8xLjEyLjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXJ1c3RfMS4xMy4w
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2V0dXB0b29s
cy1ydXN0XzEuMTIuMS5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjEzLjAuYmJ9ICg5
MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNl
dHVwdG9vbHMtcnVzdF8xLjEyLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuMTMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1y
dXN0XzEuMTIuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHMtcnVzdF8xLjEzLjAuYmIKaW5kZXggYTExMzU3OTRiYS4uMGFiZWJiNjdl
ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMtcnVzdF8xLjEyLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjEzLjAuYmIKQEAgLTksNyArOSw3IEBAIEJVR1RSQUNL
RVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL1B5TzMvc2V0dXB0b29scy1ydXN0L2lzc3VlcyIKIExJ
Q0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDEx
Y2Q5MmU3MDJkZDllNmIxYTI2MTU3YjZmZDUzZjUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4
NWFlNzA5ODlkOTZjOWNmZWI1ZWY3OWNmM2JhYzJkNTIwMGJjNTU2NGY3MjBhMDZlZGNlZWRiZGY2
NjY0NjQwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImYyYWZjZjRiYWVlZTY4OTkxMGNlNDljZmE4
YWFkNGUwOGNjZTcyZjQxNzQ0OWJjYzMyODkxYjg2NjRmZGM3MjYiCiAKIFBZUElfUEFDS0FHRSA9
ICJzZXR1cHRvb2xzX3J1c3QiCiAKLS0gCjIuNDcuMQoK

--===============2392259071698791826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-setuptools-rust: PV changed from "1.12.1" to "1.13.0"
packages/x86-64-v3-poky-linux/python3-setuptools-rust: PKGV changed from 1.12.1 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.12.1.tar.gz;downloadfilename=setuptools_rust-1.12.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.13.0.tar.gz;downloadfilename=setuptools_rust-1.13.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PV changed from "1.12.1" to "1.13.0"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PKGV changed from 1.12.1 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PV changed from "1.12.1" to "1.13.0"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PKGV changed from 1.12.1 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PV changed from "1.12.1" to "1.13.0"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PKGV changed from 1.12.1 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PV changed from "1.12.1" to "1.13.0"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PKGV changed from 1.12.1 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PV changed from "1.12.1" to "1.13.0"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PKGV changed from 1.12.1 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PV changed from "1.12.1" to "1.13.0"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PKGV changed from 1.12.1 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PV changed from "1.12.1" to "1.13.0"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGV changed from 1.12.1 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 186550 to 198491 (+6%)
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools_rust-1.13.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info -> /usr/lib/python3.14/site-packages/setuptools_rust-1.13.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools_rust-1.13.0.dist-info

--===============2392259071698791826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools_rust-1.13.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info -> /usr/lib/python3.14/site-packages/setuptools_rust-1.13.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools_rust-1.13.0.dist-info

--===============2392259071698791826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1978 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-5adb8f91083da47f44605fdb10004ef9a6158e83"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:5adb8f91083da47f44605fdb10004ef9a6158e83"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 697 Local 639 Mirrors 0 Missed 58 Current 229 (91% match, 93% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 241 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 262 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 263 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_package_qa_setscene)
NOTE: Running setscene task 275 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 279 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 280 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 281 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 299 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 320 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 336 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 347 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 376 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-82.0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-setuptools-82.0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-setuptools-82.0.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-setuptools-82.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-setuptools-82.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-26.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.96.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-vcs-versioning-native-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-setuptools-82.0.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-82.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-82.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libstd-rs-1.96.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 379 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 381 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.0.bb:do_packagedata_setscene)
NOTE: recipe python3-vcs-versioning-native-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 382 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.6-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 456 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 457 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-82.0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-setuptools-82.0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 465 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-26.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.96.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.96.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.96.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-82.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-vcs-versioning-native-1.1.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 469 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.96.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 478 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.96.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: recipe python3-vcs-versioning-native-1.1.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 487 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 488 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 506 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-82.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 523 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20260601-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2026b-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-22.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ca-certificates-20260601-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 544 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe tzdata-2026b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 558 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-native-26.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcxx-22.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 577 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 582 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-82.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe compiler-rt-22.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.96.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 617 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-82.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 625 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 626 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 631 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcxx-22.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.96.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 731 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_recipe_qa)
NOTE: Running task 760 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_recipe_qa)
NOTE: Running task 773 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_recipe_qa)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 785 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_recipe_qa)
NOTE: Running task 787 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_fetch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 638 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.96.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 639 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe python3-wheel-0.47.0-r0: task do_recipe_qa: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_recipe_qa: Started
NOTE: Running setscene task 642 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 648 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 667 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 669 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-wheel-0.47.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 674 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libcxx-22.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 683 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 689 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/json-c/0.18/temp/log.do_packagedata_setscene.715122
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 697 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe sqlite3-3_3.53.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 704 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_package_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe compiler-rt-22.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcxx-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcxx-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 720 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 724 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 733 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 762 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 767 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe compiler-rt-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 814 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 825 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 830 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 835 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_package_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 853 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 855 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 856 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 859 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1188 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_fetch)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1276 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_fetch)
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1296 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1314 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_fetch)
NOTE: Running task 1318 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 869 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1343 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-wheel-0.47.0-r0: task do_fetch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_fetch: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1504 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1518 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1519 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_unpack: Started
NOTE: Running task 1537 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_create_recipe_spdx)
NOTE: Running task 1539 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_create_recipe_spdx)
NOTE: Running task 1540 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_create_recipe_spdx)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1541 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_create_recipe_spdx)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 878 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wheel-0.47.0-r0: task do_fetch: Succeeded
NOTE: Running task 1542 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_patch)
NOTE: Running task 1548 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_unpack)
NOTE: Running task 1549 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1550 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_unpack)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1551 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wheel-0.47.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-wheel-0.47.0-r0: task do_unpack: Started
NOTE: Running task 1562 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_patch)
NOTE: recipe python3-wheel-0.47.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Started
NOTE: Running task 1563 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_patch)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1564 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1570 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_patch)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1571 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_patch)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.18-r0: task do_package_setscene: Succeeded
NOTE: Running task 1578 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 891 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 894 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_patch: Started
NOTE: recipe python3-wheel-0.47.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1580 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1581 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1582 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_rust_gen_targets)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-wheel-0.47.0-r0: task do_patch: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-wheel-0.47.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1584 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_patch: Succeeded
NOTE: Running task 1585 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1586 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_check_backend)
NOTE: Running task 1587 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-wheel-0.47.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_check_backend: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_check_backend: Succeeded
NOTE: Running task 1594 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_deploy_source_date_epoch unihash changed to 14c3da509de6ca7f88b4235abf770193bc9f8e914abf35976c8102245136ed78
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1595 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 898 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 899 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 901 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_deploy_source_date_epoch unihash changed to 3036522c0ac1f4d54c221e590fb2168ada904d3b2fa0416b0730aaf38e42c77c
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wheel-0.47.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_deploy_source_date_epoch unihash changed to 3fb53ec9f8f1f4710a7919b8a48580c484f35dd1ad15e16677f8f1e8955297e5
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 903 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 906 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 908 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1601 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 913 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 914 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 919 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 922 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 924 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 926 of 926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1937 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2004 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2044 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2045 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2046 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2130 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata)
NOTE: recipe python3-wheel-0.47.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wheel-0.47.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2186 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2187 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_configure)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2188 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_configure)
NOTE: Running task 2189 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_configure)
NOTE: recipe python3-wheel-0.47.0-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_configure: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_configure: Started
NOTE: recipe python3-wheel-0.47.0-r0: task do_configure: Succeeded
NOTE: Running task 2190 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_configure_ptest_base)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2191 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_compile)
NOTE: Running task 2192 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_rust_create_wrappers)
NOTE: Running task 2193 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_compile)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2194 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile)
NOTE: recipe python3-wheel-0.47.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Started
NOTE: recipe python3-wheel-0.47.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_compile: Started
NOTE: Running task 2195 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_compile)
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2196 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_configure)
NOTE: recipe python3-wheel-0.47.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_configure: Succeeded
NOTE: Running task 2197 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_compile: Started
NOTE: Running task 2198 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2205 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_install: Started
NOTE: recipe python3-wheel-0.47.0-r0: task do_compile: Succeeded
NOTE: Running task 2206 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_compile_ptest_base)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2207 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_install)
NOTE: recipe python3-wheel-0.47.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Started
NOTE: recipe python3-wheel-0.47.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2208 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_install)
NOTE: recipe python3-wheel-0.47.0-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_install: Succeeded
NOTE: Running task 2209 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package)
NOTE: Running task 2210 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_populate_sysroot)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Succeeded
NOTE: Running task 2211 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package)
NOTE: Running task 2212 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_populate_sysroot)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_compile: Succeeded
NOTE: recipe python3-wheel-0.47.0-r0: task do_install: Succeeded
NOTE: Running task 2213 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_install)
NOTE: Running task 2214 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_install_ptest_base)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_install: Started
NOTE: recipe python3-wheel-0.47.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-wheel-0.47.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2215 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_package)
NOTE: Running task 2216 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_populate_sysroot)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-wheel-0.47.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-wheel-0.47.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_compile: Succeeded
NOTE: Running task 2217 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_install)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_install: Succeeded
NOTE: Running task 2218 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_package)
NOTE: Running task 2219 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_package: Started
NOTE: recipe python3-wheel-0.47.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package: Succeeded
NOTE: Running task 2220 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_install: Succeeded
NOTE: Running task 2221 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_package)
NOTE: Running task 2222 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_populate_sysroot)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Succeeded
NOTE: Running task 2223 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_packagedata unihash changed to 48e5fcf70d5b5fbfb08a2b52072e6efa47ef07c0707814a0d70cc979e7bd3dd0
NOTE: Setscene tasks completed
NOTE: Running task 2224 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_create_spdx)
NOTE: Running task 2225 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_ipk)
NOTE: Running task 2226 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_deb)
NOTE: Running task 2227 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_rpm)
NOTE: Running task 2228 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_qa)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_qa: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_packagedata unihash changed to 6d9d0607145132b369bed31809cca9ae0d06d7671c51c09edf166b56f0f9ac0f
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2229 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_create_spdx)
NOTE: Running task 2230 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_ipk)
NOTE: Running task 2231 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_deb)
NOTE: Running task 2232 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2233 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_qa)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_spdx: Started
NOTE: recipe python3-wheel-0.47.0-r0: task do_package: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_deb: Started
NOTE: Running task 2234 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_packagedata)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_qa: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-wheel-0.47.0-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_qa unihash changed to 941403d83423f0772317c15c76c2b9e51121922ad6aaccffb488925ef0a2ab82
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_package: Succeeded
NOTE: Running task 2235 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_packagedata)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_deb unihash changed to 8a42541d07a430bff641917a1f3fdd74f6b3075e536937fac87fd0c872b8d9ef
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_rpm unihash changed to 2504db1f9879d2aa20291401f8848378fdf89a3b04e3834379ff3e8ac9cba252
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_ipk unihash changed to fff890992c13ac0ea260cf84da0a737f6324788cc634b674c2a6353dd4281c6b
NOTE: recipe python3-wheel-0.47.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_packagedata unihash changed to 3352213760890f5bbdccdd63612b94866b9dd4a88b4e039e5359d31119868127
NOTE: Running task 2236 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_spdx)
NOTE: Running task 2237 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_package_write_ipk)
NOTE: Running task 2238 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_package_write_deb)
NOTE: Running task 2239 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_package_write_rpm)
NOTE: Running task 2240 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_package_qa)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_ipk unihash changed to ae65f1d9cbdf7e183c12629afc4022c68c1745a07cf5c31cd8c09121b1f4b2fc
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_qa unihash changed to 8a6aa26e39c67511bfab9855331b20acb37a5e56e41347c1b4ac1dd376312456
NOTE: recipe python3-wheel-0.47.0-r0: task do_create_spdx: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-wheel-0.47.0-r0: task do_package_write_ipk: Started
NOTE: Running task 2241 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_create_spdx)
NOTE: recipe python3-wheel-0.47.0-r0: task do_package_write_deb: Started
NOTE: Running task 2242 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_package_write_ipk)
NOTE: recipe python3-wheel-0.47.0-r0: task do_package_write_rpm: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_deb unihash changed to 7e0ca7444249f09ec5fa64ff8f2e91cda94bdb00fbed23ce07d8d46bf8c3cd50
NOTE: Running task 2243 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_package_write_deb)
NOTE: recipe python3-wheel-0.47.0-r0: task do_package_qa: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2244 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_package_write_rpm)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_rpm unihash changed to ef6b09eb272004dc49e05420fb63c5584eaae71dd70a7a491cf84ac66a2b42c7
NOTE: Setscene tasks completed
NOTE: Running task 2245 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_package_qa)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_create_spdx: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_package_write_ipk: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_package_write_deb: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_package: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_package_write_rpm: Started
NOTE: Running task 2246 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_package_qa: Started
NOTE: recipe python3-wheel-0.47.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-wheel-0.47.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_package_qa unihash changed to 3fc7a31410c7932b7b1cafe1e0c1d8f2ff7572804d8b28f558cb8463a1f603e9
NOTE: recipe python3-wheel-0.47.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_package_write_ipk unihash changed to cddde571ab51c09a24691d30a5a9658e359589680132194ee3fd40a90316a4d6
NOTE: Running task 2247 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_create_spdx)
NOTE: recipe python3-wheel-0.47.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_package_qa: Succeeded
NOTE: Running task 2248 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_package_write_ipk)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_package_write_deb unihash changed to 3fe2ddb011493066909fdb65a2603ca0a0993a065e2d18edb0107d8fe2136ce7
NOTE: Running task 2249 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_package_write_deb)
NOTE: Running task 2250 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_package_write_rpm)
NOTE: Running task 2251 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_package_qa)
NOTE: recipe python3-wheel-0.47.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_create_spdx: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2252 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_create_package_spdx)
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-rust-1.13.0-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2253 of 2253 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2253 tasks of which 2146 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: json-c-0.18-r0 do_packagedata_setscene: QA Issue: Package version for package json-c-src went backwards which would break package feeds (from 0:0.19-r0 to 0:0.18-r0) [version-going-backwards]
ERROR: json-c-0.18-r0 do_packagedata_setscene: QA Issue: Package version for package json-c-dbg went backwards which would break package feeds (from 0:0.19-r0 to 0:0.18-r0) [version-going-backwards]
ERROR: json-c-0.18-r0 do_packagedata_setscene: QA Issue: Package version for package json-c-ptest went backwards which would break package feeds (from 0:0.19-r0 to 0:0.18-r0) [version-going-backwards]
ERROR: json-c-0.18-r0 do_packagedata_setscene: QA Issue: Package version for package json-c-staticdev went backwards which would break package feeds (from 0:0.19-r0 to 0:0.18-r0) [version-going-backwards]
ERROR: json-c-0.18-r0 do_packagedata_setscene: QA Issue: Package version for package json-c-dev went backwards which would break package feeds (from 0:0.19-r0 to 0:0.18-r0) [version-going-backwards]
ERROR: json-c-0.18-r0 do_packagedata_setscene: QA Issue: Package version for package json-c-doc went backwards which would break package feeds (from 0:0.19-r0 to 0:0.18-r0) [version-going-backwards]
ERROR: json-c-0.18-r0 do_packagedata_setscene: QA Issue: Package version for package json-c-locale went backwards which would break package feeds (from 0:0.19-r0 to 0:0.18-r0) [version-going-backwards]
ERROR: json-c-0.18-r0 do_packagedata_setscene: QA Issue: Package version for package json-c went backwards which would break package feeds (from 0:0.19-r0 to 0:0.18-r0) [version-going-backwards]
ERROR: json-c-0.18-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2392259071698791826==--

