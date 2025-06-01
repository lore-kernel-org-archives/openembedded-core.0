Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4872C61CE5
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:44 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.27795.1748786131029556291
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=INpTssmZ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WUaS/rz4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101972bc6dc8e-d360ed48-f238-40d9-9c68-6e86de8cdf06-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786142;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WQ6igEUT5PlVtfHGu0UK0z66R/LkOun+71zTadTB7wQ=;
	b=INpTssmZvcTSJRq1CLazVaOEVgRCtr/TMgA3iTrstPAfs91cNbZYslfFyhF+15pG
	27CjkUVJ8jq0OKbofm2DLHkhgZ5eIF7ERJ7U/1WC2yVTbdWiRVGvmEQ+jFHi6hH/4bd
	idohp3/aL/YFh1FxWLxkaersDKutr8b1FsV1+P34=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786142;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WQ6igEUT5PlVtfHGu0UK0z66R/LkOun+71zTadTB7wQ=;
	b=WUaS/rz4AHr26lPuJWj/bXtKCl2WAjdV74YBFFaZax0hdcCun6Xmd68+0wQ6k9E5
	no6lzVNpaid+I6TI/Kx5udm5QhNags7T9it1WCM5qlwnqXVz3EiQ5uxC5GyjFefoX2V
	M34xVKwgQiR/fAnDkZPrj6ki7C3m5/1LHsEEtVeU=
Content-Type: multipart/mixed; boundary="===============1228510812325329825=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcf-agent: upgrading to 1.9.0 FAILED
Message-ID: <010101972bc6dc8e-d360ed48-f238-40d9-9c68-6e86de8cdf06-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217627

--===============1228510812325329825==
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
From 5d41e811883a4beea6b2fda95a677f5799f59ea6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 10:38:20 +0000
Subject: [PATCH] tcf-agent: upgrade 1.8.0 -> 1.9.0

---
 .../tcf-agent/tcf-agent/ldflags.patch         | 22 +++++++++----------
 .../tcf-agent/tcf-agent_git.bb                |  4 ++--
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
index d701e8dec0..e356ad997a 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
@@ -1,29 +1,27 @@
+From d1e69a1c5f54bf0ca2a16d4cbd13e78749e89fd9 Mon Sep 17 00:00:00 2001
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
  
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 235936288b..8027dff04d 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -6,8 +6,8 @@ BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 LICENSE = "EPL-1.0 | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
-SRCREV = "1f11747e83ebf4f53e8d17f430136f92ec378709"
-PV = "1.8.0+git"
+SRCREV = "9076423f959d53aafa4000d6bb8bf2a1485971b9"
+PV = "1.9.0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 SRC_URI = "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=https;branch=master \
-- 
2.47.1


--===============1228510812325329825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
Parsing recipes...done.
Parsing of 936 .bb files complete (935 cached, 1 parsed). 1915 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4e4cefca8032decdbf8a9b24a63b1217e78dbd07"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 218 Local 207 Mirrors 0 Missed 11 Current 326 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 543 of 544 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb:do_recipe_qa_setscene)
NOTE: recipe tcf-agent-1.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1264 of 1568 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb:do_fetch)
NOTE: recipe tcf-agent-1.9.0-r0: task do_fetch: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1550 of 1568 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb:do_unpack)
NOTE: Running task 1551 of 1568 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcf-agent-1.9.0-r0: task do_unpack: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_unpack: Succeeded
NOTE: recipe tcf-agent-1.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1552 of 1568 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb:do_patch)
NOTE: Running task 1553 of 1568 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb:do_collect_spdx_deps)
NOTE: recipe tcf-agent-1.9.0-r0: task do_patch: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tcf-agent-1.9.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1553 tasks of which 1548 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601103808.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601103808.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/tcf-agent/1.9.0/temp/log.do_patch.1252077
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: tcf-agent-1.9.0-r0 do_patch: Applying patch 'ldflags.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/tcf-agent/1.9.0/git/agent'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/tcf-agent/1.9.0/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch ldflags.patch
can't find file to patch at input line 25
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From d1e69a1c5f54bf0ca2a16d4cbd13e78749e89fd9 Mon Sep 17 00:00:00 2001
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
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/tcf-agent/1.9.0/temp/log.do_patch.1252077
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb:do_patch) failed with exit code '1'

--===============1228510812325329825==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tcf-agent-upgrade-1.8.0-1.9.0.patch"

