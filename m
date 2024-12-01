Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D44FD49763
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:10 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.148765.1733047562367592312
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JA4WCdCV;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=nzVFr0r8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019381af2d8d-d4c450ee-5505-4939-b13f-c17a8a7614c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047561;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NHm5Z8ttaPf5hdP+IlOY4UUo+8teDExQ867GntKopq4=;
	b=JA4WCdCVP3+i8C0EdGVqX79FZEhN8Wljwu/rWoNS4lvML5ETnhVtLOSERYW9E8oe
	/pZ0DWLtMYCb3CcdVy8izDAhhiNnDOTIuijtDLvYO96Q7e7m54fYQMgGONONnPw6+ay
	8fhcLVA0FNSVQ4GfON0CvnFycJ3dTz2Gi2RBJ/7E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047561;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NHm5Z8ttaPf5hdP+IlOY4UUo+8teDExQ867GntKopq4=;
	b=nzVFr0r80akhUcWuVxA2BdeiIazrYBN9Q4D6PO+WGeTA/Bhyp8BV3h+n4H2eDDXT
	li1Lcs06pyp7ficLz/aVp87B1DgvOCg+8wjFU5U9I2ncpo80fGBQjk3wunk11oxNALg
	2L7Y6DTar3EjluhCbPN/fe8q2Er33JxL5SkBYFyk=
Content-Type: multipart/mixed; boundary="===============7752883506892155354=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cups: upgrading to 2.4.11 FAILED
Message-ID: <0101019381af2d8d-d4c450ee-5505-4939-b13f-c17a8a7614c9-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208082

--===============7752883506892155354==
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
From 2f6c06f1d241e1de728b7743b0393d461caf2dbb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 07:45:55 +0000
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
index e6bd400779..baf1b94dcc 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,4 +1,4 @@
-From ddfe6ed6a89226985e8c9f0751c026aabc0927a0 Mon Sep 17 00:00:00 2001
+From d9605086fa9f8ef4201525db3017841c339e92b2 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
 Subject: [PATCH] use echo only in init
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index 75270cb0cb..ee2ab4ee0d 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,4 +1,4 @@
-From ff6c7168c3f26094b3a18298208a28831d1c1fd5 Mon Sep 17 00:00:00 2001
+From 17df535c1e743d230e5d66d5c3ae46a6ad7f4f25 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
 Subject: [PATCH] don't try to run generated binaries
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index d49fb8f2c2..901aee2c8a 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,4 +1,4 @@
-From 6e286b582571ffca3f7874076d70eec6fd5713f6 Mon Sep 17 00:00:00 2001
+From b5193bacf682dd53f695e00579f99a96e3efd383 Mon Sep 17 00:00:00 2001
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
index 7ccad94f0f..60d1499d0b 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,4 +1,4 @@
-From 1724f7bcdbcfdb445778f8a2e530c5c094c18c10 Mon Sep 17 00:00:00 2001
+From e72f07eddbb071df122f21d2ed25f3a2ec431e94 Mon Sep 17 00:00:00 2001
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


