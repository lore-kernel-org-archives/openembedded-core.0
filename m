Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F121CCEBF73
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:40 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11932.1763224716833638919
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=a/8gFjhl;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Ke7QA0Kt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019a88620346-1b096fe6-5865-452e-a0df-f5a640ff0176-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=16RUiVMzSFF7usSze8f69pi6iC43Mo1YRs5GP8FSqII=;
	b=a/8gFjhlN+8iI2Mc4V5IaEVuwBHtb+9J7Zy9Lyw26T+TsCwMPGuqobLsIwtwhdhr
	Rpm+K4O5GZQ/6ZN3YvH15p/a6pudgjgn2QiNTKOZg5UqIVkcf+bYMkpMX16Jw9qyfxa
	L4lc651A20IYH4g43BzZY9f7w60LBhJPVs/eur0k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=16RUiVMzSFF7usSze8f69pi6iC43Mo1YRs5GP8FSqII=;
	b=Ke7QA0KtBQER7LdCdLiyZrFL6CXexRM70uvG/ThDO2DJeViGJbxFPf6ht3aN515G
	mpfkHabOnM96A9Ig/0a0MGCFcJEciJHO2jNpCly2xSfYZZBlwF2eDiUewjFYjH4C4K1
	dYvdBnsNmTQAnislyt5V7QzEpTCdyC3fzQ5yjb3w=
Content-Type: multipart/mixed; boundary="===============6789483753246434684=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] kbd: upgrading to 2.9.0 FAILED
Message-ID: <0101019a88620346-1b096fe6-5865-452e-a0df-f5a640ff0176-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226324

--===============6789483753246434684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kbd* to *2.9.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-kbd-upgrade-2.8.0-2.9.0.patch
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
From 6968cde933cf5110b1a8c97d39537ae2d44bf053 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 08:27:30 +0000
Subject: [PATCH] kbd: upgrade 2.8.0 -> 2.9.0

---
 meta/recipes-core/kbd/{kbd_2.8.0.bb => kbd_2.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/kbd/{kbd_2.8.0.bb => kbd_2.9.0.bb} (96%)

diff --git a/meta/recipes-core/kbd/kbd_2.8.0.bb b/meta/recipes-core/kbd/kbd_2.9.0.bb
similarity index 96%
rename from meta/recipes-core/kbd/kbd_2.8.0.bb
rename to meta/recipes-core/kbd/kbd_2.9.0.bb
index ababa09918..2a0c5bc1b1 100644
--- a/meta/recipes-core/kbd/kbd_2.8.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.9.0.bb
@@ -26,7 +26,7 @@ RCONFLICTS:${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "01f5806da7d1d34f594b7b2a6ae1ab23215344cf1064e8edcd3a90fef9776a11"
+SRC_URI[sha256sum] = "fb3197f17a99eb44d22a3a1a71f755f9622dd963e66acfdea1a45120951b02ed"
 
 # 'gzip -n' is set due to https://github.com/legionus/kbd/issues/124
 EXTRA_OECONF = "--disable-tests --enable-compress='gzip -n'"
-- 
2.47.1


--===============6789483753246434684==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kbd-upgrade-2.8.0-2.9.0.patch"

RnJvbSA2OTY4Y2RlOTMzY2Y1MTEwYjFhOGM5N2QzOTUzN2FlMmQ0NGJmMDUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDg6Mjc6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
YmQ6IHVwZ3JhZGUgMi44LjAgLT4gMi45LjAKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUva2JkL3tr
YmRfMi44LjAuYmIgPT4ga2JkXzIuOS4wLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2tiZC97
a2JkXzIuOC4wLmJiID0+IGtiZF8yLjkuMC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29yZS9rYmQva2JkXzIuOC4wLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUva2JkL2tiZF8y
LjkuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29y
ZS9rYmQva2JkXzIuOC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9rYmQva2JkXzIu
OS4wLmJiCmluZGV4IGFiYWJhMDk5MTguLjJhMGM1YmMxYjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL2tiZC9rYmRfMi44LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUva2JkL2ti
ZF8yLjkuMC5iYgpAQCAtMjYsNyArMjYsNyBAQCBSQ09ORkxJQ1RTOiR7UE59ID0gImNvbnNvbGUt
dG9vbHMiCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvdXRpbHMvJHtCUE59
LyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAx
ZjU4MDZkYTdkMWQzNGY1OTRiN2IyYTZhZTFhYjIzMjE1MzQ0Y2YxMDY0ZThlZGNkM2E5MGZlZjk3
NzZhMTEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmIzMTk3ZjE3YTk5ZWI0NGQyMmEzYTFhNzFm
NzU1Zjk2MjJkZDk2M2U2NmFjZmRlYTFhNDUxMjA5NTFiMDJlZCIKIAogIyAnZ3ppcCAtbicgaXMg
c2V0IGR1ZSB0byBodHRwczovL2dpdGh1Yi5jb20vbGVnaW9udXMva2JkL2lzc3Vlcy8xMjQKIEVY
VFJBX09FQ09ORiA9ICItLWRpc2FibGUtdGVzdHMgLS1lbmFibGUtY29tcHJlc3M9J2d6aXAgLW4n
IgotLSAKMi40Ny4xCgo=

--===============6789483753246434684==
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
DISTRO_VERSION       = "5.2.99+snapshot-1760d7aa4bd8081ccefc0514e5347893cb238324"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:1760d7aa4bd8081ccefc0514e5347893cb238324"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 131 Local 123 Mirrors 0 Missed 8 Current 256 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 317 of 387 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/kbd/kbd_2.9.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 322 of 387 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 324 of 387 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 325 of 387 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/kbd/kbd_2.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kbd-2.9.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe kbd-2.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kbd-2.9.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 335 of 387 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe kbd-2.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 340 of 387 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/kbd/kbd_2.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 341 of 387 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 387 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe kbd-2.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kbd-2.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 343 of 387 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/kbd/kbd_2.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 345 of 387 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_create_spdx_setscene)
NOTE: recipe kbd-2.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 351 of 387 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe kbd-2.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 739 of 1146 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/kbd/kbd_2.9.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe kbd-2.9.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kbd-2.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 745 of 1146 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/kbd/kbd_2.9.0.bb:do_unpack)
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 355 of 387 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe kbd-2.9.0-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 377 of 387 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kbd-2.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1022 of 1146 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/kbd/kbd_2.9.0.bb:do_patch)
NOTE: recipe kbd-2.9.0-r0: task do_patch: Started
NOTE: recipe kbd-2.9.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 387 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1120 of 1146 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/kbd/kbd_2.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1133 of 1146 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/kbd/kbd_2.9.0.bb:do_collect_spdx_deps)
NOTE: recipe kbd-2.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kbd-2.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe kbd-2.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1134 of 1146 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/kbd/kbd_2.9.0.bb:do_configure)
NOTE: recipe kbd-2.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kbd-2.9.0-r0: task do_configure: Started
NOTE: recipe kbd-2.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1135 of 1146 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/kbd/kbd_2.9.0.bb:do_compile)
NOTE: recipe kbd-2.9.0-r0: task do_compile: Started
NOTE: recipe kbd-2.9.0-r0: task do_compile: Succeeded
NOTE: Running task 1136 of 1146 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/kbd/kbd_2.9.0.bb:do_install)
NOTE: recipe kbd-2.9.0-r0: task do_install: Started
NOTE: recipe kbd-2.9.0-r0: task do_install: Succeeded
NOTE: Running task 1137 of 1146 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/kbd/kbd_2.9.0.bb:do_package)
NOTE: recipe kbd-2.9.0-r0: task do_package: Started
NOTE: recipe kbd-2.9.0-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1138 tasks of which 1129 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115082658.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115082658.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/kbd/kbd_2.9.0.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/kbd/2.9.0/temp/log.do_package.3520354
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: kbd-2.9.0-r0 do_package: Error executing a python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:sstate_report_unihash(d)
     0003:
