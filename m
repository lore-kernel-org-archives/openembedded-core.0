Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B331CED271
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:04 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11939.1763224721298458727
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3++XLF8d;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=O7yNIXwP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a88626827-6899715a-4c96-4312-aece-636f658b572f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jxnxtZevXg7xl7+g2c8lSFHPCnNmix+2mJR4HNQjCxw=;
	b=3++XLF8do7tvnkTpw+Ynt2WBsfQOsLgdn3zLYv+4DEfmX61nrco8BLzjtdKl/v9H
	8j3786v20+Uuri1Z8hK53j/Nb3IGS4fNtUcaynRG1rFEiETUTD3DFxdKwZzW89FwXks
	MOmE1Dq6aKQlbXpAhwV5co34+Z/mZUI4YcCYRK+M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jxnxtZevXg7xl7+g2c8lSFHPCnNmix+2mJR4HNQjCxw=;
	b=O7yNIXwP6yg4F2zqR5S85srcmS34EqQ0agQ46Z6lIwiW9vZBv3frkenxHyy5V0zS
	CTpmMtUED3sxXtOU6Ws4K6SCuVrqAO+t67z6pLxtlBON57Xz+diArzEEbsWWKlDNY54
	2hnOXu8io6zglJf0F8xThlBglECg7FgJN2pkruE8=
Content-Type: multipart/mixed; boundary="===============2548342302780233528=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] scdoc: upgrading to 1.11.4 FAILED
Message-ID: <0101019a88626827-6899715a-4c96-4312-aece-636f658b572f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226401

--===============2548342302780233528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *scdoc* to *1.11.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-scdoc-upgrade-1.11.3-1.11.4.patch
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
From 144f392dddcea2a123d8ee52d4d44d30b5e2aebb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 12:27:45 +0000
Subject: [PATCH] scdoc: upgrade 1.11.3 -> 1.11.4

---
 .../recipes-extended/scdoc/{scdoc_1.11.3.bb => scdoc_1.11.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/scdoc/{scdoc_1.11.3.bb => scdoc_1.11.4.bb} (91%)

diff --git a/meta/recipes-extended/scdoc/scdoc_1.11.3.bb b/meta/recipes-extended/scdoc/scdoc_1.11.4.bb
similarity index 91%
rename from meta/recipes-extended/scdoc/scdoc_1.11.3.bb
rename to meta/recipes-extended/scdoc/scdoc_1.11.4.bb
index 5f571c64dd..1c66072053 100644
--- a/meta/recipes-extended/scdoc/scdoc_1.11.3.bb
+++ b/meta/recipes-extended/scdoc/scdoc_1.11.4.bb
@@ -8,7 +8,7 @@ DEPENDS = "scdoc-native"
 
 SRC_URI = "git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master \
            file://0001-Makefile-drop-static.patch "
-SRCREV = "0528bcb993cac6c412acd3ae2e09539e994c0a59"
+SRCREV = "70de0e5e5d3bc40134ee65c35f1631656199f4be"
 
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install
-- 
2.47.1


--===============2548342302780233528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1945 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (946 cached, 1 parsed). 1944 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-d22d3b5367243983fc12e1bf46007039e7759fe9"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:d22d3b5367243983fc12e1bf46007039e7759fe9"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 98 Local 82 Mirrors 0 Missed 16 Current 258 (83% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 922 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/scdoc/scdoc_1.11.4.bb:do_recipe_qa)
NOTE: Running task 923 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/scdoc/scdoc_1.11.4.bb:do_recipe_qa)
NOTE: recipe scdoc-1.11.4-r0: task do_recipe_qa: Started
NOTE: recipe scdoc-native-1.11.4-r0: task do_recipe_qa: Started
NOTE: recipe scdoc-1.11.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1031 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/scdoc/scdoc_1.11.4.bb:do_fetch)
NOTE: recipe scdoc-1.11.4-r0: task do_fetch: Started
NOTE: recipe scdoc-native-1.11.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1032 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/scdoc/scdoc_1.11.4.bb:do_fetch)
NOTE: recipe scdoc-native-1.11.4-r0: task do_fetch: Started
NOTE: recipe scdoc-1.11.4-r0: task do_fetch: Succeeded
NOTE: Running task 1033 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/scdoc/scdoc_1.11.4.bb:do_unpack)
NOTE: recipe scdoc-1.11.4-r0: task do_unpack: Started
NOTE: recipe scdoc-native-1.11.4-r0: task do_fetch: Succeeded
NOTE: Running task 1034 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/scdoc/scdoc_1.11.4.bb:do_unpack)
NOTE: Running task 1035 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/scdoc/scdoc_1.11.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe scdoc-native-1.11.4-r0: task do_unpack: Started
NOTE: recipe scdoc-native-1.11.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe scdoc-native-1.11.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe scdoc-1.11.4-r0: task do_unpack: Succeeded
NOTE: Running task 1036 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/scdoc/scdoc_1.11.4.bb:do_patch)
NOTE: recipe scdoc-1.11.4-r0: task do_patch: Started
NOTE: recipe scdoc-native-1.11.4-r0: task do_unpack: Succeeded
NOTE: Running task 1037 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/scdoc/scdoc_1.11.4.bb:do_patch)
NOTE: Running task 1038 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/scdoc/scdoc_1.11.4.bb:do_collect_spdx_deps)
NOTE: recipe scdoc-native-1.11.4-r0: task do_patch: Started
NOTE: recipe scdoc-native-1.11.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe scdoc-native-1.11.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe scdoc-1.11.4-r0: task do_patch: Failed
NOTE: recipe scdoc-native-1.11.4-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1038 tasks of which 1028 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115122731.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115122731.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/scdoc/scdoc_1.11.4.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/scdoc/1.11.4/temp/log.do_patch.3386230
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/scdoc/scdoc_1.11.4.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/scdoc-native/1.11.4/temp/log.do_patch.3386382
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: scdoc-1.11.4-r0 do_patch: Applying patch '0001-Makefile-drop-static.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/scdoc/1.11.4/sources/scdoc-1.11.4'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/scdoc/1.11.4/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Makefile-drop-static.patch
patching file Makefile
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file Makefile
Patch 0001-Makefile-drop-static.patch can be reverse-applied

