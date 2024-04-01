Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB497CD13B6
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:31 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.44639.1711994601339404771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HVm2/htS;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lPdf1RxX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018e9ad47f5b-c344e358-2b86-4c59-abc8-71ab25da4176-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7PXonvom5qU4vj1sbkKpww3tWvLELV+Bseqy4HOBaTY=;
	b=HVm2/htSpespWGdttG+qS5JYFEnnQQzM5govmm/OVCdkjFVjYrIgZ8KyQng4hcuo
	xGmrndrfHbEua/3e/tMjp6Wi447f2f9EhLIaAmHWBx5TM3da0Ajhe0w6Xy6055Ei4R/
	UlA9J65ocsGXvw7deJXqg2a0HLjCYk2vWZVBVJyU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7PXonvom5qU4vj1sbkKpww3tWvLELV+Bseqy4HOBaTY=;
	b=lPdf1RxXyT9BixnKLSGhs877MuN/5On7D9o7WxrhsuEedAnJ0TVahwCwkYhKFx69
	DhDw6zSE6xce420HCiF7MI5nFVXKGTQ05bofZBp4agSA2SF6GntG3hpeN4NB4VSN1yu
	6N2svUV6PlPAp1m7Aez4htHyvk0+bWhqoX1t5HBk=
Content-Type: multipart/mixed; boundary="===============2720454363229419011=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyasn1: upgrading to 0.6.0 SUCCEEDED
Message-ID: <0101018e9ad47f5b-c344e358-2b86-4c59-abc8-71ab25da4176-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197723

--===============2720454363229419011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyasn1* to *0.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyasn1-upgrade-0.5.1-0.6.0.patch
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
From 63d605b777ef264c8ea68b9fdc50dc66f316c21a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 08:53:44 +0000
Subject: [PATCH] python3-pyasn1: upgrade 0.5.1 -> 0.6.0

