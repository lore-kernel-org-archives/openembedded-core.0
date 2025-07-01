Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C4DC83F35
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:24 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1442.1751386813695290371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QFIG2Myv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VhaA3RlJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010197c6ca0932-2e6fe12e-1305-4042-bb84-fca8789aa5af-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=arxWBeBuTqwPHdT38/AV9hsoYOMcyCbf1J14yTnpgeE=;
	b=QFIG2MyvqEt4D5dL5kRH1L3e1/UmhQ+OJ1Sx6zW6Y6YxnaNaH4WaVKTmORKuchPq
	xisw7jVEPrnjVGxN6ykpxI3TgMgEbuTbnR4jZbiaTWWMLx2gQulvU9IWFYL9NV0PVXE
	Uglir1+D6eE8EZ3/5d6FtNLx9X0imMLj4eqcXN60=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=arxWBeBuTqwPHdT38/AV9hsoYOMcyCbf1J14yTnpgeE=;
	b=VhaA3RlJH3n/NkYWQYcDhwSgv1J+URE7c8yAXRtpkF2ydlckeWWNuenaQiyCZwCi
	jB5PqThhbfivwjkt7xrbYNcU/XtGmqpxoWaA5R1ugf7zttPxoKq1BMI7tYo0+RdoqvN
	aLZ8ET0xUTpZZo7HR3ly3y0zERHv94QPs0s2pdYs=
Content-Type: multipart/mixed; boundary="===============2161203141604928272=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia-crypto-policy: upgrading to
 9496ef7ee47499895cee097f111c94200e033729 FAILED
Message-ID: <01010197c6ca0932-2e6fe12e-1305-4042-bb84-fca8789aa5af-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219651

--===============2161203141604928272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia-crypto-policy* to *9496ef7ee47499895cee097f111c94200e033729* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-rpm-sequoia-crypto-policy-upgrade-to-latest-revision.patch
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
From 12047ed3d52b6db0c17110a13b3f36581e0ba53e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 10:16:43 +0000
Subject: [PATCH] rpm-sequoia-crypto-policy: upgrade to latest revision

---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 658b9ab36a..04f2fbc495 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
     file://0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch \
 "
 
-SRCREV = "032b418a6db842f0eab330eb5909e4604e888728"
+SRCREV = "9496ef7ee47499895cee097f111c94200e033729"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile () {
-- 
2.47.1


--===============2161203141604928272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1917 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1917 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-8b29d4835271495a6e1be573826888df4ca8a108"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8b29d4835271495a6e1be573826888df4ca8a108"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 70 Local 59 Mirrors 0 Missed 11 Current 168 (84% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 238 of 238 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb:do_recipe_qa_setscene)
NOTE: recipe rpm-sequoia-crypto-policy-git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-sequoia-crypto-policy-git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 721 of 740 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb:do_fetch)
NOTE: recipe rpm-sequoia-crypto-policy-git-r0: task do_fetch: Started
NOTE: recipe rpm-sequoia-crypto-policy-git-r0: task do_fetch: Succeeded
NOTE: Running task 722 of 740 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb:do_unpack)
NOTE: Running task 723 of 740 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-sequoia-crypto-policy-git-r0: task do_unpack: Started
NOTE: recipe rpm-sequoia-crypto-policy-git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-sequoia-crypto-policy-git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-sequoia-crypto-policy-git-r0: task do_unpack: Succeeded
NOTE: Running task 724 of 740 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb:do_patch)
NOTE: Running task 725 of 740 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb:do_collect_spdx_deps)
NOTE: recipe rpm-sequoia-crypto-policy-git-r0: task do_patch: Started
NOTE: recipe rpm-sequoia-crypto-policy-git-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-sequoia-crypto-policy-git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rpm-sequoia-crypto-policy-git-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 725 tasks of which 720 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701101628.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701101628.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/rpm-sequoia-crypto-policy/git/temp/log.do_patch.315020
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: rpm-sequoia-crypto-policy-git-r0 do_patch: Applying patch '0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/rpm-sequoia-crypto-policy/git/sources/rpm-sequoia-crypto-policy-git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/rpm-sequoia-crypto-policy/git/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch
patching file python/policygenerators/libreswan.py
Hunk #1 FAILED at 227.
1 out of 1 hunk FAILED -- rejects in file python/policygenerators/libreswan.py
Patch 0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/rpm-sequoia-crypto-policy/git/temp/log.do_patch.315020
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb:do_patch) failed with exit code '1'

--===============2161203141604928272==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rpm-sequoia-crypto-policy-upgrade-to-latest-revision.patch"

RnJvbSAxMjA0N2VkM2Q1MmI2ZGIwYzE3MTEwYTEzYjNmMzY1ODFlMGJhNTNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxMDoxNjo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJw
bS1zZXF1b2lhLWNyeXB0by1wb2xpY3k6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0K
IC4uLi9ycG0tc2VxdW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYiAgICAgICAg
ICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0tc2VxdW9pYS9ycG0t
c2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0t
c2VxdW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYgppbmRleCA2NThiOWFiMzZh
Li4wNGYyZmJjNDk1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtLXNlcXVv
aWEvcnBtLXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JwbS1zZXF1b2lhL3JwbS1zZXF1b2lhLWNyeXB0by1wb2xpY3lfZ2l0LmJiCkBAIC0x
Myw3ICsxMyw3IEBAIFNSQ19VUkkgPSAiIFwKICAgICBmaWxlOi8vMDAwMS1saWJyZXN3YW4tQWxs
b3ctc2tpcHBpbmctdGVzdF9jb25maWctZm9yLW9sZC1pcHNlYy5wYXRjaCBcCiAiCiAKLVNSQ1JF
ViA9ICIwMzJiNDE4YTZkYjg0MmYwZWFiMzMwZWI1OTA5ZTQ2MDRlODg4NzI4IgorU1JDUkVWID0g
Ijk0OTZlZjdlZTQ3NDk5ODk1Y2VlMDk3ZjExMWM5NDIwMGUwMzM3MjkiCiBVUFNUUkVBTV9DSEVD
S19DT01NSVRTID0gIjEiCiAKIGRvX2NvbXBpbGUgKCkgewotLSAKMi40Ny4xCgo=

--===============2161203141604928272==--

