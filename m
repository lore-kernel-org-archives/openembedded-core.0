Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DC2C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:34 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.1428.1751386807920747292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=weJLHNxc;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gxahtMQ3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010197c6ca3eea-9bc85bcf-067f-4b81-9f9d-29a2aff28c01-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qDgjtwylgi1O1Puu6fXLuR3hW8im4JXegP326GAghWg=;
	b=weJLHNxcrBQi3Lqs7ES83fXYBC1/inu2ZWZp8etsLozipuWNP9lAVpsmr0HVfoCL
	ugHTZVwsOD5Q77kqT/O1/tx9dBKPWGTzBP3uNRUR/mjVi7KgnDrXQBVKzt8JXqL+zJE
	T4orJqznoLOGx1h5MTp97iyFwEXbXMNGFKNzejQ8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qDgjtwylgi1O1Puu6fXLuR3hW8im4JXegP326GAghWg=;
	b=gxahtMQ3FWYRACFNeo5f0OO+sxeaYjWWkB5tkb4PGFr60TdJ/RlpuC+JeBa5Jh9U
	L05nwR4+iZNRBzTLTkyvbVE+2IlhwMb/8OGmhzfpltCnHWa/MRN1o8A71B5+7V7GLqb
	MNcd8UQxpz1LAb/7lExfXA5/TEqmo+v+GZWM0na4=
Content-Type: multipart/mixed; boundary="===============0522967572094194938=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libgit2: upgrading to 1.9.1 FAILED
Message-ID: <01010197c6ca3eea-9bc85bcf-067f-4b81-9f9d-29a2aff28c01-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219701

--===============0522967572094194938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgit2* to *1.9.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libgit2-upgrade-1.9.0-1.9.1.patch
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
From 3e0cf4feafebf8d74ac2ac237e0a7f09f0b7e097 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 15:53:35 +0000
Subject: [PATCH] libgit2: upgrade 1.9.0 -> 1.9.1

---
 .../libgit2/{libgit2_1.9.0.bb => libgit2_1.9.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.9.0.bb => libgit2_1.9.1.bb} (83%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.9.0.bb b/meta/recipes-support/libgit2/libgit2_1.9.1.bb
similarity index 83%
rename from meta/recipes-support/libgit2/libgit2_1.9.0.bb
rename to meta/recipes-support/libgit2/libgit2_1.9.1.bb
index 66ec62f17a..e2b51769ca 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.1.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8eacfdc17c8f4d219e131a073973b97d"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https \
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https \
            file://0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch \
            "
-SRCREV = "338e6fb681369ff0537719095e22ce9dc602dbf0"
+SRCREV = "0060d9cf5666f015b1067129bd874c6cc4c9c7ac"
 
 inherit cmake
 
-- 
2.47.1


--===============0522967572094194938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1918 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1917 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-fa280d94f209030dbfdfd32e4cf466b16d965942"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fa280d94f209030dbfdfd32e4cf466b16d965942"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 142 Local 130 Mirrors 0 Missed 12 Current 311 (91% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1195 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgit2/libgit2_1.9.1.bb:do_recipe_qa)
NOTE: recipe libgit2-1.9.1-r0: task do_recipe_qa: Started
NOTE: recipe libgit2-1.9.1-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgit2/libgit2_1.9.1.bb:do_recipe_qa unihash changed to b89ab93220c4e4339a8cc99d60973ebaa1156d6799868733e52230a4a8fc06ee
NOTE: Setscene tasks completed
NOTE: Running task 1302 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgit2/libgit2_1.9.1.bb:do_fetch)
NOTE: recipe libgit2-1.9.1-r0: task do_fetch: Started
NOTE: recipe libgit2-1.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 1303 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgit2/libgit2_1.9.1.bb:do_unpack)
NOTE: Running task 1304 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgit2/libgit2_1.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgit2-1.9.1-r0: task do_unpack: Started
NOTE: recipe libgit2-1.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgit2-1.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgit2-1.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1305 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgit2/libgit2_1.9.1.bb:do_patch)
NOTE: Running task 1306 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgit2/libgit2_1.9.1.bb:do_collect_spdx_deps)
NOTE: recipe libgit2-1.9.1-r0: task do_patch: Started
NOTE: recipe libgit2-1.9.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgit2-1.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgit2-1.9.1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1306 tasks of which 1300 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701155321.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701155321.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgit2/libgit2_1.9.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libgit2/1.9.1/temp/log.do_patch.3850298
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: libgit2-1.9.1-r0 do_patch: Applying patch '0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libgit2/1.9.1/sources/libgit2-1.9.1'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libgit2/1.9.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch
patching file src/libgit2/CMakeLists.txt
Hunk #1 FAILED at 119.
1 out of 1 hunk FAILED -- rejects in file src/libgit2/CMakeLists.txt
Patch 0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libgit2/1.9.1/temp/log.do_patch.3850298
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgit2/libgit2_1.9.1.bb:do_patch) failed with exit code '1'

--===============0522967572094194938==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgit2-upgrade-1.9.0-1.9.1.patch"

RnJvbSAzZTBjZjRmZWFmZWJmOGQ3NGFjMmFjMjM3ZTBhN2YwOWYwYjdlMDk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxNTo1MzozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmdpdDI6IHVwZ3JhZGUgMS45LjAgLT4gMS45LjEKCi0tLQogLi4uL2xpYmdpdDIve2xpYmdpdDJf
MS45LjAuYmIgPT4gbGliZ2l0Ml8xLjkuMS5iYn0gICAgICAgICAgICB8IDQgKystLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJnaXQyL3tsaWJnaXQyXzEuOS4wLmJiID0+IGxpYmdpdDJfMS45LjEu
YmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9saWJn
aXQyXzEuOS4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9saWJnaXQyXzEuOS4x
LmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmdpdDIvbGliZ2l0Ml8xLjkuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliZ2l0Mi9saWJnaXQyXzEuOS4xLmJiCmluZGV4IDY2ZWM2MmYxN2EuLmUyYjUxNzY5Y2EgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdpdDIvbGliZ2l0Ml8xLjkuMC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdpdDJfMS45LjEuYmIKQEAgLTUs
MTAgKzUsMTAgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9OGVhY2Zk
YzE3YzhmNGQyMTllMTMxYTA3Mzk3M2I5N2QiCiAKIERFUEVORFMgPSAiY3VybCBvcGVuc3NsIHps
aWIgbGlic3NoMiBsaWJnY3J5cHQgbGlicGNyZTIiCiAKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS9saWJnaXQyL2xpYmdpdDIuZ2l0O2JyYW5jaD1tYWluO3Byb3RvY29sPWh0dHBzIFwKK1NS
Q19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9saWJnaXQyL2xpYmdpdDIuZ2l0O2JyYW5jaD1tYWlu
dC92MS45O3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtc3JjLWxpYmdp
dDItQ01ha2VMaXN0cy50eHQtaW5zdGFsbC1jbWFrZS1maWxlcy1pbnRvLS5wYXRjaCBcCiAgICAg
ICAgICAgICIKLVNSQ1JFViA9ICIzMzhlNmZiNjgxMzY5ZmYwNTM3NzE5MDk1ZTIyY2U5ZGM2MDJk
YmYwIgorU1JDUkVWID0gIjAwNjBkOWNmNTY2NmYwMTViMTA2NzEyOWJkODc0YzZjYzRjOWM3YWMi
CiAKIGluaGVyaXQgY21ha2UKIAotLSAKMi40Ny4xCgo=

--===============0522967572094194938==--

