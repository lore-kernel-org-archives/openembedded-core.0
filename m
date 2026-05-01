Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD61FCD343B
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15610.1777645533598114196
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=oWf/CcD+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xAUF60Ft;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019de3ee3672-b0c9597f-b8da-49c1-b7a0-d65ca37c5478-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645532;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MbURreQbQSulOPlhDBaNPdQM/jCC+5zV+qRaKSZ8+E0=;
	b=oWf/CcD+100kUYOvCGf6fCbkdLsBbFMMRWo8DG1rPVy+jIgJqnPHMGj6blspZvjF
	qjXXClwaYkXjBEehEiy35lSEblLkIabOAXWDOICGwVlsw/65Iyco6M7Z8Tr+tKgtKe8
	HliXSMVFf0KExaiNaiFU3J1HoDJylrywwcunyWDo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645532;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MbURreQbQSulOPlhDBaNPdQM/jCC+5zV+qRaKSZ8+E0=;
	b=xAUF60FtTfZYAkREN1+uiy6NH+j6z75kut4WPgJXp/Mc10TTqs17vPmO/I0iNzcA
	PSA+SHVMaasRWLzbhV6M2UN+CoouoTgX2uUXG0bHDAojwdMItQon6k1g6u0s2xhsd1P
	b4k7EzAqpkEaig8dBvxHIrq+VT+h/3Rz4rPPvElg=
Content-Type: multipart/mixed; boundary="===============6473034205994758084=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] neard: upgrading to 0.20 FAILED
Message-ID: <0101019de3ee3672-b0c9597f-b8da-49c1-b7a0-d65ca37c5478-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236210

--===============6473034205994758084==
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
From 1a88f11a0361514e10f8019beed3dc282ad1fa5b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 06:50:44 +0000
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
index d8e8a5e5da..9e366693e7 100644
--- a/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch
+++ b/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch
@@ -1,4 +1,4 @@
-From affaa2021a54c30353e4e1fee09c13a4de2196be Mon Sep 17 00:00:00 2001
+From de251cdfe62140d6f3e688ddc7ae5dff2e709ecf Mon Sep 17 00:00:00 2001
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
index 16875e0543..b606103c5f 100644
--- a/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch
+++ b/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch
@@ -1,4 +1,4 @@
-From bfd32d68cfc9f1e31dab88e07446d1c02bc80b5e Mon Sep 17 00:00:00 2001
+From 2584e21cb46346a22e1bad66c9c1f77ef8865aea Mon Sep 17 00:00:00 2001
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


--===============6473034205994758084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-bdcc92127fb84566c17e5ad4ca5f62fc3ec9bf22"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:bdcc92127fb84566c17e5ad4ca5f62fc3ec9bf22"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 406 Local 392 Mirrors 0 Missed 14 Current 583 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 773 of 989 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 794 of 989 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_create_spdx_setscene)
NOTE: recipe wpa-supplicant-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1229 of 2367 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_recipe_qa)
NOTE: recipe wpa-supplicant-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 899 of 989 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.86-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe neard-0.20-r0: task do_recipe_qa: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 984 of 989 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libnl-1_3.12.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe neard-0.20-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_recipe_qa unihash changed to 1bb5c0ff674e02c51c318b350cb27db6aebe702522c8d5b3fab78101dbb72eea
NOTE: Setscene tasks completed
NOTE: Running task 2154 of 2367 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_fetch)
NOTE: Running task 2330 of 2367 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_create_recipe_spdx)
NOTE: recipe neard-0.20-r0: task do_fetch: Started
NOTE: recipe neard-0.20-r0: task do_create_recipe_spdx: Started
NOTE: recipe neard-0.20-r0: task do_fetch: Succeeded
NOTE: Running task 2350 of 2367 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_unpack)
NOTE: Running task 2351 of 2367 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_prepare_recipe_sysroot)
NOTE: recipe neard-0.20-r0: task do_unpack: Started
NOTE: recipe neard-0.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe neard-0.20-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe neard-0.20-r0: task do_unpack: Succeeded
NOTE: Running task 2352 of 2367 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_patch)
NOTE: recipe neard-0.20-r0: task do_patch: Started
NOTE: recipe neard-0.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe neard-0.20-r0: task do_patch: Succeeded
NOTE: Running task 2353 of 2367 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_deploy_source_date_epoch)
NOTE: Running task 2354 of 2367 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_populate_lic)
NOTE: recipe neard-0.20-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe neard-0.20-r0: task do_populate_lic: Started
NOTE: recipe neard-0.20-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_populate_lic unihash changed to 87ef655b9a11ac009f3ace839c086d3984b1b3510ea7f401a17d8f9823a4265c
NOTE: recipe neard-0.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_deploy_source_date_epoch unihash changed to 7782d7f416f40304c7cd4d2394a0ddd45260ac1ee9ce677b141fc8e7c034d020
NOTE: Setscene tasks completed
NOTE: Running task 2355 of 2367 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_configure)
NOTE: recipe neard-0.20-r0: task do_configure: Started
NOTE: recipe neard-0.20-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2355 tasks of which 2346 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501065022.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501065022.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/neard/0.20/temp/log.do_configure.3467073
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: neard-0.20-r0 do_configure: QA Issue: neard: configure was passed unrecognised options: --with-systemduserunitdir [unknown-configure-option]
ERROR: neard-0.20-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/neard/0.20/temp/log.do_configure.3467073
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_configure) failed with exit code '1'

