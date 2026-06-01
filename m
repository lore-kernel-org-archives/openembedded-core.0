Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5E0CD98D4
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:03 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1587.1780328152884430764
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K1cv5kJI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zN8FoLhA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019e83d3bc94-d1655407-bda0-4ddf-af84-0193479a46f7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328152;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9lnFFXHbY39rjcJRgIEje1YaIB5PsCiu458PFOXok+M=;
	b=K1cv5kJIliZzZdLlQq8p1UV9g6p3gaA+pqfLfTKXHj+asWRDvYhur/gY/ufud75M
	LN6zNRgv+suGY7xZKHVZ5ZOvSCARMUFC3s49i5Zffp/Zb2EXeYbULjKpj8jFjwCF2Ru
	Xn6aXEEGzhGRHLJ6xfle1F+RM94gCeDXylfsK3K8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328152;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9lnFFXHbY39rjcJRgIEje1YaIB5PsCiu458PFOXok+M=;
	b=zN8FoLhAoGgB6Ju0kM1lVCmc9t163D5SwcDD0p6ZeZfY6RnAhTY9Qc2uNyKoNtlO
	Skk1kcALhYyI2ZqoGofdhOMW5eGtK5qmifcnQy6PuMhO4p5n+oZy/QiXJuWkqU5wVk3
	o2tRe3ALHlsndScF+EDgnPZY+Xel7y5N6SMRiUc8=
Content-Type: multipart/mixed; boundary="===============0888052348216699763=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dtc: upgrading to 1.8.1 FAILED
Message-ID: <0101019e83d3bc94-d1655407-bda0-4ddf-af84-0193479a46f7-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237938

--===============0888052348216699763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dtc* to *1.8.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-dtc-upgrade-1.7.2-1.8.1.patch
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
From c5c15206741ff3ec53d5fa54fab06949b68b6cf2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 12:21:23 +0000
Subject: [PATCH] dtc: upgrade 1.7.2 -> 1.8.1

---
 .../dtc/{dtc_1.7.2.bb => dtc_1.8.1.bb}        | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/dtc/{dtc_1.7.2.bb => dtc_1.8.1.bb} (51%)

diff --git a/meta/recipes-kernel/dtc/dtc_1.7.2.bb b/meta/recipes-kernel/dtc/dtc_1.8.1.bb
similarity index 51%
rename from meta/recipes-kernel/dtc/dtc_1.7.2.bb
rename to meta/recipes-kernel/dtc/dtc_1.8.1.bb
index b8b79542c5..864494805c 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.2.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.8.1.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- README.license
+# +++ README.license
+# @@ -28,7 +28,7 @@
+#  makes that it easier for vendors or authors of such software to do so.
+#  
+#  This does mean that libfdt code could be "stolen" - say, included in a
+# -proprietary fimware and extended without contributing those extensions
+# +proprietary firmware and extended without contributing those extensions
+#  back to the libfdt mainline.  While I hope that doesn't happen, I
+#  believe the goal of allowing libfdt to be widely used is more
+#  important than avoiding that.  libfdt is quite small, and hardly
+# 
+#
+
 SUMMARY = "Device Tree Compiler"
 HOMEPAGE = "https://devicetree.org/"
 DESCRIPTION = "The Device Tree Compiler is a toolchain for working with device tree source and binary files."
@@ -6,13 +28,14 @@ LICENSE = "GPL-2.0-only | BSD-2-Clause"
 
 LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927 \
-                    file://README.license;md5=a1eb22e37f09df5b5511b8a278992d0e"
+                    file://README.license;md5=a5696bd07fcc7285cbbacc42c2132248 \
+                    "
 
 SRC_URI = " \
     git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https \
     file://0001-Fix-discarded-const-qualifiers.patch \
 "
-SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
+SRCREV = "8f48565e5cfedc74d3f7512f1e0188e9d85dc1de"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============0888052348216699763==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-dtc-upgrade-1.7.2-1.8.1.patch"

