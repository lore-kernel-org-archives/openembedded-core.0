Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70216CD3425
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:24 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2356.1762384577484165766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dX/dHIDF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Qaqfy7bb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a564e8176-d24375f3-4fc6-494a-b9bf-6c6655257c7b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384577;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=14yG8+Y26xr5DLmhSzBkyQy/3uGXVFWUgh3MwTUIiJc=;
	b=dX/dHIDFkWbImVUpgGaCkQ390Ysz+jtznJXCGSkIX2ONBz9DPLIcY+R5wZIBeUy+
	TusIFk3zIq1HHI7045bfhWdQQ8mlx8nt3Y5nIsjOynEDTsTT4qD4DGan+SOTBylc24R
	gpcLzNI/wnjum1HFsh2WRgTGJ2BUFB/Ubic64XvM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384577;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=14yG8+Y26xr5DLmhSzBkyQy/3uGXVFWUgh3MwTUIiJc=;
	b=Qaqfy7bb/Vmp5QZQuPK/9/Nv4OuhW/uMK4AxQFgAkFir8ViteAeFJUfpgaT6cGgn
	LZF4J/kKltuYPPs67f+iK9aAhRIALIRHZiOvZrP9nw8SANJ3Z4ur9p/p0Vhc/m1Z8BO
	Dsv13bsN7+re/Wwiti4SxV0aN6sjFiA0bOzA4+aA=
Content-Type: multipart/mixed; boundary="===============1779278196978840284=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202508.01^{} FAILED
Message-ID: <0101019a564e8176-d24375f3-4fc6-494a-b9bf-6c6655257c7b-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225804

--===============1779278196978840284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202508.01^{}* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ovmf-upgrade-edk2-stable202508-edk2-stable202508.01.patch
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
From b3cd40e7ecfb017116bd398500ee61d05164dfc9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 15:25:32 +0000
Subject: [PATCH] ovmf: upgrade edk2-stable202508 -> edk2-stable202508.01^{}

---
 .../ovmf/0001-ovmf-update-path-to-native-BaseTools.patch    | 2 +-
 ...aseTools-makefile-adjust-to-build-in-under-bitbake.patch | 2 +-
 meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch     | 2 +-
 meta/recipes-core/ovmf/ovmf/0004-reproducible.patch         | 2 +-
 meta/recipes-core/ovmf/ovmf_git.bb                          | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
index 890e586210..7dec755ee7 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
@@ -1,4 +1,4 @@
-From 0f859c6de2914cd984f8a0dd61471b91a2371bfa Mon Sep 17 00:00:00 2001
+From 93c3af054f78c3b4e1788d7ac2a48fea552d5d3d Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Thu, 9 Jun 2016 02:23:01 -0700
 Subject: [PATCH] ovmf: update path to native BaseTools
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
index 4a55528571..557b79c1ae 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
@@ -1,4 +1,4 @@
-From 9dbd082516fdd7100f99f0f389b8eef5ececab19 Mon Sep 17 00:00:00 2001
+From b1f143e9a8fd19397e28496f27bfd29d8900ee1e Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
 Subject: [PATCH] BaseTools: makefile: adjust to build in under bitbake
diff --git a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
index 1e79c23ae9..bb2f17444a 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
@@ -1,4 +1,4 @@
-From eb6db21ed0a845dce149d17acf8673d5188adea4 Mon Sep 17 00:00:00 2001
+From 860f764b821eae611cf308ed45b690cbfd032429 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:56:28 +0200
 Subject: [PATCH] debug prefix map
diff --git a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
index 73f242321e..f48a8f3146 100644
--- a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
@@ -1,4 +1,4 @@
-From 0d22e07cd9cc35ede04c01d3141068db744d7677 Mon Sep 17 00:00:00 2001
+From 1a1716d768f46fd6bab47e2557184c89e46a610b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:57:30 +0200
 Subject: [PATCH] reproducible
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 577310a678..652551865f 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -20,15 +20,15 @@ PACKAGECONFIG[tpm] = "-D TPM_ENABLE=TRUE,-D TPM_ENABLE=FALSE,,"
 #see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetools-turn-off-gcc12-warning.patch
 BUILD_CFLAGS += "-Wno-error=stringop-overflow"
 
-SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https;tag=${PV} \
+SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=stable/202508;protocol=https;tag=${PV} \
            file://0001-ovmf-update-path-to-native-BaseTools.patch \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
            "
 
