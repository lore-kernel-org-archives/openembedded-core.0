Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79F8C47DDA
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:06 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.4630.1704114719598145901
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=c24gZoVT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ksBbWMWO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018cc5270f7d-30a14188-ec54-41ff-8a99-1afc4f7e16fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dv4gp5ob8f7OL5KmUe5pkqdtlzu2nlhj/nnme8lQTHY=;
	b=c24gZoVTaspgwzPPweROjQ9L97X7CxhH4rFylBFl75gSyZFdhaCEcBxKXezzTGsv
	gt+83UX28EIaD91q4fstBNP+qzcYcfIgFrhcVSwpY1wnlgGWJ2dJfnlkcCiflsTsGMW
	YBnhCMMCsr0Ae+I9yATynLqYB0V98LYt/txbzq8g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dv4gp5ob8f7OL5KmUe5pkqdtlzu2nlhj/nnme8lQTHY=;
	b=ksBbWMWO2L8PWU3ufErUpYmjEYMPfFPmBlY7I3EA0MCXrr+r3ujCkzS+eYlfI0yU
	cBhtVB5z1ItjrbJpmDCVEokMwvOij9YHepP5dnt5yp7lXISMa5ivt+XnMNeE+HBLjtX
	y2CUj/xdngxWY8nTQsVN3blwY5NwEx8IrPFY43G4=
Content-Type: multipart/mixed; boundary="===============2779261493373991824=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng: upgrading to 0.8.4 FAILED
Message-ID: <0101018cc5270f7d-30a14188-ec54-41ff-8a99-1afc4f7e16fd-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:12:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193158

--===============2779261493373991824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcap-ng* to *0.8.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libcap-ng-upgrade-0.8.3-0.8.4.patch
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
From 26bfadcb3c15a71f5fc395afe7247901b02430b0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 12:45:32 +0000
Subject: [PATCH] libcap-ng: upgrade 0.8.3 -> 0.8.4

---
 meta/recipes-support/libcap-ng/libcap-ng.inc                    | 2 +-
 .../libcap-ng/{libcap-ng_0.8.3.bb => libcap-ng_0.8.4.bb}        | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.8.3.bb => libcap-ng_0.8.4.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 55e3287396..a6b5dcf452 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "bed6f6848e22bb2f83b5f764b2aef0ed393054e803a8e3a8711cb2a39e6b492d"
+SRC_URI[sha256sum] = "68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a"
 
 EXTRA_OECONF:append:class-target = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
 EXTRA_OECONF:append:class-nativesdk = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb
-- 
2.42.0


--===============2779261493373991824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1850 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (911 cached, 2 parsed). 1847 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-86de35aafb7e2c888c818ff41e9d40b4a231f742"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:86de35aafb7e2c888c818ff41e9d40b4a231f742"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 92 Local 58 Mirrors 0 Missed 34 Current 200 (63% match, 88% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 214 of 886 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_patch)
NOTE: Running task 238 of 886 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_patch)
NOTE: Running task 499 of 886 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_patch: Started
NOTE: Running task 701 of 886 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_collect_spdx_deps)
NOTE: Running task 706 of 886 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa)
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_recipe_qa: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_patch: Succeeded
NOTE: Running noexec task 761 of 886 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_configure)
NOTE: Running noexec task 762 of 886 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_compile)
NOTE: Running task 763 of 886 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_install)
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 764 of 886 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch)
NOTE: Running task 765 of 886 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.4-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_install: Started
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_fetch: Succeeded
NOTE: Running task 766 of 886 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_unpack)
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_fetch: Succeeded
NOTE: Running task 767 of 886 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_unpack)
NOTE: Running task 768 of 886 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-ng-0.8.4-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 769 of 886 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_patch)
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 770 of 886 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_patch)
NOTE: recipe libcap-ng-0.8.4-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_patch: Started
NOTE: Running task 771 of 886 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 772 of 886 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_lic)
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_patch: Succeeded
NOTE: Running task 773 of 886 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_lic: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_lic: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Succeeded
NOTE: Running task 775 of 886 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_preconfigure)
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 780 of 886 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_configure)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Started
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_configure: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_install: Succeeded
NOTE: Running task 795 of 886 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.38+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.38+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 796 of 886 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_configure)
NOTE: recipe glibc-2.38+git-r0: task do_configure: Started
NOTE: recipe glibc-2.38+git-r0: task do_configure: Succeeded
NOTE: Running task 797 of 886 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_compile)
NOTE: recipe glibc-2.38+git-r0: task do_compile: Started
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_configure: Failed
NOTE: recipe glibc-2.38+git-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 797 tasks of which 774 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101124346.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101124346.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libcap-ng-native-0.8.4-r0 do_configure: QA Issue: libcap-ng-native: configure was passed unrecognised options: --without-python [unknown-configure-option]
ERROR: libcap-ng-native-0.8.4-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/libcap-ng-native/0.8.4/temp/log.do_configure.2585214
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_configure) failed with exit code '1'

--===============2779261493373991824==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-ng-upgrade-0.8.3-0.8.4.patch"

RnJvbSAyNmJmYWRjYjNjMTVhNzFmNWZjMzk1YWZlNzI0NzkwMWIwMjQzMGIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAxMjo0NTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmNhcC1uZzogdXBncmFkZSAwLjguMyAtPiAwLjguNAoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJjYXAtbmcvbGliY2FwLW5nLmluYyAgICAgICAgICAgICAgICAgICAgfCAyICstCiAuLi4v
bGliY2FwLW5nL3tsaWJjYXAtbmdfMC44LjMuYmIgPT4gbGliY2FwLW5nXzAuOC40LmJifSAgICAg
ICAgfCAwCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL3tsaWJjYXAtbmdfMC44LjMuYmIg
PT4gbGliY2FwLW5nXzAuOC40LmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLmluYyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmNhcC1uZy9saWJjYXAtbmcuaW5jCmluZGV4IDU1ZTMyODczOTYuLmE2YjVkY2Y0NTIgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jCkBAIC05LDcgKzks
NyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT05NGQ1NWQ1MTJhOWJh
MzZjYWE5YjdkZjA3OWJhZTE5ZiBcCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9wZW9wbGUucmVkaGF0
LmNvbS9zZ3J1YmIvbGliY2FwLW5nL2xpYmNhcC1uZy0ke1BWfS50YXIuZ3oiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJiZWQ2ZjY4NDhlMjJiYjJmODNiNWY3NjRiMmFlZjBlZDM5MzA1NGU4MDNh
OGUzYTg3MTFjYjJhMzllNmI0OTJkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY4NTgxZDNiMzhl
NzU1M2NiNmY2ZGRmNzgxM2IxZmM5OWU1Mjg1NmYyMTQyMWY3YjQ3N2NlNWFiZDI2MDVhOGEiCiAK
IEVYVFJBX09FQ09ORjphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiAtLXdpdGgtY2FwYWJpbGl0eV9o
ZWFkZXI9JHtTVEFHSU5HX0lOQ0RJUn0vbGludXgvY2FwYWJpbGl0eS5oIgogRVhUUkFfT0VDT05G
OmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIC0td2l0aC1jYXBhYmlsaXR5X2hlYWRlcj0ke1NU
QUdJTkdfSU5DRElSfS9saW51eC9jYXBhYmlsaXR5LmgiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nXzAuOC4zLmJiIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZ18wLjguNC5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZ18wLjgu
My5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZ18w
LjguNC5iYgotLSAKMi40Mi4wCgo=

--===============2779261493373991824==--

