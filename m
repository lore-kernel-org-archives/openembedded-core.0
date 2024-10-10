Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D09D0EE04
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:05 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.53361.1728588948281790444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dU6KLpoi;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ovPtwHfK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019277ee5468-e525ad39-0a94-435d-91f4-eb4a92a646f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588961;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=luNVqeLg+SUx/DKG3PuyjuOln/1VOgQ4W2ISpbpJYRY=;
	b=dU6KLpoiidNKF0uG/hmqY0GMfZobMbytUrrFaXW7/8q5D2ntLDsCbuBY4/l0eUWc
	gpeEitlwwy9d2+IT8sitZ22Vjf/JOei0V1SvITr8Fz/ZZIUa6aeYGkas+B8uoNzq6k9
	xDj9uY+G2yJ/rDeXk9rTkFgjCB35g2ypGJsKGNxo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588961;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=luNVqeLg+SUx/DKG3PuyjuOln/1VOgQ4W2ISpbpJYRY=;
	b=ovPtwHfKFekd617OwznSlAu+I6gKT0qoCbbP70KigUU5fIWkhAAeWvJO+Ky3XyCt
	bPA1eKFKtJ3apzg7ZvenObD4P+iLlx1fTxr8YUfr+iUwnctqo4i06AL6tzBZU6p+vnA
	udqOaa49SO3y3orP2eD9vaTmg+x1iYshL8ItW5fs=
Content-Type: multipart/mixed; boundary="===============5694285956332962778=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cups: upgrading to 2.4.11 FAILED
Message-ID: <0101019277ee5468-e525ad39-0a94-435d-91f4-eb4a92a646f9-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205498

--===============5694285956332962778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cups* to *2.4.11* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cups-upgrade-2.4.10-2.4.11.patch
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
From 51ab0455cf71f27d6585e85845233aa3ed967a95 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 03:01:10 +0000
Subject: [PATCH] cups: upgrade 2.4.10 -> 2.4.11

---
 .../cups/cups/0001-use-echo-only-in-init.patch              | 2 +-
 .../cups/0002-don-t-try-to-run-generated-binaries.patch     | 2 +-
 .../0004-cups-fix-multilib-install-file-conflicts.patch     | 6 +++---
 meta/recipes-extended/cups/cups/libexecdir.patch            | 5 ++---
 .../cups/{cups_2.4.10.bb => cups_2.4.11.bb}                 | 2 +-
 5 files changed, 8 insertions(+), 9 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.4.10.bb => cups_2.4.11.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index e6bd400779..69c771f391 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,4 +1,4 @@
-From ddfe6ed6a89226985e8c9f0751c026aabc0927a0 Mon Sep 17 00:00:00 2001
+From e9340b281fc7877a45539d0de425d7ab1b829661 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
 Subject: [PATCH] use echo only in init
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index 75270cb0cb..2d19e6b43c 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,4 +1,4 @@
-From ff6c7168c3f26094b3a18298208a28831d1c1fd5 Mon Sep 17 00:00:00 2001
+From 3a286f83cb90e5ac79596653707adf4f64e1aaad Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
 Subject: [PATCH] don't try to run generated binaries
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index d49fb8f2c2..4b53b8d655 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,4 +1,4 @@
-From 6e286b582571ffca3f7874076d70eec6fd5713f6 Mon Sep 17 00:00:00 2001
+From d7898d0b142e25ebb465ae672b8366c83a2d8b5b Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 3 Oct 2018 00:27:11 +0800
 Subject: [PATCH] cups: fix multilib install file conflicts
@@ -15,10 +15,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/conf/cups-files.conf.in b/conf/cups-files.conf.in
-index 93584a1..65b7052 100644
+index f96f745..27d8be9 100644
 --- a/conf/cups-files.conf.in
 +++ b/conf/cups-files.conf.in
-@@ -67,7 +67,7 @@ PageLog @CUPS_LOGDIR@/page_log
+@@ -70,7 +70,7 @@ PageLog @CUPS_LOGDIR@/page_log
  #RequestRoot @CUPS_REQUESTS@
  
  # Location of helper programs...
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/recipes-extended/cups/cups/libexecdir.patch
index 7ccad94f0f..5f9c7e62be 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,4 +1,4 @@
-From 1724f7bcdbcfdb445778f8a2e530c5c094c18c10 Mon Sep 17 00:00:00 2001
+From 8a4e25b2fb05ab7dc82066ff9cb6f8eb856a0038 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 13 Jul 2021 12:56:30 +0100
 Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
