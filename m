Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE80C5B559
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:01 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.11022.1747312301909318574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CF660xeE;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fMpm7APN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010196d3ee1e57-bbd84095-0f56-44b7-8059-6633cd761707-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312320;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ihMZo02cWn9P4++tPzoWObOtvgWEv8fEM1eRdX/eUTU=;
	b=CF660xeEvAyfQVP7izd2QK0GwG+4aH55I/D0gQXzJwohNUFoz70Ekzpo63djdtcn
	v452e+W1eT3RqScG+A97EgbfsGn0KHIhUYYzH4xgVcJ0eywJnRUtXjbWPomq9LZGl9i
	8Q6aAY4X0gamTkC6BB33QjXAcx/kKeh/QfSWWKFw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312320;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ihMZo02cWn9P4++tPzoWObOtvgWEv8fEM1eRdX/eUTU=;
	b=fMpm7APN0eeg+4B0H/SwGpE45iBra4x7AU+5xKEuesVrALuJM/ej5i6/wxwcwbay
	x7RIIWN++FrVC0iFzf5sYjq813FrdoqXZ+4hY8bLWrp1HWfEcSsiQKosQ+2pLJtk1fx
	WogIG5/m3Y1llBn9nsJuMw5P29idANeXt/4PnkD4=
Content-Type: multipart/mixed; boundary="===============9001574187560949566=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcf-agent: upgrading to 1.9.0 FAILED
Message-ID: <01010196d3ee1e57-bbd84095-0f56-44b7-8059-6633cd761707-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216631

--===============9001574187560949566==
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
From 35dadf38dbd8ec5a0c7ef97c015f7ea0b207e9df Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 09:12:40 +0000
Subject: [PATCH] tcf-agent: upgrade 1.8.0 -> 1.9.0

---
 .../tcf-agent/tcf-agent/ldflags.patch         | 22 +++++++++----------
 .../tcf-agent/tcf-agent_git.bb                |  4 ++--
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
index d701e8dec0..849e7c2652 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
@@ -1,29 +1,27 @@
+From cad4392dfcd891b499f1753627255fefe5c8dfff Mon Sep 17 00:00:00 2001
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


--===============9001574187560949566==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tcf-agent-upgrade-1.8.0-1.9.0.patch"

