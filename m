Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E88C54730
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.75486.1722536823636237147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MXHiSHht;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wBvq2jwb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101910f320866-f516af43-c38b-4e42-ad47-d1f99bdf8cbb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536823;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2CYitX1JH/fZv3Io1CX2WCTMSkGN+hB93eBOeXEzkJM=;
	b=MXHiSHht9lVZe4N4+FJc2G64bbd713LYH0t64ZFUgnZv7/iRcWLaySkmuCcDTu2t
	n/gY6BOZQ1a8djinB40SjpSRep0XEcARrkxzpAEcH8m/E0YIos8MfoQc1nSN+BeHEz7
	BqF/ZbkmybQVE9IJIgSvY2MUrgaDqJ3OGqxJ3ebE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536823;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2CYitX1JH/fZv3Io1CX2WCTMSkGN+hB93eBOeXEzkJM=;
	b=wBvq2jwbAXx0Mo9G89ACCqFytwOfcVldXNhjWPvogdZxSbzxDNo5eW3g96bp2yAf
	z2sX5ZVSK9euKSrVPtg5Goa0xaOX8KwzN9FAWFfhdtcR7pvl6TQmGPgEFl5SDUS2k2y
	KYYzNR4eMULZTLz70E49ZOWUkONy9MQWwNXhXaOA=
Content-Type: multipart/mixed; boundary="===============4269557473099596793=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] kea: upgrading to 2.6.1 FAILED
Message-ID: <010101910f320866-f516af43-c38b-4e42-ad47-d1f99bdf8cbb-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202780

--===============4269557473099596793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kea* to *2.6.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-kea-upgrade-2.4.1-2.6.1.patch
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
From 6da9340a6dc62c6074f26723c020c6e04804a309 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 08:51:25 +0000
Subject: [PATCH] kea: upgrade 2.4.1 -> 2.6.1

---
 ...er_unittest_support.cc-do-not-write-.patch |  3 +--
 .../kea/files/fix-multilib-conflict.patch     |  7 +++---
 .../kea/files/fix_pid_keactrl.patch           |  7 +++---
 .../kea/{kea_2.4.1.bb => kea_2.6.1.bb}        | 23 +++++++++++++++++--
 4 files changed, 28 insertions(+), 12 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.4.1.bb => kea_2.6.1.bb} (77%)

diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
index 94fbd12737..c3a654dfe5 100644
--- a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
@@ -1,4 +1,4 @@
-From 841924e1fe8db2bff3eab8d37634ef08f86c00ec Mon Sep 17 00:00:00 2001
+From 87581d269d83618a290b5d84e8f2f5127658d458 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 15:57:03 +0000
 Subject: [PATCH] src/lib/log/logger_unittest_support.cc: do not write build
@@ -8,7 +8,6 @@ This breaks reproducibility and is needed only in unit testing.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  src/lib/log/logger_unittest_support.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 5b135b3aee..b6b65b6503 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -1,4 +1,4 @@
-From 06ebd1b2ced426c420ed162980eca194f9f918ae Mon Sep 17 00:00:00 2001
+From e6fb25f2bd3050e75446e2ccc075f6cb0bea64af Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 22 Sep 2020 15:02:33 +0800
 Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
@@ -14,14 +14,13 @@ Because they are all commented out, replace the expanded libdir path with
 
 Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/2602]
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
 ---
  src/bin/keactrl/kea-ctrl-agent.conf.pre | 3 ++-
  src/bin/keactrl/kea-dhcp4.conf.pre      | 4 ++--
  2 files changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/src/bin/keactrl/kea-ctrl-agent.conf.pre b/src/bin/keactrl/kea-ctrl-agent.conf.pre
-index e6ae8b8..50a3092 100644
+index d8e0429..b2ec5b5 100644
 --- a/src/bin/keactrl/kea-ctrl-agent.conf.pre
 +++ b/src/bin/keactrl/kea-ctrl-agent.conf.pre
 @@ -51,7 +51,8 @@
@@ -35,7 +34,7 @@ index e6ae8b8..50a3092 100644
  //          "param1": "foo"
  //      }
 diff --git a/src/bin/keactrl/kea-dhcp4.conf.pre b/src/bin/keactrl/kea-dhcp4.conf.pre
