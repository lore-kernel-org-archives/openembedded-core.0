Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263D3CEDD86
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:17 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12141.1763224747841460356
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bQoFynHH;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Hp9kdhAG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a88629acc-cbcbbb0a-5868-49e6-aa72-b1dc725869e5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224755;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=evGChEy/UI2ilhLGTrA3v1O39Uw+b5ydHSGTmGr18D0=;
	b=bQoFynHHWCwMHwKKPlIQnl4bvgAIYauC7Zq1tHWUxB80WUJIrGAVPkCRQ2GmeKDr
	CcSb8KiMWxcNZOCX/QhErB/jOJX0vmFFg3v8j1SufXdn8e5vH2KT48+c8c70GWlWVgx
	GSg0uUweYro+R3j0pnx1LRXIvIIh9X0/AUjZ7RtA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224755;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=evGChEy/UI2ilhLGTrA3v1O39Uw+b5ydHSGTmGr18D0=;
	b=Hp9kdhAGylTOmOpUVsje5+u2ORCHNoxLx7qQeTH7iQToxSGbVtSWPQBO6mngIvQ2
	mp3LnJQ2ZgnfnS1vFUYlTAOpWBIQnjTEMWeKHdqiBRyB3YtZwOIb/offL/MXYmgeSov
	XpxR2gOMjq8UNBWQMGIK4bMvDBsAgUAVt3U0oyvI=
Content-Type: multipart/mixed; boundary="===============2072982347840205060=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] p11-kit: upgrading to 0.25.10 FAILED
Message-ID: <0101019a88629acc-cbcbbb0a-5868-49e6-aa72-b1dc725869e5-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226457

--===============2072982347840205060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *p11-kit* to *0.25.10* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-p11-kit-upgrade-0.25.5-0.25.10.patch
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
From 9f42df0b6351f482d131654d660b149725f7e9f2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 16:35:28 +0000
Subject: [PATCH] p11-kit: upgrade 0.25.5 -> 0.25.10

---
 .../p11-kit/{p11-kit_0.25.5.bb => p11-kit_0.25.10.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.25.5.bb => p11-kit_0.25.10.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.25.10.bb
index 1c982a2aab..8bfe9c08ad 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb
@@ -12,7 +12,7 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https \
            "
-SRCREV = "0dd113361057e477f40ff4d8788f3e7e400af5f9"
+SRCREV = "90dba4ded391c6232a78ee14db0da76efda7b1c3"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
-- 
2.47.1


--===============2072982347840205060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1946 entries from dependency cache.
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
DISTRO_VERSION       = "5.2.99+snapshot-18601c3b9924a9d2abab8a4756c34fa0bce396dc"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:18601c3b9924a9d2abab8a4756c34fa0bce396dc"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 122 Local 113 Mirrors 0 Missed 9 Current 280 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 347 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_populate_lic_setscene)
NOTE: Running setscene task 351 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 365 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 935 of 1175 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_write_config)
NOTE: recipe p11-kit-0.25.10-r0: task do_populate_lic_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_write_config: Succeeded
NOTE: recipe p11-kit-0.25.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 373 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe p11-kit-0.25.10-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 376 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 988 of 1175 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 380 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_create_spdx_setscene)
NOTE: recipe p11-kit-0.25.10-r0: task do_fetch: Started
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 387 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 392 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_fetch: Succeeded
NOTE: Running task 1026 of 1175 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_unpack)
NOTE: recipe p11-kit-0.25.10-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_unpack: Succeeded
NOTE: Running task 1037 of 1175 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_patch)
NOTE: recipe p11-kit-0.25.10-r0: task do_patch: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_patch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1140 of 1175 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1158 of 1175 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_collect_spdx_deps)
NOTE: recipe p11-kit-0.25.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p11-kit-0.25.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1163 of 1175 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_configure)
NOTE: recipe p11-kit-0.25.10-r0: task do_configure: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_configure: Succeeded
NOTE: Running task 1164 of 1175 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_compile)
NOTE: recipe p11-kit-0.25.10-r0: task do_compile: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_compile: Succeeded
NOTE: Running task 1165 of 1175 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_install)
NOTE: recipe p11-kit-0.25.10-r0: task do_install: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_install: Succeeded
NOTE: Running task 1166 of 1175 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_package)
NOTE: Running task 1167 of 1175 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.25.10-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_package: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_populate_sysroot unihash changed to 7afcc9e64134e8abf8f508facf99e3d774eb0588d82b6306f113fb1dad727078
NOTE: Setscene tasks completed
NOTE: recipe p11-kit-0.25.10-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1167 tasks of which 1156 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115163449.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115163449.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/p11-kit/0.25.10/temp/log.do_package.2249085
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: p11-kit-0.25.10-r0 do_package: QA Issue: p11-kit: Files/directories were installed but not shipped in any package:
  /usr/share/zsh
  /usr/share/zsh/site-functions
  /usr/share/zsh/site-functions/_trust
  /usr/share/zsh/site-functions/_p11-kit
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
p11-kit: 4 installed and not shipped files. [installed-vs-shipped]
ERROR: p11-kit-0.25.10-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/p11-kit/0.25.10/temp/log.do_package.2249085
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_package) failed with exit code '1'