RnJvbSAzNWRhZGYzOGRiZDhlYzVhMGM3ZWY5N2MwMTVmN2VhMGIyMDdlOWRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDk6MTI6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
Y2YtYWdlbnQ6IHVwZ3JhZGUgMS44LjAgLT4gMS45LjAKCi0tLQogLi4uL3RjZi1hZ2VudC90Y2Yt
YWdlbnQvbGRmbGFncy5wYXRjaCAgICAgICAgIHwgMjIgKysrKysrKysrLS0tLS0tLS0tLQogLi4u
L3RjZi1hZ2VudC90Y2YtYWdlbnRfZ2l0LmJiICAgICAgICAgICAgICAgIHwgIDQgKystLQogMiBm
aWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1hZ2VudC9sZGZsYWdzLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC90Y2YtYWdlbnQvbGRmbGFncy5w
YXRjaAppbmRleCBkNzAxZThkZWMwLi44NDllN2MyNjUyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1hZ2VudC9sZGZsYWdzLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFnZW50L2xkZmxhZ3MucGF0Y2gKQEAgLTEs
MjkgKzEsMjcgQEAKK0Zyb20gY2FkNDM5MmRmY2Q4OTFiNDk5ZjE3NTM2MjcyNTVmZWZlNWM4ZGZm
ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IEFiZHVyIFJlaG1hbiA8YWJkdXJfcmVo
bWFuQG1lbnRvci5jb20+CitEYXRlOiBXZWQsIDI2IEF1ZyAyMDE1IDE5OjE4OjExICswNTAwCitT
dWJqZWN0OiBbUEFUQ0hdIHRjZi1hZ2VudDogb2JleSBMREZMQUdTCisKIFdlIG5lZWQgTERGTEFH
UyB0byBiZSByZXNwZWN0ZWQgb3RoZXJ3aXNlIHRoZXJlIGFyZSBRQSB3YXJuaW5ncyBhcyB0aGUg
cmlnaHQKIGZsYWdzIGRvbid0IGdldCB1c2VkLgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9w
cmlhdGUgW29lLWNvcmUgc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9z
cy5idXJ0b25AYXJtLmNvbT4KIAotRnJvbSBkOTJhZjA0ODNjMjAzNjVmZDBhZjc0MGQwYmFlZjg4
NzBiNGFhMzc0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogQWJkdXIgUmVobWFuIDxh
YmR1cl9yZWhtYW5AbWVudG9yLmNvbT4KLURhdGU6IFdlZCwgMjYgQXVnIDIwMTUgMTk6MTg6MTEg
KzA1MDAKLVN1YmplY3Q6IFtQQVRDSF0gdGNmLWFnZW50OiBvYmV5IExERkxBR1MKLQogU2lnbmVk
LW9mZi1ieTogQWJkdXIgUmVobWFuIDxhYmR1cl9yZWhtYW5AbWVudG9yLmNvbT4KIAogUmViYXNl
ZCB0byA0YTJjNGJhYWNjYmM4YzI5Y2UwMjk3NzA1ZGU5YTRlMDk2ZDU3Y2U1IHZlcnNpb24KIAog
U2lnbmVkLW9mZi1ieTogTWFyayBoYXRsZSA8bWFyay5oYXRsZUBhbWQuY29tPgotCi0KIC0tLQot
IE1ha2VmaWxlLmluYyB8ICAgIDIgKy0KKyBhZ2VudC9NYWtlZmlsZS5pbmMgfCAyICstCiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKLUluZGV4OiBhZ2Vu
dC9NYWtlZmlsZS5pbmMKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBhZ2VudC5vcmlnL01ha2VmaWxlLmluYwot
KysrIGFnZW50L01ha2VmaWxlLmluYworZGlmZiAtLWdpdCBhL2FnZW50L01ha2VmaWxlLmluYyBi
L2FnZW50L01ha2VmaWxlLmluYworaW5kZXggNzZiODg2MTguLjZkY2UyOGY1IDEwMDY0NAorLS0t
IGEvYWdlbnQvTWFrZWZpbGUuaW5jCisrKysgYi9hZ2VudC9NYWtlZmlsZS5pbmMKIEBAIC0xMTEs
NyArMTExLDcgQEAgTk9fTElOS19GICAgPz0gLWMKICAjIExpbmtlciBkZWZpbml0aW9uIGFuZCBm
bGFncwogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC90Y2Yt
YWdlbnRfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC90Y2YtYWdlbnRf
Z2l0LmJiCmluZGV4IDIzNTkzNjI4OGIuLjgwMjdkZmYwNGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFnZW50X2dpdC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1hZ2VudF9naXQuYmIKQEAgLTYsOCArNiw4IEBAIEJV
R1RSQUNLRVIgPSAiaHR0cHM6Ly9idWdzLmVjbGlwc2Uub3JnL2J1Z3MvIgogTElDRU5TRSA9ICJF
UEwtMS4wIHwgQlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vZWRsLXYx
MC5odG1sO21kNT01MjJhMzkwYTgzZGMxODY1MTNmMDUwMDU0M2FkMzY3OSIKIAotU1JDUkVWID0g
IjFmMTE3NDdlODNlYmY0ZjUzZThkMTdmNDMwMTM2ZjkyZWMzNzg3MDkiCi1QViA9ICIxLjguMCtn
aXQiCitTUkNSRVYgPSAiOTA3NjQyM2Y5NTlkNTNhYWZhNDAwMGQ2YmI4YmYyYTE0ODU5NzFiOSIK
K1BWID0gIjEuOS4wIgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICIoP1A8cHZlcj4o
XGQrKFwuXGQrKSspKSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmVjbGlwc2Uub3JnL2VjbGlw
c2UvdGNmL3RjZi5hZ2VudC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBcCi0tIAoy
LjQ3LjEKCg==

--===============9001574187560949566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1916 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1916 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:3eefa8cd883755e93b489bd65b93afddbf605603"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 203 Local 191 Mirrors 0 Missed 12 Current 341 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1263 of 1568 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb:do_recipe_qa)
NOTE: recipe tcf-agent-1.9.0-r0: task do_recipe_qa: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb:do_recipe_qa unihash changed to 87f68c1084e655072422f00adea44856d331e9ae7ccbf232ba8d62191e218d5c
NOTE: Setscene tasks completed
NOTE: Running task 1549 of 1568 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb:do_fetch)
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
NOTE: Tasks Summary: Attempted 1553 tasks of which 1547 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515091227.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515091227.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/tcf-agent/1.9.0/temp/log.do_patch.3072794
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: tcf-agent-1.9.0-r0 do_patch: Applying patch 'ldflags.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/tcf-agent/1.9.0/git/agent'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/tcf-agent/1.9.0/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch ldflags.patch
can't find file to patch at input line 25
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From cad4392dfcd891b499f1753627255fefe5c8dfff Mon Sep 17 00:00:00 2001
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
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/tcf-agent/1.9.0/temp/log.do_patch.3072794
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb:do_patch) failed with exit code '1'

--===============9001574187560949566==--