@@ -6,13 +6,12 @@ Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>
-
 ---
  config-scripts/cups-directories.m4 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/config-scripts/cups-directories.m4 b/config-scripts/cups-directories.m4
-index 2033d47..230166e 100644
+index 069ee7b..2f67e5b 100644
 --- a/config-scripts/cups-directories.m4
 +++ b/config-scripts/cups-directories.m4
 @@ -239,7 +239,7 @@ AC_SUBST([CUPS_REQUESTS])
diff --git a/meta/recipes-extended/cups/cups_2.4.10.bb b/meta/recipes-extended/cups/cups_2.4.11.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.10.bb
rename to meta/recipes-extended/cups/cups_2.4.11.bb
index e16ad47cf5..71568295cb 100644
--- a/meta/recipes-extended/cups/cups_2.4.10.bb
+++ b/meta/recipes-extended/cups/cups_2.4.11.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "d75757c2bc0f7a28b02ee4d52ca9e4b1aa1ba2affe16b985854f5336940e5ad7"
+SRC_URI[sha256sum] = "9a88fe1da3a29a917c3fc67ce6eb3178399d68e1a548c6d86c70d9b13651fd71"
-- 
2.44.1


--===============5694285956332962778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (916 cached, 1 parsed). 1871 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:90096c3f11f784774959bafc82441188c76d5e69"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 323 Local 311 Mirrors 0 Missed 12 Current 494 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2039 of 2264 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_recipe_qa)
NOTE: recipe cups-2.4.11-r0: task do_recipe_qa: Started
NOTE: recipe cups-2.4.11-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2245 of 2264 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_fetch)
NOTE: recipe cups-2.4.11-r0: task do_fetch: Started
NOTE: recipe cups-2.4.11-r0: task do_fetch: Succeeded
NOTE: Running task 2246 of 2264 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_unpack)
NOTE: Running task 2247 of 2264 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe cups-2.4.11-r0: task do_unpack: Started
NOTE: recipe cups-2.4.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cups-2.4.11-r0: task do_unpack: Succeeded
NOTE: Running task 2248 of 2264 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_patch)
NOTE: Running task 2249 of 2264 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_collect_spdx_deps)
NOTE: recipe cups-2.4.11-r0: task do_patch: Started
NOTE: recipe cups-2.4.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe cups-2.4.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cups-2.4.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cups-2.4.11-r0: task do_patch: Succeeded
NOTE: Running task 2250 of 2264 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2251 of 2264 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_populate_lic)
NOTE: recipe cups-2.4.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cups-2.4.11-r0: task do_populate_lic: Started
NOTE: recipe cups-2.4.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cups-2.4.11-r0: task do_populate_lic: Succeeded
NOTE: Running task 2252 of 2264 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_configure)
NOTE: recipe cups-2.4.11-r0: task do_configure: Started
NOTE: recipe cups-2.4.11-r0: task do_configure: Succeeded
NOTE: Running task 2253 of 2264 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_compile)
NOTE: recipe cups-2.4.11-r0: task do_compile: Started
NOTE: recipe cups-2.4.11-r0: task do_compile: Succeeded
NOTE: Running task 2254 of 2264 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_install)
NOTE: recipe cups-2.4.11-r0: task do_install: Started
NOTE: recipe cups-2.4.11-r0: task do_install: Succeeded
NOTE: Running task 2255 of 2264 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_package)
NOTE: Running task 2256 of 2264 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_populate_sysroot)
NOTE: recipe cups-2.4.11-r0: task do_populate_sysroot: Started
NOTE: recipe cups-2.4.11-r0: task do_package: Started
NOTE: recipe cups-2.4.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cups-2.4.11-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 2256 tasks of which 2243 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010030011.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010030011.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.11/temp/log.do_package.3838333
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cups-2.4.11-r0 do_package: QA Issue: cups: Files/directories were installed but not shipped in any package:
  /usr/lib/systemd/system/system-cups.slice
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
cups: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: cups-2.4.11-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.11/temp/log.do_package.3838333
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_package) failed with exit code '1'

--===============5694285956332962778==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cups-upgrade-2.4.10-2.4.11.patch"