-index 6edb8a1..b2a7385 100644
+index 55af9db..056f06f 100644
 --- a/src/bin/keactrl/kea-dhcp4.conf.pre
 +++ b/src/bin/keactrl/kea-dhcp4.conf.pre
 @@ -255,7 +255,7 @@
diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
index 63a6a2805b..30ec690704 100644
--- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
+++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
@@ -1,4 +1,4 @@
-From c878a356712606549f7f188b62f7d1cae08a176e Mon Sep 17 00:00:00 2001
+From d06aa08f485a2123b5cab1feed96c474f10f8f7b Mon Sep 17 00:00:00 2001
 From: Armin kuster <akuster808@gmail.com>
 Date: Wed, 14 Oct 2020 22:48:31 -0700
 Subject: [PATCH] Busybox does not support ps -p so use pgrep
@@ -7,16 +7,15 @@ Upstream-Status: Inappropriate [embedded specific]
 Based on changes from Diego Sueiro <Diego.Sueiro@arm.com>
 
 Signed-off-by: Armin kuster <akuster808@gmail.com>
-
 ---
  src/bin/keactrl/keactrl.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
-index 450e997..c353ca9 100644
+index cccfdac..20ae2e6 100644
 --- a/src/bin/keactrl/keactrl.in
 +++ b/src/bin/keactrl/keactrl.in
-@@ -149,8 +149,8 @@ check_running() {
+@@ -146,8 +146,8 @@ check_running() {
      # Get the PID from the PID file (if it exists)
      get_pid_from_file "${proc_name}"
      if [ ${_pid} -gt 0 ]; then
diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.6.1.bb
similarity index 77%
rename from meta/recipes-connectivity/kea/kea_2.4.1.bb
rename to meta/recipes-connectivity/kea/kea_2.6.1.bb
index 19309ce314..af0c7d1c0c 100644
--- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.6.1.bb
@@ -1,9 +1,28 @@
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
+# @@ -1,4 +1,4 @@
+# -Copyright (C) 2009-2023 Internet Systems Consortium, Inc. ("ISC")
+# +Copyright (C) 2009-2024 Internet Systems Consortium, Inc. ("ISC")
+#  
+#  This Source Code Form is subject to the terms of the Mozilla Public
+#  License, v. 2.0. If a copy of the MPL was not distributed with this
+# 
+#
+
 SUMMARY = "ISC Kea DHCP Server"
 DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It supports both DHCPv4 and DHCPv6 protocols along with their extensions, e.g. prefix delegation and dynamic updates to DNS."
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea061fa0188838072c4248c1318ec131"
+LIC_FILES_CHKSUM = "file://COPYING;md5=618093ea9de92c70a115268c1d53421f"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -18,7 +37,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
+SRC_URI[sha256sum] = "d2ce14a91c2e248ad2876e29152d647bcc5e433bc68dafad0ee96ec166fcfad1"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.44.0


--===============4269557473099596793==
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
DISTRO_VERSION       = "5.0+snapshot-03fc998fdadbb18e454e55601fbd501e2647e0d8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:03fc998fdadbb18e454e55601fbd501e2647e0d8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 155 Local 143 Mirrors 0 Missed 12 Current 301 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1087 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_recipe_qa)
NOTE: recipe kea-2.6.1-r0: task do_recipe_qa: Started
NOTE: recipe kea-2.6.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1282 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_fetch)
NOTE: recipe kea-2.6.1-r0: task do_fetch: Started
NOTE: recipe kea-2.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1283 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_unpack)
NOTE: Running task 1284 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe kea-2.6.1-r0: task do_unpack: Started
NOTE: recipe kea-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kea-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1285 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_patch)
NOTE: Running task 1286 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_collect_spdx_deps)
NOTE: recipe kea-2.6.1-r0: task do_patch: Started
NOTE: recipe kea-2.6.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe kea-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kea-2.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kea-2.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1287 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1288 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_populate_lic)
NOTE: recipe kea-2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kea-2.6.1-r0: task do_populate_lic: Started
NOTE: recipe kea-2.6.1-r0: task do_populate_lic: Succeeded
NOTE: recipe kea-2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1289 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_configure)
NOTE: recipe kea-2.6.1-r0: task do_configure: Started
NOTE: recipe kea-2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1290 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_compile)
NOTE: recipe kea-2.6.1-r0: task do_compile: Started
NOTE: recipe kea-2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1291 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_install)
NOTE: recipe kea-2.6.1-r0: task do_install: Started
NOTE: recipe kea-2.6.1-r0: task do_install: Succeeded
NOTE: Running task 1292 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_package)
NOTE: Running task 1293 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_populate_sysroot)
NOTE: recipe kea-2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe kea-2.6.1-r0: task do_package: Started
NOTE: recipe kea-2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kea-2.6.1-r0: task do_package: Succeeded
NOTE: Running task 1294 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_packagedata)
NOTE: recipe kea-2.6.1-r0: task do_packagedata: Started
NOTE: recipe kea-2.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1295 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_create_spdx)
NOTE: Running task 1296 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_package_write_ipk)
NOTE: Running task 1297 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_package_write_deb)
NOTE: Running task 1298 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_package_write_rpm)
NOTE: Running task 1299 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_package_qa)
NOTE: recipe kea-2.6.1-r0: task do_create_spdx: Started
NOTE: recipe kea-2.6.1-r0: task do_package_write_ipk: Started
NOTE: recipe kea-2.6.1-r0: task do_package_write_deb: Started
NOTE: recipe kea-2.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe kea-2.6.1-r0: task do_package_qa: Started
NOTE: recipe kea-2.6.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe kea-2.6.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1300 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_create_package_spdx)
NOTE: recipe kea-2.6.1-r0: task do_create_package_spdx: Started
NOTE: recipe kea-2.6.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe kea-2.6.1-r0: task do_package_qa: Failed
NOTE: recipe kea-2.6.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe kea-2.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1300 tasks of which 1280 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801084229.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801084229.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_package_qa
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: kea-2.6.1-r0 do_package_qa: QA Issue: File /usr/sbin/kea-admin in package kea contains reference to TMPDIR [buildpaths]
ERROR: kea-2.6.1-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kea/2.6.1/temp/log.do_package_qa.1601838
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.1.bb:do_package_qa) failed with exit code '1'