-PV = "edk2-stable202508"
-SRCREV = "d46aa46c8361194521391aa581593e556c707c6e"
+PV = "edk2-stable202508.01^{}"
+SRCREV = "3d244c3b364bd4e21261380662186d064659161c"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 CVE_PRODUCT = "edk2"
-- 
2.47.1


--===============1779278196978840284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1945 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (947 cached, 1 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-0614abe7302b8691c0353d5a880ae24e30157c78"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:0614abe7302b8691c0353d5a880ae24e30157c78"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 167 Local 151 Mirrors 0 Missed 16 Current 375 (90% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 530 of 542 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 541 of 542 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_recipe_qa_setscene)
NOTE: recipe ovmf-edk2-stable202508.01^{}-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ovmf-native-edk2-stable202508.01^{}-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ovmf-edk2-stable202508.01^{}-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1656 of 1689 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: recipe ovmf-native-edk2-stable202508.01^{}-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1658 of 1689 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: recipe ovmf-edk2-stable202508.01^{}-r0: task do_fetch: Started
NOTE: recipe ovmf-native-edk2-stable202508.01^{}-r0: task do_fetch: Started
NOTE: recipe ovmf-edk2-stable202508.01^{}-r0: task do_fetch: Succeeded
NOTE: Running task 1659 of 1689 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: recipe ovmf-edk2-stable202508.01^{}-r0: task do_unpack: Started
NOTE: recipe ovmf-native-edk2-stable202508.01^{}-r0: task do_fetch: Succeeded
NOTE: Running task 1660 of 1689 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: Running task 1661 of 1689 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe ovmf-native-edk2-stable202508.01^{}-r0: task do_unpack: Started
NOTE: recipe ovmf-native-edk2-stable202508.01^{}-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ovmf-native-edk2-stable202508.01^{}-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ovmf-edk2-stable202508.01^{}-r0: task do_unpack: Succeeded
NOTE: Running task 1662 of 1689 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_patch)
NOTE: recipe ovmf-edk2-stable202508.01^{}-r0: task do_patch: Started
NOTE: recipe ovmf-edk2-stable202508.01^{}-r0: task do_patch: Failed
NOTE: recipe ovmf-native-edk2-stable202508.01^{}-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1662 tasks of which 1656 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105152427.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105152427.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ovmf/edk2-stable202508.01^{}/temp/log.do_patch.2584335
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: ovmf-edk2-stable202508.01^{}-r0 do_patch: Applying patch '0001-ovmf-update-path-to-native-BaseTools.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ovmf/edk2-stable202508.01^{}/sources/ovmf-edk2-stable202508.01^{}'
CmdError("quilt --quiltrc '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ovmf/edk2-stable202508.01^{}/recipe-sysroot-native/etc/quiltrc' push", 0, 'stdout: Usage: quilt [--trace[=verbose]] [--quiltrc=XX] command [-h] ...
       quilt --version
Commands are:

Global options:

--trace
\tRuns the command in bash trace mode (-x). For internal debugging.

--quiltrc file
\tUse the specified configuration file instead of ~/.quiltrc (or
\t/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ovmf/edk2-stable202508.01^{}/recipe-sysroot-native/etc/quilt.quiltrc if ~/.quiltrc does not exist).  See the pdf
\tdocumentation for details about its possible contents.  The
\tspecial value "-" causes quilt not to read any configuration
\tfile.

--version
\tPrint the version number and exit immediately.

stderr: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ovmf/edk2-stable202508.01^{}/recipe-sysroot-native/usr/bin/quilt: line 46: column: command not found
/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ovmf/edk2-stable202508.01^{}/recipe-sysroot-native/usr/bin/quilt: line 46: column: command not found
')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ovmf/edk2-stable202508.01^{}/temp/log.do_patch.2584335
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_patch) failed with exit code '1'

--===============1779278196978840284==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ovmf-upgrade-edk2-stable202508-edk2-stable202508.01.patch"