RnJvbSBjNWMxNTIwNjc0MWZmM2VjNTNkNWZhNTRmYWIwNjk0OWI2OGI2Y2YyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMjoyMToyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGR0
YzogdXBncmFkZSAxLjcuMiAtPiAxLjguMQoKLS0tCiAuLi4vZHRjL3tkdGNfMS43LjIuYmIgPT4g
ZHRjXzEuOC4xLmJifSAgICAgICAgfCAyNyArKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMta2VybmVsL2R0Yy97ZHRjXzEuNy4yLmJiID0+IGR0Y18xLjguMS5iYn0gKDUxJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2R0Yy9kdGNfMS43LjIuYmIgYi9tZXRhL3JlY2lw
ZXMta2VybmVsL2R0Yy9kdGNfMS44LjEuYmIKc2ltaWxhcml0eSBpbmRleCA1MSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWtlcm5lbC9kdGMvZHRjXzEuNy4yLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMta2VybmVsL2R0Yy9kdGNfMS44LjEuYmIKaW5kZXggYjhiNzk1NDJjNS4uODY0NDk0ODA1
YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9kdGMvZHRjXzEuNy4yLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1rZXJuZWwvZHRjL2R0Y18xLjguMS5iYgpAQCAtMSwzICsxLDI1IEBACisj
IEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkg
J2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0
aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4K
KyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFt
cGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRo
ZSBjaGFuZ2VzOgorIworIyAtLS0gUkVBRE1FLmxpY2Vuc2UKKyMgKysrIFJFQURNRS5saWNlbnNl
CisjIEBAIC0yOCw3ICsyOCw3IEBACisjICBtYWtlcyB0aGF0IGl0IGVhc2llciBmb3IgdmVuZG9y
cyBvciBhdXRob3JzIG9mIHN1Y2ggc29mdHdhcmUgdG8gZG8gc28uCisjICAKKyMgIFRoaXMgZG9l
cyBtZWFuIHRoYXQgbGliZmR0IGNvZGUgY291bGQgYmUgInN0b2xlbiIgLSBzYXksIGluY2x1ZGVk
IGluIGEKKyMgLXByb3ByaWV0YXJ5IGZpbXdhcmUgYW5kIGV4dGVuZGVkIHdpdGhvdXQgY29udHJp
YnV0aW5nIHRob3NlIGV4dGVuc2lvbnMKKyMgK3Byb3ByaWV0YXJ5IGZpcm13YXJlIGFuZCBleHRl
bmRlZCB3aXRob3V0IGNvbnRyaWJ1dGluZyB0aG9zZSBleHRlbnNpb25zCisjICBiYWNrIHRvIHRo
ZSBsaWJmZHQgbWFpbmxpbmUuICBXaGlsZSBJIGhvcGUgdGhhdCBkb2Vzbid0IGhhcHBlbiwgSQor
IyAgYmVsaWV2ZSB0aGUgZ29hbCBvZiBhbGxvd2luZyBsaWJmZHQgdG8gYmUgd2lkZWx5IHVzZWQg
aXMgbW9yZQorIyAgaW1wb3J0YW50IHRoYW4gYXZvaWRpbmcgdGhhdC4gIGxpYmZkdCBpcyBxdWl0
ZSBzbWFsbCwgYW5kIGhhcmRseQorIyAKKyMKKwogU1VNTUFSWSA9ICJEZXZpY2UgVHJlZSBDb21w
aWxlciIKIEhPTUVQQUdFID0gImh0dHBzOi8vZGV2aWNldHJlZS5vcmcvIgogREVTQ1JJUFRJT04g
PSAiVGhlIERldmljZSBUcmVlIENvbXBpbGVyIGlzIGEgdG9vbGNoYWluIGZvciB3b3JraW5nIHdp
dGggZGV2aWNlIHRyZWUgc291cmNlIGFuZCBiaW5hcnkgZmlsZXMuIgpAQCAtNiwxMyArMjgsMTQg
QEAgTElDRU5TRSA9ICJHUEwtMi4wLW9ubHkgfCBCU0QtMi1DbGF1c2UiCiAKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0dQTDttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMg
XAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQlNELTItQ2xhdXNlO21kNT01ZDYzMDZkMWIw
OGY4ZGY2MjMxNzhkZmQ4MTg4MDkyNyBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9SRUFE
TUUubGljZW5zZTttZDU9YTFlYjIyZTM3ZjA5ZGY1YjU1MTFiOGEyNzg5OTJkMGUiCisgICAgICAg
ICAgICAgICAgICAgIGZpbGU6Ly9SRUFETUUubGljZW5zZTttZDU9YTU2OTZiZDA3ZmNjNzI4NWNi
YmFjYzQyYzIxMzIyNDggXAorICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiIFwK
ICAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL3V0aWxzL2R0Yy9kdGMuZ2l0O2JyYW5j
aD1tYWluO3Byb3RvY29sPWh0dHBzIFwKICAgICBmaWxlOi8vMDAwMS1GaXgtZGlzY2FyZGVkLWNv
bnN0LXF1YWxpZmllcnMucGF0Y2ggXAogIgotU1JDUkVWID0gIjJkMTBhYTJhZmUzNTUyNzcyOGRi
MzBiMzVlYzQ5MWVjYjY5NTllNWMiCitTUkNSRVYgPSAiOGY0ODU2NWU1Y2ZlZGM3NGQzZjc1MTJm
MWUwMTg4ZTlkODVkYzFkZSIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAidig/UDxw
dmVyPlxkKyhcLlxkKykrKSIKIAotLSAKMi40Ny4xCgo=

