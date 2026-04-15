Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEA2F42105
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:37 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19812.1776261873807100432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wTea/4P4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yd90d4Oi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d91753d6d-d4e54035-6dce-444c-bb44-f992312117d8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dnB7gMjfoB63sfjP9x429Vcpq5oJzPtXvodfEHzEr6c=;
	b=wTea/4P4XFYSzpc+IJXxtQAz6ooRavcyCLQFkivBonl1nWVv99zexTbyNIN21sBF
	Q3WhT8Nm6SZ9jmHbb0SwXm9QyKz7Qq5T9GgcJycYYtckoJZSOqBfknLio5ud/b7VpOI
	NvLs+0Yat0pqChotZf6u+NJwUIkAZ1wufnGPhg1k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dnB7gMjfoB63sfjP9x429Vcpq5oJzPtXvodfEHzEr6c=;
	b=yd90d4OiX7RnQSmYFkW+n23a3w/8YPDQjNckIc+nkuo5k95wlWIpyfAROx8EDjI4
	q1ZWRfGx5eFnWENWe3a2Noq0+rrBeJi54O1u60zzNeh0BOYozotJEjRdc14S8FbveCv
	IpNVnp49MvtVJq5juJFmLL9JbD4w/uSraRpnkWlc=
Content-Type: multipart/mixed; boundary="===============4240116660667685882=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] neard: upgrading to 0.20 FAILED
Message-ID: <0101019d91753d6d-d4e54035-6dce-444c-bb44-f992312117d8-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235214

--===============4240116660667685882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *neard* to *0.20* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-neard-upgrade-0.19-0.20.patch
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
From f55ddc56c04e9b81a767e1f8fe36aff3b59fdae2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 06:27:01 +0000
Subject: [PATCH] neard: upgrade 0.19 -> 0.20

---
 ...Add-header-dependency-to-nciattach.o.patch |  9 ++----
 .../Makefile.am-do-not-ship-version.h.patch   |  9 ++----
 .../Makefile.am-fix-parallel-issue.patch      | 30 -------------------
 .../neard/{neard_0.19.bb => neard_0.20.bb}    |  5 ++--
 4 files changed, 8 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
 rename meta/recipes-connectivity/neard/{neard_0.19.bb => neard_0.20.bb} (93%)

diff --git a/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch b/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch
index d8e8a5e5da..814c5af493 100644
--- a/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch
+++ b/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch
@@ -1,4 +1,4 @@
-From affaa2021a54c30353e4e1fee09c13a4de2196be Mon Sep 17 00:00:00 2001
+From 57df6a3acdbe76874ca0a4d3838db9c0b25227b4 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Fri, 17 Mar 2017 14:24:29 +0200
 Subject: [PATCH] Add header dependency to nciattach.o
@@ -19,10 +19,10 @@ Upstream-Status: Submitted [mailinglist]
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index fa552ee..acef6ba 100644
+index d865e84..1c81d58 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -253,6 +253,7 @@ se/builtin.h: src/genbuiltin $(builtin_se_sources)
+@@ -258,6 +258,7 @@ se/builtin.h: src/genbuiltin $(builtin_se_sources)
  
  $(src_neard_OBJECTS) \
  $(tools_nfctool_nfctool_OBJECTS) \
@@ -30,6 +30,3 @@ index fa552ee..acef6ba 100644
  $(plugin_objects) \
  $(se_seeld_OBJECTS) \
  $(unit_test_ndef_parse_OBJECTS) \
--- 
-2.11.0
-
diff --git a/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch b/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch
index 16875e0543..1c22928def 100644
--- a/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch
+++ b/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch
@@ -1,4 +1,4 @@
-From bfd32d68cfc9f1e31dab88e07446d1c02bc80b5e Mon Sep 17 00:00:00 2001
+From c9ea78dc914eb821d041527436ba6fa914483219 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 12 Feb 2015 00:39:29 -0800
 Subject: [PATCH] Makefile.am: do not ship version.h