RnJvbSBiM2NkNDBlN2VjZmIwMTcxMTZiZDM5ODUwMGVlNjFkMDUxNjRkZmM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNToyNTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG92
bWY6IHVwZ3JhZGUgZWRrMi1zdGFibGUyMDI1MDggLT4gZWRrMi1zdGFibGUyMDI1MDguMDFee30K
Ci0tLQogLi4uL292bWYvMDAwMS1vdm1mLXVwZGF0ZS1wYXRoLXRvLW5hdGl2ZS1CYXNlVG9vbHMu
cGF0Y2ggICAgfCAyICstCiAuLi5hc2VUb29scy1tYWtlZmlsZS1hZGp1c3QtdG8tYnVpbGQtaW4t
dW5kZXItYml0YmFrZS5wYXRjaCB8IDIgKy0KIG1ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8w
MDAzLWRlYnVnLXByZWZpeC1tYXAucGF0Y2ggICAgIHwgMiArLQogbWV0YS9yZWNpcGVzLWNvcmUv
b3ZtZi9vdm1mLzAwMDQtcmVwcm9kdWNpYmxlLnBhdGNoICAgICAgICAgfCAyICstCiBtZXRhL3Jl
Y2lwZXMtY29yZS9vdm1mL292bWZfZ2l0LmJiICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYg
KysrLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwMS1vdm1mLXVwZGF0
ZS1wYXRoLXRvLW5hdGl2ZS1CYXNlVG9vbHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9vdm1m
L292bWYvMDAwMS1vdm1mLXVwZGF0ZS1wYXRoLXRvLW5hdGl2ZS1CYXNlVG9vbHMucGF0Y2gKaW5k
ZXggODkwZTU4NjIxMC4uN2RlYzc1NWVlNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
b3ZtZi9vdm1mLzAwMDEtb3ZtZi11cGRhdGUtcGF0aC10by1uYXRpdmUtQmFzZVRvb2xzLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDAxLW92bWYtdXBkYXRlLXBhdGgt
dG8tbmF0aXZlLUJhc2VUb29scy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGY4NTljNmRl
MjkxNGNkOTg0ZjhhMGRkNjE0NzFiOTFhMjM3MWJmYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gOTNjM2FmMDU0Zjc4YzNiNGUxNzg4ZDdhYzJhNDhmZWE1NTJkNWQzZCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2FyZG8gTmVyaSA8cmljYXJkby5uZXJpLWNhbGRlcm9u
QGxpbnV4LmludGVsLmNvbT4KIERhdGU6IFRodSwgOSBKdW4gMjAxNiAwMjoyMzowMSAtMDcwMAog
U3ViamVjdDogW1BBVENIXSBvdm1mOiB1cGRhdGUgcGF0aCB0byBuYXRpdmUgQmFzZVRvb2xzCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwMi1CYXNlVG9vbHMtbWFr
ZWZpbGUtYWRqdXN0LXRvLWJ1aWxkLWluLXVuZGVyLWJpdGJha2UucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtY29yZS9vdm1mL292bWYvMDAwMi1CYXNlVG9vbHMtbWFrZWZpbGUtYWRqdXN0LXRvLWJ1aWxk
LWluLXVuZGVyLWJpdGJha2UucGF0Y2gKaW5kZXggNGE1NTUyODU3MS4uNTU3Yjc5YzFhZSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDItQmFzZVRvb2xzLW1ha2Vm
aWxlLWFkanVzdC10by1idWlsZC1pbi11bmRlci1iaXRiYWtlLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb3JlL292bWYvb3ZtZi8wMDAyLUJhc2VUb29scy1tYWtlZmlsZS1hZGp1c3QtdG8tYnVp
bGQtaW4tdW5kZXItYml0YmFrZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWRiZDA4MjUx
NmZkZDcxMDBmOTlmMGYzODliOGVlZjVlY2VjYWIxOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gYjFmMTQzZTlhOGZkMTkzOTdlMjg0OTZmMjdiZmQyOWQ4OTAwZWUxZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2FyZG8gTmVyaSA8cmljYXJkby5uZXJpLWNhbGRlcm9u
QGxpbnV4LmludGVsLmNvbT4KIERhdGU6IEZyaSwgMjYgSnVsIDIwMTkgMTc6MzQ6MjYgLTA0MDAK
IFN1YmplY3Q6IFtQQVRDSF0gQmFzZVRvb2xzOiBtYWtlZmlsZTogYWRqdXN0IHRvIGJ1aWxkIGlu
IHVuZGVyIGJpdGJha2UKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8w
MDAzLWRlYnVnLXByZWZpeC1tYXAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYv
MDAwMy1kZWJ1Zy1wcmVmaXgtbWFwLnBhdGNoCmluZGV4IDFlNzljMjNhZTkuLmJiMmYxNzQ0NGEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDAzLWRlYnVnLXByZWZp
eC1tYXAucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDMtZGVidWct
cHJlZml4LW1hcC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZWI2ZGIyMWVkMGE4NDVkY2Ux
NDlkMTdhY2Y4NjczZDUxODhhZGVhNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODYw
Zjc2NGI4MjFlYWU2MTFjZjMwOGVkNDViNjkwY2JmZDAzMjQyOSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgog
RGF0ZTogTW9uLCAxNCBKdW4gMjAyMSAxOTo1NjoyOCArMDIwMAogU3ViamVjdDogW1BBVENIXSBk
ZWJ1ZyBwcmVmaXggbWFwCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYv
MDAwNC1yZXByb2R1Y2libGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAw
NC1yZXByb2R1Y2libGUucGF0Y2gKaW5kZXggNzNmMjQyMzIxZS4uZjQ4YThmMzE0NiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDQtcmVwcm9kdWNpYmxlLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDA0LXJlcHJvZHVjaWJsZS5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGQyMmUwN2NkOWNjMzVlZGUwNGMwMWQzMTQxMDY4ZGI3
NDRkNzY3NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWExNzE2ZDc2OGY0NmZkNmJh
YjQ3ZTI1NTcxODRjODllNDZhNjEwYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogTW9uLCAxNCBK
dW4gMjAyMSAxOTo1NzozMCArMDIwMAogU3ViamVjdDogW1BBVENIXSByZXByb2R1Y2libGUKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZl9naXQuYmIgYi9tZXRhL3JlY2lw
ZXMtY29yZS9vdm1mL292bWZfZ2l0LmJiCmluZGV4IDU3NzMxMGE2NzguLjY1MjU1MTg2NWYgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZl9naXQuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvb3ZtZi9vdm1mX2dpdC5iYgpAQCAtMjAsMTUgKzIwLDE1IEBAIFBBQ0tBR0VD
T05GSUdbdHBtXSA9ICItRCBUUE1fRU5BQkxFPVRSVUUsLUQgVFBNX0VOQUJMRT1GQUxTRSwsIgog
I3NlZSBodHRwczovL3NyYy5mZWRvcmFwcm9qZWN0Lm9yZy9ycG1zL2VkazIvYmxvYi9yYXdoaWRl
L2YvMDAzMi1CYXNldG9vbHMtdHVybi1vZmYtZ2NjMTItd2FybmluZy5wYXRjaAogQlVJTERfQ0ZM
QUdTICs9ICItV25vLWVycm9yPXN0cmluZ29wLW92ZXJmbG93IgogCi1TUkNfVVJJID0gImdpdHNt
Oi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1o
dHRwczt0YWc9JHtQVn0gXAorU1JDX1VSSSA9ICJnaXRzbTovL2dpdGh1Yi5jb20vdGlhbm9jb3Jl
L2VkazIuZ2l0O2JyYW5jaD1zdGFibGUvMjAyNTA4O3Byb3RvY29sPWh0dHBzO3RhZz0ke1BWfSBc
CiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW92bWYtdXBkYXRlLXBhdGgtdG8tbmF0aXZlLUJhc2VU
b29scy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLUJhc2VUb29scy1tYWtlZmlsZS1h
ZGp1c3QtdG8tYnVpbGQtaW4tdW5kZXItYml0YmFrZS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAzLWRlYnVnLXByZWZpeC1tYXAucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwNC1y
ZXByb2R1Y2libGUucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVBWID0gImVkazItc3RhYmxlMjAy
NTA4IgotU1JDUkVWID0gImQ0NmFhNDZjODM2MTE5NDUyMTM5MWFhNTgxNTkzZTU1NmM3MDdjNmUi
CitQViA9ICJlZGsyLXN0YWJsZTIwMjUwOC4wMV57fSIKK1NSQ1JFViA9ICIzZDI0NGMzYjM2NGJk
NGUyMTI2MTM4MDY2MjE4NmQwNjQ2NTkxNjFjIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVgg
PSAiKD9QPHB2ZXI+ZWRrMi1zdGFibGUuKikiCiAKIENWRV9QUk9EVUNUID0gImVkazIiCi0tIAoy
LjQ3LjEKCg==

--===============1779278196978840284==--

