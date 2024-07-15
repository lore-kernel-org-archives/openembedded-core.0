Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77926C531DB
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:15 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.1300.1721071146269733676
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=eX0UJboZ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ZrZC741V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010190b7d59c47-bf91922f-3637-47c7-a2ff-5a9e805d5555-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8bg+ITz0WmJu/A8/7LVpHe15RbX6o+8+HLJI2vQ89OM=;
	b=eX0UJboZsUKNjgYJfsPRfwBUCJqoEjZh2hmMV56yQ9CUbo8QotjLpbbhGCi/6S9L
	2ABWUKqkNdcf8d0o6avb/tegE2WszVjweDA1n7OXZz3YFeroPEPHV8OKWvTj73QBD9C
	ABrdstWu3YUVFaLcPTcQuOthHlEoNZkRaazRAzKQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8bg+ITz0WmJu/A8/7LVpHe15RbX6o+8+HLJI2vQ89OM=;
	b=ZrZC741VnRaCJJh2Qyk84ofRgexf+YZkr3/xaOXZvmo679f6nLKhwNbcmJLLTMfJ
	ktFaBy719FF5x/TbLavegANXC4oQdOlA/ml257izIVnwm7gaLp5F/5iwWTmaPq+zLz6
	Rje4F113ZjKMDyaEJUMKsqsEULjHO8inXJyYkNCo=
Content-Type: multipart/mixed; boundary="===============3801119855814312889=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael@opdenacker.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-utils: upgrading to 1.2.12 FAILED
Message-ID: <01010190b7d59c47-bf91922f-3637-47c7-a2ff-5a9e805d5555-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202024

--===============3801119855814312889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-utils* to *1.2.12* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-alsa-utils-upgrade-1.2.11-1.2.12.patch
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
From bb16ddb81d14a5451599e4e0ca37e83106e11615 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 15:57:50 +0000
Subject: [PATCH] alsa-utils: upgrade 1.2.11 -> 1.2.12