File: '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/classes-global/sstate.bbclass', lineno: 915, function: sstate_report_unihash
     0911:    report_unihash = getattr(bb.parse.siggen, 'report_unihash', None)
     0912:
     0913:    if report_unihash:
     0914:        ss = sstate_state_fromvars(d)
 *** 0915:        report_unihash(os.getcwd(), ss['task'], d)
     0916:}
     0917:
     0918:#
     0919:# Shell function to decompress and prepare a package for installation
File: '/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/siggen.py', lineno: 784, function: report_unihash
     0780:
     0781:            if "." in self.method:
     0782:                (module, method) = self.method.rsplit('.', 1)
     0783:                locs['method'] = getattr(importlib.import_module(module), method)
 *** 0784:                outhash = bb.utils.better_eval('method(path, sigfile, task, d)', locs)
     0785:            else:
     0786:                outhash = bb.utils.better_eval(self.method + '(path, sigfile, task, d)', locs)
     0787:
     0788:            try:
File: '/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/utils.py', lineno: 489, function: better_eval
     0485:    if extraglobals:
     0486:        ctx = copy.copy(ctx)
     0487:        for g in extraglobals:
     0488:            ctx[g] = extraglobals[g]
 *** 0489:    return eval(source, ctx, locals)
     0490:
     0491:@contextmanager
     0492:def fileslocked(files, *args, **kwargs):
     0493:    """Context manager for locking and unlocking file locks. Uses
File: '<string>', lineno: 1, function: <module>
  File "<string>", line 1, in <module>

File: '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/lib/oe/sstatesig.py', lineno: 726, function: OEOuthashBasic
     0722:                process(root)
     0723:            for f in files:
     0724:                if f == 'fixmepath':
     0725:                    continue
 *** 0726:                process(os.path.join(root, f))
     0727:
     0728:            for dir in dirs:
     0729:                if os.path.islink(os.path.join(root, dir)):
     0730:                    process(os.path.join(root, dir))
File: '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/lib/oe/sstatesig.py', lineno: 661, function: process
     0657:                    except KeyError as e:
     0658:                        msg = ("KeyError: %s\nPath %s is owned by uid %d, gid %d, which doesn't match "
     0659:                            "any user/group on target. This may be due to host contamination." %
     0660:                            (e, os.path.abspath(path), s.st_uid, s.st_gid))
 *** 0661:                        raise Exception(msg).with_traceback(e.__traceback__)
     0662:
     0663:                if include_timestamps:
     0664:                    # Need to clamp to SOURCE_DATE_EPOCH
     0665:                    if s.st_mtime > source_date_epoch:
File: '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/lib/oe/sstatesig.py', lineno: 655, function: process
     0651:                    else:
     0652:                        add_perm(stat.S_IXOTH, 'x')
     0653:
     0654:                    try:
 *** 0655:                        update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
     0656:                        update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
     0657:                    except KeyError as e:
     0658:                        msg = ("KeyError: %s\nPath %s is owned by uid %d, gid %d, which doesn't match "
     0659:                            "any user/group on target. This may be due to host contamination." %
Exception: Exception: KeyError: 'getpwuid(): uid not found: 6000'
Path /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/kbd/2.9.0/sstate-build-package/package/usr/share/consolefonts/161.cp.gz is owned by uid 6000, gid 6000, which doesn't match any user/group on target. This may be due to host contamination.

ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/kbd/2.9.0/temp/log.do_package.3520354
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/kbd/kbd_2.9.0.bb:do_package) failed with exit code '1'

--===============6789483753246434684==--