@@ -10,11 +10,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- Makefile.am |    4 ++--
+ Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 3334790..69cd58f 100644
+index 592fb7c..d865e84 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -10,11 +10,11 @@ pkginclude_HEADERS = include/types.h include/log.h include/plugin.h \
@@ -31,6 +31,3 @@ index 3334790..69cd58f 100644
  			$(noinst_HEADERS), include/near/$(notdir $(file)))
  
  gdbus_sources = gdbus/gdbus.h gdbus/mainloop.c gdbus/watch.c \
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch b/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
deleted file mode 100644
index aeb33a5bdc..0000000000
--- a/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 43acc56d5506c7e318f717fb3634bc16e3438913 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 15 Jan 2015 18:12:07 -0800
-Subject: [PATCH] Makefile.am: fix parallel issue
-
-There might be no src dir if src/builtin.h runs earlier, create it to
-fix the race issue:
-
-src/genbuiltin nfctype1 nfctype2 nfctype3 nfctype4 p2p > src/builtin.h
-/bin/sh: src/builtin.h: No such file or directory
-
-Upstream-Status: Backport [d39f8c0eee659743b4425d395c2f7ab1949e9c71]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Makefile.am |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: neard-0.16/Makefile.am
-===================================================================
---- neard-0.16.orig/Makefile.am
-+++ neard-0.16/Makefile.am
-@@ -244,6 +244,7 @@ SED_PROCESS = $(AM_V_GEN)$(MKDIR_P) $(di
- src/plugin.$(OBJEXT): src/builtin.h
- 
- src/builtin.h: src/genbuiltin $(builtin_sources)
-+	$(AM_V_at)$(MKDIR_P) src
- 	$(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_modules) > $@
- 
- se/plugin.$(OBJEXT): se/builtin.h
diff --git a/meta/recipes-connectivity/neard/neard_0.19.bb b/meta/recipes-connectivity/neard/neard_0.20.bb
similarity index 93%
rename from meta/recipes-connectivity/neard/neard_0.19.bb
rename to meta/recipes-connectivity/neard/neard_0.20.bb
index c1149e7631..a583da827f 100644
--- a/meta/recipes-connectivity/neard/neard_0.19.bb
+++ b/meta/recipes-connectivity/neard/neard_0.20.bb
@@ -10,12 +10,11 @@ DEPENDS = "dbus glib-2.0 libnl autoconf-archive-native"
 
 SRC_URI = "git://github.com/linux-nfc/neard;protocol=https;branch=master \
            file://neard.in \
-           file://Makefile.am-fix-parallel-issue.patch \
            file://Makefile.am-do-not-ship-version.h.patch \
            file://0001-Add-header-dependency-to-nciattach.o.patch \
-          "
+           "
 
-SRCREV = "a1dc8a75cba999728e154a0f811ab9dd50c809f7"
+SRCREV = "7118668bc92fe15a8ff5e4067abd5e1622524f03"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.47.1


--===============4240116660667685882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-9a3f0547d6e1f6b27ebfcd7a9108f93a53e405e4"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9a3f0547d6e1f6b27ebfcd7a9108f93a53e405e4"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 405 Local 392 Mirrors 0 Missed 13 Current 581 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 781 of 986 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_create_spdx_setscene)
NOTE: Running setscene task 820 of 986 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 877 of 986 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_recipe_qa_setscene)
NOTE: recipe wpa-supplicant-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_create_spdx_setscene: Started
NOTE: recipe neard-0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe neard-0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1299 of 2356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_fetch)
NOTE: recipe wpa-supplicant-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 888 of 986 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.86-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 892 of 986 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: recipe neard-0.20-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 960 of 986 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 966 of 986 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe neard-0.20-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.12.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 2146 of 2356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_unpack)
NOTE: Running task 2209 of 2356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_prepare_recipe_sysroot)
NOTE: recipe neard-0.20-r0: task do_unpack: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2334 of 2356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_create_recipe_spdx)
NOTE: recipe neard-0.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe neard-0.20-r0: task do_create_recipe_spdx: Started
NOTE: recipe neard-0.20-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe neard-0.20-r0: task do_unpack: Succeeded
NOTE: Running task 2341 of 2356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_patch)
NOTE: recipe neard-0.20-r0: task do_patch: Started
NOTE: recipe neard-0.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe neard-0.20-r0: task do_patch: Succeeded
NOTE: Running task 2342 of 2356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_deploy_source_date_epoch)
NOTE: Running task 2343 of 2356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_populate_lic)
NOTE: recipe neard-0.20-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe neard-0.20-r0: task do_populate_lic: Started
NOTE: recipe neard-0.20-r0: task do_populate_lic: Succeeded
NOTE: recipe neard-0.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_populate_lic unihash changed to 87ef655b9a11ac009f3ace839c086d3984b1b3510ea7f401a17d8f9823a4265c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_deploy_source_date_epoch unihash changed to 7782d7f416f40304c7cd4d2394a0ddd45260ac1ee9ce677b141fc8e7c034d020
NOTE: Setscene tasks completed
NOTE: Running task 2344 of 2356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_configure)
NOTE: recipe neard-0.20-r0: task do_configure: Started
NOTE: recipe neard-0.20-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2344 tasks of which 2336 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415062639.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415062639.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/neard/0.20/temp/log.do_configure.952946
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: neard-0.20-r0 do_configure: QA Issue: neard: configure was passed unrecognised options: --with-systemduserunitdir [unknown-configure-option]
ERROR: neard-0.20-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/neard/0.20/temp/log.do_configure.952946
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_configure) failed with exit code '1'