RnJvbSA1MWFiMDQ1NWNmNzFmMjdkNjU4NWU4NTg0NTIzM2FhM2VkOTY3YTk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDM6MDE6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
dXBzOiB1cGdyYWRlIDIuNC4xMCAtPiAyLjQuMTEKCi0tLQogLi4uL2N1cHMvY3Vwcy8wMDAxLXVz
ZS1lY2hvLW9ubHktaW4taW5pdC5wYXRjaCAgICAgICAgICAgICAgfCAyICstCiAuLi4vY3Vwcy8w
MDAyLWRvbi10LXRyeS10by1ydW4tZ2VuZXJhdGVkLWJpbmFyaWVzLnBhdGNoICAgICB8IDIgKy0K
IC4uLi8wMDA0LWN1cHMtZml4LW11bHRpbGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2gg
ICAgIHwgNiArKystLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvbGliZXhlY2Rp
ci5wYXRjaCAgICAgICAgICAgIHwgNSArKy0tLQogLi4uL2N1cHMve2N1cHNfMi40LjEwLmJiID0+
IGN1cHNfMi40LjExLmJifSAgICAgICAgICAgICAgICAgfCAyICstCiA1IGZpbGVzIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvY3Vwcy97Y3Vwc18yLjQuMTAuYmIgPT4gY3Vwc18yLjQuMTEuYmJ9ICg1MSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAxLXVzZS1lY2hvLW9u
bHktaW4taW5pdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMS11
c2UtZWNoby1vbmx5LWluLWluaXQucGF0Y2gKaW5kZXggZTZiZDQwMDc3OS4uNjljNzcxZjM5MSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAxLXVzZS1lY2hv
LW9ubHktaW4taW5pdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBz
LzAwMDEtdXNlLWVjaG8tb25seS1pbi1pbml0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBk
ZGZlNmVkNmE4OTIyNjk4NWU4YzlmMDc1MWMwMjZhYWJjMDkyN2EwIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBlOTM0MGIyODFmYzc4NzdhNDU1MzlkMGRlNDI1ZDdhYjFiODI5NjYxIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogU2F1bCBXb2xkIDxzZ3dAbGludXguaW50ZWwu
Y29tPgogRGF0ZTogVGh1LCAxMyBEZWMgMjAxMiAxOTowMzo1MiAtMDgwMAogU3ViamVjdDogW1BB
VENIXSB1c2UgZWNobyBvbmx5IGluIGluaXQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9jdXBzL2N1cHMvMDAwMi1kb24tdC10cnktdG8tcnVuLWdlbmVyYXRlZC1iaW5hcmllcy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMi1kb24tdC10cnktdG8t
cnVuLWdlbmVyYXRlZC1iaW5hcmllcy5wYXRjaAppbmRleCA3NTI3MGNiMGNiLi4yZDE5ZTZiNDNj
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDItZG9uLXQt
dHJ5LXRvLXJ1bi1nZW5lcmF0ZWQtYmluYXJpZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2N1cHMvY3Vwcy8wMDAyLWRvbi10LXRyeS10by1ydW4tZ2VuZXJhdGVkLWJpbmFyaWVz
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmZjZjNzE2OGMzZjI2MDk0YjNhMTgyOTgyMDhh
Mjg4MzFkMWMxZmQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzYTI4NmY4M2NiOTBl
NWFjNzk1OTY2NTM3MDdhZGY0ZjY0ZTFhYWFkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogS29lbiBLb29pIDxrb2VuQGRvbWluaW9uLnRocnVoZXJlLm5ldD4KIERhdGU6IFN1biwgMzAg
SmFuIDIwMTEgMTY6Mzc6MjcgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZG9uJ3QgdHJ5IHRvIHJ1
biBnZW5lcmF0ZWQgYmluYXJpZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9j
dXBzL2N1cHMvMDAwNC1jdXBzLWZpeC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUtY29uZmxpY3RzLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDA0LWN1cHMtZml4LW11bHRp
bGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2gKaW5kZXggZDQ5ZmI4ZjJjMi4uNGI1M2I4
ZDY1NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDA0LWN1
cHMtZml4LW11bHRpbGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDA0LWN1cHMtZml4LW11bHRpbGliLWluc3RhbGwt
ZmlsZS1jb25mbGljdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDZlMjg2YjU4MjU3MWZm
Y2EzZjc4NzQwNzZkNzBlZWM2ZmQ1NzEzZjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGQ3ODk4ZDBiMTQyZTI1ZWJiNDY1YWU2NzJiODM2NmM4M2EyZDhiNWIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBLYWkgS2FuZyA8a2FpLmthbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6
IFdlZCwgMyBPY3QgMjAxOCAwMDoyNzoxMSArMDgwMAogU3ViamVjdDogW1BBVENIXSBjdXBzOiBm
aXggbXVsdGlsaWIgaW5zdGFsbCBmaWxlIGNvbmZsaWN0cwpAQCAtMTUsMTAgKzE1LDEwIEBAIFNp
Z25lZC1vZmYtYnk6IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29u
Zi9jdXBzLWZpbGVzLmNvbmYuaW4gYi9jb25mL2N1cHMtZmlsZXMuY29uZi5pbgotaW5kZXggOTM1
ODRhMS4uNjViNzA1MiAxMDA2NDQKK2luZGV4IGY5NmY3NDUuLjI3ZDhiZTkgMTAwNjQ0CiAtLS0g
YS9jb25mL2N1cHMtZmlsZXMuY29uZi5pbgogKysrIGIvY29uZi9jdXBzLWZpbGVzLmNvbmYuaW4K
LUBAIC02Nyw3ICs2Nyw3IEBAIFBhZ2VMb2cgQENVUFNfTE9HRElSQC9wYWdlX2xvZworQEAgLTcw
LDcgKzcwLDcgQEAgUGFnZUxvZyBAQ1VQU19MT0dESVJAL3BhZ2VfbG9nCiAgI1JlcXVlc3RSb290
IEBDVVBTX1JFUVVFU1RTQAogIAogICMgTG9jYXRpb24gb2YgaGVscGVyIHByb2dyYW1zLi4uCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL2xpYmV4ZWNkaXIucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL2xpYmV4ZWNkaXIucGF0Y2gKaW5k
ZXggN2NjYWQ5NGYwZi4uNWY5YzdlNjJiZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2N1cHMvY3Vwcy9saWJleGVjZGlyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9jdXBzL2N1cHMvbGliZXhlY2Rpci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTcyNGY3
YmNkYmNmZGI0NDU3NzhmOGEyZTUzMGM1YzA5NGMxOGMxMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gOGE0ZTI1YjJmYjA1YWI3ZGM4MjA2NmZmOWNiNmY4ZWI4NTZhMDAzOCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29t
PgogRGF0ZTogVHVlLCAxMyBKdWwgMjAyMSAxMjo1NjozMCArMDEwMAogU3ViamVjdDogW1BBVENI
XSBVc2UgJGxpYmV4ZWNkaXIgaW5zdGVhZCBvZiBoYXJkY29kaW5nICRwcmVmaXgvbGliIGFzIHRo
aXMKQEAgLTYsMTMgKzYsMTIgQEAgU3ViamVjdDogW1BBVENIXSBVc2UgJGxpYmV4ZWNkaXIgaW5z
dGVhZCBvZiBoYXJkY29kaW5nICRwcmVmaXgvbGliIGFzIHRoaXMKIAogVXBzdHJlYW0tU3RhdHVz
OiBQZW5kaW5nCiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNv
bT4KLQogLS0tCiAgY29uZmlnLXNjcmlwdHMvY3Vwcy1kaXJlY3Rvcmllcy5tNCB8IDQgKystLQog
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYg
LS1naXQgYS9jb25maWctc2NyaXB0cy9jdXBzLWRpcmVjdG9yaWVzLm00IGIvY29uZmlnLXNjcmlw
dHMvY3Vwcy1kaXJlY3Rvcmllcy5tNAotaW5kZXggMjAzM2Q0Ny4uMjMwMTY2ZSAxMDA2NDQKK2lu
ZGV4IDA2OWVlN2IuLjJmNjdlNWIgMTAwNjQ0CiAtLS0gYS9jb25maWctc2NyaXB0cy9jdXBzLWRp
cmVjdG9yaWVzLm00CiArKysgYi9jb25maWctc2NyaXB0cy9jdXBzLWRpcmVjdG9yaWVzLm00CiBA
QCAtMjM5LDcgKzIzOSw3IEBAIEFDX1NVQlNUKFtDVVBTX1JFUVVFU1RTXSkKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40LjEwLmJiIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuMTEuYmIKc2ltaWxhcml0eSBpbmRleCA1MSUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuMTAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40LjExLmJiCmluZGV4IGUxNmFkNDdj
ZjUuLjcxNTY4Mjk1Y2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1
cHNfMi40LjEwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40LjEx
LmJiCkBAIC0yLDQgKzIsNCBAQCByZXF1aXJlIGN1cHMuaW5jCiAKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3Igog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDc1NzU3YzJiYzBmN2EyOGIwMmVlNGQ1MmNhOWU0YjFh
YTFiYTJhZmZlMTZiOTg1ODU0ZjUzMzY5NDBlNWFkNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5
YTg4ZmUxZGEzYTI5YTkxN2MzZmM2N2NlNmViMzE3ODM5OWQ2OGUxYTU0OGM2ZDg2YzcwZDliMTM2
NTFmZDcxIgotLSAKMi40NC4xCgo=

--===============5694285956332962778==--

