Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3FEC54EE8
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:21 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.36650.1709330718408459895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OAywQ80Y;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=S3n3sfv4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018dfc0cda1d-48573220-1fc9-45a1-8132-be37a3f341d6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2jg/0tmnpICx1iQBxShuh5/QmVroX1H6LvHP8yPjZJI=;
	b=OAywQ80Y96rsNvfMO95KfQzQEnLyEKcgazykOqpM1iXmKudmKCFT/MB7QrQEViMv
	7z7GI3tnb390v5j+3NCVG4WsNl1hh5MLXGCezQxo0REV6tlePozQ7MG8V3TtqqpvmWE
	KF2FHIuPhrmDGDaR2W8idXorPVwhOHvUj2vin4qM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2jg/0tmnpICx1iQBxShuh5/QmVroX1H6LvHP8yPjZJI=;
	b=S3n3sfv4XlrbBkINI7AvuAj5wipD0rJzU7Z4+rF69FBQTSDhdzv3OToO4Sn9JU9r
	lRHUcvmW82AVwXe6CZsVSIO1VWNxKRmQoTLH4emKq1+9jDzKxpkAmF3+yN37Ane7flz
	zP0T81IAO4p/gq0b9nCV7TQnrktitrCt89H2uI1A=
Content-Type: multipart/mixed; boundary="===============7798913795830226360=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpciaccess: upgrading to 0.18 FAILED
Message-ID: <0101018dfc0cda1d-48573220-1fc9-45a1-8132-be37a3f341d6-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196543

--===============7798913795830226360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpciaccess* to *0.18* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libpciaccess-upgrade-0.17-0.18.patch
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
From c748a4c41a2ecaf4efcbe0d720c2faa67ab3a054 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 17:31:28 +0000
Subject: [PATCH] libpciaccess: upgrade 0.17 -> 0.18