---
 .../alsa/{alsa-utils_1.2.11.bb => alsa-utils_1.2.12.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.11.bb => alsa-utils_1.2.12.bb} (98%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.11.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb
similarity index 98%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.11.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb
index e598fac9f8..35443ec7e7 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.11.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb
@@ -26,7 +26,7 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2 \
            "
-SRC_URI[sha256sum] = "9ac6ca3a883f151e568dcf979b8d2e5cbecc51b819bb0e6bb8a2e9b34cc428a7"
+SRC_URI[sha256sum] = "98bc6677d0c0074006679051822324a0ab0879aea558a8f68b511780d30cd924"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.44.0


--===============3801119855814312889==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-utils-upgrade-1.2.11-1.2.12.patch"

RnJvbSBiYjE2ZGRiODFkMTRhNTQ1MTU5OWU0ZTBjYTM3ZTgzMTA2ZTExNjE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTU6NTc6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLXV0aWxzOiB1cGdyYWRlIDEuMi4xMSAtPiAxLjIuMTIKCi0tLQogLi4uL2Fsc2Eve2Fsc2Et
dXRpbHNfMS4yLjExLmJiID0+IGFsc2EtdXRpbHNfMS4yLjEyLmJifSAgICAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS97YWxzYS11dGlsc18xLjIuMTEuYmIgPT4gYWxzYS11
dGlsc18xLjIuMTIuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvYWxzYS9hbHNhLXV0aWxzXzEuMi4xMS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fs
c2EvYWxzYS11dGlsc18xLjIuMTIuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzXzEuMi4xMS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzXzEuMi4xMi5iYgppbmRl
eCBlNTk4ZmFjOWY4Li4zNTQ0M2VjN2U3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjExLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2Fsc2EvYWxzYS11dGlsc18xLjIuMTIuYmIKQEAgLTI2LDcgKzI2LDcgQEAgUEFDS0FHRUNP
TkZJR1ttYW5wYWdlc10gPSAiLS1lbmFibGUteG1sdG8sIC0tZGlzYWJsZS14bWx0bywgeG1sdG8t
bmF0aXZlIGRvY2Jvb2sKICMgYWxzYS11dGlscyBzcGVjaWZpZWQgaW4gU1JDX1VSSSBkdWUgdG8g
YWxzYS11dGlscy1zY3JpcHRzIHJlY2lwZQogU1JDX1VSSSA9ICJodHRwczovL3d3dy5hbHNhLXBy
b2plY3Qub3JnL2ZpbGVzL3B1Yi91dGlscy9hbHNhLXV0aWxzLSR7UFZ9LnRhci5iejIgXAogICAg
ICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWFjNmNhM2E4ODNmMTUxZTU2OGRjZjk3
OWI4ZDJlNWNiZWNjNTFiODE5YmIwZTZiYjhhMmU5YjM0Y2M0MjhhNyIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI5OGJjNjY3N2QwYzAwNzQwMDY2NzkwNTE4MjIzMjRhMGFiMDg3OWFlYTU1OGE4ZjY4
YjUxMTc4MGQzMGNkOTI0IgogCiAjIE9uIGJ1aWxkIG1hY2hpbmVzIHdpdGggcHl0aG9uLWRvY3V0
aWxzIChub3QgcHl0aG9uMy1kb2N1dGlscyAhISkgaW5zdGFsbGVkCiAjIHJzdDJtYW4gKG5vdCBy
c3QybWFuLnB5KSBpcyBkZXRlY3RlZCBhbmQgY29tcGlsZSBmYWlscyB3aXRoCi0tIAoyLjQ0LjAK
Cg==

--===============3801119855814312889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (917 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-00c09649df2e157939635ea481b7e772facf6604"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:00c09649df2e157939635ea481b7e772facf6604"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 302 Local 286 Mirrors 0 Missed 16 Current 513 (94% match, 98% complete)
Removing 3 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1832 of 2263 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_recipe_qa)
NOTE: recipe alsa-utils-1.2.12-r0: task do_recipe_qa: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2241 of 2263 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_fetch)
NOTE: recipe alsa-utils-1.2.12-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_fetch: Succeeded
NOTE: Running task 2242 of 2263 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_unpack)
NOTE: Running task 2243 of 2263 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.12-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_unpack: Succeeded
NOTE: Running task 2244 of 2263 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_patch)
NOTE: Running task 2245 of 2263 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_collect_spdx_deps)
NOTE: recipe alsa-utils-1.2.12-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-utils-1.2.12-r0: task do_patch: Succeeded
NOTE: Running task 2246 of 2263 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2247 of 2263 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_populate_lic)
NOTE: recipe alsa-utils-1.2.12-r0: task do_populate_lic: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_populate_lic: Succeeded
NOTE: recipe alsa-utils-1.2.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2248 of 2263 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_configure)
NOTE: recipe alsa-utils-1.2.12-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_configure: Succeeded
NOTE: Running task 2249 of 2263 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_compile)
NOTE: recipe alsa-utils-1.2.12-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_compile: Succeeded
NOTE: Running task 2250 of 2263 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_install)
NOTE: recipe alsa-utils-1.2.12-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_install: Succeeded
NOTE: Running task 2251 of 2263 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_package)
NOTE: Running task 2252 of 2263 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_populate_sysroot)
NOTE: recipe alsa-utils-1.2.12-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.12-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 2252 tasks of which 2239 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715155709.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715155709.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_package
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: alsa-utils-1.2.12-r0 do_package: QA Issue: alsa-utils: Files/directories were installed but not shipped in any package:
  /usr/bin/aseqsend
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
alsa-utils: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: alsa-utils-1.2.12-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/alsa-utils/1.2.12/temp/log.do_package.1003668
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_package) failed with exit code '1'

--===============3801119855814312889==--

