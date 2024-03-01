Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD6FC54ED8
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:20 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.36633.1709330716991457095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hrEKUGOL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=d0ZaS0kp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018dfc0cd60a-15960c17-37a2-45c6-99b9-6459945e5641-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330716;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=OyUnJe8DRLDYPl7njDYRRAuOvp75FY1+mFXKjoIWmr4=;
	b=hrEKUGOLo5DmkXVrXRuVIks1r4wW1j1nIX49VYHdt+sHSoXioR5FXMjaq/sDAt3x
	JLDzOxEtuqOpmpW1ObakRfoxvKxnPfCKCQL1SqZsduWPokDCKPHyU3KvwjiGyYo7Owr
	79ORJcsJVoew7W8xrOXqV9V+w1N/fiP0ZbImm03o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330716;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=OyUnJe8DRLDYPl7njDYRRAuOvp75FY1+mFXKjoIWmr4=;
	b=d0ZaS0kpSYs7FzTDjuXaF5cTH1IVmzagWmNmIEq0Iq6opuC8z/K6yXg6iVE1PIZB
	d+HFDSdkJeGZKajaDOWBU71zHAsIDDaN3CtcuaOpBU1fQROFYeuvjeE+XnUnRyRO7Bg
	n+I7jOI+hd+4TS5+phuXJKuHKAm4DD+PnKvS3+oY=
Content-Type: multipart/mixed; boundary="===============6372304455363326453=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.42 FAILED
Message-ID: <0101018dfc0cd60a-15960c17-37a2-45c6-99b9-6459945e5641-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196493

--===============6372304455363326453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.42* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.41-2.42.patch
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
From 62c0263adc7e8c428299c64345f86feb32960a84 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 12:55:21 +0000
Subject: [PATCH] repo: upgrade 2.41 -> 2.42

---
 meta/recipes-devtools/repo/{repo_2.41.bb => repo_2.42.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.41.bb => repo_2.42.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.41.bb b/meta/recipes-devtools/repo/repo_2.42.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.41.bb
rename to meta/recipes-devtools/repo/repo_2.42.bb
index 4d614d9c5f..f18514ac50 100644
--- a/meta/recipes-devtools/repo/repo_2.41.bb
+++ b/meta/recipes-devtools/repo/repo_2.42.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "4217a82bec7b95c1a0bc7b081a1764a6a6d6c59b"
+SRCREV = "5554572f02537b8646139d59ab520e59e1d5f7b3"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.42.0


--===============6372304455363326453==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.41-2.42.patch"

RnJvbSA2MmMwMjYzYWRjN2U4YzQyODI5OWM2NDM0NWY4NmZlYjMyOTYwYTg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxMjo1NToyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi40MSAtPiAyLjQyCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3tyZXBvXzIuNDEuYmIgPT4gcmVwb18yLjQyLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9yZXBvL3tyZXBvXzIuNDEuYmIgPT4gcmVwb18yLjQyLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi40MS5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9yZXBvL3JlcG9fMi40Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi40Mi5iYgppbmRleCA0ZDYxNGQ5YzVmLi5mMTg1
MTRhYzUwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjQyLmJiCkBAIC0xMiw3
ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2
Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogU1JDX1VSSSA9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xl
c291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAogICAg
ICAgICAgICBmaWxlOi8vMDAwMS1weXRob24zLXNoZWJhbmcucGF0Y2ggXAogICAgICAgICAgICAi
Ci1TUkNSRVYgPSAiNDIxN2E4MmJlYzdiOTVjMWEwYmM3YjA4MWExNzY0YTZhNmQ2YzU5YiIKK1NS
Q1JFViA9ICI1NTU0NTcyZjAyNTM3Yjg2NDYxMzlkNTlhYjUyMGU1OWUxZDVmN2IzIgogCiBNSVJS
T1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVwby5naXQgZ2l0Oi8v
Z2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1yZXBvLmdpdCIKIAotLSAKMi40Mi4wCgo=

--===============6372304455363326453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1865 entries from dependency cache.
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
DISTRO_VERSION       = "4.3+snapshot-5805651488b3966a32286c79d17845193a7486cf"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5805651488b3966a32286c79d17845193a7486cf"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 286 Local 274 Mirrors 0 Missed 12 Current 343 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 420 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe repo-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe repo-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1308 of 1776 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.42.bb:do_fetch)
NOTE: recipe repo-2.42-r0: task do_fetch: Started
NOTE: recipe repo-2.42-r0: task do_fetch: Succeeded
NOTE: Running task 1758 of 1776 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.42.bb:do_unpack)
NOTE: Running task 1759 of 1776 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.42.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.42-r0: task do_unpack: Started
NOTE: recipe repo-2.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.42-r0: task do_unpack: Succeeded
NOTE: Running task 1760 of 1776 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.42.bb:do_patch)
NOTE: Running task 1761 of 1776 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.42.bb:do_collect_spdx_deps)
NOTE: recipe repo-2.42-r0: task do_patch: Started
NOTE: recipe repo-2.42-r0: task do_collect_spdx_deps: Started
NOTE: recipe repo-2.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe repo-2.42-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1761 tasks of which 1756 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301125501.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301125501.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.42.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: repo-2.42-r0 do_patch: Applying patch '0001-python3-shebang.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/repo/2.42/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/repo/2.42/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-python3-shebang.patch
patching file repo
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file repo
Patch 0001-python3-shebang.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/repo/2.42/temp/log.do_patch.3819845
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.42.bb:do_patch) failed with exit code '1'

--===============6372304455363326453==--