---
 ...pwrite-pread-instead-of-64bit-versio.patch | 39 -------------------
 ...pciaccess_0.17.bb => libpciaccess_0.18.bb} | 28 +++++++++++--
 2 files changed, 24 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.17.bb => libpciaccess_0.18.bb} (24%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess/0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch b/meta/recipes-graphics/xorg-lib/libpciaccess/0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch
deleted file mode 100644
index 512a473e20..0000000000
--- a/meta/recipes-graphics/xorg-lib/libpciaccess/0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From d20ff4f2e4feaafa6a6191b9cae3815b85617943 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 11 Nov 2022 11:15:58 -0800
-Subject: [PATCH] linux_sysfs: Use pwrite/pread instead of 64bit versions
-
-pread64/pwrite64 are aliased to pread/pwrite when largefile support is
-enabled e.g. using _FILE_OFFSET_BITS=64 macro
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/26]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/linux_sysfs.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/linux_sysfs.c b/src/linux_sysfs.c
-index d62f48c..20c800e 100644
---- a/src/linux_sysfs.c
-+++ b/src/linux_sysfs.c
-@@ -462,7 +462,7 @@ pci_device_linux_sysfs_read( struct pci_device * dev, void * data,
- 
- 
-     while ( temp_size > 0 ) {
--	const ssize_t bytes = pread64( fd, data_bytes, temp_size, offset );
-+	const ssize_t bytes = pread( fd, data_bytes, temp_size, offset );
- 
- 	/* If zero bytes were read, then we assume it's the end of the
- 	 * config file.
-@@ -522,7 +522,7 @@ pci_device_linux_sysfs_write( struct pci_device * dev, const void * data,
- 
- 
-     while ( temp_size > 0 ) {
--	const ssize_t bytes = pwrite64( fd, data_bytes, temp_size, offset );
-+	const ssize_t bytes = pwrite( fd, data_bytes, temp_size, offset );
- 
- 	/* If zero bytes were written, then we assume it's the end of the
- 	 * config file.
--- 
-2.38.1
-
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb
similarity index 24%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb
index 54bdb08976..d275076043 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -2,7 +2,7 @@
+#  (C) Copyright Eric Anholt 2006
+#  (C) Copyright Mark Kettenis 2011
+#  (C) Copyright Robert Millan 2012
+# -Copyright (c) 2007, 2008, 2009, 2011, 2012, 2013 Oracle and/or its affiliates.
+# +Copyright (c) 2007, 2008, 2009, 2011, 2012, 2016 Oracle and/or its affiliates.
+#  Copyright 2009, 2012 Red Hat, Inc.
+#  All Rights Reserved.
+#  
+# 
+#
+
 SUMMARY = "Generic PCI access library for X"
 
 DESCRIPTION = "libpciaccess provides functionality for X to access the \
@@ -5,12 +27,10 @@ PCI bus and devices in a platform-independent way."
 
 require xorg-lib-common.inc
 
-SRC_URI += "file://0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch"
-
-SRC_URI[sha256sum] = "74283ba3c974913029e7a547496a29145b07ec51732bbb5b5c58d5025ad95b73"
+SRC_URI[sha256sum] = "5461b0257d495254346f52a9c329b44b346262663675d3fecdb204a7e7c262a9"
 
 LICENSE = "MIT & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
+LIC_FILES_CHKSUM = "file://COPYING;md5=54c978968e565218eea36cf03ef24352"
 
 REQUIRED_DISTRO_FEATURES = ""
 
-- 
2.42.0


--===============7798913795830226360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1866 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1863 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-a8594ddcf20aa59bafee5cd931f782fb5f7bae0a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a8594ddcf20aa59bafee5cd931f782fb5f7bae0a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 73 Local 61 Mirrors 0 Missed 12 Current 228 (83% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 263 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: Running task 813 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_recipe_qa)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_recipe_qa: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 296 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 298 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_recipe_qa unihash changed to 2e3272fff94ab2f5fb5e19dedd594e8da44c4540a374804d23ca1b8043083422
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 291 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: Running task 871 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.18-r0: task do_fetch: Succeeded
NOTE: Running task 872 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 890 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.18-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.18-r0: task do_unpack: Succeeded
NOTE: Running task 895 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_patch)
NOTE: Running task 896 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_collect_spdx_deps)
NOTE: recipe libpciaccess-0.18-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpciaccess-0.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.18-r0: task do_patch: Succeeded
NOTE: Running task 897 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 898 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_populate_lic)
NOTE: recipe libpciaccess-0.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpciaccess-0.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.18-r0: task do_populate_lic: Started
NOTE: recipe libpciaccess-0.18-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_populate_lic unihash changed to c9a94c61bc008378f92f1700cd2d9a8f67dfc09befd7b805db460365928b6341
NOTE: recipe libpciaccess-0.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_deploy_source_date_epoch unihash changed to 79ac5b24a980b8e1481ef66f1f94fdc02ec875c334b5be4142acf8574d1f9ff4
NOTE: Setscene tasks completed
NOTE: Running task 899 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_configure)
NOTE: recipe libpciaccess-0.18-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.18-r0: task do_configure: Succeeded
NOTE: Running task 900 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_compile)
NOTE: recipe libpciaccess-0.18-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75
| make: *** No targets specified and no makefile found.  Stop.
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/run.do_compile.3191453:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/run.do_compile.3191453, line 182
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/run.do_compile.3191453, line 166
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/run.do_compile.3191453, line 161
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/run.do_compile.3191453, line 156
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/run.do_compile.3191453, line 151
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/run.do_compile.3191453, line 195
NOTE: recipe libpciaccess-0.18-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 900 tasks of which 890 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301173108.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301173108.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libpciaccess-0.18-r0 do_compile: oe_runmake failed
ERROR: libpciaccess-0.18-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/run.do_compile.3191453', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/log.do_compile.3191453
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_compile) failed with exit code '1'

--===============7798913795830226360==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpciaccess-upgrade-0.17-0.18.patch"

RnJvbSBjNzQ4YTRjNDFhMmVjYWY0ZWZjYmUwZDcyMGMyZmFhNjdhYjNhMDU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxNzozMToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnBjaWFjY2VzczogdXBncmFkZSAwLjE3IC0+IDAuMTgKCi0tLQogLi4ucHdyaXRlLXByZWFkLWlu
c3RlYWQtb2YtNjRiaXQtdmVyc2lvLnBhdGNoIHwgMzkgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4u
cGNpYWNjZXNzXzAuMTcuYmIgPT4gbGlicGNpYWNjZXNzXzAuMTguYmJ9IHwgMjggKysrKysrKysr
KystLQogMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlvbnMoLSkK
IGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlicGNp
YWNjZXNzLzAwMDEtbGludXhfc3lzZnMtVXNlLXB3cml0ZS1wcmVhZC1pbnN0ZWFkLW9mLTY0Yml0
LXZlcnNpby5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi97bGli
cGNpYWNjZXNzXzAuMTcuYmIgPT4gbGlicGNpYWNjZXNzXzAuMTguYmJ9ICgyNCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnBjaWFjY2Vzcy8wMDAxLWxp
bnV4X3N5c2ZzLVVzZS1wd3JpdGUtcHJlYWQtaW5zdGVhZC1vZi02NGJpdC12ZXJzaW8ucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlicGNpYWNjZXNzLzAwMDEtbGludXhf
c3lzZnMtVXNlLXB3cml0ZS1wcmVhZC1pbnN0ZWFkLW9mLTY0Yml0LXZlcnNpby5wYXRjaApkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNTEyYTQ3M2UyMC4uMDAwMDAwMDAwMAotLS0gYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlicGNpYWNjZXNzLzAwMDEtbGludXhfc3lz
ZnMtVXNlLXB3cml0ZS1wcmVhZC1pbnN0ZWFkLW9mLTY0Yml0LXZlcnNpby5wYXRjaAorKysgL2Rl
di9udWxsCkBAIC0xLDM5ICswLDAgQEAKLUZyb20gZDIwZmY0ZjJlNGZlYWFmYTZhNjE5MWI5Y2Fl
MzgxNWI4NTYxNzk0MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+Ci1EYXRlOiBGcmksIDExIE5vdiAyMDIyIDExOjE1OjU4IC0wODAw
Ci1TdWJqZWN0OiBbUEFUQ0hdIGxpbnV4X3N5c2ZzOiBVc2UgcHdyaXRlL3ByZWFkIGluc3RlYWQg
b2YgNjRiaXQgdmVyc2lvbnMKLQotcHJlYWQ2NC9wd3JpdGU2NCBhcmUgYWxpYXNlZCB0byBwcmVh
ZC9wd3JpdGUgd2hlbiBsYXJnZWZpbGUgc3VwcG9ydCBpcwotZW5hYmxlZCBlLmcuIHVzaW5nIF9G
SUxFX09GRlNFVF9CSVRTPTY0IG1hY3JvCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFto
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcveG9yZy9saWIvbGlicGNpYWNjZXNzLy0vbWVy
Z2VfcmVxdWVzdHMvMjZdCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgotLS0tCi0gc3JjL2xpbnV4X3N5c2ZzLmMgfCA0ICsrLS0KLSAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvc3JjL2xpbnV4
X3N5c2ZzLmMgYi9zcmMvbGludXhfc3lzZnMuYwotaW5kZXggZDYyZjQ4Yy4uMjBjODAwZSAxMDA2
NDQKLS0tLSBhL3NyYy9saW51eF9zeXNmcy5jCi0rKysgYi9zcmMvbGludXhfc3lzZnMuYwotQEAg
LTQ2Miw3ICs0NjIsNyBAQCBwY2lfZGV2aWNlX2xpbnV4X3N5c2ZzX3JlYWQoIHN0cnVjdCBwY2lf
ZGV2aWNlICogZGV2LCB2b2lkICogZGF0YSwKLSAKLSAKLSAgICAgd2hpbGUgKCB0ZW1wX3NpemUg
PiAwICkgewotLQljb25zdCBzc2l6ZV90IGJ5dGVzID0gcHJlYWQ2NCggZmQsIGRhdGFfYnl0ZXMs
IHRlbXBfc2l6ZSwgb2Zmc2V0ICk7Ci0rCWNvbnN0IHNzaXplX3QgYnl0ZXMgPSBwcmVhZCggZmQs
IGRhdGFfYnl0ZXMsIHRlbXBfc2l6ZSwgb2Zmc2V0ICk7Ci0gCi0gCS8qIElmIHplcm8gYnl0ZXMg
d2VyZSByZWFkLCB0aGVuIHdlIGFzc3VtZSBpdCdzIHRoZSBlbmQgb2YgdGhlCi0gCSAqIGNvbmZp
ZyBmaWxlLgotQEAgLTUyMiw3ICs1MjIsNyBAQCBwY2lfZGV2aWNlX2xpbnV4X3N5c2ZzX3dyaXRl
KCBzdHJ1Y3QgcGNpX2RldmljZSAqIGRldiwgY29uc3Qgdm9pZCAqIGRhdGEsCi0gCi0gCi0gICAg
IHdoaWxlICggdGVtcF9zaXplID4gMCApIHsKLS0JY29uc3Qgc3NpemVfdCBieXRlcyA9IHB3cml0
ZTY0KCBmZCwgZGF0YV9ieXRlcywgdGVtcF9zaXplLCBvZmZzZXQgKTsKLSsJY29uc3Qgc3NpemVf
dCBieXRlcyA9IHB3cml0ZSggZmQsIGRhdGFfYnl0ZXMsIHRlbXBfc2l6ZSwgb2Zmc2V0ICk7Ci0g
Ci0gCS8qIElmIHplcm8gYnl0ZXMgd2VyZSB3cml0dGVuLCB0aGVuIHdlIGFzc3VtZSBpdCdzIHRo
ZSBlbmQgb2YgdGhlCi0gCSAqIGNvbmZpZyBmaWxlLgotLS0gCi0yLjM4LjEKLQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnBjaWFjY2Vzc18wLjE3LmJiIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnBjaWFjY2Vzc18wLjE4LmJiCnNpbWls
YXJpdHkgaW5kZXggMjQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxp
Yi9saWJwY2lhY2Nlc3NfMC4xNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmctbGliL2xpYnBjaWFjY2Vzc18wLjE4LmJiCmluZGV4IDU0YmRiMDg5NzYuLmQyNzUwNzYwNDMg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJwY2lhY2Nlc3Nf
MC4xNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlicGNpYWNjZXNz
XzAuMTguYmIKQEAgLTEsMyArMSwyNSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0g
dmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9s
bG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNl
bnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBh
bmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xp
Y2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmln
aHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcK
KyMgKysrIENPUFlJTkcKKyMgQEAgLTIsNyArMiw3IEBACisjICAoQykgQ29weXJpZ2h0IEVyaWMg
QW5ob2x0IDIwMDYKKyMgIChDKSBDb3B5cmlnaHQgTWFyayBLZXR0ZW5pcyAyMDExCisjICAoQykg
Q29weXJpZ2h0IFJvYmVydCBNaWxsYW4gMjAxMgorIyAtQ29weXJpZ2h0IChjKSAyMDA3LCAyMDA4
LCAyMDA5LCAyMDExLCAyMDEyLCAyMDEzIE9yYWNsZSBhbmQvb3IgaXRzIGFmZmlsaWF0ZXMuCisj
ICtDb3B5cmlnaHQgKGMpIDIwMDcsIDIwMDgsIDIwMDksIDIwMTEsIDIwMTIsIDIwMTYgT3JhY2xl
IGFuZC9vciBpdHMgYWZmaWxpYXRlcy4KKyMgIENvcHlyaWdodCAyMDA5LCAyMDEyIFJlZCBIYXQs
IEluYy4KKyMgIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisjICAKKyMgCisjCisKIFNVTU1BUlkgPSAi
R2VuZXJpYyBQQ0kgYWNjZXNzIGxpYnJhcnkgZm9yIFgiCiAKIERFU0NSSVBUSU9OID0gImxpYnBj
aWFjY2VzcyBwcm92aWRlcyBmdW5jdGlvbmFsaXR5IGZvciBYIHRvIGFjY2VzcyB0aGUgXApAQCAt
NSwxMiArMjcsMTAgQEAgUENJIGJ1cyBhbmQgZGV2aWNlcyBpbiBhIHBsYXRmb3JtLWluZGVwZW5k
ZW50IHdheS4iCiAKIHJlcXVpcmUgeG9yZy1saWItY29tbW9uLmluYwogCi1TUkNfVVJJICs9ICJm
aWxlOi8vMDAwMS1saW51eF9zeXNmcy1Vc2UtcHdyaXRlLXByZWFkLWluc3RlYWQtb2YtNjRiaXQt
dmVyc2lvLnBhdGNoIgotCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzQyODNiYTNjOTc0OTEzMDI5
ZTdhNTQ3NDk2YTI5MTQ1YjA3ZWM1MTczMmJiYjViNWM1OGQ1MDI1YWQ5NWI3MyIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI1NDYxYjAyNTdkNDk1MjU0MzQ2ZjUyYTljMzI5YjQ0YjM0NjI2MjY2MzY3
NWQzZmVjZGIyMDRhN2U3YzI2MmE5IgogCiBMSUNFTlNFID0gIk1JVCAmIE1JVCIKLUxJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTI3N2FhZGE1MjIyYjlhMjJmYmYzNDcxZmYz
Njg3MDY4IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NTRjOTc4OTY4
ZTU2NTIxOGVlYTM2Y2YwM2VmMjQzNTIiCiAKIFJFUVVJUkVEX0RJU1RST19GRUFUVVJFUyA9ICIi
CiAKLS0gCjIuNDIuMAoK

--===============7798913795830226360==--

