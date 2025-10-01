Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46928CCF9F3
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:37 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.18072.1759325536079836896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=epYVunU9;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ahbpmKqZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101999ff98e2e-824829e1-f1f8-4a20-9d3b-10d09f7755cf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CiD6T9R9qrCzQinNDXFCN1FnGf0mAuVfnQcxCS8NDZA=;
	b=epYVunU9/40Cinsb/AfvzaYmRaotoxc73kA6aL2eIxeDrlRuyXMSCXgX38QrfngL
	TFEz5qKFe28HcjbMqQyQz+4axtwiYYdw+1NZN5/C+1B6hrcorBEDQWwhj5nkSxGS2kF
	yCgNtceZT9d6NQpXkMwZmlRrARH+uTRhRyGW9awg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CiD6T9R9qrCzQinNDXFCN1FnGf0mAuVfnQcxCS8NDZA=;
	b=ahbpmKqZurWdI7vRNy4wvjRWV4Upe9z6Nn79/qfkOkOOE/QeZhWbKmX0QUZ0oUaB
	CmCm6jyGmWZcrNoEy8F5Td9FmLuX7U2kLPkkgCZ5xTQHuW+ZcWsmgEg8mKc3n09vaVc
	UGBNhkrtepsbmW+2vqfE6WGT44l0s201bn8nmuuQ=
Content-Type: multipart/mixed; boundary="===============7131736975275653501=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] p11-kit: upgrading to 0.25.10 FAILED
Message-ID: <010101999ff98e2e-824829e1-f1f8-4a20-9d3b-10d09f7755cf-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224300

--===============7131736975275653501==
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
From 7598f6a2fa7e54b597ce5c608a222fcad14a9b9a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 13:23:34 +0000
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


--===============7131736975275653501==
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
DISTRO_VERSION       = "5.2.99+snapshot-765bc80df702a99e0f4538542c1e5a3d76e8a151"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:765bc80df702a99e0f4538542c1e5a3d76e8a151"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 119 Local 107 Mirrors 0 Missed 12 Current 283 (89% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 355 of 402 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 402 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_create_spdx_setscene)
NOTE: Running task 903 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_recipe_qa)
NOTE: Running task 936 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_write_config)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_recipe_qa: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_write_config: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe p11-kit-0.25.10-r0: task do_write_config: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 371 of 402 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_recipe_qa: Succeeded
NOTE: Running task 988 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 379 of 402 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_create_spdx_setscene)
NOTE: recipe p11-kit-0.25.10-r0: task do_fetch: Started
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 386 of 402 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 392 of 402 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_fetch: Succeeded
NOTE: Running task 1026 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_unpack)
NOTE: recipe p11-kit-0.25.10-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 400 of 402 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_unpack: Succeeded
NOTE: Running task 1037 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_patch)
NOTE: recipe p11-kit-0.25.10-r0: task do_patch: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_patch: Succeeded
NOTE: Running task 1038 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1039 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_populate_lic)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1140 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1158 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_collect_spdx_deps)
NOTE: recipe p11-kit-0.25.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_populate_lic: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_populate_lic: Succeeded
NOTE: recipe p11-kit-0.25.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe p11-kit-0.25.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p11-kit-0.25.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1163 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_configure)
NOTE: recipe p11-kit-0.25.10-r0: task do_configure: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_configure: Succeeded
NOTE: Running task 1164 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_compile)
NOTE: recipe p11-kit-0.25.10-r0: task do_compile: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_compile: Succeeded
NOTE: Running task 1165 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_install)
NOTE: recipe p11-kit-0.25.10-r0: task do_install: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_install: Succeeded
NOTE: Running task 1166 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_package)
NOTE: Running task 1167 of 1175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.25.10-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_package: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe p11-kit-0.25.10-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1167 tasks of which 1153 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001132255.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001132255.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/p11-kit/0.25.10/temp/log.do_package.676039
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: p11-kit-0.25.10-r0 do_package: QA Issue: p11-kit: Files/directories were installed but not shipped in any package:
  /usr/share/zsh
  /usr/share/zsh/site-functions
  /usr/share/zsh/site-functions/_p11-kit
  /usr/share/zsh/site-functions/_trust
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
p11-kit: 4 installed and not shipped files. [installed-vs-shipped]
ERROR: p11-kit-0.25.10-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/p11-kit/0.25.10/temp/log.do_package.676039
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_package) failed with exit code '1'

--===============7131736975275653501==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-p11-kit-upgrade-0.25.5-0.25.10.patch"

RnJvbSA3NTk4ZjZhMmZhN2U1NGI1OTdjZTVjNjA4YTIyMmZjYWQxNGE5YjlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAxMzoyMzozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHAx
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

--===============7131736975275653501==--