---
 meta/recipes-devtools/python/python-pyasn1.inc                  | 2 +-
 .../python/{python3-pyasn1_0.5.1.bb => python3-pyasn1_0.6.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.5.1.bb => python3-pyasn1_0.6.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index 530ff1c7c3..7b269f2940 100644
--- a/meta/recipes-devtools/python/python-pyasn1.inc
+++ b/meta/recipes-devtools/python/python-pyasn1.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "6d391a96e59b23130a5cfa74d6fd7f388dbbe26cc8f1edf39fdddf08d9d6676c"
+SRC_URI[sha256sum] = "3a35ab2c4b5ef98e17dfdec8ab074046fbda76e281c5a706ccd82328cfc8f64c"
 
 RDEPENDS:${PN}:class-target += " \
     python3-codecs \
diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.5.1.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-pyasn1_0.5.1.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb
-- 
2.42.0


--===============2720454363229419011==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyasn1-upgrade-0.5.1-0.6.0.patch"

RnJvbSA2M2Q2MDViNzc3ZWYyNjRjOGVhNjhiOWZkYzUwZGM2NmYzMTZjMjFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwODo1Mzo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlhc24xOiB1cGdyYWRlIDAuNS4xIC0+IDAuNi4wCgotLS0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uLXB5YXNuMS5pbmMgICAgICAgICAgICAgICAgICB8IDIgKy0K
IC4uLi9weXRob24ve3B5dGhvbjMtcHlhc24xXzAuNS4xLmJiID0+IHB5dGhvbjMtcHlhc24xXzAu
Ni4wLmJifSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5YXNuMV8w
LjUuMS5iYiA9PiBweXRob24zLXB5YXNuMV8wLjYuMC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tcHlhc24xLmluYyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXB5YXNuMS5pbmMKaW5kZXggNTMwZmYxYzdjMy4u
N2IyNjlmMjk0MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24tcHlhc24xLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1w
eWFzbjEuaW5jCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwOi8vcHlhc24xLnNvdXJj
ZWZvcmdlLm5ldC8iCiBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0UucnN0O21kNT0xOTBmNzkyNTM5MDhjOTg2ZTZjYWNmMzgwYzNhNWY2
ZCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZkMzkxYTk2ZTU5YjIzMTMwYTVjZmE3NGQ2ZmQ3
ZjM4OGRiYmUyNmNjOGYxZWRmMzlmZGRkZjA4ZDlkNjY3NmMiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiM2EzNWFiMmM0YjVlZjk4ZTE3ZGZkZWM4YWIwNzQwNDZmYmRhNzZlMjgxYzVhNzA2Y2NkODIz
MjhjZmM4ZjY0YyIKIAogUkRFUEVORFM6JHtQTn06Y2xhc3MtdGFyZ2V0ICs9ICIgXAogICAgIHB5
dGhvbjMtY29kZWNzIFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWFzbjFfMC41LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcHlhc24xXzAuNi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNS4xLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNi4wLmJi
Ci0tIAoyLjQyLjAKCg==

--===============2720454363229419011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.12/site-packages/pyasn1-0.5.1.dist-info moved to /usr/lib/python3.12/site-packages/pyasn1-0.6.0.dist-info

--===============2720454363229419011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1875 targets, 46 skipped, 0 masked, 0 errors.
Removing 25 recipes from the core2-64 sysroot...done.
Removing 70 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-46614cb617bf4688a7642aa55f4a0c0fa7d107fb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:46614cb617bf4688a7642aa55f4a0c0fa7d107fb"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 551 Local 535 Mirrors 0 Missed 16 Current 247 (97% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 265 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 266 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 267 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 268 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 270 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 271 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 272 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 274 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 275 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 279 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 280 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 281 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pytest-8.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-8.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 374 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 375 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-more-itertools_10.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 384 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 386 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-7.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-69.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-packaging/23.2/temp/log.do_packagedata_setscene.3359530
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 391 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_package_setscene)
NOTE: recipe python3-pytest-8.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-7.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-69.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 392 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 431 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_packagedata_setscene)
NOTE: Running task 411 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_recipe_qa)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.12.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 468 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 497 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 562 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 517 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_fetch: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 581 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_unpack)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-23.2-r0: task do_package_setscene: Started
NOTE: Running setscene task 529 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 585 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 556 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 595 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe python3-packaging-23.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 558 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 559 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-23.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 581 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-23.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1106 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_patch)
NOTE: Running setscene task 607 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_packagedata_setscene)
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running task 1207 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1237 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_patch: Started
NOTE: Running setscene task 622 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 638 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 639 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 640 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running setscene task 643 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 673 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 680 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 681 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 686 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 691 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 701 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 709 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 713 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 716 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 721 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 722 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1442 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1455 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1456 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_populate_lic)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_populate_lic: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1487 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_populate_lic unihash changed to ed15c6a629f64f4bd6abbeefcafe9d773cc300adb89e059d5b87a7b3e3555aac
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1498 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1531 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 759 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 764 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 788 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1566 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3827d1886d21fc285ddcf2fcb9cb1cc58679b8245b5b8a3c52f01f2714d587ae
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 977ca22303a05360d47e8ab9923cc76a77f00bf7e46f07abe59b8c0478624cee to hashserv.yocto.io:8686 ({'taskhash': '10fd181cce6700ef799889965ec8adc24d91891851e16021ba834d179001293a', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '977ca22303a05360d47e8ab9923cc76a77f00bf7e46f07abe59b8c0478624cee'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 10fd181cce6700ef799889965ec8adc24d91891851e16021ba834d179001293a -> 977ca22303a05360d47e8ab9923cc76a77f00bf7e46f07abe59b8c0478624cee as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 793 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 796 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1886 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2213 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_packagedata)
NOTE: Running task 2223 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-packaging-23.2-r0: task do_packagedata: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-packaging-23.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2252 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_configure)
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_configure: Succeeded
NOTE: Running task 2253 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2254 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_compile)
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2255 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2256 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_install)
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_install: Succeeded
NOTE: Running task 2257 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_install_ptest_base)
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2258 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_package)
NOTE: Running task 2259 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_populate_sysroot)
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_package: Succeeded
NOTE: Running task 2260 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_packagedata)
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2261 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_create_spdx)
NOTE: Running task 2262 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_package_write_ipk)
NOTE: Running task 2263 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_package_write_deb)
NOTE: Running task 2264 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_package_write_rpm)
NOTE: Running task 2265 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_package_qa)
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_package_qa: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2266 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_create_runtime_spdx)
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pyasn1-0.6.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2267 of 2267 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2267 tasks of which 2233 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-packaging-23.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:24.0-r0 to 0:23.2-r0) [version-going-backwards]
ERROR: python3-packaging-23.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:24.0-r0 to 0:23.2-r0) [version-going-backwards]
ERROR: python3-packaging-23.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:24.0-r0 to 0:23.2-r0) [version-going-backwards]
ERROR: python3-packaging-23.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:24.0-r0 to 0:23.2-r0) [version-going-backwards]
ERROR: python3-packaging-23.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:24.0-r0 to 0:23.2-r0) [version-going-backwards]
ERROR: python3-packaging-23.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:24.0-r0 to 0:23.2-r0) [version-going-backwards]
ERROR: python3-packaging-23.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:24.0-r0 to 0:23.2-r0) [version-going-backwards]
ERROR: python3-packaging-23.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2720454363229419011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyasn1: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.5.1.tar.gz;downloadfilename=pyasn1-0.5.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.6.0.tar.gz;downloadfilename=pyasn1-0.6.0.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-pyasn1: PKGV changed from 0.5.1 [default] to 0.6.0 [default]
packages/core2-64-poky-linux/python3-pyasn1: PV changed from "0.5.1" to "0.6.0"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PKGV changed from 0.5.1 [default] to 0.6.0 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PV changed from "0.5.1" to "0.6.0"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-dev: PKGV changed from 0.5.1 [default] to 0.6.0 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-dev: PV changed from "0.5.1" to "0.6.0"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-doc: PKGV changed from 0.5.1 [default] to 0.6.0 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-doc: PV changed from "0.5.1" to "0.6.0"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-locale: PKGV changed from 0.5.1 [default] to 0.6.0 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-locale: PV changed from "0.5.1" to "0.6.0"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGV changed from 0.5.1 [default] to 0.6.0 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGSIZE changed from 325568 to 330792 (+2%)
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PV changed from "0.5.1" to "0.6.0"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-src: PKGV changed from 0.5.1 [default] to 0.6.0 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-src: PV changed from "0.5.1" to "0.6.0"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PKGV changed from 0.5.1 [default] to 0.6.0 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PV changed from "0.5.1" to "0.6.0"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1: PKGV changed from 0.5.1 [default] to 0.6.0 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1: PKGSIZE changed from 821675 to 838157 (+2%)
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1: PV changed from "0.5.1" to "0.6.0"
Changes to packages/core2-64-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.12/site-packages/pyasn1-0.5.1.dist-info moved to /usr/lib/python3.12/site-packages/pyasn1-0.6.0.dist-info

--===============2720454363229419011==--

