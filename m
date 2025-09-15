Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B84CCD183
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:55:00 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.30932.1757937284671270594
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iYhpQNTA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kJ+T3y17;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101994d3a685a-151d8d21-cb11-4698-a7d1-b228afa1c2e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Bh8xc0za0kNqRWG0lcNcLZxhcv3Ugxk0mwDb3m814a0=;
	b=iYhpQNTADbyw6UKMy8gA1UYLZuB/zw/Hvyc4uAnht5P9Lbnni0SSepWPmOh+USNo
	b22lKXPoaP5wwWu25R2kragapJQFyfq9XTTTIr6H071mi6zZilNs/C6ALvpHA6y1T2B
	WCkQYYKUZXyDzbv4z/+To686t4B4y7VMv02jYqII=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Bh8xc0za0kNqRWG0lcNcLZxhcv3Ugxk0mwDb3m814a0=;
	b=kJ+T3y17pfWo5Eckh1uElO2Jfw16Zr0bUN4mFF/6JFoq+lG8+kRkpvZhcCgmtQts
	WNAMNvIAZOwwzH9/r4Eww6e3XsR4MPwqWl+7jnOJdx6808P30zkEqV1oENnbiE6A78E
	QnurSr6RLb/jxGDYBxN3TOALYZszb97rF+54Obcw=
Content-Type: multipart/mixed; boundary="===============6794525533910666032=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] p11-kit: upgrading to 0.25.8 FAILED
Message-ID: <010101994d3a685a-151d8d21-cb11-4698-a7d1-b228afa1c2e1-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223481

--===============6794525533910666032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *p11-kit* to *0.25.8* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-p11-kit-upgrade-0.25.5-0.25.8.patch
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
From 12e2f271a3da586cb634ee6748c615003bd517f2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 11:46:23 +0000
Subject: [PATCH] p11-kit: upgrade 0.25.5 -> 0.25.8

---
 .../p11-kit/{p11-kit_0.25.5.bb => p11-kit_0.25.8.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.25.5.bb => p11-kit_0.25.8.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.25.8.bb
index 1c982a2aab..3b0b196a15 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb
@@ -12,7 +12,7 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https \
            "
-SRCREV = "0dd113361057e477f40ff4d8788f3e7e400af5f9"
+SRCREV = "2ee61264fa004e65176adf601c0bacc355d8b63b"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
-- 
2.47.1


--===============6794525533910666032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1939 targets, 43 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-2bb3ff91c9c346bdadb751122a2f98bba09b3ce1"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:2bb3ff91c9c346bdadb751122a2f98bba09b3ce1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 125 Local 113 Mirrors 0 Missed 12 Current 277 (90% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 352 of 402 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 354 of 402 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: Running task 858 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb:do_recipe_qa)
NOTE: Running task 891 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb:do_write_config)
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.8-r0: task do_recipe_qa: Started
NOTE: recipe p11-kit-0.25.8-r0: task do_write_config: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe p11-kit-0.25.8-r0: task do_write_config: Succeeded
NOTE: Running setscene task 370 of 402 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 375 of 402 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_create_spdx_setscene)
NOTE: recipe p11-kit-0.25.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 945 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb:do_fetch)
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.8-r0: task do_fetch: Started
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 385 of 402 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 388 of 402 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.25.8-r0: task do_fetch: Succeeded
NOTE: Running task 1026 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb:do_unpack)
NOTE: recipe p11-kit-0.25.8-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 402 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.25.8-r0: task do_unpack: Succeeded
NOTE: Running task 1037 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb:do_patch)
NOTE: recipe p11-kit-0.25.8-r0: task do_patch: Started
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1138 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1156 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb:do_collect_spdx_deps)
NOTE: recipe p11-kit-0.25.8-r0: task do_patch: Succeeded
NOTE: Running task 1161 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1162 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb:do_populate_lic)
NOTE: recipe p11-kit-0.25.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.25.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe p11-kit-0.25.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.25.8-r0: task do_populate_lic: Started
NOTE: recipe p11-kit-0.25.8-r0: task do_populate_lic: Succeeded
NOTE: recipe p11-kit-0.25.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe p11-kit-0.25.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p11-kit-0.25.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1163 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb:do_configure)
NOTE: recipe p11-kit-0.25.8-r0: task do_configure: Started
NOTE: recipe p11-kit-0.25.8-r0: task do_configure: Succeeded
NOTE: Running task 1164 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb:do_compile)
NOTE: recipe p11-kit-0.25.8-r0: task do_compile: Started
NOTE: recipe p11-kit-0.25.8-r0: task do_compile: Succeeded
NOTE: Running task 1165 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb:do_install)
NOTE: recipe p11-kit-0.25.8-r0: task do_install: Started
NOTE: recipe p11-kit-0.25.8-r0: task do_install: Succeeded
NOTE: Running task 1166 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb:do_package)
NOTE: Running task 1167 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.25.8-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.25.8-r0: task do_package: Started
NOTE: recipe p11-kit-0.25.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe p11-kit-0.25.8-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1167 tasks of which 1153 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915114546.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915114546.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/p11-kit/0.25.8/temp/log.do_package.2839238
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: p11-kit-0.25.8-r0 do_package: QA Issue: p11-kit: Files/directories were installed but not shipped in any package:
  /usr/share/zsh
  /usr/share/zsh/site-functions
  /usr/share/zsh/site-functions/_trust
  /usr/share/zsh/site-functions/_p11-kit
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
p11-kit: 4 installed and not shipped files. [installed-vs-shipped]
ERROR: p11-kit-0.25.8-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/p11-kit/0.25.8/temp/log.do_package.2839238
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.8.bb:do_package) failed with exit code '1'

