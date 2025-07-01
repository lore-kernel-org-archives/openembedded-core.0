Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10399C83F0C
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:24 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.1428.1751386807920747292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ohhV0G3p;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DB0gOly6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010197c6ca0bad-39edd264-d30a-4900-af4b-8db75dd44664-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TUVgdqwuzdJHkQonSI8g3JgGXjZ4cg+wlIiJCs/OXBc=;
	b=ohhV0G3pVXjhzh+Huq/eWVKiBRpzYDuhPTaY9Zs5SuVsv1PodFZcVgtDAE/443TT
	74lLsOJPoOJ6B5bdp/B5OHdLSjx4H8lWtgm3OtA5VyIBErZxK8o/DMtKGwEY82wAE6Z
	ekBN/XT08PGK575EL/RPCrspy76NOjnl7gqy1EVc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TUVgdqwuzdJHkQonSI8g3JgGXjZ4cg+wlIiJCs/OXBc=;
	b=DB0gOly65GqDJAOxXZ3cQc1PqefuAtLo+uwkKTlFnNmoYtdPXHHyyqhkguQH4esF
	Pd69PeZdcY5Vsw+SNERFwJegGZ0O4NXbCKzICspkwNY53DFpFgu1f2M2ZIGbxYwWYbA
	KrZzI5l94hhveSYByKBGoQOchvH7MxjR1qrAC0I8=
Content-Type: multipart/mixed; boundary="===============5818705840482017006=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcf-agent: upgrading to 1.9.0 FAILED
Message-ID: <01010197c6ca0bad-39edd264-d30a-4900-af4b-8db75dd44664-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219652

--===============5818705840482017006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tcf-agent* to *1.9.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tcf-agent-upgrade-1.8.0-1.9.0.patch
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
From 94e2b853bd635ce134a69013c8d1b371ed4bfce8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 10:34:29 +0000
Subject: [PATCH] tcf-agent: upgrade 1.8.0 -> 1.9.0

---
 .../tcf-agent/tcf-agent/ldflags.patch         | 22 +++++++++----------
 ...{tcf-agent_1.8.0.bb => tcf-agent_1.9.0.bb} |  2 +-
 2 files changed, 11 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/tcf-agent/{tcf-agent_1.8.0.bb => tcf-agent_1.9.0.bb} (97%)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
index d701e8dec0..3a93e09183 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
@@ -1,29 +1,27 @@
+From fd82f8ce1f5072125c88b7f2575f520832e91698 Mon Sep 17 00:00:00 2001
+From: Abdur Rehman <abdur_rehman@mentor.com>
+Date: Wed, 26 Aug 2015 19:18:11 +0500
+Subject: [PATCH] tcf-agent: obey LDFLAGS
+
 We need LDFLAGS to be respected otherwise there are QA warnings as the right
 flags don't get used.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-From d92af0483c20365fd0af740d0baef8870b4aa374 Mon Sep 17 00:00:00 2001
-From: Abdur Rehman <abdur_rehman@mentor.com>
-Date: Wed, 26 Aug 2015 19:18:11 +0500
-Subject: [PATCH] tcf-agent: obey LDFLAGS
-
 Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
 
 Rebased to 4a2c4baaccbc8c29ce0297705de9a4e096d57ce5 version
 
 Signed-off-by: Mark hatle <mark.hatle@amd.com>
-
-
 ---
- Makefile.inc |    2 +-
+ agent/Makefile.inc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: agent/Makefile.inc
-===================================================================
---- agent.orig/Makefile.inc
-+++ agent/Makefile.inc
+diff --git a/agent/Makefile.inc b/agent/Makefile.inc
+index 76b88618..6dce28f5 100644
+--- a/agent/Makefile.inc
++++ b/agent/Makefile.inc
 @@ -111,7 +111,7 @@ NO_LINK_F   ?= -c
  # Linker definition and flags
  
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
similarity index 97%
rename from meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb
rename to meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
index 1639ae84e9..c1fb3a6fd0 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 LICENSE = "EPL-1.0 | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
-SRCREV = "1f11747e83ebf4f53e8d17f430136f92ec378709"
+SRCREV = "9076423f959d53aafa4000d6bb8bf2a1485971b9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 SRC_URI = "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=https;branch=master \
-- 
2.47.1


