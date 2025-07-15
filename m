Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C375C83F3A
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:51 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.12167.1752594935548506255
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rJTa1i0g;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rJhYoBFN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101980ecc9009-800377d8-a227-4336-bb36-9a91156f9f36-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594944;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wxAT7asJLu1vi3N8A+00+4yFERhIPqOjuFuirpqh5As=;
	b=rJTa1i0gvouJmCzvRlByhDd4REO87sqCroWoPdPuX0vDq7dWimRNvtoYhTPANJkp
	3CXLTGcy34KBP48yA/3T/QZsPD89+A31XUfkcdaxyauIwQY6dbuyyz7N7PODqMNUY0h
	uwarVa2o5EiXUJA9ZKys5fa6Sk5MVV7garAwiOzI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594944;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wxAT7asJLu1vi3N8A+00+4yFERhIPqOjuFuirpqh5As=;
	b=rJhYoBFNOzoguJCaU8nAZgyd3ZNnQlc9FAmUX2wueJAe56PqAhh+LJ4lDT3nmXyv
	K563HIo2pYJE9jd68yhtH3Pp/Yy60Fvhez5oxvWYeMbcXdTWPjNa0G5F4T6dEQ/8rKb
	KHd3TUSn1hp+Ns2WsFG3HAUM8FxI7Hj5EL3OMSGE=
Content-Type: multipart/mixed; boundary="===============8064096445338481390=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia-crypto-policy: upgrading to
 cd6043a774abf6e4d17116f1497a2032f5351d49 FAILED
Message-ID: <010101980ecc9009-800377d8-a227-4336-bb36-9a91156f9f36-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220353

--===============8064096445338481390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia-crypto-policy* to *cd6043a774abf6e4d17116f1497a2032f5351d49* has Failed(do_compile).

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
From 05a0a0d6d30bb630eb4b10608928d55992e8b090 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 10:23:21 +0000
Subject: [PATCH] rpm-sequoia-crypto-policy: upgrade to latest revision

---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 658b9ab36a..b30c49e039 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
     file://0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch \
 "
 
-SRCREV = "032b418a6db842f0eab330eb5909e4604e888728"
+SRCREV = "cd6043a774abf6e4d17116f1497a2032f5351d49"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile () {
-- 
2.47.1


--===============8064096445338481390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1928 entries from dependency cache.
Parsing recipes...done.
Parsing of 941 .bb files complete (940 cached, 1 parsed). 1928 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-c12143e92696d8b64d184d098220e154abf675c3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c12143e92696d8b64d184d098220e154abf675c3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 61 Local 50 Mirrors 0 Missed 11 Current 177 (81% match, 95% complete)
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
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250715102309.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250715102309.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/rpm-sequoia-crypto-policy/git/temp/log.do_patch.697077
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: rpm-sequoia-crypto-policy-git-r0 do_patch: Applying patch '0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/rpm-sequoia-crypto-policy/git/sources/rpm-sequoia-crypto-policy-git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/rpm-sequoia-crypto-policy/git/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch
patching file python/policygenerators/libreswan.py
Hunk #1 FAILED at 227.
1 out of 1 hunk FAILED -- rejects in file python/policygenerators/libreswan.py
Patch 0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/rpm-sequoia-crypto-policy/git/temp/log.do_patch.697077
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb:do_patch) failed with exit code '1'

--===============8064096445338481390==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rpm-sequoia-crypto-policy-upgrade-to-latest-revision.patch"

RnJvbSAwNWEwYTBkNmQzMGJiNjMwZWI0YjEwNjA4OTI4ZDU1OTkyZThiMDkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTA6MjM6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
cG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5OiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0t
CiAuLi4vcnBtLXNlcXVvaWEvcnBtLXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIgICAgICAg
ICAgICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtLXNlcXVvaWEvcnBt
LXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBt
LXNlcXVvaWEvcnBtLXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIKaW5kZXggNjU4YjlhYjM2
YS4uYjMwYzQ5ZTAzOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS1zZXF1
b2lhL3JwbS1zZXF1b2lhLWNyeXB0by1wb2xpY3lfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ycG0tc2VxdW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYgpAQCAt
MTMsNyArMTMsNyBAQCBTUkNfVVJJID0gIiBcCiAgICAgZmlsZTovLzAwMDEtbGlicmVzd2FuLUFs
bG93LXNraXBwaW5nLXRlc3RfY29uZmlnLWZvci1vbGQtaXBzZWMucGF0Y2ggXAogIgogCi1TUkNS
RVYgPSAiMDMyYjQxOGE2ZGI4NDJmMGVhYjMzMGViNTkwOWU0NjA0ZTg4ODcyOCIKK1NSQ1JFViA9
ICJjZDYwNDNhNzc0YWJmNmU0ZDE3MTE2ZjE0OTdhMjAzMmY1MzUxZDQ5IgogVVBTVFJFQU1fQ0hF
Q0tfQ09NTUlUUyA9ICIxIgogCiBkb19jb21waWxlICgpIHsKLS0gCjIuNDcuMQoK

--===============8064096445338481390==--