--===============6794525533910666032==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-p11-kit-upgrade-0.25.5-0.25.8.patch"

RnJvbSAxMmUyZjI3MWEzZGE1ODZjYjYzNGVlNjc0OGM2MTUwMDNiZDUxN2YyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMTE6NDY6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
MTEta2l0OiB1cGdyYWRlIDAuMjUuNSAtPiAwLjI1LjgKCi0tLQogLi4uL3AxMS1raXQve3AxMS1r
aXRfMC4yNS41LmJiID0+IHAxMS1raXRfMC4yNS44LmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvcDExLWtpdC97cDExLWtpdF8wLjI1LjUuYmIgPT4gcDExLWtpdF8wLjI1
LjguYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9w
MTEta2l0XzAuMjUuNS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvcDExLWtpdF8w
LjI1LjguYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvcDExLWtpdC9wMTEta2l0XzAuMjUuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvcDExLWtpdC9wMTEta2l0XzAuMjUuOC5iYgppbmRleCAxYzk4MmEyYWFiLi4zYjBiMTk2
YTE1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9wMTEta2l0L3AxMS1raXRfMC4y
NS41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvcDExLWtpdF8wLjI1Ljgu
YmIKQEAgLTEyLDcgKzEyLDcgQEAgREVQRU5EUzphcHBlbmQgPSAiJHtAJyBnbGliLTIuMCcgaWYg
ZC5nZXRWYXIoJ0dUS0RPQ19FTkFCTEVEJykgPT0gJ1RydWUnIGVsc2UgJycKIAogU1JDX1VSSSA9
ICJnaXRzbTovL2dpdGh1Yi5jb20vcDExLWdsdWUvcDExLWtpdDticmFuY2g9bWFzdGVyO3Byb3Rv
Y29sPWh0dHBzIFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjBkZDExMzM2MTA1N2U0NzdmNDBm
ZjRkODc4OGYzZTdlNDAwYWY1ZjkiCitTUkNSRVYgPSAiMmVlNjEyNjRmYTAwNGU2NTE3NmFkZjYw
MWMwYmFjYzM1NWQ4YjYzYiIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiIKIFBBQ0tBR0VDT05GSUdb
bWFucGFnZXNdID0gIi1EbWFuPXRydWUsLURtYW49ZmFsc2UsbGlieHNsdC1uYXRpdmUiCi0tIAoy
LjQ3LjEKCg==

--===============6794525533910666032==--

