Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75FBCD4F33
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:50 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2356.1762384577484165766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=b4xOxnXw;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=G83AM0jQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a564ef901-421cdb5b-c920-40e1-9352-3180bc10975b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384607;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/O4WCBe4on4XpGtzVE8tMBG/F3fGy0/wnd0PH13/kdA=;
	b=b4xOxnXwz5pgeALmx3Moxz8l7zgrOd3KA81eJMKg82jH0MnxDSbphCxg9EZsP8mE
	iZbSB30gDom0EobduJp2nqlga/as8ppguvVpqoY+xSDRyUsS8vpEXIAZ1z7hF6bbki4
	rzCNArP3/ESRECjiLqLIbMcU2s8Ud5vG7N1YItPk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384607;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/O4WCBe4on4XpGtzVE8tMBG/F3fGy0/wnd0PH13/kdA=;
	b=G83AM0jQY5VRlCfN3QBdsHyxP1Ouuemwwmhe8Hw2KE4UCg3timI5pjdEg5Y/AVQa
	zFqH0PE9S4FBbhMRsoIyBS0GyVgtjb32gwUmK8Hh95lChG6pZIh5qCAWfDpPe5TO4uC
	ACTpxobTV299zMS5vgHAsE/ZA2QSqbwb2GQR+mSA=
Content-Type: multipart/mixed; boundary="===============6873726266470074875=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] p11-kit: upgrading to 0.25.10 FAILED
Message-ID: <0101019a564ef901-421cdb5b-c920-40e1-9352-3180bc10975b-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225926

--===============6873726266470074875==
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
From e9debf8471317b4e39af619ac0825979d1595b10 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 23:13:02 +0000
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


--===============6873726266470074875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1947 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (947 cached, 1 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-af901f68ccbcaabbc9e498e232926733714f24d4"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:af901f68ccbcaabbc9e498e232926733714f24d4"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 122 Local 113 Mirrors 0 Missed 9 Current 280 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 342 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_populate_lic_setscene)
NOTE: Running setscene task 343 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 366 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 935 of 1175 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_write_config)
NOTE: recipe p11-kit-0.25.10-r0: task do_populate_lic_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_write_config: Succeeded
NOTE: recipe p11-kit-0.25.10-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe p11-kit-0.25.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 369 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 375 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe p11-kit-0.25.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 988 of 1175 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 380 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_create_spdx_setscene)
NOTE: recipe p11-kit-0.25.10-r0: task do_fetch: Started
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 385 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 394 of 402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
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
NOTE: recipe p11-kit-0.25.10-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1167 tasks of which 1156 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105231223.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105231223.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/p11-kit/0.25.10/temp/log.do_package.2042632
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: p11-kit-0.25.10-r0 do_package: QA Issue: p11-kit: Files/directories were installed but not shipped in any package:
  /usr/share/zsh
  /usr/share/zsh/site-functions
  /usr/share/zsh/site-functions/_trust
  /usr/share/zsh/site-functions/_p11-kit
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
p11-kit: 4 installed and not shipped files. [installed-vs-shipped]
ERROR: p11-kit-0.25.10-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/p11-kit/0.25.10/temp/log.do_package.2042632
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_package) failed with exit code '1'

--===============6873726266470074875==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-p11-kit-upgrade-0.25.5-0.25.10.patch"

RnJvbSBlOWRlYmY4NDcxMzE3YjRlMzlhZjYxOWFjMDgyNTk3OWQxNTk1YjEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMzoxMzowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHAx
MS1raXQ6IHVwZ3JhZGUgMC4yNS41IC0+IDAuMjUuMTAKCi0tLQogLi4uL3AxMS1raXQve3AxMS1r
aXRfMC4yNS41LmJiID0+IHAxMS1raXRfMC4yNS4xMC5iYn0gICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvcDExLWtpdC97cDExLWtpdF8wLjI1LjUuYmIgPT4gcDExLWtpdF8wLjI1
LjEwLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQv
cDExLWtpdF8wLjI1LjUuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9wMTEta2l0L3AxMS1raXRf
MC4yNS4xMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9wMTEta2l0L3AxMS1raXRfMC4yNS41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9wMTEta2l0L3AxMS1raXRfMC4yNS4xMC5iYgppbmRleCAxYzk4MmEyYWFiLi44YmZl
OWMwOGFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9wMTEta2l0L3AxMS1raXRf
MC4yNS41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvcDExLWtpdF8wLjI1
LjEwLmJiCkBAIC0xMiw3ICsxMiw3IEBAIERFUEVORFM6YXBwZW5kID0gIiR7QCcgZ2xpYi0yLjAn
IGlmIGQuZ2V0VmFyKCdHVEtET0NfRU5BQkxFRCcpID09ICdUcnVlJyBlbHNlICcnCiAKIFNSQ19V
UkkgPSAiZ2l0c206Ly9naXRodWIuY29tL3AxMS1nbHVlL3AxMS1raXQ7YnJhbmNoPW1hc3Rlcjtw
cm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICIwZGQxMTMzNjEwNTdlNDc3
ZjQwZmY0ZDg3ODhmM2U3ZTQwMGFmNWY5IgorU1JDUkVWID0gIjkwZGJhNGRlZDM5MWM2MjMyYTc4
ZWUxNGRiMGRhNzZlZmRhN2IxYzMiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIiCiBQQUNLQUdFQ09O
RklHW21hbnBhZ2VzXSA9ICItRG1hbj10cnVlLC1EbWFuPWZhbHNlLGxpYnhzbHQtbmF0aXZlIgot
LSAKMi40Ny4xCgo=

--===============6873726266470074875==--

