Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585E5C61CE3
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 05:57:05 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15469.1787637418648690470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 22:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RKPPQig7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=N8gOi+xr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a0377e46cd-a6fd065b-e083-49fc-8c5c-e5df7bd43152-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787637417;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tTDkbnDN4gtsy+vY9VC436xehIrmOBeUunwMyQBP/A4=;
	b=RKPPQig7ISFXigyzpmc30dLcsa0kwIorodnq+TafIDOGQLqc1vyeuEbhUUHveGIs
	TiU7qzLF4ujARxI9hqGqBBwq/1EHqyqfUw+7LGNN+1iUcUoh2bUvrA0OVixwURQK8iB
	FB/Kb7n4NMBJW6RIijU9iUAlYeov3jlDk1amRxvw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787637417;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tTDkbnDN4gtsy+vY9VC436xehIrmOBeUunwMyQBP/A4=;
	b=N8gOi+xrIspJ2KnrEmnnzz9YaPDo3/GfY9Kb7KThag4wdDCW7txE2xgSZvaEDdFe
	mXvwGAquIBEFvbRm2wf8AVqCI26XkTClLuYNtMR8lI79Nb+r0xPz565P7hFGJXGU6F7
	F1iqrjpfuzeGmL+sNjRl2FX1LcreYKUCGpn1ASB8=
Content-Type: multipart/mixed; boundary="===============6043944816219884541=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-imagesize: upgrading to 2.0.1 FAILED
Message-ID: <010101a0377e46cd-a6fd065b-e083-49fc-8c5c-e5df7bd43152-000000@us-west-2.amazonses.com>
Date: Tue, 25 Aug 2026 05:56:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.25-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 05:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244194

--===============6043944816219884541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-imagesize* to *2.0.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-imagesize-upgrade-2.0.0-2.0.1.patch
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
From fd8ae1d2e188bf5f0ae2f0ba699076e7e4775acb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 25 Aug 2026 05:17:52 +0000
Subject: [PATCH] python3-imagesize: upgrade 2.0.0 -> 2.0.1

---
 .../{python3-imagesize_2.0.0.bb => python3-imagesize_2.0.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-imagesize_2.0.0.bb => python3-imagesize_2.0.1.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb b/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-imagesize_2.0.0.bb
rename to meta/recipes-devtools/python/python3-imagesize_2.0.1.bb
index 7430130e5f..116e5a3cf9 100644
--- a/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=0c128f0f7e8a02e1b83884c0b5a41cda"
 
-SRC_URI[sha256sum] = "8e8358c4a05c304f1fccf7ff96f036e7243a189e9e42e90851993c558cfe9ee3"
+SRC_URI[sha256sum] = "b2ba6a4dea487a7ebcd53248d3476aca449d30db12a2dde5e0c5ca9624fd77e5"
 
 inherit setuptools3 pypi
 
-- 
2.47.1


--===============6043944816219884541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1986 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-7200f3bc359a29e0b158fd2cb71391bda9ae62e7"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:7200f3bc359a29e0b158fd2cb71391bda9ae62e7"
meta-yocto-bsp       
meta-poky            = "master:6ce984c0a3a68c2fdc3c32bc185b6729d09e7829"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 391 Local 377 Mirrors 0 Missed 14 Current 310 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 399 of 701 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 467 of 701 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: Running task 497 of 1813 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_recipe_qa)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 590 of 701 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 591 of 701 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 576 of 1813 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_fetch)
NOTE: Running setscene task 594 of 701 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 660 of 701 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 662 of 701 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_spdx_setscene)
NOTE: Running task 1214 of 1813 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_unpack)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 1813 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_patch)
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 697 of 701 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_patch: Started
NOTE: Running task 1684 of 1813 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-imagesize-2.0.1-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-imagesize-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1793 of 1813 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1794 of 1813 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_check_backend)
NOTE: Running task 1799 of 1813 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_create_recipe_spdx)
NOTE: Running task 1800 of 1813 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_populate_lic)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_check_backend: Started
WARNING: python3-imagesize-2.0.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]
NOTE: recipe python3-imagesize-2.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_check_backend: Succeeded
NOTE: recipe python3-imagesize-2.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-imagesize-2.0.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-imagesize-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1801 of 1813 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_configure)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1802 of 1813 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_compile)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| nativepython3: can't open file '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-imagesize/2.0.1/sources/imagesize-2.0.1/setup.py': [Errno 2] No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-imagesize/2.0.1/temp/run.do_compile.1387633:165 exit 2 from 'nativepython3 setup.py --verbose build -j 16 bdist_wheel --dist-dir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-imagesize/2.0.1/dist'
| WARNING: Backtrace (BB generated script):
| 	#1: setuptools3_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-imagesize/2.0.1/temp/run.do_compile.1387633, line 165
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-imagesize/2.0.1/temp/run.do_compile.1387633, line 147
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-imagesize/2.0.1/temp/run.do_compile.1387633, line 172
NOTE: recipe python3-imagesize-2.0.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1802 tasks of which 1791 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260825051740.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260825051740.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-imagesize/2.0.1/temp/log.do_compile.1387633
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-imagesize-2.0.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-imagesize/2.0.1/temp/run.do_compile.1387633' failed with exit code 2
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-imagesize/2.0.1/temp/log.do_compile.1387633
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_compile) failed with exit code '1'

--===============6043944816219884541==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-imagesize-upgrade-2.0.0-2.0.1.patch"

RnJvbSBmZDhhZTFkMmUxODhiZjVmMGFlMmYwYmE2OTkwNzZlN2U0Nzc1YWNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjUgQXVnIDIwMjYgMDU6MTc6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWltYWdlc2l6ZTogdXBncmFkZSAyLjAuMCAtPiAyLjAuMQoKLS0tCiAuLi4ve3B5dGhv
bjMtaW1hZ2VzaXplXzIuMC4wLmJiID0+IHB5dGhvbjMtaW1hZ2VzaXplXzIuMC4xLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWltYWdlc2l6ZV8yLjAuMC5i
YiA9PiBweXRob24zLWltYWdlc2l6ZV8yLjAuMS5iYn0gKDc4JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW1hZ2VzaXplXzIuMC4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWltYWdlc2l6ZV8yLjAuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDc4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaW1hZ2VzaXplXzIuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtaW1hZ2VzaXplXzIuMC4xLmJiCmluZGV4IDc0MzAxMzBlNWYuLjEx
NmU1YTNjZjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1pbWFnZXNpemVfMi4wLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWltYWdlc2l6ZV8yLjAuMS5iYgpAQCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZl
bC9weXRob24iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0UucnN0O21kNT0wYzEyOGYwZjdlOGEwMmUxYjgzODg0YzBiNWE0MWNkYSIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjhlODM1OGM0YTA1YzMwNGYxZmNjZjdmZjk2ZjAzNmU3MjQzYTE4OWU5
ZTQyZTkwODUxOTkzYzU1OGNmZTllZTMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjJiYTZhNGRl
YTQ4N2E3ZWJjZDUzMjQ4ZDM0NzZhY2E0NDlkMzBkYjEyYTJkZGU1ZTBjNWNhOTYyNGZkNzdlNSIK
IAogaW5oZXJpdCBzZXR1cHRvb2xzMyBweXBpCiAKLS0gCjIuNDcuMQoK

--===============6043944816219884541==--

