Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E92C25B76
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:07 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.10765.1688227323201429882
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hBpmwceI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018912309a18-82d3bf26-f8a9-493e-bdc9-84200c8f245a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EU4Qo7IKX1kphJIK/vxL1Zcck4MopcKARm1bB3wH8v8=;
	b=hBpmwceIW4fGtln3dIAenKNnpgILrTlOgGrtidegWYfkTfLws6lkzwHRBAyloVBM
	aFi/S2D0dR1P9+tYc7uEjSjdLhEi7ZDY50E8n+/2zstKV5q4rwbAclWJMl8+3V4tAQI
	9Dhfbv2q8WIGeSjzcl7Mijj9/m0hWd+VfclvmKBk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EU4Qo7IKX1kphJIK/vxL1Zcck4MopcKARm1bB3wH8v8=;
	b=E3/VC9+mA+vduintuO9+hMyZTvqjgrJPikhx+PnfYPSxTmdMyrIa0rHpXa3s+4xf
	ErtDk0wwWjK3ThAoqszsKkIUo62+oz4q4YYVJjm6Y6LegzCzm8GoQQYXe24rLpUSKjk
	crQvlDOOlT84Rp52l+Ip6xSr95PNGRSJXsLG33pY=
Content-Type: multipart/mixed; boundary="===============8979615248240202195=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest-subtests: upgrading to 0.11.0 FAILED
Message-ID: <0101018912309a18-82d3bf26-f8a9-493e-bdc9-84200c8f245a-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183726

--===============8979615248240202195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest-subtests* to *0.11.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pytest-subtests-upgrade-0.10.0-0.11.0.patch
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
From e2050f1d65499144c3e063bf2b7427e7763569a6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 09:00:22 +0000
Subject: [PATCH] python3-pytest-subtests: upgrade 0.10.0 -> 0.11.0

---
 ...est-subtests_0.10.0.bb => python3-pytest-subtests_0.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.10.0.bb => python3-pytest-subtests_0.11.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb
index e1f2a49d31..bbcc2a7a17 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "d9961a67c1791e8c1e32dce7a70ed1e54f3b1e641087f2094f2d37087ab7fb17"
+SRC_URI[sha256sum] = "51865c88457545f51fb72011942f0a3c6901ee9e24cbfb6d1b9dc1348bafbe37"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============8979615248240202195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (895 cached, 1 parsed). 1798 targets, 34 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3d26e8a691316eca6b52dd7864360f8ffd20411b"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 151 Local 142 Mirrors 0 Missed 9 Current 333 (94% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1180 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_fetch)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 1695 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_unpack)
NOTE: Running task 1696 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1697 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_patch)
NOTE: Running task 1698 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1699 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1700 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_populate_lic)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1701 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1702 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/pytest-subtests-0.11.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/temp/run.do_compile.1880589:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/temp/run.do_compile.1880589, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/temp/run.do_compile.1880589, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/temp/run.do_compile.1880589, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/temp/run.do_compile.1880589, line 184
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1702 tasks of which 1693 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-subtests-0.11.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-pytest-subtests-0.11.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/temp/run.do_compile.1880589', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/temp/log.do_compile.1880589
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_compile) failed with exit code '1'

--===============8979615248240202195==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-subtests-upgrade-0.10.0-0.11.0.patch"

RnJvbSBlMjA1MGYxZDY1NDk5MTQ0YzNlMDYzYmYyYjc0MjdlNzc2MzU2OWE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAwOTowMDoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHl0ZXN0LXN1YnRlc3RzOiB1cGdyYWRlIDAuMTAuMCAtPiAwLjExLjAKCi0tLQogLi4u
ZXN0LXN1YnRlc3RzXzAuMTAuMC5iYiA9PiBweXRob24zLXB5dGVzdC1zdWJ0ZXN0c18wLjExLjAu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weXRlc3Qtc3Vi
dGVzdHNfMC4xMC4wLmJiID0+IHB5dGhvbjMtcHl0ZXN0LXN1YnRlc3RzXzAuMTEuMC5iYn0gKDg2
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0
ZXN0LXN1YnRlc3RzXzAuMTAuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1weXRlc3Qtc3VidGVzdHNfMC4xMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3Qtc3VidGVz
dHNfMC4xMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHl0ZXN0LXN1YnRlc3RzXzAuMTEuMC5iYgppbmRleCBlMWYyYTQ5ZDMxLi5iYmNjMmE3YTE3
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0
LXN1YnRlc3RzXzAuMTAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcHl0ZXN0LXN1YnRlc3RzXzAuMTEuMC5iYgpAQCAtNyw3ICs3LDcgQEAgQlVHVFJBQ0tF
UiA9ICJodHRwczovL2dpdGh1Yi5jb20vcHl0ZXN0LWRldi9weXRlc3Qtc3VidGVzdHMvaXNzdWVz
IgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21k
NT0yNDJiNGUxN2ZhMjg3ZGNmN2FlZjM3MmY2YmMzZGNiMSIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImQ5OTYxYTY3YzE3OTFlOGMxZTMyZGNlN2E3MGVkMWU1NGYzYjFlNjQxMDg3ZjIwOTRmMmQz
NzA4N2FiN2ZiMTciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTE4NjVjODg0NTc1NDVmNTFmYjcy
MDExOTQyZjBhM2M2OTAxZWU5ZTI0Y2JmYjZkMWI5ZGMxMzQ4YmFmYmUzNyIKIAogaW5oZXJpdCBw
eXBpIHNldHVwdG9vbHMzCiAKLS0gCjIuMzkuMgoK

--===============8979615248240202195==--

