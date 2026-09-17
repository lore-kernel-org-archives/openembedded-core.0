Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3690C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:10:18 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33831.1789629013475259428
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=sH0uFsJs;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=otICV25U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a0ae339a45-ebae6b73-b5c8-4ddf-9e2f-5ad064c91dae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789629012;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ssbWTEd9dEP6Hfwir6akSGNP7xSEhDQ9jx5kfQokhBg=;
	b=sH0uFsJsU3MGZ8vjQ5fx7WhKTtms5CWijmaC0Lp4G3LC7WiGvh28PX4H7ecELORq
	VgZGTOXleBvvDGdkAx3p9CZgoYIJ04HCubpp0recj0081M6yzxiqvCt1EVBDH0yPEdL
	FxrB0CXhxqO+Nq37myamUk6bBUb2/8cPLmxt7Sh4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789629012;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ssbWTEd9dEP6Hfwir6akSGNP7xSEhDQ9jx5kfQokhBg=;
	b=otICV25UoI1jZVW/q50aUTzoXNhU42hs9/tlbdJ4NlbpOy7n5NfjCLZ6nHxE4oDW
	TXtx+xjt3cdzwTSwuWF4dEeVjHepDxcLDdB/wq9OKptg7II9ePCGfxmIfqavM1Md6Uy
	xaErgMHnmXeahEKjxBTXWR/rb3dqkbFp8RVNUmg4=
Content-Type: multipart/mixed; boundary="===============1342208508213181476=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] tcf-agent: upgrading to 1.11.1 FAILED
Message-ID: <010101a0ae339a45-ebae6b73-b5c8-4ddf-9e2f-5ad064c91dae-000000@us-west-2.amazonses.com>
Date: Thu, 17 Sep 2026 07:10:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.17-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246036

--===============1342208508213181476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tcf-agent* to *1.11.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tcf-agent-upgrade-1.11.0-1.11.1.patch
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
From e730a83da3fc3569f66aa30ba9b4329001ebce15 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 17 Sep 2026 06:23:24 +0000
Subject: [PATCH] tcf-agent: upgrade 1.11.0 -> 1.11.1

8e23af30 TCF Agent: fixed possible NULL pointer dereference in Processes.getCapabilities
---
 .../recipes-devtools/tcf-agent/tcf-agent/ldflags.patch | 10 +++++-----
 .../{tcf-agent_1.11.0.bb => tcf-agent_1.11.1.bb}       |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/tcf-agent/{tcf-agent_1.11.0.bb => tcf-agent_1.11.1.bb} (96%)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
index 9a911051e6..338d88d4bc 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
@@ -1,4 +1,4 @@
-From 2132bc5206b5d619c74caa391bc00d6f91d6ebe2 Mon Sep 17 00:00:00 2001
+From 918ddcbb890e91e7683493115d919313c92931ad Mon Sep 17 00:00:00 2001
 From: Abdur Rehman <abdur_rehman@mentor.com>
 Date: Wed, 26 Aug 2015 19:18:11 +0500
 Subject: [PATCH] tcf-agent: obey LDFLAGS
@@ -15,13 +15,13 @@ Rebased to 4a2c4baaccbc8c29ce0297705de9a4e096d57ce5 version
 
 Signed-off-by: Mark hatle <mark.hatle@amd.com>
 ---
- Makefile.inc | 2 +-
+ agent/Makefile.inc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile.inc b/Makefile.inc
+diff --git a/agent/Makefile.inc b/agent/Makefile.inc
 index 63f062b2..5da23c02 100644
---- a/Makefile.inc
-+++ b/Makefile.inc
+--- a/agent/Makefile.inc
++++ b/agent/Makefile.inc
 @@ -111,7 +111,7 @@ NO_LINK_F   ?= -c
  # Linker definition and flags
  
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.1.bb
similarity index 96%
rename from meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb
rename to meta/recipes-devtools/tcf-agent/tcf-agent_1.11.1.bb
index 01e4b7df49..5798426971 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.1.bb
@@ -6,14 +6,14 @@ BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 LICENSE = "BSD-3-Clause OR EPL-1.0"
 LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
-SRCREV = "3051a4806ac4b041ec7c49ffc6d07f0014b8480c"
+SRCREV = "8e23af30895e085e3e6a9d694f2c5b521d844742"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=https;branch=master;tag=${PV} \
+SRC_URI = "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=https;branch=1.11;tag=${PV} \
            file://ldflags.patch \
            file://tcf-agent.init \
            file://tcf-agent.service \
-          "
+           "
 
 DEPENDS = "util-linux openssl"
 RDEPENDS:${PN} = "bash"
