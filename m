Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D491EC5AE5A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:26 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.75487.1722536824370817382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=du3Zy1XO;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cB2hkl2C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101910f3237e1-a561d9c0-aca4-465f-a2ae-3966b57d47c1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536835;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6I0fKCjT6iNJPdECHvjHdt8ca6ORNLIwQTNniSz/Wf0=;
	b=du3Zy1XOFUtHEuZEOk6xEYAASv7ZZmXyTseCUurU85pRah32MfD6KuaNZNkPTdp5
	OlnBGNFNYV9VP/IEZ8wgr3E2wObpew4BlIcf6KFPg3PpicIPAhd9YFm3ErTWja7OCZE
	Vjh8R3Su6Ls+kq9kANAmtZgzwE1NdNrL6zio2Zo8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536835;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6I0fKCjT6iNJPdECHvjHdt8ca6ORNLIwQTNniSz/Wf0=;
	b=cB2hkl2CENRH/lrBmBKkO9heJq0zPwktig70S3M7D4HQ/TDXpTZt+nV1izhBbSlc
	2w33IH2XmnYVC4glNaYvFlphJJHYq0eP6IyUbpJcfbtWEiF1JiOHcCqfAcrRUDJMdsE
	PF/R+kiekJKG1NtmCwxW7OG5FM8ZoQd4PAFlNhFQ=
Content-Type: multipart/mixed; boundary="===============7540899091309135139=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael@opdenacker.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-utils: upgrading to 1.2.12 FAILED
Message-ID: <010101910f3237e1-a561d9c0-aca4-465f-a2ae-3966b57d47c1-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202861

--===============7540899091309135139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-utils* to *1.2.12* has Failed(do_compile).

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
From 4f0dcbc2752b95a025a19e118e3726e128e238f9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 15:11:17 +0000
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


--===============7540899091309135139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1883 targets, 37 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-3aafca7271a0d01ce53d10b51d2bbca755fb0c88"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3aafca7271a0d01ce53d10b51d2bbca755fb0c88"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 309 Local 293 Mirrors 0 Missed 16 Current 514 (94% match, 98% complete)
Removing 3 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1841 of 2279 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_recipe_qa)
NOTE: recipe alsa-utils-1.2.12-r0: task do_recipe_qa: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_recipe_qa unihash changed to bea4ecdd90fb8d360a3e19dd245bb5d4aae7b8febe2460e162a20c3df33e125c
NOTE: Setscene tasks completed
NOTE: Running task 2257 of 2279 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_fetch)
NOTE: recipe alsa-utils-1.2.12-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_fetch: Succeeded
NOTE: Running task 2258 of 2279 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_unpack)
NOTE: Running task 2259 of 2279 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.12-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_unpack: Succeeded
NOTE: Running task 2260 of 2279 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_patch)
NOTE: Running task 2261 of 2279 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_collect_spdx_deps)
NOTE: recipe alsa-utils-1.2.12-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-utils-1.2.12-r0: task do_patch: Succeeded
NOTE: Running task 2262 of 2279 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2263 of 2279 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_populate_lic)
NOTE: recipe alsa-utils-1.2.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_populate_lic: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_populate_lic unihash changed to 780ee12b4908952d486e408e29c7c40977f0516e2b8c6e85b517e684865fa748
NOTE: recipe alsa-utils-1.2.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_deploy_source_date_epoch unihash changed to ef3e974625e75d826d511191490017171688e84d594fe5bbd32f425a9bc4e6e1
NOTE: Setscene tasks completed
NOTE: Running task 2264 of 2279 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_configure)
NOTE: recipe alsa-utils-1.2.12-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_configure: Succeeded
NOTE: Running task 2265 of 2279 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_compile)
NOTE: recipe alsa-utils-1.2.12-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_compile: Succeeded
NOTE: Running task 2266 of 2279 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_install)
NOTE: recipe alsa-utils-1.2.12-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_install: Succeeded
NOTE: Running task 2267 of 2279 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_package)
NOTE: Running task 2268 of 2279 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_populate_sysroot)
NOTE: recipe alsa-utils-1.2.12-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-1.2.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.12-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 2268 tasks of which 2255 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801151031.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801151031.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_package
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: alsa-utils-1.2.12-r0 do_package: QA Issue: alsa-utils: Files/directories were installed but not shipped in any package:
  /usr/bin/aseqsend
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
alsa-utils: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: alsa-utils-1.2.12-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/alsa-utils/1.2.12/temp/log.do_package.3978380
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb:do_package) failed with exit code '1'

--===============7540899091309135139==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-utils-upgrade-1.2.11-1.2.12.patch"

RnJvbSA0ZjBkY2JjMjc1MmI5NWEwMjVhMTllMTE4ZTM3MjZlMTI4ZTIzOGY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNToxMToxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFs
c2EtdXRpbHM6IHVwZ3JhZGUgMS4yLjExIC0+IDEuMi4xMgoKLS0tCiAuLi4vYWxzYS97YWxzYS11
dGlsc18xLjIuMTEuYmIgPT4gYWxzYS11dGlsc18xLjIuMTIuYmJ9ICAgICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL3thbHNhLXV0aWxzXzEuMi4xMS5iYiA9PiBhbHNhLXV0
aWxzXzEuMi4xMi5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjExLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxz
YS9hbHNhLXV0aWxzXzEuMi4xMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjExLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjEyLmJiCmluZGV4
IGU1OThmYWM5ZjguLjM1NDQzZWM3ZTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2Fsc2EvYWxzYS11dGlsc18xLjIuMTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvYWxzYS9hbHNhLXV0aWxzXzEuMi4xMi5iYgpAQCAtMjYsNyArMjYsNyBAQCBQQUNLQUdFQ09O
RklHW21hbnBhZ2VzXSA9ICItLWVuYWJsZS14bWx0bywgLS1kaXNhYmxlLXhtbHRvLCB4bWx0by1u
YXRpdmUgZG9jYm9vawogIyBhbHNhLXV0aWxzIHNwZWNpZmllZCBpbiBTUkNfVVJJIGR1ZSB0byBh
bHNhLXV0aWxzLXNjcmlwdHMgcmVjaXBlCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3LmFsc2EtcHJv
amVjdC5vcmcvZmlsZXMvcHViL3V0aWxzL2Fsc2EtdXRpbHMtJHtQVn0udGFyLmJ6MiBcCiAgICAg
ICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5YWM2Y2EzYTg4M2YxNTFlNTY4ZGNmOTc5
YjhkMmU1Y2JlY2M1MWI4MTliYjBlNmJiOGEyZTliMzRjYzQyOGE3IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjk4YmM2Njc3ZDBjMDA3NDAwNjY3OTA1MTgyMjMyNGEwYWIwODc5YWVhNTU4YThmNjhi
NTExNzgwZDMwY2Q5MjQiCiAKICMgT24gYnVpbGQgbWFjaGluZXMgd2l0aCBweXRob24tZG9jdXRp
bHMgKG5vdCBweXRob24zLWRvY3V0aWxzICEhKSBpbnN0YWxsZWQKICMgcnN0Mm1hbiAobm90IHJz
dDJtYW4ucHkpIGlzIGRldGVjdGVkIGFuZCBjb21waWxlIGZhaWxzIHdpdGgKLS0gCjIuNDQuMAoK

--===============7540899091309135139==--