--===============2072982347840205060==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-p11-kit-upgrade-0.25.5-0.25.10.patch"

RnJvbSA5ZjQyZGYwYjYzNTFmNDgyZDEzMTY1NGQ2NjBiMTQ5NzI1ZjdlOWYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTY6MzU6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
MTEta2l0OiB1cGdyYWRlIDAuMjUuNSAtPiAwLjI1LjEwCgotLS0KIC4uLi9wMTEta2l0L3twMTEt
a2l0XzAuMjUuNS5iYiA9PiBwMTEta2l0XzAuMjUuMTAuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L3AxMS1raXQve3AxMS1raXRfMC4yNS41LmJiID0+IHAxMS1raXRfMC4y
NS4xMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9wMTEta2l0
L3AxMS1raXRfMC4yNS41LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9wMTEta2l0
XzAuMjUuMTAuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvcDExLWtpdC9wMTEta2l0XzAuMjUuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvcDExLWtpdC9wMTEta2l0XzAuMjUuMTAuYmIKaW5kZXggMWM5ODJhMmFhYi4uOGJm
ZTljMDhhZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9wMTEta2l0
XzAuMjUuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9wMTEta2l0L3AxMS1raXRfMC4y
NS4xMC5iYgpAQCAtMTIsNyArMTIsNyBAQCBERVBFTkRTOmFwcGVuZCA9ICIke0AnIGdsaWItMi4w
JyBpZiBkLmdldFZhcignR1RLRE9DX0VOQUJMRUQnKSA9PSAnVHJ1ZScgZWxzZSAnJwogCiBTUkNf
VVJJID0gImdpdHNtOi8vZ2l0aHViLmNvbS9wMTEtZ2x1ZS9wMTEta2l0O2JyYW5jaD1tYXN0ZXI7
cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiMGRkMTEzMzYxMDU3ZTQ3
N2Y0MGZmNGQ4Nzg4ZjNlN2U0MDBhZjVmOSIKK1NSQ1JFViA9ICI5MGRiYTRkZWQzOTFjNjIzMmE3
OGVlMTRkYjBkYTc2ZWZkYTdiMWMzIgogCiBQQUNLQUdFQ09ORklHID8/PSAiIgogUEFDS0FHRUNP
TkZJR1ttYW5wYWdlc10gPSAiLURtYW49dHJ1ZSwtRG1hbj1mYWxzZSxsaWJ4c2x0LW5hdGl2ZSIK
LS0gCjIuNDcuMQoK

--===============2072982347840205060==--