--===============7752883506892155354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1877 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:6ed7588844f0791e2a1212514077fb6f60e95af9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 295 Local 284 Mirrors 0 Missed 11 Current 501 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 782 of 796 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_recipe_qa_setscene)
NOTE: recipe cups-2.4.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cups-2.4.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1984 of 2203 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_fetch)
NOTE: recipe cups-2.4.11-r0: task do_fetch: Started
NOTE: recipe cups-2.4.11-r0: task do_fetch: Succeeded
NOTE: Running task 2185 of 2203 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_unpack)
NOTE: Running task 2186 of 2203 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe cups-2.4.11-r0: task do_unpack: Started
NOTE: recipe cups-2.4.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cups-2.4.11-r0: task do_unpack: Succeeded
NOTE: Running task 2187 of 2203 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_patch)
NOTE: Running task 2188 of 2203 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_collect_spdx_deps)
NOTE: recipe cups-2.4.11-r0: task do_patch: Started
NOTE: recipe cups-2.4.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe cups-2.4.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cups-2.4.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cups-2.4.11-r0: task do_patch: Succeeded
NOTE: Running task 2189 of 2203 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2190 of 2203 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_populate_lic)
NOTE: recipe cups-2.4.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cups-2.4.11-r0: task do_populate_lic: Started
NOTE: recipe cups-2.4.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_deploy_source_date_epoch unihash changed to d65aa5d80eb9da98c5554ad8c45a800244b01a36efb1399078379f5e7be856a9
NOTE: recipe cups-2.4.11-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_populate_lic unihash changed to d7386203b323e4fc4a6b31d9f098955a1ee663ec14d2ac5ea2269589dbb1a8ec
NOTE: Setscene tasks completed
NOTE: Running task 2191 of 2203 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_configure)
NOTE: recipe cups-2.4.11-r0: task do_configure: Started
NOTE: recipe cups-2.4.11-r0: task do_configure: Succeeded
NOTE: Running task 2192 of 2203 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_compile)
NOTE: recipe cups-2.4.11-r0: task do_compile: Started
NOTE: recipe cups-2.4.11-r0: task do_compile: Succeeded
NOTE: Running task 2193 of 2203 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_install)
NOTE: recipe cups-2.4.11-r0: task do_install: Started
NOTE: recipe cups-2.4.11-r0: task do_install: Succeeded
NOTE: Running task 2194 of 2203 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_package)
NOTE: Running task 2195 of 2203 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_populate_sysroot)
NOTE: recipe cups-2.4.11-r0: task do_populate_sysroot: Started
NOTE: recipe cups-2.4.11-r0: task do_package: Started
NOTE: recipe cups-2.4.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cups-2.4.11-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 2195 tasks of which 2183 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201074456.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201074456.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.11/temp/log.do_package.1172542
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cups-2.4.11-r0 do_package: QA Issue: cups: Files/directories were installed but not shipped in any package:
  /usr/lib/systemd/system/system-cups.slice
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
cups: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: cups-2.4.11-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.11/temp/log.do_package.1172542
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_package) failed with exit code '1'

--===============7752883506892155354==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cups-upgrade-2.4.10-2.4.11.patch"