--===============4240116660667685882==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-neard-upgrade-0.19-0.20.patch"

RnJvbSBmNTVkZGM1NmMwNGU5YjgxYTc2N2UxZjhmZTM2YWZmM2I1OWZkYWUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDY6Mjc6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
ZWFyZDogdXBncmFkZSAwLjE5IC0+IDAuMjAKCi0tLQogLi4uQWRkLWhlYWRlci1kZXBlbmRlbmN5
LXRvLW5jaWF0dGFjaC5vLnBhdGNoIHwgIDkgKystLS0tCiAuLi4vTWFrZWZpbGUuYW0tZG8tbm90
LXNoaXAtdmVyc2lvbi5oLnBhdGNoICAgfCAgOSArKy0tLS0KIC4uLi9NYWtlZmlsZS5hbS1maXgt
cGFyYWxsZWwtaXNzdWUucGF0Y2ggICAgICB8IDMwIC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9u
ZWFyZC97bmVhcmRfMC4xOS5iYiA9PiBuZWFyZF8wLjIwLmJifSAgICB8ICA1ICsrLS0KIDQgZmls
ZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkL01ha2VmaWxlLmFt
LWZpeC1wYXJhbGxlbC1pc3N1ZS5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvbmVhcmQve25lYXJkXzAuMTkuYmIgPT4gbmVhcmRfMC4yMC5iYn0gKDkzJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkLzAwMDEtQWRkLWhlYWRl
ci1kZXBlbmRlbmN5LXRvLW5jaWF0dGFjaC5vLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9uZWFyZC9uZWFyZC8wMDAxLUFkZC1oZWFkZXItZGVwZW5kZW5jeS10by1uY2lhdHRhY2gu
by5wYXRjaAppbmRleCBkOGU4YTVlNWRhLi44MTRjNWFmNDkzIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkLzAwMDEtQWRkLWhlYWRlci1kZXBlbmRlbmN5
LXRvLW5jaWF0dGFjaC5vLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVh
cmQvbmVhcmQvMDAwMS1BZGQtaGVhZGVyLWRlcGVuZGVuY3ktdG8tbmNpYXR0YWNoLm8ucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGFmZmFhMjAyMWE1NGMzMDM1M2U0ZTFmZWUwOWMxM2E0ZGUy
MTk2YmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU3ZGY2YTNhY2RiZTc2ODc0Y2Ew
YTRkMzgzOGRiOWMwYjI1MjI3YjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKdXNz
aSBLdWtrb25lbiA8anVzc2kua3Vra29uZW5AaW50ZWwuY29tPgogRGF0ZTogRnJpLCAxNyBNYXIg
MjAxNyAxNDoyNDoyOSArMDIwMAogU3ViamVjdDogW1BBVENIXSBBZGQgaGVhZGVyIGRlcGVuZGVu
Y3kgdG8gbmNpYXR0YWNoLm8KQEAgLTE5LDEwICsxOSwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IFN1
Ym1pdHRlZCBbbWFpbGluZ2xpc3RdCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAK
IGRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1pbmRleCBmYTU1MmVlLi5h
Y2VmNmJhIDEwMDY0NAoraW5kZXggZDg2NWU4NC4uMWM4MWQ1OCAxMDA2NDQKIC0tLSBhL01ha2Vm
aWxlLmFtCiArKysgYi9NYWtlZmlsZS5hbQotQEAgLTI1Myw2ICsyNTMsNyBAQCBzZS9idWlsdGlu
Lmg6IHNyYy9nZW5idWlsdGluICQoYnVpbHRpbl9zZV9zb3VyY2VzKQorQEAgLTI1OCw2ICsyNTgs
NyBAQCBzZS9idWlsdGluLmg6IHNyYy9nZW5idWlsdGluICQoYnVpbHRpbl9zZV9zb3VyY2VzKQog
IAogICQoc3JjX25lYXJkX09CSkVDVFMpIFwKICAkKHRvb2xzX25mY3Rvb2xfbmZjdG9vbF9PQkpF
Q1RTKSBcCkBAIC0zMCw2ICszMCwzIEBAIGluZGV4IGZhNTUyZWUuLmFjZWY2YmEgMTAwNjQ0CiAg
JChwbHVnaW5fb2JqZWN0cykgXAogICQoc2Vfc2VlbGRfT0JKRUNUUykgXAogICQodW5pdF90ZXN0
X25kZWZfcGFyc2VfT0JKRUNUUykgXAotLS0gCi0yLjExLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9uZWFyZC9uZWFyZC9NYWtlZmlsZS5hbS1kby1ub3Qtc2hpcC12
ZXJzaW9uLmgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkL01h
a2VmaWxlLmFtLWRvLW5vdC1zaGlwLXZlcnNpb24uaC5wYXRjaAppbmRleCAxNjg3NWUwNTQzLi4x
YzIyOTI4ZGVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25l
YXJkL01ha2VmaWxlLmFtLWRvLW5vdC1zaGlwLXZlcnNpb24uaC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkL01ha2VmaWxlLmFtLWRvLW5vdC1zaGlwLXZl
cnNpb24uaC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYmZkMzJkNjhjZmM5ZjFlMzFkYWI4
OGUwNzQ0NmQxYzAyYmM4MGI1ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzllYTc4
ZGM5MTRlYjgyMWQwNDE1Mjc0MzZiYTZmYTkxNDQ4MzIxOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIuY29tPgogRGF0ZTog
VGh1LCAxMiBGZWIgMjAxNSAwMDozOToyOSAtMDgwMAogU3ViamVjdDogW1BBVENIXSBNYWtlZmls
ZS5hbTogZG8gbm90IHNoaXAgdmVyc2lvbi5oCkBAIC0xMCwxMSArMTAsMTEgQEAgVXBzdHJlYW0t
U3RhdHVzOiBQZW5kaW5nCiAKIFNpZ25lZC1vZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGkueWFu
Z0B3aW5kcml2ZXIuY29tPgogLS0tCi0gTWFrZWZpbGUuYW0gfCAgICA0ICsrLS0KKyBNYWtlZmls
ZS5hbSB8IDQgKystLQogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1pbmRleCAz
MzM0NzkwLi42OWNkNThmIDEwMDY0NAoraW5kZXggNTkyZmI3Yy4uZDg2NWU4NCAxMDA2NDQKIC0t
LSBhL01ha2VmaWxlLmFtCiArKysgYi9NYWtlZmlsZS5hbQogQEAgLTEwLDExICsxMCwxMSBAQCBw
a2dpbmNsdWRlX0hFQURFUlMgPSBpbmNsdWRlL3R5cGVzLmggaW5jbHVkZS9sb2cuaCBpbmNsdWRl
L3BsdWdpbi5oIFwKQEAgLTMxLDYgKzMxLDMgQEAgaW5kZXggMzMzNDc5MC4uNjljZDU4ZiAxMDA2
NDQKICAJCQkkKG5vaW5zdF9IRUFERVJTKSwgaW5jbHVkZS9uZWFyLyQobm90ZGlyICQoZmlsZSkp
KQogIAogIGdkYnVzX3NvdXJjZXMgPSBnZGJ1cy9nZGJ1cy5oIGdkYnVzL21haW5sb29wLmMgZ2Ri
dXMvd2F0Y2guYyBcCi0tLSAKLTEuNy45LjUKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9uZWFyZC9uZWFyZC9NYWtlZmlsZS5hbS1maXgtcGFyYWxsZWwtaXNzdWUucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkL01ha2VmaWxlLmFtLWZp
eC1wYXJhbGxlbC1pc3N1ZS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYWVi
MzNhNWJkYy4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJk
L25lYXJkL01ha2VmaWxlLmFtLWZpeC1wYXJhbGxlbC1pc3N1ZS5wYXRjaAorKysgL2Rldi9udWxs
CkBAIC0xLDMwICswLDAgQEAKLUZyb20gNDNhY2M1NmQ1NTA2YzdlMzE4ZjcxN2ZiMzYzNGJjMTZl
MzQzODkxMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFJvYmVydCBZYW5nIDxsaWV6
aGkueWFuZ0B3aW5kcml2ZXIuY29tPgotRGF0ZTogVGh1LCAxNSBKYW4gMjAxNSAxODoxMjowNyAt
MDgwMAotU3ViamVjdDogW1BBVENIXSBNYWtlZmlsZS5hbTogZml4IHBhcmFsbGVsIGlzc3VlCi0K
LVRoZXJlIG1pZ2h0IGJlIG5vIHNyYyBkaXIgaWYgc3JjL2J1aWx0aW4uaCBydW5zIGVhcmxpZXIs
IGNyZWF0ZSBpdCB0bwotZml4IHRoZSByYWNlIGlzc3VlOgotCi1zcmMvZ2VuYnVpbHRpbiBuZmN0
eXBlMSBuZmN0eXBlMiBuZmN0eXBlMyBuZmN0eXBlNCBwMnAgPiBzcmMvYnVpbHRpbi5oCi0vYmlu
L3NoOiBzcmMvYnVpbHRpbi5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Ci0KLVVwc3RyZWFt
LVN0YXR1czogQmFja3BvcnQgW2QzOWY4YzBlZWU2NTk3NDNiNDQyNWQzOTVjMmY3YWIxOTQ5ZTlj
NzFdCi0KLVNpZ25lZC1vZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIu
Y29tPgotLS0tCi0gTWFrZWZpbGUuYW0gfCAgICAxICsKLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKLQotSW5kZXg6IG5lYXJkLTAuMTYvTWFrZWZpbGUuYW0KLT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0t
LSBuZWFyZC0wLjE2Lm9yaWcvTWFrZWZpbGUuYW0KLSsrKyBuZWFyZC0wLjE2L01ha2VmaWxlLmFt
Ci1AQCAtMjQ0LDYgKzI0NCw3IEBAIFNFRF9QUk9DRVNTID0gJChBTV9WX0dFTikkKE1LRElSX1Ap
ICQoZGkKLSBzcmMvcGx1Z2luLiQoT0JKRVhUKTogc3JjL2J1aWx0aW4uaAotIAotIHNyYy9idWls
dGluLmg6IHNyYy9nZW5idWlsdGluICQoYnVpbHRpbl9zb3VyY2VzKQotKwkkKEFNX1ZfYXQpJChN
S0RJUl9QKSBzcmMKLSAJJChBTV9WX0dFTikkKHNyY2Rpcikvc3JjL2dlbmJ1aWx0aW4gJChidWls
dGluX21vZHVsZXMpID4gJEAKLSAKLSBzZS9wbHVnaW4uJChPQkpFWFQpOiBzZS9idWlsdGluLmgK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVhcmQvbmVhcmRfMC4xOS5i
YiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVhcmQvbmVhcmRfMC4yMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJk
L25lYXJkXzAuMTkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVhcmQv
bmVhcmRfMC4yMC5iYgppbmRleCBjMTE0OWU3NjMxLi5hNTgzZGE4MjdmIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkXzAuMTkuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9uZWFyZC9uZWFyZF8wLjIwLmJiCkBAIC0xMCwxMiArMTAsMTEg
QEAgREVQRU5EUyA9ICJkYnVzIGdsaWItMi4wIGxpYm5sIGF1dG9jb25mLWFyY2hpdmUtbmF0aXZl
IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGludXgtbmZjL25lYXJkO3Byb3RvY29s
PWh0dHBzO2JyYW5jaD1tYXN0ZXIgXAogICAgICAgICAgICBmaWxlOi8vbmVhcmQuaW4gXAotICAg
ICAgICAgICBmaWxlOi8vTWFrZWZpbGUuYW0tZml4LXBhcmFsbGVsLWlzc3VlLnBhdGNoIFwKICAg
ICAgICAgICAgZmlsZTovL01ha2VmaWxlLmFtLWRvLW5vdC1zaGlwLXZlcnNpb24uaC5wYXRjaCBc
CiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUFkZC1oZWFkZXItZGVwZW5kZW5jeS10by1uY2lhdHRh
Y2guby5wYXRjaCBcCi0gICAgICAgICAgIgorICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICJhMWRj
OGE3NWNiYTk5OTcyOGUxNTRhMGY4MTFhYjlkZDUwYzgwOWY3IgorU1JDUkVWID0gIjcxMTg2Njhi
YzkyZmUxNWE4ZmY1ZTQwNjdhYmQ1ZTE2MjI1MjRmMDMiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBr
Z2NvbmZpZyBzeXN0ZW1kIHVwZGF0ZS1yYy5kCiAKLS0gCjIuNDcuMQoK

--===============4240116660667685882==--

