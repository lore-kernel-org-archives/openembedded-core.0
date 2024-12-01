Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768EAE6689A
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:05:58 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.149802.1733047557303939340
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:05:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FkoHQxiO;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=IcwTQJ4R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019381af1a10-62866719-a658-4346-b28a-8bbd756de83a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PWwLnup01c+IfQ2Gd0Y7wy8c+RZC3UOE7dRbNnt5Jkc=;
	b=FkoHQxiOd1r65WrbD6/iGP2C87sWGyB/nBMEcFj6jv2BGMztSBzlICTBjRABbJ+m
	VAibDWcFd2hEqtNq7DcIs7MOKjwLzaCF+BcRZxwYAFwSgq8SEhY1pM+HvUEslI+frHS
	EM5PlqaWLgclPeIWfz25/ofcVG/Q8Mb1PXY82ttk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PWwLnup01c+IfQ2Gd0Y7wy8c+RZC3UOE7dRbNnt5Jkc=;
	b=IcwTQJ4RHIToDsyiIlb9WHccuXF/W1rUfEa+8PM4GvSskefQVildHmDGWuV97loF
	7OHrpQNGxPbYgG62m+CxOBPhLSIEUoec92nECRLLSXr+LP40/85F/ZG7yGBcRp2NPpB
	Q/fgJZyNGZ5lzK6yeD34K8+HNybYzKKVFGMfHCXE=
Content-Type: multipart/mixed; boundary="===============3235692308512624587=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] file: upgrading to 5.46 FAILED
Message-ID: <0101019381af1a10-62866719-a658-4346-b28a-8bbd756de83a-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:05:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208067

--===============3235692308512624587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *file* to *5.46* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-file-upgrade-5.45-5.46.patch
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
From ab212f01edde74ab99d21a4ace5f82965551822c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 06:57:38 +0000
Subject: [PATCH] file: upgrade 5.45 -> 5.46

---
 meta/recipes-devtools/file/{file_5.45.bb => file_5.46.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/file/{file_5.45.bb => file_5.46.bb} (97%)

diff --git a/meta/recipes-devtools/file/file_5.45.bb b/meta/recipes-devtools/file/file_5.46.bb
similarity index 97%
rename from meta/recipes-devtools/file/file_5.45.bb
rename to meta/recipes-devtools/file/file_5.46.bb
index fa8dc576dc..2e9dabb96f 100644
--- a/meta/recipes-devtools/file/file_5.45.bb
+++ b/meta/recipes-devtools/file/file_5.46.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https \
            file://print_c.patch \
           "
 
-SRCREV = "4cbd5c8f0851201d203755b76cb66ba991ffd8be"
+SRCREV = "c5aa4f7f8d5063fb3c37ad57bf54bb67ec641a09"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
-- 
2.44.1


--===============3235692308512624587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1877 targets, 41 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f8faced0ecb8ad6319ca8da3179398fdeb38c184"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 122 Local 74 Mirrors 0 Missed 48 Current 218 (60% match, 85% complete)
Removing 1 stale sstate objects for arch x86_64...done.
Removing 10 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 301 of 340 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 335 of 340 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: Running task 476 of 1008 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_install)
NOTE: recipe lzlib-native-1.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-native-1.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 608 of 1008 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa)
NOTE: Running task 821 of 1008 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa)
NOTE: recipe glibc-2.40+git-r0: task do_install: Started
NOTE: recipe file-native-5.46-r0: task do_recipe_qa: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa: Started
NOTE: recipe file-native-5.46-r0: task do_recipe_qa: Succeeded
NOTE: Running task 870 of 1008 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_fetch)
NOTE: recipe file-5.46-r0: task do_recipe_qa: Succeeded
NOTE: Running task 871 of 1008 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_fetch)
NOTE: recipe file-native-5.46-r0: task do_fetch: Started
NOTE: recipe file-5.46-r0: task do_fetch: Started
NOTE: recipe file-native-5.46-r0: task do_fetch: Succeeded
NOTE: Running task 872 of 1008 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_unpack)
NOTE: Running task 873 of 1008 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-native-5.46-r0: task do_unpack: Started
NOTE: recipe file-native-5.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.46-r0: task do_fetch: Succeeded
NOTE: Running task 874 of 1008 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_unpack)
NOTE: recipe file-5.46-r0: task do_unpack: Started
NOTE: recipe file-native-5.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-native-5.46-r0: task do_unpack: Succeeded
NOTE: Running task 875 of 1008 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_patch)
NOTE: Running task 876 of 1008 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_collect_spdx_deps)
NOTE: recipe file-native-5.46-r0: task do_patch: Started
NOTE: recipe file-native-5.46-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-native-5.46-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe file-5.46-r0: task do_unpack: Succeeded
NOTE: Running task 877 of 1008 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_patch)
NOTE: recipe file-5.46-r0: task do_patch: Started
NOTE: recipe file-native-5.46-r0: task do_patch: Failed
NOTE: recipe file-5.46-r0: task do_patch: Failed
NOTE: recipe glibc-2.40+git-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 877 tasks of which 866 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201065648.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201065648.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/file-native/5.46/temp/log.do_patch.617701
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/file/5.46/temp/log.do_patch.618186
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: file-native-5.46-r0 do_patch: Applying patch 'print_c.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/file-native/5.46/git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/file-native/5.46/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch print_c.patch
patching file src/print.c
Hunk #1 FAILED at 289.
1 out of 1 hunk FAILED -- rejects in file src/print.c
Patch print_c.patch can be reverse-applied