-- 
2.47.1


--===============1342208508213181476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="tcf-agent-changelog.txt"

Changelog for tcf-agent: 1.11.0 -> 1.11.1

8e23af30 TCF Agent: fixed possible NULL pointer dereference in Processes.getCapabilities

--===============1342208508213181476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1993 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-ad651706eb8ed7d489071ad6a448017f3135292d"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:ad651706eb8ed7d489071ad6a448017f3135292d"
meta-yocto-bsp       
meta-poky            = "master:7e41504cd63b099b214f10d92cfdaf358ab98c5f"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 192 Local 178 Mirrors 0 Missed 14 Current 404 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 525 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 526 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 531 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_create_spdx_setscene)
NOTE: Running task 734 of 1515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.1.bb:do_recipe_qa)
NOTE: recipe tcf-agent-1.11.1-r0: task do_recipe_qa: Started
NOTE: recipe openssl-4.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.42.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.42.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 575 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-2.42.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.42.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1494 of 1515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.1.bb:do_create_recipe_spdx)
NOTE: recipe tcf-agent-1.11.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe tcf-agent-1.11.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1497 of 1515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.1.bb:do_fetch)
NOTE: recipe tcf-agent-1.11.1-r0: task do_fetch: Started
NOTE: recipe tcf-agent-1.11.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe tcf-agent-1.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 1498 of 1515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.1.bb:do_unpack)
NOTE: Running task 1499 of 1515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcf-agent-1.11.1-r0: task do_unpack: Started
NOTE: recipe tcf-agent-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcf-agent-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcf-agent-1.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 1500 of 1515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.1.bb:do_patch)
NOTE: recipe tcf-agent-1.11.1-r0: task do_patch: Started
NOTE: recipe tcf-agent-1.11.1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1500 tasks of which 1494 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260917062309.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260917062309.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/tcf-agent/1.11.1/temp/log.do_patch.1502830
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: tcf-agent-1.11.1-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/tcf-agent/1.11.1/sources/tcf-agent-1.11.1/agent'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/tcf-agent/1.11.1/recipe-sysroot-native/etc/quiltrc push', 1, "stdout: Applying patch ldflags.patch
can't find file to patch at input line 25
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 918ddcbb890e91e7683493115d919313c92931ad Mon Sep 17 00:00:00 2001
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
|index 63f062b2..5da23c02 100644
|--- a/agent/Makefile.inc
|+++ b/agent/Makefile.inc
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch ldflags.patch does not apply (enforce with -f)

stderr: ")
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/tcf-agent/1.11.1/temp/log.do_patch.1502830
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.1.bb:do_patch) failed with exit code '1'

--===============1342208508213181476==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tcf-agent-upgrade-1.11.0-1.11.1.patch"

