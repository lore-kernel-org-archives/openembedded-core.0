Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC26C44500
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 05:32:52 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62832.1782970367600494345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 22:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=sEf2zZV3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IDINY814;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f2150bace-f31066c6-64c1-42fb-9758-f227ae95dd7b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782970366;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wUCXEdfucq70jcc0MqXWN9NXwu7r6xdsJg6fkULhNwc=;
	b=sEf2zZV30afEipE6Iv5MTKXxMbF+lryONbgrJbR4HR1jVLIlDAw2YMqdapbTmSM2
	CSS8z1ali2ETSf7TMtm3z10kCwYkznuggGLqcgqt01yZXwL7Phf3pf8DYYIoscyX5g3
	DRwyvjqlhrsMUfuUC4am7ytJjlalVQeMB1JjJvA4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782970366;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wUCXEdfucq70jcc0MqXWN9NXwu7r6xdsJg6fkULhNwc=;
	b=IDINY814Hs88LDzIXYQU62WK0kijfniWtQzyNKnDdwE1wf5xClnxKzBW4IBZ6sOZ
	+xDggfu5bqIuEQvlnuCTtYpLIRhzcN3gM7hAs3EsFsNEcP4+yBYyfQTMNn4IFHLze/O
	z2Eov55ROy3nyPAP3ZHB9pn7GtefQYFkOyQWRcSg=
Content-Type: multipart/mixed; boundary="===============6907005085142715001=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Enet=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libseccomp: upgrading to 2.6.1 FAILED
Message-ID: <0101019f2150bace-f31066c6-64c1-42fb-9758-f227ae95dd7b-000000@us-west-2.amazonses.com>
Date: Thu, 2 Jul 2026 05:32:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 05:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240018

--===============6907005085142715001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libseccomp* to *2.6.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libseccomp-upgrade-2.6.0-2.6.1.patch
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
From f7737bbdea5549f0498f2f461fa4761fc820bb60 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 2 Jul 2026 05:30:59 +0000
Subject: [PATCH] libseccomp: upgrade 2.6.0 -> 2.6.1

---
 .../libseccomp/{libseccomp_2.6.0.bb => libseccomp_2.6.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libseccomp/{libseccomp_2.6.0.bb => libseccomp_2.6.1.bb} (97%)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb b/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb
similarity index 97%
rename from meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
rename to meta/recipes-support/libseccomp/libseccomp_2.6.1.bb
index b356862dfd..9269096bf6 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 
 DEPENDS += "gperf-native"
 
-SRCREV = "c7c0caed1d04292500ed4b9bb386566053eb9775"
+SRCREV = "a81cc2de8ee7a33633defc88bb8a2d986b421613"
 
 SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.6;protocol=https \
            file://0001-api-fix-seccomp_export_bpf_mem-out-of-bounds-read.patch \
-- 
2.47.1


--===============6907005085142715001==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libseccomp-upgrade-2.6.0-2.6.1.patch"

RnJvbSBmNzczN2JiZGVhNTU0OWYwNDk4ZjJmNDYxZmE0NzYxZmM4MjBiYjYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMiBKdWwgMjAyNiAwNTozMDo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNlY2NvbXA6IHVwZ3JhZGUgMi42LjAgLT4gMi42LjEKCi0tLQogLi4uL2xpYnNlY2NvbXAve2xp
YnNlY2NvbXBfMi42LjAuYmIgPT4gbGlic2VjY29tcF8yLjYuMS5iYn0gICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGlic2VjY29tcC97bGlic2VjY29tcF8yLjYuMC5iYiA9PiBsaWJzZWNj
b21wXzIuNi4xLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YnNlY2NvbXAvbGlic2VjY29tcF8yLjYuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnNl
Y2NvbXAvbGlic2VjY29tcF8yLjYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJzZWNjb21wL2xpYnNlY2NvbXBfMi42LjAuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnNlY2NvbXAvbGlic2VjY29tcF8yLjYuMS5i
YgppbmRleCBiMzU2ODYyZGZkLi45MjY5MDk2YmY2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJzZWNjb21wL2xpYnNlY2NvbXBfMi42LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGlic2VjY29tcC9saWJzZWNjb21wXzIuNi4xLmJiCkBAIC03LDcgKzcsNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03YzEzYjMzNzZjZWEwY2U2OGQy
ZDJkYTBhMWIzYTcyYyIKIAogREVQRU5EUyArPSAiZ3BlcmYtbmF0aXZlIgogCi1TUkNSRVYgPSAi
YzdjMGNhZWQxZDA0MjkyNTAwZWQ0YjliYjM4NjU2NjA1M2ViOTc3NSIKK1NSQ1JFViA9ICJhODFj
YzJkZThlZTdhMzM2MzNkZWZjODhiYjhhMmQ5ODZiNDIxNjEzIgogCiBTUkNfVVJJID0gImdpdDov
L2dpdGh1Yi5jb20vc2VjY29tcC9saWJzZWNjb21wLmdpdDticmFuY2g9cmVsZWFzZS0yLjY7cHJv
dG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1hcGktZml4LXNlY2NvbXBfZXhw
b3J0X2JwZl9tZW0tb3V0LW9mLWJvdW5kcy1yZWFkLnBhdGNoIFwKLS0gCjIuNDcuMQoK

--===============6907005085142715001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1979 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-e285c7593aea4e77cc7e8ffdd4956c00b9c0e037"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:e285c7593aea4e77cc7e8ffdd4956c00b9c0e037"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 386 Local 371 Mirrors 0 Missed 15 Current 309 (96% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 480 of 695 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 503 of 695 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 520 of 695 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running task 418 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa)
NOTE: recipe coreutils-9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 641 of 695 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_spdx_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 692 of 695 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 693 of 695 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1236 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_fetch)
NOTE: recipe gperf-native-3.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Started
NOTE: recipe gperf-native-3.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 1255 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_create_recipe_spdx)
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 695 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1260 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_unpack)
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Started
NOTE: Running task 1455 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1716 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_patch)
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1716 tasks of which 1710 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260702053044.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260702053044.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libseccomp/2.6.1/temp/log.do_patch.2080705
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: libseccomp-2.6.1-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/files/0001-api-fix-seccomp_export_bpf_mem-out-of-bounds-read.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libseccomp/2.6.1/sources/libseccomp-2.6.1'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libseccomp/2.6.1/recipe-sysroot-native/etc/quiltrc push', 1, 'stdout: Applying patch 0001-api-fix-seccomp_export_bpf_mem-out-of-bounds-read.patch
patching file src/api.c
Hunk #1 FAILED at 786.
1 out of 1 hunk FAILED -- rejects in file src/api.c
Patch 0001-api-fix-seccomp_export_bpf_mem-out-of-bounds-read.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libseccomp/2.6.1/temp/log.do_patch.2080705
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_patch) failed with exit code '1'

--===============6907005085142715001==--