--===============4269557473099596793==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kea-upgrade-2.4.1-2.6.1.patch"

RnJvbSA2ZGE5MzQwYTZkYzYyYzYwNzRmMjY3MjNjMDIwYzZlMDQ4MDRhMzA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAwODo1MToyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtl
YTogdXBncmFkZSAyLjQuMSAtPiAyLjYuMQoKLS0tCiAuLi5lcl91bml0dGVzdF9zdXBwb3J0LmNj
LWRvLW5vdC13cml0ZS0ucGF0Y2ggfCAgMyArLS0KIC4uLi9rZWEvZmlsZXMvZml4LW11bHRpbGli
LWNvbmZsaWN0LnBhdGNoICAgICB8ICA3ICsrKy0tLQogLi4uL2tlYS9maWxlcy9maXhfcGlkX2tl
YWN0cmwucGF0Y2ggICAgICAgICAgIHwgIDcgKysrLS0tCiAuLi4va2VhL3trZWFfMi40LjEuYmIg
PT4ga2VhXzIuNi4xLmJifSAgICAgICAgfCAyMyArKysrKysrKysrKysrKysrKy0tCiA0IGZpbGVz
IGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL3trZWFfMi40LjEuYmIgPT4ga2VhXzIuNi4xLmJifSAo
NzclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAw
MDEtc3JjLWxpYi1sb2ctbG9nZ2VyX3VuaXR0ZXN0X3N1cHBvcnQuY2MtZG8tbm90LXdyaXRlLS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAwMDEtc3JjLWxpYi1s
b2ctbG9nZ2VyX3VuaXR0ZXN0X3N1cHBvcnQuY2MtZG8tbm90LXdyaXRlLS5wYXRjaAppbmRleCA5
NGZiZDEyNzM3Li5jM2E2NTRkZmU1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2tlYS9maWxlcy8wMDAxLXNyYy1saWItbG9nLWxvZ2dlcl91bml0dGVzdF9zdXBwb3J0LmNj
LWRvLW5vdC13cml0ZS0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEv
ZmlsZXMvMDAwMS1zcmMtbGliLWxvZy1sb2dnZXJfdW5pdHRlc3Rfc3VwcG9ydC5jYy1kby1ub3Qt
d3JpdGUtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4NDE5MjRlMWZlOGRiMmJmZjNlYWI4
ZDM3NjM0ZWYwOGY4NmMwMGVjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4NzU4MWQy
NjlkODM2MThhMjkwYjVkODRlOGYyZjUxMjc2NThkNDU4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRl
OiBUdWUsIDEwIE5vdiAyMDIwIDE1OjU3OjAzICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNyYy9s
aWIvbG9nL2xvZ2dlcl91bml0dGVzdF9zdXBwb3J0LmNjOiBkbyBub3Qgd3JpdGUgYnVpbGQKQEAg
LTgsNyArOCw2IEBAIFRoaXMgYnJlYWtzIHJlcHJvZHVjaWJpbGl0eSBhbmQgaXMgbmVlZGVkIG9u
bHkgaW4gdW5pdCB0ZXN0aW5nLgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29l
LWNvcmUgc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4KLQogLS0tCiAgc3JjL2xpYi9sb2cvbG9nZ2VyX3VuaXR0ZXN0X3N1
cHBvcnQuY2MgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy9m
aXgtbXVsdGlsaWItY29uZmxpY3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tl
YS9maWxlcy9maXgtbXVsdGlsaWItY29uZmxpY3QucGF0Y2gKaW5kZXggNWIxMzViM2FlZS4uYjZi
NjViNjUwMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMv
Zml4LW11bHRpbGliLWNvbmZsaWN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkva2VhL2ZpbGVzL2ZpeC1tdWx0aWxpYi1jb25mbGljdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gMDZlYmQxYjJjZWQ0MjZjNDIwZWQxNjI5ODBlY2ExOTRmOWY5MThhZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTZmYjI1ZjJiZDMwNTBlNzU0NDZlMmNjYzA3NWY2Y2IwYmVh
NjRhZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEthaSBLYW5nIDxrYWkua2FuZ0B3
aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAyMiBTZXAgMjAyMCAxNTowMjozMyArMDgwMAogU3Vi
amVjdDogW1BBVENIXSBUaGVyZSBhcmUgY29uZmxpY3Qgb2YgY29uZmlnIGZpbGVzIGJldHdlZW4g
a2VhIGFuZCBsaWIzMi1rZWE6CkBAIC0xNCwxNCArMTQsMTMgQEAgQmVjYXVzZSB0aGV5IGFyZSBh
bGwgY29tbWVudGVkIG91dCwgcmVwbGFjZSB0aGUgZXhwYW5kZWQgbGliZGlyIHBhdGggd2l0aAog
CiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRsYWIuaXNjLm9yZy9pc2Mt
cHJvamVjdHMva2VhLy0vaXNzdWVzLzI2MDJdCiBTaWduZWQtb2ZmLWJ5OiBLYWkgS2FuZyA8a2Fp
LmthbmdAd2luZHJpdmVyLmNvbT4KLQogLS0tCiAgc3JjL2Jpbi9rZWFjdHJsL2tlYS1jdHJsLWFn
ZW50LmNvbmYucHJlIHwgMyArKy0KICBzcmMvYmluL2tlYWN0cmwva2VhLWRoY3A0LmNvbmYucHJl
ICAgICAgfCA0ICsrLS0KICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9iaW4va2VhY3RybC9rZWEtY3RybC1hZ2VudC5j
b25mLnByZSBiL3NyYy9iaW4va2VhY3RybC9rZWEtY3RybC1hZ2VudC5jb25mLnByZQotaW5kZXgg
ZTZhZThiOC4uNTBhMzA5MiAxMDA2NDQKK2luZGV4IGQ4ZTA0MjkuLmIyZWM1YjUgMTAwNjQ0CiAt
LS0gYS9zcmMvYmluL2tlYWN0cmwva2VhLWN0cmwtYWdlbnQuY29uZi5wcmUKICsrKyBiL3NyYy9i
aW4va2VhY3RybC9rZWEtY3RybC1hZ2VudC5jb25mLnByZQogQEAgLTUxLDcgKzUxLDggQEAKQEAg
LTM1LDcgKzM0LDcgQEAgaW5kZXggZTZhZThiOC4uNTBhMzA5MiAxMDA2NDQKICAvLyAgICAgICAg
ICAicGFyYW0xIjogImZvbyIKICAvLyAgICAgIH0KIGRpZmYgLS1naXQgYS9zcmMvYmluL2tlYWN0
cmwva2VhLWRoY3A0LmNvbmYucHJlIGIvc3JjL2Jpbi9rZWFjdHJsL2tlYS1kaGNwNC5jb25mLnBy
ZQotaW5kZXggNmVkYjhhMS4uYjJhNzM4NSAxMDA2NDQKK2luZGV4IDU1YWY5ZGIuLjA1NmYwNmYg
MTAwNjQ0CiAtLS0gYS9zcmMvYmluL2tlYWN0cmwva2VhLWRoY3A0LmNvbmYucHJlCiArKysgYi9z
cmMvYmluL2tlYWN0cmwva2VhLWRoY3A0LmNvbmYucHJlCiBAQCAtMjU1LDcgKzI1NSw3IEBACmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy9maXhfcGlkX2tl
YWN0cmwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy9maXhfcGlk
X2tlYWN0cmwucGF0Y2gKaW5kZXggNjNhNmEyODA1Yi4uMzBlYzY5MDcwNCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvZml4X3BpZF9rZWFjdHJsLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzL2ZpeF9waWRfa2VhY3Ry
bC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzg3OGEzNTY3MTI2MDY1NDlmN2YxODhiNjJm
N2QxY2FlMDhhMTc2ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDA2YWEwOGY0ODVh
MjEyM2I1Y2FiMWZlZWQ5NmM0NzRmMTBmOGY3YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFybWluIGt1c3RlciA8YWt1c3RlcjgwOEBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDE0IE9j
dCAyMDIwIDIyOjQ4OjMxIC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEJ1c3lib3ggZG9lcyBub3Qg
c3VwcG9ydCBwcyAtcCBzbyB1c2UgcGdyZXAKQEAgLTcsMTYgKzcsMTUgQEAgVXBzdHJlYW0tU3Rh
dHVzOiBJbmFwcHJvcHJpYXRlIFtlbWJlZGRlZCBzcGVjaWZpY10KIEJhc2VkIG9uIGNoYW5nZXMg
ZnJvbSBEaWVnbyBTdWVpcm8gPERpZWdvLlN1ZWlyb0Bhcm0uY29tPgogCiBTaWduZWQtb2ZmLWJ5
OiBBcm1pbiBrdXN0ZXIgPGFrdXN0ZXI4MDhAZ21haWwuY29tPgotCiAtLS0KICBzcmMvYmluL2tl
YWN0cmwva2VhY3RybC5pbiB8IDQgKystLQogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvYmluL2tlYWN0cmwva2VhY3Ry
bC5pbiBiL3NyYy9iaW4va2VhY3RybC9rZWFjdHJsLmluCi1pbmRleCA0NTBlOTk3Li5jMzUzY2E5
IDEwMDY0NAoraW5kZXggY2NjZmRhYy4uMjBhZTJlNiAxMDA2NDQKIC0tLSBhL3NyYy9iaW4va2Vh
Y3RybC9rZWFjdHJsLmluCiArKysgYi9zcmMvYmluL2tlYWN0cmwva2VhY3RybC5pbgotQEAgLTE0
OSw4ICsxNDksOCBAQCBjaGVja19ydW5uaW5nKCkgeworQEAgLTE0Niw4ICsxNDYsOCBAQCBjaGVj
a19ydW5uaW5nKCkgewogICAgICAjIEdldCB0aGUgUElEIGZyb20gdGhlIFBJRCBmaWxlIChpZiBp
dCBleGlzdHMpCiAgICAgIGdldF9waWRfZnJvbV9maWxlICIke3Byb2NfbmFtZX0iCiAgICAgIGlm
IFsgJHtfcGlkfSAtZ3QgMCBdOyB0aGVuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2tlYS9rZWFfMi40LjEuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9r
ZWFfMi42LjEuYmIKc2ltaWxhcml0eSBpbmRleCA3NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9rZWEva2VhXzIuNC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2tlYS9rZWFfMi42LjEuYmIKaW5kZXggMTkzMDljZTMxNC4uYWYwYzdkMWMwYyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEva2VhXzIuNC4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2tlYV8yLjYuMS5iYgpAQCAtMSw5ICsx
LDI4IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVw
ZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNl
IHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNo
YW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcu
CisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicp
CisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBA
QCAtMSw0ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAoQykgMjAwOS0yMDIzIEludGVybmV0IFN5c3Rl
bXMgQ29uc29ydGl1bSwgSW5jLiAoIklTQyIpCisjICtDb3B5cmlnaHQgKEMpIDIwMDktMjAyNCBJ
bnRlcm5ldCBTeXN0ZW1zIENvbnNvcnRpdW0sIEluYy4gKCJJU0MiKQorIyAgCisjICBUaGlzIFNv
dXJjZSBDb2RlIEZvcm0gaXMgc3ViamVjdCB0byB0aGUgdGVybXMgb2YgdGhlIE1vemlsbGEgUHVi
bGljCisjICBMaWNlbnNlLCB2LiAyLjAuIElmIGEgY29weSBvZiB0aGUgTVBMIHdhcyBub3QgZGlz
dHJpYnV0ZWQgd2l0aCB0aGlzCisjIAorIworCiBTVU1NQVJZID0gIklTQyBLZWEgREhDUCBTZXJ2
ZXIiCiBERVNDUklQVElPTiA9ICJLZWEgaXMgdGhlIG5leHQgZ2VuZXJhdGlvbiBvZiBESENQIHNv
ZnR3YXJlIGRldmVsb3BlZCBieSBJU0MuIEl0IHN1cHBvcnRzIGJvdGggREhDUHY0IGFuZCBESENQ
djYgcHJvdG9jb2xzIGFsb25nIHdpdGggdGhlaXIgZXh0ZW5zaW9ucywgZS5nLiBwcmVmaXggZGVs
ZWdhdGlvbiBhbmQgZHluYW1pYyB1cGRhdGVzIHRvIEROUy4iCiBIT01FUEFHRSA9ICJodHRwOi8v
a2VhLmlzYy5vcmciCiBTRUNUSU9OID0gImNvbm5lY3Rpdml0eSIKIExJQ0VOU0UgPSAiTVBMLTIu
MCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWVhMDYxZmEwMTg4ODM4
MDcyYzQyNDhjMTMxOGVjMTMxIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9NjE4MDkzZWE5ZGU5MmM3MGExMTUyNjhjMWQ1MzQyMWYiCiAKIERFUEVORFMgPSAiYm9vc3Qg
bG9nNGNwbHVzIG9wZW5zc2wiCiAKQEAgLTE4LDcgKzM3LDcgQEAgU1JDX1VSSSA9ICJodHRwOi8v
ZnRwLmlzYy5vcmcvaXNjL2tlYS8ke1BWfS8ke0JQfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxl
Oi8vZml4X3BpZF9rZWFjdHJsLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtc3JjLWxp
Yi1sb2ctbG9nZ2VyX3VuaXR0ZXN0X3N1cHBvcnQuY2MtZG8tbm90LXdyaXRlLS5wYXRjaCBcCiAg
ICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4MTVjNjFmNWMyNzFjYWE0YTFkYjMx
ZGQ2NTZlYjUwYTdmNmVhOTczZGEzNjkwZjdjODU4MTQwOGUxODAxMzFhIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImQyY2UxNGE5MWMyZTI0OGFkMjg3NmUyOTE1MmQ2NDdiY2M1ZTQzM2JjNjhkYWZh
ZDBlZTk2ZWMxNjZmY2ZhZDEiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHN5c3RlbWQgdXBkYXRlLXJj
LmQgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuCiAKLS0gCjIuNDQuMAoK

--===============4269557473099596793==--

