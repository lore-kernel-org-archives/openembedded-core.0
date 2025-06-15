Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BF3C83F1B
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:06 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.8856.1749993275954159520
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tOAZfAs+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Ln5UJGbW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019773baaf66-605dfd49-f223-4e9c-9442-af0273581815-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993304;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2aNKk4JQ1Ta/XQ0Kw6J7nKfTihIrBxkP2wG+Q7/yifU=;
	b=tOAZfAs+izj7CxsALZgDnqHJcJvUlufKGNpyIQp+iCGRQmK7S+Zm2hw3zcuAkEUc
	I8lW0nDapcp1usHCPNbhPLPlNis9iD08vAjSWqFHEUE337C3O7rZ7BTJCtowLbk1aVm
	vJ0Cr3IfcywYfQSA0cPfUYX/YOQMGYXMMd42LYSw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993304;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2aNKk4JQ1Ta/XQ0Kw6J7nKfTihIrBxkP2wG+Q7/yifU=;
	b=Ln5UJGbWvLUdPDd57rTBDylyhAzmCN707/8NEUXP8/F/U6liaYsmM/PoxSJuUKO0
	Ht2jboZk7abRqwDB44aDVyWuQroZas8vBd0J3M9sNb0s4LtzvnCq2M5RtpGVnI6xxxZ
	J3k1EUlLNmFi/1I4zIwOFdQ9awyamj4S8o1fBnbk=
Content-Type: multipart/mixed; boundary="===============5413856583456913072=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libgit2: upgrading to 1.9.1 FAILED
Message-ID: <0101019773baaf66-605dfd49-f223-4e9c-9442-af0273581815-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:15:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218740

--===============5413856583456913072==
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
From 0e64c6cb5aea2c5d9b47f223867cb03c59737319 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 13:10:29 +0000
Subject: [PATCH] libgit2: upgrade 1.9.0 -> 1.9.1

---
 .../libgit2/{libgit2_1.9.0.bb => libgit2_1.9.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.9.0.bb => libgit2_1.9.1.bb} (84%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.9.0.bb b/meta/recipes-support/libgit2/libgit2_1.9.1.bb
similarity index 84%
rename from meta/recipes-support/libgit2/libgit2_1.9.0.bb
rename to meta/recipes-support/libgit2/libgit2_1.9.1.bb
index 47a63ca286..b9a2ece1b3 100644
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
 
 S = "${WORKDIR}/git"
 
-- 
2.47.1


--===============5413856583456913072==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgit2-upgrade-1.9.0-1.9.1.patch"

RnJvbSAwZTY0YzZjYjVhZWEyYzVkOWI0N2YyMjM4NjdjYjAzYzU5NzM3MzE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMTM6MTA6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJnaXQyOiB1cGdyYWRlIDEuOS4wIC0+IDEuOS4xCgotLS0KIC4uLi9saWJnaXQyL3tsaWJnaXQy
XzEuOS4wLmJiID0+IGxpYmdpdDJfMS45LjEuYmJ9ICAgICAgICAgICAgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi97bGliZ2l0Ml8xLjkuMC5iYiA9PiBsaWJnaXQyXzEuOS4x
LmJifSAoODQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdpdDIvbGli
Z2l0Ml8xLjkuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdpdDIvbGliZ2l0Ml8xLjku
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJnaXQyL2xpYmdpdDJfMS45LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmdpdDIvbGliZ2l0Ml8xLjkuMS5iYgppbmRleCA0N2E2M2NhMjg2Li5iOWEyZWNlMWIzIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdpdDJfMS45LjAuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9saWJnaXQyXzEuOS4xLmJiCkBAIC01
LDEwICs1LDEwIEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PThlYWNm
ZGMxN2M4ZjRkMjE5ZTEzMWEwNzM5NzNiOTdkIgogCiBERVBFTkRTID0gImN1cmwgb3BlbnNzbCB6
bGliIGxpYnNzaDIgbGliZ2NyeXB0IGxpYnBjcmUyIgogCi1TUkNfVVJJID0gImdpdDovL2dpdGh1
Yi5jb20vbGliZ2l0Mi9saWJnaXQyLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyBcCitT
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGliZ2l0Mi9saWJnaXQyLmdpdDticmFuY2g9bWFp
bnQvdjEuOTtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXNyYy1saWJn
aXQyLUNNYWtlTGlzdHMudHh0LWluc3RhbGwtY21ha2UtZmlsZXMtaW50by0ucGF0Y2ggXAogICAg
ICAgICAgICAiCi1TUkNSRVYgPSAiMzM4ZTZmYjY4MTM2OWZmMDUzNzcxOTA5NWUyMmNlOWRjNjAy
ZGJmMCIKK1NSQ1JFViA9ICIwMDYwZDljZjU2NjZmMDE1YjEwNjcxMjliZDg3NGM2Y2M0YzljN2Fj
IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjQ3LjEKCg==

--===============5413856583456913072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1911 entries from dependency cache.
Parsing recipes...done.
Parsing of 935 .bb files complete (934 cached, 1 parsed). 1910 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:4382b061082f6a3c2688bcd802afcb2f68c8e35d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 157 Local 145 Mirrors 0 Missed 12 Current 296 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1195 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgit2/libgit2_1.9.1.bb:do_recipe_qa)
NOTE: recipe libgit2-1.9.1-r0: task do_recipe_qa: Started
NOTE: recipe libgit2-1.9.1-r0: task do_recipe_qa: Succeeded
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
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615131015.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615131015.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgit2/libgit2_1.9.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libgit2/1.9.1/temp/log.do_patch.2893761
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: libgit2-1.9.1-r0 do_patch: Applying patch '0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libgit2/1.9.1/git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libgit2/1.9.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch
patching file src/libgit2/CMakeLists.txt
Hunk #1 FAILED at 119.
1 out of 1 hunk FAILED -- rejects in file src/libgit2/CMakeLists.txt
Patch 0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libgit2/1.9.1/temp/log.do_patch.2893761
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgit2/libgit2_1.9.1.bb:do_patch) failed with exit code '1'

--===============5413856583456913072==--