--===============5818705840482017006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1917 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1917 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-e89f924f6a8fc91c206ece9bb4fe60bbf551b486"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e89f924f6a8fc91c206ece9bb4fe60bbf551b486"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 195 Local 182 Mirrors 0 Missed 13 Current 341 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1239 of 1544 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_recipe_qa)
NOTE: recipe tcf-agent-1.9.0-r0: task do_recipe_qa: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_recipe_qa unihash changed to 87f68c1084e655072422f00adea44856d331e9ae7ccbf232ba8d62191e218d5c
NOTE: Setscene tasks completed
NOTE: Running task 1525 of 1544 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_fetch)
NOTE: recipe tcf-agent-1.9.0-r0: task do_fetch: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1526 of 1544 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_unpack)
NOTE: Running task 1527 of 1544 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcf-agent-1.9.0-r0: task do_unpack: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1528 of 1544 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_patch)
NOTE: Running task 1529 of 1544 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_collect_spdx_deps)
NOTE: recipe tcf-agent-1.9.0-r0: task do_patch: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcf-agent-1.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tcf-agent-1.9.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1529 tasks of which 1523 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701103412.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701103412.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/tcf-agent/1.9.0/temp/log.do_patch.2062363
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: tcf-agent-1.9.0-r0 do_patch: Applying patch 'ldflags.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/tcf-agent/1.9.0/sources/tcf-agent-1.9.0/agent'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/tcf-agent/1.9.0/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch ldflags.patch
can't find file to patch at input line 25
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From fd82f8ce1f5072125c88b7f2575f520832e91698 Mon Sep 17 00:00:00 2001
|From: Abdur Rehman <abdur_rehman@mentor.com>
|Date: Wed, 26 Aug 2015 19:18:11 +0500
|Subject: [PATCH] tcf-agent: obey LDFLAGS
|
|We need LDFLAGS to be respected otherwise there are QA warnings as the right
|flags don't get used.
|
|Upstream-Status: Inappropriate [oe-core specific]
|Signed-off-by: Ross Burton <ross.burton@arm.com>
|
|Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
|
|Rebased to 4a2c4baaccbc8c29ce0297705de9a4e096d57ce5 version
|
|Signed-off-by: Mark hatle <mark.hatle@amd.com>
|---
| agent/Makefile.inc | 2 +-
| 1 file changed, 1 insertion(+), 1 deletion(-)
|
|diff --git a/agent/Makefile.inc b/agent/Makefile.inc
|index 76b88618..6dce28f5 100644
|--- a/agent/Makefile.inc
|+++ b/agent/Makefile.inc
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch ldflags.patch does not apply (enforce with -f)

stderr: ")
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/tcf-agent/1.9.0/temp/log.do_patch.2062363
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_patch) failed with exit code '1'

--===============5818705840482017006==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tcf-agent-upgrade-1.8.0-1.9.0.patch"