stderr: ')
ERROR: file-5.46-r0 do_patch: Applying patch 'print_c.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/file/5.46/git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/file/5.46/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch print_c.patch
patching file src/print.c
Hunk #1 FAILED at 289.
1 out of 1 hunk FAILED -- rejects in file src/print.c
Patch print_c.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/file-native/5.46/temp/log.do_patch.617701
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/file/5.46/temp/log.do_patch.618186
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_patch) failed with exit code '1'

--===============3235692308512624587==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-file-upgrade-5.45-5.46.patch"

RnJvbSBhYjIxMmYwMWVkZGU3NGFiOTlkMjFhNGFjZTVmODI5NjU1NTE4MjJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwNjo1NzozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZp
bGU6IHVwZ3JhZGUgNS40NSAtPiA1LjQ2CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9maWxl
L3tmaWxlXzUuNDUuYmIgPT4gZmlsZV81LjQ2LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9maWxlL3tmaWxlXzUuNDUuYmIgPT4gZmlsZV81LjQ2LmJifSAoOTclKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9maWxlL2ZpbGVfNS40NS5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9maWxlL2ZpbGVfNS40Ni5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmlsZS9maWxlXzUuNDUuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9maWxlL2ZpbGVfNS40Ni5iYgppbmRleCBmYThkYzU3NmRjLi4yZTlk
YWJiOTZmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmlsZS9maWxlXzUuNDUu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZpbGUvZmlsZV81LjQ2LmJiCkBAIC0xNSw3
ICsxNSw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9maWxlL2ZpbGUuZ2l0O2JyYW5j
aD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vcHJpbnRfYy5wYXRj
aCBcCiAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiNGNiZDVjOGYwODUxMjAxZDIwMzc1NWI3NmNi
NjZiYTk5MWZmZDhiZSIKK1NSQ1JFViA9ICJjNWFhNGY3ZjhkNTA2M2ZiM2MzN2FkNTdiZjU0YmI2
N2VjNjQxYTA5IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogaW5oZXJpdCBhdXRvdG9vbHMgdXBk
YXRlLWFsdGVybmF0aXZlcwotLSAKMi40NC4xCgo=

--===============3235692308512624587==--