stderr: ')
ERROR: scdoc-native-1.11.4-r0 do_patch: Applying patch '0001-Makefile-drop-static.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/scdoc-native/1.11.4/sources/scdoc-1.11.4'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/scdoc-native/1.11.4/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Makefile-drop-static.patch
patching file Makefile
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file Makefile
Patch 0001-Makefile-drop-static.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/scdoc/1.11.4/temp/log.do_patch.3386230
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/scdoc/scdoc_1.11.4.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/scdoc-native/1.11.4/temp/log.do_patch.3386382
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/scdoc/scdoc_1.11.4.bb:do_patch) failed with exit code '1'

--===============2548342302780233528==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-scdoc-upgrade-1.11.3-1.11.4.patch"

RnJvbSAxNDRmMzkyZGRkY2VhMmExMjNkOGVlNTJkNGQ0NGQzMGI1ZTJhZWJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTI6Mjc6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
Y2RvYzogdXBncmFkZSAxLjExLjMgLT4gMS4xMS40CgotLS0KIC4uLi9yZWNpcGVzLWV4dGVuZGVk
L3NjZG9jL3tzY2RvY18xLjExLjMuYmIgPT4gc2Nkb2NfMS4xMS40LmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9zY2RvYy97c2Nkb2NfMS4xMS4zLmJiID0+IHNjZG9jXzEuMTEuNC5iYn0g
KDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2Nkb2Mvc2Nkb2NfMS4x
MS4zLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NjZG9jL3NjZG9jXzEuMTEuNC5iYgpzaW1p
bGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2Nkb2Mv
c2Nkb2NfMS4xMS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2Nkb2Mvc2Nk
b2NfMS4xMS40LmJiCmluZGV4IDVmNTcxYzY0ZGQuLjFjNjYwNzIwNTMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zY2RvYy9zY2RvY18xLjExLjMuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3NjZG9jL3NjZG9jXzEuMTEuNC5iYgpAQCAtOCw3ICs4LDcgQEAgREVQRU5E
UyA9ICJzY2RvYy1uYXRpdmUiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnNyLmh0L35zaXJjbXB3
bi9zY2RvYztwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIFwKICAgICAgICAgICAgZmlsZTov
LzAwMDEtTWFrZWZpbGUtZHJvcC1zdGF0aWMucGF0Y2ggIgotU1JDUkVWID0gIjA1MjhiY2I5OTNj
YWM2YzQxMmFjZDNhZTJlMDk1MzllOTk0YzBhNTkiCitTUkNSRVYgPSAiNzBkZTBlNWU1ZDNiYzQw
MTM0ZWU2NWMzNWYxNjMxNjU2MTk5ZjRiZSIKIAogZG9faW5zdGFsbCgpIHsKIAlvZV9ydW5tYWtl
ICdERVNURElSPSR7RH0nIGluc3RhbGwKLS0gCjIuNDcuMQoK

--===============2548342302780233528==--