RnJvbSA5NGUyYjg1M2JkNjM1Y2UxMzRhNjkwMTNjOGQxYjM3MWVkNGJmY2U4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxMDozNDoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRj
Zi1hZ2VudDogdXBncmFkZSAxLjguMCAtPiAxLjkuMAoKLS0tCiAuLi4vdGNmLWFnZW50L3RjZi1h
Z2VudC9sZGZsYWdzLnBhdGNoICAgICAgICAgfCAyMiArKysrKysrKystLS0tLS0tLS0tCiAuLi57
dGNmLWFnZW50XzEuOC4wLmJiID0+IHRjZi1hZ2VudF8xLjkuMC5iYn0gfCAgMiArLQogMiBmaWxl
cyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50L3t0Y2YtYWdlbnRfMS44LjAuYmIgPT4gdGNmLWFn
ZW50XzEuOS4wLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90
Y2YtYWdlbnQvdGNmLWFnZW50L2xkZmxhZ3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dGNmLWFnZW50L3RjZi1hZ2VudC9sZGZsYWdzLnBhdGNoCmluZGV4IGQ3MDFlOGRlYzAuLjNhOTNl
MDkxODMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFn
ZW50L2xkZmxhZ3MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC90
Y2YtYWdlbnQvbGRmbGFncy5wYXRjaApAQCAtMSwyOSArMSwyNyBAQAorRnJvbSBmZDgyZjhjZTFm
NTA3MjEyNWM4OGI3ZjI1NzVmNTIwODMyZTkxNjk4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbTogQWJkdXIgUmVobWFuIDxhYmR1cl9yZWhtYW5AbWVudG9yLmNvbT4KK0RhdGU6IFdlZCwg
MjYgQXVnIDIwMTUgMTk6MTg6MTEgKzA1MDAKK1N1YmplY3Q6IFtQQVRDSF0gdGNmLWFnZW50OiBv
YmV5IExERkxBR1MKKwogV2UgbmVlZCBMREZMQUdTIHRvIGJlIHJlc3BlY3RlZCBvdGhlcndpc2Ug
dGhlcmUgYXJlIFFBIHdhcm5pbmdzIGFzIHRoZSByaWdodAogZmxhZ3MgZG9uJ3QgZ2V0IHVzZWQu
CiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNp
Z25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogCi1Gcm9tIGQ5
MmFmMDQ4M2MyMDM2NWZkMGFmNzQwZDBiYWVmODg3MGI0YWEzNzQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCi1Gcm9tOiBBYmR1ciBSZWhtYW4gPGFiZHVyX3JlaG1hbkBtZW50b3IuY29tPgotRGF0
ZTogV2VkLCAyNiBBdWcgMjAxNSAxOToxODoxMSArMDUwMAotU3ViamVjdDogW1BBVENIXSB0Y2Yt
YWdlbnQ6IG9iZXkgTERGTEFHUwotCiBTaWduZWQtb2ZmLWJ5OiBBYmR1ciBSZWhtYW4gPGFiZHVy
X3JlaG1hbkBtZW50b3IuY29tPgogCiBSZWJhc2VkIHRvIDRhMmM0YmFhY2NiYzhjMjljZTAyOTc3
MDVkZTlhNGUwOTZkNTdjZTUgdmVyc2lvbgogCiBTaWduZWQtb2ZmLWJ5OiBNYXJrIGhhdGxlIDxt
YXJrLmhhdGxlQGFtZC5jb20+Ci0KLQogLS0tCi0gTWFrZWZpbGUuaW5jIHwgICAgMiArLQorIGFn
ZW50L01ha2VmaWxlLmluYyB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKIAotSW5kZXg6IGFnZW50L01ha2VmaWxlLmluYwotPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQot
LS0tIGFnZW50Lm9yaWcvTWFrZWZpbGUuaW5jCi0rKysgYWdlbnQvTWFrZWZpbGUuaW5jCitkaWZm
IC0tZ2l0IGEvYWdlbnQvTWFrZWZpbGUuaW5jIGIvYWdlbnQvTWFrZWZpbGUuaW5jCitpbmRleCA3
NmI4ODYxOC4uNmRjZTI4ZjUgMTAwNjQ0CistLS0gYS9hZ2VudC9NYWtlZmlsZS5pbmMKKysrKyBi
L2FnZW50L01ha2VmaWxlLmluYwogQEAgLTExMSw3ICsxMTEsNyBAQCBOT19MSU5LX0YgICA/PSAt
YwogICMgTGlua2VyIGRlZmluaXRpb24gYW5kIGZsYWdzCiAgCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1hZ2VudF8xLjguMC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFnZW50XzEuOS4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFnZW50
XzEuOC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1h
Z2VudF8xLjkuMC5iYgppbmRleCAxNjM5YWU4NGU5Li5jMWZiM2E2ZmQwIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1hZ2VudF8xLjguMC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1hZ2VudF8xLjkuMC5iYgpAQCAtNiw3
ICs2LDcgQEAgQlVHVFJBQ0tFUiA9ICJodHRwczovL2J1Z3MuZWNsaXBzZS5vcmcvYnVncy8iCiBM
SUNFTlNFID0gIkVQTC0xLjAgfCBCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9lZGwtdjEwLmh0bWw7bWQ1PTUyMmEzOTBhODNkYzE4NjUxM2YwNTAwNTQzYWQzNjc5Igog
Ci1TUkNSRVYgPSAiMWYxMTc0N2U4M2ViZjRmNTNlOGQxN2Y0MzAxMzZmOTJlYzM3ODcwOSIKK1NS
Q1JFViA9ICI5MDc2NDIzZjk1OWQ1M2FhZmE0MDAwZDZiYjhiZjJhMTQ4NTk3MWI5IgogCiBVUFNU
UkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICIoP1A8cHZlcj4oXGQrKFwuXGQrKSspKSIKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0bGFiLmVjbGlwc2Uub3JnL2VjbGlwc2UvdGNmL3RjZi5hZ2VudC5naXQ7
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBcCi0tIAoyLjQ3LjEKCg==

--===============5818705840482017006==--

