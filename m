Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A62C54732
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:03 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.131445.1723748335738409806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ICsuv6Kq;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=fAZe/suk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019157683e4d-8de4c3f1-6abf-46e9-86df-a0e3848b5721-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zwnOgBb7+LPP4tGNH4+TlowAwfqphDCl0RRDHUctLSo=;
	b=ICsuv6Kqh1eKtmnpzvW3byCW1hb1NGPzxcL0UfdFzD28r2WR7CMANPTvn3nZAC8z
	QN6K7tpZ70IqLUfBo+RNvnEWiBijY1CGIxSLl+et9ART1t/ap/Iq7vchUb2hpm3+HJR
	PSWNIKjDUrrCxVerB3D8i4aqe/zcDb/kwmqAbUlA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zwnOgBb7+LPP4tGNH4+TlowAwfqphDCl0RRDHUctLSo=;
	b=fAZe/sukk0GFhmAOc7WgUumeRCN+U2Ccc9LWjdujbLbpc7Nvh5LpuFwKD3Oex0l6
	/lvNFj3zY6F0yM+itAKu/cLFaEzIhpDdNk5Rove7cVLMIjgM8Vp3hmLsSQqScjBIjQ4
	whliRiuEkz06fi4dS6xg3qnshP3AddASUDpfVClE=
Content-Type: multipart/mixed; boundary="===============7008505304181181649=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtraceevent: upgrading to 1.8.3 FAILED
Message-ID: <0101019157683e4d-8de4c3f1-6abf-46e9-86df-a0e3848b5721-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203433

--===============7008505304181181649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtraceevent* to *1.8.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libtraceevent-upgrade-1.8.2-1.8.3.patch
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
From 1f02e70677a2fc5f7a899d5a735538e833bbd479 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 15:56:05 +0000
Subject: [PATCH] libtraceevent: upgrade 1.8.2 -> 1.8.3

---
 .../{libtraceevent_1.8.2.bb => libtraceevent_1.8.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/libtraceevent/{libtraceevent_1.8.2.bb => libtraceevent_1.8.3.bb} (93%)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.2.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb
similarity index 93%
rename from meta/recipes-kernel/libtraceevent/libtraceevent_1.8.2.bb
rename to meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb
index d4ace54884..c98fdc5fad 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.2.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
 
-SRCREV = "6f6d5802f31992e7527a4c32b43a32fda6bf6bdf"
+SRCREV = "645a883516e343ee970ebb80398cfd7b7dbd227e"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
            file://meson.patch"
 
-- 
2.44.0


--===============7008505304181181649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-c941c43eaf233fbc5cc9385e24167060e8faa9c6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c941c43eaf233fbc5cc9385e24167060e8faa9c6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 101 Local 90 Mirrors 0 Missed 11 Current 254 (89% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 287 of 355 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_recipe_qa_setscene)
NOTE: Running task 982 of 1059 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_write_config)
NOTE: recipe libtraceevent-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtraceevent-1.8.3-r0: task do_write_config: Started
NOTE: recipe libtraceevent-1.8.3-r0: task do_write_config: Succeeded
NOTE: recipe libtraceevent-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1040 of 1059 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_fetch)
NOTE: recipe libtraceevent-1.8.3-r0: task do_fetch: Started
NOTE: recipe libtraceevent-1.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1041 of 1059 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_unpack)
NOTE: Running task 1042 of 1059 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtraceevent-1.8.3-r0: task do_unpack: Started
NOTE: recipe libtraceevent-1.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtraceevent-1.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtraceevent-1.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1043 of 1059 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_patch)
NOTE: Running task 1044 of 1059 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_collect_spdx_deps)
NOTE: recipe libtraceevent-1.8.3-r0: task do_patch: Started
NOTE: recipe libtraceevent-1.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtraceevent-1.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtraceevent-1.8.3-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1044 tasks of which 1038 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815155551.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815155551.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: libtraceevent-1.8.3-r0 do_patch: Applying patch 'meson.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libtraceevent/1.8.3/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libtraceevent/1.8.3/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch meson.patch
patching file meson.build
Hunk #1 FAILED at 25.
1 out of 1 hunk FAILED -- rejects in file meson.build
patching file plugins/meson.build
Hunk #1 FAILED at 19.
1 out of 1 hunk FAILED -- rejects in file plugins/meson.build
Patch meson.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libtraceevent/1.8.3/temp/log.do_patch.3298566
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_patch) failed with exit code '1'

--===============7008505304181181649==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtraceevent-upgrade-1.8.2-1.8.3.patch"

RnJvbSAxZjAyZTcwNjc3YTJmYzVmN2E4OTlkNWE3MzU1MzhlODMzYmJkNDc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTU6NTY6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ0cmFjZWV2ZW50OiB1cGdyYWRlIDEuOC4yIC0+IDEuOC4zCgotLS0KIC4uLi97bGlidHJhY2Vl
dmVudF8xLjguMi5iYiA9PiBsaWJ0cmFjZWV2ZW50XzEuOC4zLmJifSAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVudC97bGlidHJhY2VldmVudF8xLjguMi5iYiA9
PiBsaWJ0cmFjZWV2ZW50XzEuOC4zLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1rZXJuZWwvbGlidHJhY2VldmVudC9saWJ0cmFjZWV2ZW50XzEuOC4yLmJiIGIvbWV0YS9yZWNp
cGVzLWtlcm5lbC9saWJ0cmFjZWV2ZW50L2xpYnRyYWNlZXZlbnRfMS44LjMuYmIKc2ltaWxhcml0
eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtlcm5lbC9saWJ0cmFjZWV2ZW50
L2xpYnRyYWNlZXZlbnRfMS44LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGli
dHJhY2VldmVudC9saWJ0cmFjZWV2ZW50XzEuOC4zLmJiCmluZGV4IGQ0YWNlNTQ4ODQuLmM5OGZk
YzVmYWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVudC9saWJ0
cmFjZWV2ZW50XzEuOC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVu
dC9saWJ0cmFjZWV2ZW50XzEuOC4zLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFUy9HUEwtMi4wO21kNT1lNmE3NTM3MWJhNGQxNjc0OTI1NGE1MTIx
NWQxM2Y5NwogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRVMvTEdQTC0yLjE7bWQ1
PWIzNzA4ODc5ODBkYjVkZDQwNjU5YjUwOTA5MjM4ZGJkIgogU0VDVElPTiA9ICJsaWJzIgogCi1T
UkNSRVYgPSAiNmY2ZDU4MDJmMzE5OTJlNzUyN2E0YzMyYjQzYTMyZmRhNmJmNmJkZiIKK1NSQ1JF
ViA9ICI2NDVhODgzNTE2ZTM0M2VlOTcwZWJiODAzOThjZmQ3YjdkYmQyMjdlIgogU1JDX1VSSSA9
ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpYnMvbGlidHJhY2UvbGlidHJhY2VldmVu
dC5naXQ7YnJhbmNoPSR7QlBOfTtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly9t
ZXNvbi5wYXRjaCIKIAotLSAKMi40NC4wCgo=

--===============7008505304181181649==--

