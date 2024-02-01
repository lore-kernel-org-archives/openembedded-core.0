Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01985C48BEC
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:16 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.2168.1706810408014869342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=J36jqTo1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ddf0P5Ej;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018d65d3f9b3-9e9c3a5e-4796-4db0-91bf-e26d606d9c40-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810407;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ujwwjIS1f+X43rUuPsV0B1Pp+GY2yxkuvpmvZ8jjU6I=;
	b=J36jqTo1/cvTgDm9vWuAniSqb4KxVpWIJG5ao2KuLzHxl7mtj43S9a2nMN1duQlc
	USAHeXqLuD/x3MnLq9qnSgfEgtCDseaODoCz7IfHQ21Wmd4IcHb5jkviOgt5Py9cm4U
	gHacSj1s44tLzK/hhkF/f2ASLQpF8U+5cl65vnYQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810407;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ujwwjIS1f+X43rUuPsV0B1Pp+GY2yxkuvpmvZ8jjU6I=;
	b=ddf0P5EjnEkXe8txwYok8HudZ1wj1xLVv6es35fJdT3sr1Af8lVzPoqhUPnHivR0
	fZKpUb8N9P+VWDa2nxk/C/bIxyEwNmr2gu8YgRlBGq+lXxH3iaCrOD0f1qdG326pSVp
	/A5ouLFb8+HM4UzyTcXz0ZkmGfiuHNIt8Gv7GAg8=
Content-Type: multipart/mixed; boundary="===============0865592158926365336=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] wireless-regdb: upgrading to 2024.01.23 FAILED
Message-ID: <0101018d65d3f9b3-9e9c3a5e-4796-4db0-91bf-e26d606d9c40-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194699

--===============0865592158926365336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wireless-regdb* to *2024.01.23* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2023.09.01-2024.01.23.patch
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
From 468c1d0d891ac81422cb43514b57dc585491fbb8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 14:06:10 +0000
Subject: [PATCH] wireless-regdb: upgrade 2023.09.01 -> 2024.01.23

---
 ...ireless-regdb_2023.09.01.bb => wireless-regdb_2024.01.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.09.01.bb => wireless-regdb_2024.01.23.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb
index c09600ecbe..f8ce01e436 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "26d4c2a727cc59239b84735aad856b7c7d0b04e30aa5c235c4f7f47f5f053491"
+SRC_URI[sha256sum] = "c8a61c9acf76fa7eb4239e89f640dee3e87098d9f69b4d3518c9c60fc6d20c55"
 
 inherit bin_package allarch
 
-- 
2.42.0


--===============0865592158926365336==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2023.09.01-2024.01.23.patch"

RnJvbSA0NjhjMWQwZDg5MWFjODE0MjJjYjQzNTE0YjU3ZGM1ODU0OTFmYmI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNDowNjoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdp
cmVsZXNzLXJlZ2RiOiB1cGdyYWRlIDIwMjMuMDkuMDEgLT4gMjAyNC4wMS4yMwoKLS0tCiAuLi5p
cmVsZXNzLXJlZ2RiXzIwMjMuMDkuMDEuYmIgPT4gd2lyZWxlc3MtcmVnZGJfMjAyNC4wMS4yMy5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3t3aXJlbGVzcy1yZWdk
Yl8yMDIzLjA5LjAxLmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjQuMDEuMjMuYmJ9ICg5NCUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93aXJlbGVzcy1y
ZWdkYl8yMDIzLjA5LjAxLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93
aXJlbGVzcy1yZWdkYl8yMDI0LjAxLjIzLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3MtcmVnZGJfMjAy
My4wOS4wMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93
aXJlbGVzcy1yZWdkYl8yMDI0LjAxLjIzLmJiCmluZGV4IGMwOTYwMGVjYmUuLmY4Y2UwMWU0MzYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyMy4wOS4wMS5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJl
Z2RiL3dpcmVsZXNzLXJlZ2RiXzIwMjQuMDEuMjMuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0Ug
PSAiSVNDIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDdjNGY2ZGVh
Mzg0NWIwMmExOGRjMDBjOGM4NzY5OWMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9wdWIvc29mdHdhcmUvbmV0d29yay8ke0JQTn0vJHtCUH0udGFyLnh6IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjI2ZDRjMmE3MjdjYzU5MjM5Yjg0NzM1YWFkODU2YjdjN2QwYjA0ZTMwYWE1
YzIzNWM0ZjdmNDdmNWYwNTM0OTEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzhhNjFjOWFjZjc2
ZmE3ZWI0MjM5ZTg5ZjY0MGRlZTNlODcwOThkOWY2OWI0ZDM1MThjOWM2MGZjNmQyMGM1NSIKIAog
aW5oZXJpdCBiaW5fcGFja2FnZSBhbGxhcmNoCiAKLS0gCjIuNDIuMAoK

--===============0865592158926365336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1852 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1849 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-a940a725a00d640b97d92991a30412079d086261"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a940a725a00d640b97d92991a30412079d086261"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 60 Local 48 Mirrors 0 Missed 12 Current 150 (80% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 450 of 683 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb:do_recipe_qa)
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_recipe_qa: Started
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_recipe_qa: Succeeded
NOTE: Running task 664 of 683 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb:do_fetch)
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_fetch: Started
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_fetch: Succeeded
NOTE: Running task 665 of 683 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb:do_unpack)
NOTE: Running task 666 of 683 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb:do_prepare_recipe_sysroot)
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_unpack: Started
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_unpack: Succeeded
NOTE: Running task 667 of 683 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb:do_patch)
NOTE: Running task 668 of 683 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb:do_collect_spdx_deps)
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_collect_spdx_deps: Started
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_patch: Started
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_patch: Succeeded
NOTE: Running task 669 of 683 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb:do_deploy_source_date_epoch)
NOTE: Running task 670 of 683 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb:do_populate_lic)
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_populate_lic: Started
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_populate_lic: Succeeded
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running noexec task 671 of 683 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb:do_configure)
NOTE: Running noexec task 672 of 683 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb:do_compile)
NOTE: Running task 673 of 683 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb:do_install)
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'libtool-native', 'quilt-native', 'texinfo-dummy-native', 'patch-native', 'pseudo-native', 'xz-native', 'attr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| install: cannot stat 'sforshee.key.pub.pem': No such file or directory
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wireless-regdb/2024.01.23/temp/run.do_install.1248339:147 exit 1 from 'install -m 0644 sforshee.key.pub.pem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wireless-regdb/2024.01.23/image/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wireless-regdb/2024.01.23/temp/run.do_install.1248339, line 147
| 	#2: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wireless-regdb/2024.01.23/temp/run.do_install.1248339, line 154
NOTE: recipe wireless-regdb-2024.01.23-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 673 tasks of which 662 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201140551.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201140551.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb:do_install
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: wireless-regdb-2024.01.23-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wireless-regdb/2024.01.23/temp/run.do_install.1248339', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wireless-regdb/2024.01.23/temp/log.do_install.1248339
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb:do_install) failed with exit code '1'

--===============0865592158926365336==--