--===============0888052348216699763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-d25bdee4f063847ba3658a0cc7080c0bcdc9b2c5"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:d25bdee4f063847ba3658a0cc7080c0bcdc9b2c5"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 110 Local 96 Mirrors 0 Missed 14 Current 487 (87% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 575 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_create_spdx_setscene)
NOTE: Running task 1217 of 1528 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_recipe_qa)
NOTE: Running task 1348 of 1528 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_write_config)
NOTE: Running task 1481 of 1528 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_create_recipe_spdx)
NOTE: recipe diffutils-3.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.8.1-r0: task do_recipe_qa: Started
NOTE: recipe dtc-1.8.1-r0: task do_write_config: Started
NOTE: recipe dtc-1.8.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe dtc-1.8.1-r0: task do_write_config: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe dtc-1.8.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe dtc-1.8.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1510 of 1528 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_fetch)
NOTE: recipe dtc-1.8.1-r0: task do_fetch: Started
NOTE: recipe dtc-1.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1511 of 1528 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_unpack)
NOTE: Running task 1512 of 1528 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe dtc-1.8.1-r0: task do_unpack: Started
NOTE: recipe dtc-1.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dtc-1.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dtc-1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1513 of 1528 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_patch)
NOTE: recipe dtc-1.8.1-r0: task do_patch: Started
NOTE: recipe dtc-1.8.1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1513 tasks of which 1506 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601122109.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601122109.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/dtc/1.8.1/temp/log.do_patch.3547669
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: dtc-1.8.1-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/dtc/1.8.1/sources/dtc-1.8.1'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/dtc/1.8.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Fix-discarded-const-qualifiers.patch
patching file fdtput.c
Hunk #1 FAILED at 230.
1 out of 1 hunk FAILED -- rejects in file fdtput.c
patching file libfdt/fdt_overlay.c
Hunk #1 FAILED at 409.
1 out of 1 hunk FAILED -- rejects in file libfdt/fdt_overlay.c
patching file meson.build
Hunk #1 FAILED at 18.
1 out of 1 hunk FAILED -- rejects in file meson.build
Patch 0001-Fix-discarded-const-qualifiers.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/dtc/1.8.1/temp/log.do_patch.3547669
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_patch) failed with exit code '1'

--===============0888052348216699763==--