RnJvbSBlNzMwYTgzZGEzZmMzNTY5ZjY2YWEzMGJhOWI0MzI5MDAxZWJjZTE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTcgU2VwIDIwMjYgMDY6MjM6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
Y2YtYWdlbnQ6IHVwZ3JhZGUgMS4xMS4wIC0+IDEuMTEuMQoKOGUyM2FmMzAgVENGIEFnZW50OiBm
aXhlZCBwb3NzaWJsZSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gUHJvY2Vzc2VzLmdldENh
cGFiaWxpdGllcwotLS0KIC4uLi9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC90Y2YtYWdlbnQv
bGRmbGFncy5wYXRjaCB8IDEwICsrKysrLS0tLS0KIC4uLi97dGNmLWFnZW50XzEuMTEuMC5iYiA9
PiB0Y2YtYWdlbnRfMS4xMS4xLmJifSAgICAgICB8ICA2ICsrKy0tLQogMiBmaWxlcyBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3RjZi1hZ2VudC97dGNmLWFnZW50XzEuMTEuMC5iYiA9PiB0Y2YtYWdlbnRfMS4xMS4x
LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2YtYWdlbnQv
dGNmLWFnZW50L2xkZmxhZ3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50
L3RjZi1hZ2VudC9sZGZsYWdzLnBhdGNoCmluZGV4IDlhOTExMDUxZTYuLjMzOGQ4OGQ0YmMgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFnZW50L2xkZmxh
Z3MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC90Y2YtYWdlbnQv
bGRmbGFncy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjEzMmJjNTIwNmI1ZDYxOWM3NGNh
YTM5MWJjMDBkNmY5MWQ2ZWJlMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTE4ZGRj
YmI4OTBlOTFlNzY4MzQ5MzExNWQ5MTkzMTNjOTI5MzFhZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEFiZHVyIFJlaG1hbiA8YWJkdXJfcmVobWFuQG1lbnRvci5jb20+CiBEYXRlOiBX
ZWQsIDI2IEF1ZyAyMDE1IDE5OjE4OjExICswNTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRjZi1hZ2Vu
dDogb2JleSBMREZMQUdTCkBAIC0xNSwxMyArMTUsMTMgQEAgUmViYXNlZCB0byA0YTJjNGJhYWNj
YmM4YzI5Y2UwMjk3NzA1ZGU5YTRlMDk2ZDU3Y2U1IHZlcnNpb24KIAogU2lnbmVkLW9mZi1ieTog
TWFyayBoYXRsZSA8bWFyay5oYXRsZUBhbWQuY29tPgogLS0tCi0gTWFrZWZpbGUuaW5jIHwgMiAr
LQorIGFnZW50L01ha2VmaWxlLmluYyB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIAotZGlmZiAtLWdpdCBhL01ha2VmaWxlLmluYyBiL01ha2Vm
aWxlLmluYworZGlmZiAtLWdpdCBhL2FnZW50L01ha2VmaWxlLmluYyBiL2FnZW50L01ha2VmaWxl
LmluYwogaW5kZXggNjNmMDYyYjIuLjVkYTIzYzAyIDEwMDY0NAotLS0tIGEvTWFrZWZpbGUuaW5j
Ci0rKysgYi9NYWtlZmlsZS5pbmMKKy0tLSBhL2FnZW50L01ha2VmaWxlLmluYworKysrIGIvYWdl
bnQvTWFrZWZpbGUuaW5jCiBAQCAtMTExLDcgKzExMSw3IEBAIE5PX0xJTktfRiAgID89IC1jCiAg
IyBMaW5rZXIgZGVmaW5pdGlvbiBhbmQgZmxhZ3MKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFnZW50XzEuMTEuMC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFnZW50XzEuMTEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1hZ2VudF8x
LjExLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFn
ZW50XzEuMTEuMS5iYgppbmRleCAwMWU0YjdkZjQ5Li41Nzk4NDI2OTcxIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1hZ2VudF8xLjExLjAuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC90Y2YtYWdlbnRfMS4xMS4xLmJiCkBAIC02
LDE0ICs2LDE0IEBAIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9idWdzLmVjbGlwc2Uub3JnL2J1Z3Mv
IgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgT1IgRVBMLTEuMCIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL2VkbC12MTAuaHRtbDttZDU9NTIyYTM5MGE4M2RjMTg2NTEzZjA1MDA1NDNhZDM2
NzkiCiAKLVNSQ1JFViA9ICIzMDUxYTQ4MDZhYzRiMDQxZWM3YzQ5ZmZjNmQwN2YwMDE0Yjg0ODBj
IgorU1JDUkVWID0gIjhlMjNhZjMwODk1ZTA4NWUzZTZhOWQ2OTRmMmM1YjUyMWQ4NDQ3NDIiCiAK
IFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPihcZCsoXC5cZCspKykpIgot
U1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZWNsaXBzZS5vcmcvZWNsaXBzZS90Y2YvdGNmLmFnZW50
LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyO3RhZz0ke1BWfSBcCitTUkNfVVJJID0g
ImdpdDovL2dpdGxhYi5lY2xpcHNlLm9yZy9lY2xpcHNlL3RjZi90Y2YuYWdlbnQuZ2l0O3Byb3Rv
Y29sPWh0dHBzO2JyYW5jaD0xLjExO3RhZz0ke1BWfSBcCiAgICAgICAgICAgIGZpbGU6Ly9sZGZs
YWdzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3RjZi1hZ2VudC5pbml0IFwKICAgICAgICAg
ICAgZmlsZTovL3RjZi1hZ2VudC5zZXJ2aWNlIFwKLSAgICAgICAgICAiCisgICAgICAgICAgICIK
IAogREVQRU5EUyA9ICJ1dGlsLWxpbnV4IG9wZW5zc2wiCiBSREVQRU5EUzoke1BOfSA9ICJiYXNo
IgotLSAKMi40Ny4xCgo=

--===============1342208508213181476==--