RnJvbSA1ZDQxZTgxMTg4M2E0YmVlYTZiMmZkYTk1YTY3N2Y1Nzk5ZjU5ZWE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMDozODoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRj
Zi1hZ2VudDogdXBncmFkZSAxLjguMCAtPiAxLjkuMAoKLS0tCiAuLi4vdGNmLWFnZW50L3RjZi1h
Z2VudC9sZGZsYWdzLnBhdGNoICAgICAgICAgfCAyMiArKysrKysrKystLS0tLS0tLS0tCiAuLi4v
dGNmLWFnZW50L3RjZi1hZ2VudF9naXQuYmIgICAgICAgICAgICAgICAgfCAgNCArKy0tCiAyIGZp
bGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFnZW50L2xkZmxhZ3MucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1hZ2VudC9sZGZsYWdzLnBh
dGNoCmluZGV4IGQ3MDFlOGRlYzAuLmUzNTZhZDk5N2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFnZW50L2xkZmxhZ3MucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC90Y2YtYWdlbnQvbGRmbGFncy5wYXRjaApAQCAtMSwy
OSArMSwyNyBAQAorRnJvbSBkMWU2OWExYzVmNTRiZjBjYTJhMTZkNGNiZDEzZTc4NzQ5ZTg5ZmQ5
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQWJkdXIgUmVobWFuIDxhYmR1cl9yZWht
YW5AbWVudG9yLmNvbT4KK0RhdGU6IFdlZCwgMjYgQXVnIDIwMTUgMTk6MTg6MTEgKzA1MDAKK1N1
YmplY3Q6IFtQQVRDSF0gdGNmLWFnZW50OiBvYmV5IExERkxBR1MKKwogV2UgbmVlZCBMREZMQUdT
IHRvIGJlIHJlc3BlY3RlZCBvdGhlcndpc2UgdGhlcmUgYXJlIFFBIHdhcm5pbmdzIGFzIHRoZSBy
aWdodAogZmxhZ3MgZG9uJ3QgZ2V0IHVzZWQuCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3By
aWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3Nz
LmJ1cnRvbkBhcm0uY29tPgogCi1Gcm9tIGQ5MmFmMDQ4M2MyMDM2NWZkMGFmNzQwZDBiYWVmODg3
MGI0YWEzNzQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBBYmR1ciBSZWhtYW4gPGFi
ZHVyX3JlaG1hbkBtZW50b3IuY29tPgotRGF0ZTogV2VkLCAyNiBBdWcgMjAxNSAxOToxODoxMSAr
MDUwMAotU3ViamVjdDogW1BBVENIXSB0Y2YtYWdlbnQ6IG9iZXkgTERGTEFHUwotCiBTaWduZWQt
b2ZmLWJ5OiBBYmR1ciBSZWhtYW4gPGFiZHVyX3JlaG1hbkBtZW50b3IuY29tPgogCiBSZWJhc2Vk
IHRvIDRhMmM0YmFhY2NiYzhjMjljZTAyOTc3MDVkZTlhNGUwOTZkNTdjZTUgdmVyc2lvbgogCiBT
aWduZWQtb2ZmLWJ5OiBNYXJrIGhhdGxlIDxtYXJrLmhhdGxlQGFtZC5jb20+Ci0KLQogLS0tCi0g
TWFrZWZpbGUuaW5jIHwgICAgMiArLQorIGFnZW50L01ha2VmaWxlLmluYyB8IDIgKy0KICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAotSW5kZXg6IGFnZW50
L01ha2VmaWxlLmluYwotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIGFnZW50Lm9yaWcvTWFrZWZpbGUuaW5jCi0r
KysgYWdlbnQvTWFrZWZpbGUuaW5jCitkaWZmIC0tZ2l0IGEvYWdlbnQvTWFrZWZpbGUuaW5jIGIv
YWdlbnQvTWFrZWZpbGUuaW5jCitpbmRleCA3NmI4ODYxOC4uNmRjZTI4ZjUgMTAwNjQ0CistLS0g
YS9hZ2VudC9NYWtlZmlsZS5pbmMKKysrKyBiL2FnZW50L01ha2VmaWxlLmluYwogQEAgLTExMSw3
ICsxMTEsNyBAQCBOT19MSU5LX0YgICA/PSAtYwogICMgTGlua2VyIGRlZmluaXRpb24gYW5kIGZs
YWdzCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1h
Z2VudF9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1hZ2VudF9n
aXQuYmIKaW5kZXggMjM1OTM2Mjg4Yi4uODAyN2RmZjA0ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3RjZi1hZ2VudC90Y2YtYWdlbnRfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFnZW50X2dpdC5iYgpAQCAtNiw4ICs2LDggQEAgQlVH
VFJBQ0tFUiA9ICJodHRwczovL2J1Z3MuZWNsaXBzZS5vcmcvYnVncy8iCiBMSUNFTlNFID0gIkVQ
TC0xLjAgfCBCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9lZGwtdjEw
Lmh0bWw7bWQ1PTUyMmEzOTBhODNkYzE4NjUxM2YwNTAwNTQzYWQzNjc5IgogCi1TUkNSRVYgPSAi
MWYxMTc0N2U4M2ViZjRmNTNlOGQxN2Y0MzAxMzZmOTJlYzM3ODcwOSIKLVBWID0gIjEuOC4wK2dp
dCIKK1NSQ1JFViA9ICI5MDc2NDIzZjk1OWQ1M2FhZmE0MDAwZDZiYjhiZjJhMTQ4NTk3MWI5Igor
UFYgPSAiMS45LjAiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPihc
ZCsoXC5cZCspKykpIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZWNsaXBzZS5vcmcvZWNsaXBz
ZS90Y2YvdGNmLmFnZW50LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIFwKLS0gCjIu
NDcuMQoK

--===============1228510812325329825==--