--===============6473034205994758084==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-neard-upgrade-0.19-0.20.patch"

RnJvbSAxYTg4ZjExYTAzNjE1MTRlMTBmODAxOWJlZWQzZGMyODJhZDFmYTViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNjo1MDo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5l
YXJkOiB1cGdyYWRlIDAuMTkgLT4gMC4yMAoKLS0tCiAuLi5BZGQtaGVhZGVyLWRlcGVuZGVuY3kt
dG8tbmNpYXR0YWNoLm8ucGF0Y2ggfCAgOSArKy0tLS0KIC4uLi9NYWtlZmlsZS5hbS1kby1ub3Qt
c2hpcC12ZXJzaW9uLmgucGF0Y2ggICB8ICA5ICsrLS0tLQogLi4uL01ha2VmaWxlLmFtLWZpeC1w
YXJhbGxlbC1pc3N1ZS5wYXRjaCAgICAgIHwgMzAgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL25l
YXJkL3tuZWFyZF8wLjE5LmJiID0+IG5lYXJkXzAuMjAuYmJ9ICAgIHwgIDUgKystLQogNCBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQ1IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVhcmQvbmVhcmQvTWFrZWZpbGUuYW0t
Zml4LXBhcmFsbGVsLWlzc3VlLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9uZWFyZC97bmVhcmRfMC4xOS5iYiA9PiBuZWFyZF8wLjIwLmJifSAoOTMlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVhcmQvbmVhcmQvMDAwMS1BZGQtaGVhZGVy
LWRlcGVuZGVuY3ktdG8tbmNpYXR0YWNoLm8ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L25lYXJkL25lYXJkLzAwMDEtQWRkLWhlYWRlci1kZXBlbmRlbmN5LXRvLW5jaWF0dGFjaC5v
LnBhdGNoCmluZGV4IGQ4ZThhNWU1ZGEuLjllMzY2NjkzZTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvbmVhcmQvbmVhcmQvMDAwMS1BZGQtaGVhZGVyLWRlcGVuZGVuY3kt
dG8tbmNpYXR0YWNoLm8ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZWFy
ZC9uZWFyZC8wMDAxLUFkZC1oZWFkZXItZGVwZW5kZW5jeS10by1uY2lhdHRhY2guby5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gYWZmYWEyMDIxYTU0YzMwMzUzZTRlMWZlZTA5YzEzYTRkZTIx
OTZiZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGUyNTFjZGZlNjIxNDBkNmYzZTY4
OGRkYzdhZTVkZmYyZTcwOWVjZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEp1c3Np
IEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRlbC5jb20+CiBEYXRlOiBGcmksIDE3IE1hciAy
MDE3IDE0OjI0OjI5ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBoZWFkZXIgZGVwZW5kZW5j
eSB0byBuY2lhdHRhY2gubwpAQCAtMTksMTAgKzE5LDEwIEBAIFVwc3RyZWFtLVN0YXR1czogU3Vi
bWl0dGVkIFttYWlsaW5nbGlzdF0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAog
ZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZpbGUuYW0KLWluZGV4IGZhNTUyZWUuLmFj
ZWY2YmEgMTAwNjQ0CitpbmRleCBkODY1ZTg0Li4xYzgxZDU4IDEwMDY0NAogLS0tIGEvTWFrZWZp
bGUuYW0KICsrKyBiL01ha2VmaWxlLmFtCi1AQCAtMjUzLDYgKzI1Myw3IEBAIHNlL2J1aWx0aW4u
aDogc3JjL2dlbmJ1aWx0aW4gJChidWlsdGluX3NlX3NvdXJjZXMpCitAQCAtMjU4LDYgKzI1OCw3
IEBAIHNlL2J1aWx0aW4uaDogc3JjL2dlbmJ1aWx0aW4gJChidWlsdGluX3NlX3NvdXJjZXMpCiAg
CiAgJChzcmNfbmVhcmRfT0JKRUNUUykgXAogICQodG9vbHNfbmZjdG9vbF9uZmN0b29sX09CSkVD
VFMpIFwKQEAgLTMwLDYgKzMwLDMgQEAgaW5kZXggZmE1NTJlZS4uYWNlZjZiYSAxMDA2NDQKICAk
KHBsdWdpbl9vYmplY3RzKSBcCiAgJChzZV9zZWVsZF9PQkpFQ1RTKSBcCiAgJCh1bml0X3Rlc3Rf
bmRlZl9wYXJzZV9PQkpFQ1RTKSBcCi0tLSAKLTIuMTEuMAotCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkL01ha2VmaWxlLmFtLWRvLW5vdC1zaGlwLXZl
cnNpb24uaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVhcmQvbmVhcmQvTWFr
ZWZpbGUuYW0tZG8tbm90LXNoaXAtdmVyc2lvbi5oLnBhdGNoCmluZGV4IDE2ODc1ZTA1NDMuLmI2
MDYxMDNjNWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVhcmQvbmVh
cmQvTWFrZWZpbGUuYW0tZG8tbm90LXNoaXAtdmVyc2lvbi5oLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvbmVhcmQvbmVhcmQvTWFrZWZpbGUuYW0tZG8tbm90LXNoaXAtdmVy
c2lvbi5oLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiZmQzMmQ2OGNmYzlmMWUzMWRhYjg4
ZTA3NDQ2ZDFjMDJiYzgwYjVlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyNTg0ZTIx
Y2I0NjM0NmEyMmUxYmFkNjZjOWMxZjc3ZWY4ODY1YWVhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+CiBEYXRlOiBU
aHUsIDEyIEZlYiAyMDE1IDAwOjM5OjI5IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2VmaWxl
LmFtOiBkbyBub3Qgc2hpcCB2ZXJzaW9uLmgKQEAgLTEwLDExICsxMCwxMSBAQCBVcHN0cmVhbS1T
dGF0dXM6IFBlbmRpbmcKIAogU2lnbmVkLW9mZi1ieTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5n
QHdpbmRyaXZlci5jb20+CiAtLS0KLSBNYWtlZmlsZS5hbSB8ICAgIDQgKystLQorIE1ha2VmaWxl
LmFtIHwgNCArKy0tCiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZpbGUuYW0KLWluZGV4IDMz
MzQ3OTAuLjY5Y2Q1OGYgMTAwNjQ0CitpbmRleCA1OTJmYjdjLi5kODY1ZTg0IDEwMDY0NAogLS0t
IGEvTWFrZWZpbGUuYW0KICsrKyBiL01ha2VmaWxlLmFtCiBAQCAtMTAsMTEgKzEwLDExIEBAIHBr
Z2luY2x1ZGVfSEVBREVSUyA9IGluY2x1ZGUvdHlwZXMuaCBpbmNsdWRlL2xvZy5oIGluY2x1ZGUv
cGx1Z2luLmggXApAQCAtMzEsNiArMzEsMyBAQCBpbmRleCAzMzM0NzkwLi42OWNkNThmIDEwMDY0
NAogIAkJCSQobm9pbnN0X0hFQURFUlMpLCBpbmNsdWRlL25lYXIvJChub3RkaXIgJChmaWxlKSkp
CiAgCiAgZ2RidXNfc291cmNlcyA9IGdkYnVzL2dkYnVzLmggZ2RidXMvbWFpbmxvb3AuYyBnZGJ1
cy93YXRjaC5jIFwKLS0tIAotMS43LjkuNQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L25lYXJkL25lYXJkL01ha2VmaWxlLmFtLWZpeC1wYXJhbGxlbC1pc3N1ZS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVhcmQvbmVhcmQvTWFrZWZpbGUuYW0tZml4
LXBhcmFsbGVsLWlzc3VlLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBhZWIz
M2E1YmRjLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVhcmQv
bmVhcmQvTWFrZWZpbGUuYW0tZml4LXBhcmFsbGVsLWlzc3VlLnBhdGNoCisrKyAvZGV2L251bGwK
QEAgLTEsMzAgKzAsMCBAQAotRnJvbSA0M2FjYzU2ZDU1MDZjN2UzMThmNzE3ZmIzNjM0YmMxNmUz
NDM4OTEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogUm9iZXJ0IFlhbmcgPGxpZXpo
aS55YW5nQHdpbmRyaXZlci5jb20+Ci1EYXRlOiBUaHUsIDE1IEphbiAyMDE1IDE4OjEyOjA3IC0w
ODAwCi1TdWJqZWN0OiBbUEFUQ0hdIE1ha2VmaWxlLmFtOiBmaXggcGFyYWxsZWwgaXNzdWUKLQot
VGhlcmUgbWlnaHQgYmUgbm8gc3JjIGRpciBpZiBzcmMvYnVpbHRpbi5oIHJ1bnMgZWFybGllciwg
Y3JlYXRlIGl0IHRvCi1maXggdGhlIHJhY2UgaXNzdWU6Ci0KLXNyYy9nZW5idWlsdGluIG5mY3R5
cGUxIG5mY3R5cGUyIG5mY3R5cGUzIG5mY3R5cGU0IHAycCA+IHNyYy9idWlsdGluLmgKLS9iaW4v
c2g6IHNyYy9idWlsdGluLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKLQotVXBzdHJlYW0t
U3RhdHVzOiBCYWNrcG9ydCBbZDM5ZjhjMGVlZTY1OTc0M2I0NDI1ZDM5NWMyZjdhYjE5NDllOWM3
MV0KLQotU2lnbmVkLW9mZi1ieTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5j
b20+Ci0tLS0KLSBNYWtlZmlsZS5hbSB8ICAgIDEgKwotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQotCi1JbmRleDogbmVhcmQtMC4xNi9NYWtlZmlsZS5hbQotPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0t
IG5lYXJkLTAuMTYub3JpZy9NYWtlZmlsZS5hbQotKysrIG5lYXJkLTAuMTYvTWFrZWZpbGUuYW0K
LUBAIC0yNDQsNiArMjQ0LDcgQEAgU0VEX1BST0NFU1MgPSAkKEFNX1ZfR0VOKSQoTUtESVJfUCkg
JChkaQotIHNyYy9wbHVnaW4uJChPQkpFWFQpOiBzcmMvYnVpbHRpbi5oCi0gCi0gc3JjL2J1aWx0
aW4uaDogc3JjL2dlbmJ1aWx0aW4gJChidWlsdGluX3NvdXJjZXMpCi0rCSQoQU1fVl9hdCkkKE1L
RElSX1ApIHNyYwotIAkkKEFNX1ZfR0VOKSQoc3JjZGlyKS9zcmMvZ2VuYnVpbHRpbiAkKGJ1aWx0
aW5fbW9kdWxlcykgPiAkQAotIAotIHNlL3BsdWdpbi4kKE9CSkVYVCk6IHNlL2J1aWx0aW4uaApk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZWFyZC9uZWFyZF8wLjE5LmJi
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZWFyZC9uZWFyZF8wLjIwLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVhcmQv
bmVhcmRfMC4xOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZWFyZC9u
ZWFyZF8wLjIwLmJiCmluZGV4IGMxMTQ5ZTc2MzEuLmE1ODNkYTgyN2YgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVhcmQvbmVhcmRfMC4xOS5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkXzAuMjAuYmIKQEAgLTEwLDEyICsxMCwxMSBA
QCBERVBFTkRTID0gImRidXMgZ2xpYi0yLjAgbGlibmwgYXV0b2NvbmYtYXJjaGl2ZS1uYXRpdmUi
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9saW51eC1uZmMvbmVhcmQ7cHJvdG9jb2w9
aHR0cHM7YnJhbmNoPW1hc3RlciBcCiAgICAgICAgICAgIGZpbGU6Ly9uZWFyZC5pbiBcCi0gICAg
ICAgICAgIGZpbGU6Ly9NYWtlZmlsZS5hbS1maXgtcGFyYWxsZWwtaXNzdWUucGF0Y2ggXAogICAg
ICAgICAgICBmaWxlOi8vTWFrZWZpbGUuYW0tZG8tbm90LXNoaXAtdmVyc2lvbi5oLnBhdGNoIFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDEtQWRkLWhlYWRlci1kZXBlbmRlbmN5LXRvLW5jaWF0dGFj
aC5vLnBhdGNoIFwKLSAgICAgICAgICAiCisgICAgICAgICAgICIKIAotU1JDUkVWID0gImExZGM4
YTc1Y2JhOTk5NzI4ZTE1NGEwZjgxMWFiOWRkNTBjODA5ZjciCitTUkNSRVYgPSAiNzExODY2OGJj
OTJmZTE1YThmZjVlNDA2N2FiZDVlMTYyMjUyNGYwMyIKIAogaW5oZXJpdCBhdXRvdG9vbHMgcGtn
Y29uZmlnIHN5c3RlbWQgdXBkYXRlLXJjLmQKIAotLSAKMi40Ny4xCgo=

--===============6473034205994758084==--