RnJvbSAyZjZjMDZmMWQyNDFlMWRlNzI4Yjc3NDNiMDM5M2Q0NjFjYWYyZGJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwNzo0NTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGN1
cHM6IHVwZ3JhZGUgMi40LjEwIC0+IDIuNC4xMQoKLS0tCiAuLi4vY3Vwcy9jdXBzLzAwMDEtdXNl
LWVjaG8tb25seS1pbi1pbml0LnBhdGNoICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9jdXBzLzAw
MDItZG9uLXQtdHJ5LXRvLXJ1bi1nZW5lcmF0ZWQtYmluYXJpZXMucGF0Y2ggICAgIHwgMiArLQog
Li4uLzAwMDQtY3Vwcy1maXgtbXVsdGlsaWItaW5zdGFsbC1maWxlLWNvbmZsaWN0cy5wYXRjaCAg
ICAgfCA2ICsrKy0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy9saWJleGVjZGly
LnBhdGNoICAgICAgICAgICAgfCA1ICsrLS0tCiAuLi4vY3Vwcy97Y3Vwc18yLjQuMTAuYmIgPT4g
Y3Vwc18yLjQuMTEuYmJ9ICAgICAgICAgICAgICAgICB8IDIgKy0KIDUgZmlsZXMgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRl
bmRlZC9jdXBzL3tjdXBzXzIuNC4xMC5iYiA9PiBjdXBzXzIuNC4xMS5iYn0gKDUxJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDEtdXNlLWVjaG8tb25s
eS1pbi1pbml0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAxLXVz
ZS1lY2hvLW9ubHktaW4taW5pdC5wYXRjaAppbmRleCBlNmJkNDAwNzc5Li5iYWYxYjk0ZGNjIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDEtdXNlLWVjaG8t
b25seS1pbi1pbml0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMv
MDAwMS11c2UtZWNoby1vbmx5LWluLWluaXQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGRk
ZmU2ZWQ2YTg5MjI2OTg1ZThjOWYwNzUxYzAyNmFhYmMwOTI3YTAgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGQ5NjA1MDg2ZmE5ZjhlZjQyMDE1MjVkYjMwMTc4NDFjMzM5ZTkyYjIgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBTYXVsIFdvbGQgPHNnd0BsaW51eC5pbnRlbC5j
b20+CiBEYXRlOiBUaHUsIDEzIERlYyAyMDEyIDE5OjAzOjUyIC0wODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIHVzZSBlY2hvIG9ubHkgaW4gaW5pdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2N1cHMvY3Vwcy8wMDAyLWRvbi10LXRyeS10by1ydW4tZ2VuZXJhdGVkLWJpbmFyaWVzLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAyLWRvbi10LXRyeS10by1y
dW4tZ2VuZXJhdGVkLWJpbmFyaWVzLnBhdGNoCmluZGV4IDc1MjcwY2IwY2IuLmVlMmFiNGVlMGQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMi1kb24tdC10
cnktdG8tcnVuLWdlbmVyYXRlZC1iaW5hcmllcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvY3Vwcy9jdXBzLzAwMDItZG9uLXQtdHJ5LXRvLXJ1bi1nZW5lcmF0ZWQtYmluYXJpZXMu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGZmNmM3MTY4YzNmMjYwOTRiM2ExODI5ODIwOGEy
ODgzMWQxYzFmZDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE3ZGY1MzVjMWU3NDNk
MjMwZTVkNjZkNWMzYWU0NmE2YWQ3ZjRmMjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBLb2VuIEtvb2kgPGtvZW5AZG9taW5pb24udGhydWhlcmUubmV0PgogRGF0ZTogU3VuLCAzMCBK
YW4gMjAxMSAxNjozNzoyNyArMDEwMAogU3ViamVjdDogW1BBVENIXSBkb24ndCB0cnkgdG8gcnVu
IGdlbmVyYXRlZCBiaW5hcmllcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1
cHMvY3Vwcy8wMDA0LWN1cHMtZml4LW11bHRpbGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDQtY3Vwcy1maXgtbXVsdGls
aWItaW5zdGFsbC1maWxlLWNvbmZsaWN0cy5wYXRjaAppbmRleCBkNDlmYjhmMmMyLi45MDFhZWUy
YzhhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDQtY3Vw
cy1maXgtbXVsdGlsaWItaW5zdGFsbC1maWxlLWNvbmZsaWN0cy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDQtY3Vwcy1maXgtbXVsdGlsaWItaW5zdGFsbC1m
aWxlLWNvbmZsaWN0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmUyODZiNTgyNTcxZmZj
YTNmNzg3NDA3NmQ3MGVlYzZmZDU3MTNmNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
YjUxOTNiYWNmNjgyZGQ1M2Y2OTVlMDA1NzlmOTlhOTZlM2VmZDM4MyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgogRGF0ZTog
V2VkLCAzIE9jdCAyMDE4IDAwOjI3OjExICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGN1cHM6IGZp
eCBtdWx0aWxpYiBpbnN0YWxsIGZpbGUgY29uZmxpY3RzCkBAIC0xNSwxMCArMTUsMTAgQEAgU2ln
bmVkLW9mZi1ieTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25m
L2N1cHMtZmlsZXMuY29uZi5pbiBiL2NvbmYvY3Vwcy1maWxlcy5jb25mLmluCi1pbmRleCA5MzU4
NGExLi42NWI3MDUyIDEwMDY0NAoraW5kZXggZjk2Zjc0NS4uMjdkOGJlOSAxMDA2NDQKIC0tLSBh
L2NvbmYvY3Vwcy1maWxlcy5jb25mLmluCiArKysgYi9jb25mL2N1cHMtZmlsZXMuY29uZi5pbgot
QEAgLTY3LDcgKzY3LDcgQEAgUGFnZUxvZyBAQ1VQU19MT0dESVJAL3BhZ2VfbG9nCitAQCAtNzAs
NyArNzAsNyBAQCBQYWdlTG9nIEBDVVBTX0xPR0RJUkAvcGFnZV9sb2cKICAjUmVxdWVzdFJvb3Qg
QENVUFNfUkVRVUVTVFNACiAgCiAgIyBMb2NhdGlvbiBvZiBoZWxwZXIgcHJvZ3JhbXMuLi4KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvbGliZXhlY2Rpci5wYXRj
aCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvbGliZXhlY2Rpci5wYXRjaAppbmRl
eCA3Y2NhZDk0ZjBmLi42MGQxNDk5ZDBiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvY3Vwcy9jdXBzL2xpYmV4ZWNkaXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2N1cHMvY3Vwcy9saWJleGVjZGlyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxNzI0Zjdi
Y2RiY2ZkYjQ0NTc3OGY4YTJlNTMwYzVjMDk0YzE4YzEwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBlNzJmMDdlZGRiYjA3MWRmMTIyZjIxZDJlZDI1ZjNhMmVjNDMxZTk0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+
CiBEYXRlOiBUdWUsIDEzIEp1bCAyMDIxIDEyOjU2OjMwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hd
IFVzZSAkbGliZXhlY2RpciBpbnN0ZWFkIG9mIGhhcmRjb2RpbmcgJHByZWZpeC9saWIgYXMgdGhp
cwpAQCAtNiwxMyArNiwxMiBAQCBTdWJqZWN0OiBbUEFUQ0hdIFVzZSAkbGliZXhlY2RpciBpbnN0
ZWFkIG9mIGhhcmRjb2RpbmcgJHByZWZpeC9saWIgYXMgdGhpcwogCiBVcHN0cmVhbS1TdGF0dXM6
IFBlbmRpbmcKIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29t
PgotCiAtLS0KICBjb25maWctc2NyaXB0cy9jdXBzLWRpcmVjdG9yaWVzLm00IHwgNCArKy0tCiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL2NvbmZpZy1zY3JpcHRzL2N1cHMtZGlyZWN0b3JpZXMubTQgYi9jb25maWctc2NyaXB0
cy9jdXBzLWRpcmVjdG9yaWVzLm00Ci1pbmRleCAyMDMzZDQ3Li4yMzAxNjZlIDEwMDY0NAoraW5k
ZXggMDY5ZWU3Yi4uMmY2N2U1YiAxMDA2NDQKIC0tLSBhL2NvbmZpZy1zY3JpcHRzL2N1cHMtZGly
ZWN0b3JpZXMubTQKICsrKyBiL2NvbmZpZy1zY3JpcHRzL2N1cHMtZGlyZWN0b3JpZXMubTQKIEBA
IC0yMzksNyArMjM5LDcgQEAgQUNfU1VCU1QoW0NVUFNfUkVRVUVTVFNdKQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuMTAuYmIgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC4xMS5iYgpzaW1pbGFyaXR5IGluZGV4IDUxJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC4xMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuMTEuYmIKaW5kZXggZTE2YWQ0N2Nm
NS4uNzE1NjgyOTVjYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vw
c18yLjQuMTAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuMTEu
YmIKQEAgLTIsNCArMiw0IEBAIHJlcXVpcmUgY3Vwcy5pbmMKIAogTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkNzU3NTdjMmJjMGY3YTI4YjAyZWU0ZDUyY2E5ZTRiMWFh
MWJhMmFmZmUxNmI5ODU4NTRmNTMzNjk0MGU1YWQ3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlh
ODhmZTFkYTNhMjlhOTE3YzNmYzY3Y2U2ZWIzMTc4Mzk5ZDY4ZTFhNTQ4YzZkODZjNzBkOWIxMzY1
MWZkNzEiCi0tIAoyLjQ0LjEKCg==

--===============7752883506892155354==--

