Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266DFCDE00A
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:10 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50618.1781195511185228388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hSyKS8vV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nRm3Y7MD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019eb786b5fb-cd151ce3-6f3e-47a7-8a6e-8eaa8437ae05-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195520;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/nCok9NqINpNnhwHduaPpq7hT8qZSIX9m1vd1jSLYKE=;
	b=hSyKS8vVml6LDDRgBRPOgnPFYUejTMy/sXyRT+msIFBh3cfvdgw8mzmTUfjNXu6R
	Q7qKbKndxK3Wq0bc7tBnLh4pr67467CrTBvrcnsMf7KnbpeXJ57C3qs9/H2eFV7wlN8
	G2nSToI5NAbnO/4TwOi4pyX+S42jg+C62sp1He/8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195520;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/nCok9NqINpNnhwHduaPpq7hT8qZSIX9m1vd1jSLYKE=;
	b=nRm3Y7MD+YYl5W1FVXViVn8HyavDglebsQGof9qKEyc496LBaM711rmWIMQe5sgi
	yWe7BjJIK4bqZ+aNtch9DNn8Pe+FMVScxwCC1UovkbQq9V8I7r1Y6DrSG0Hfbbl+IJ6
	ndZgsrw3IEiZhl0vdPyaiKKmcAebnFT8dXlN4VTA=
Content-Type: multipart/mixed; boundary="===============6043610404311344848=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dtc: upgrading to 1.8.1 FAILED
Message-ID: <0101019eb786b5fb-cd151ce3-6f3e-47a7-8a6e-8eaa8437ae05-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238553

--===============6043610404311344848==
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
From 3b141d2f70677a9962550e363401c54b3a2c5025 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 13:28:33 +0000
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


--===============6043610404311344848==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-dtc-upgrade-1.7.2-1.8.1.patch"

RnJvbSAzYjE0MWQyZjcwNjc3YTk5NjI1NTBlMzYzNDAxYzU0YjNhMmM1MDI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTM6Mjg6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
dGM6IHVwZ3JhZGUgMS43LjIgLT4gMS44LjEKCi0tLQogLi4uL2R0Yy97ZHRjXzEuNy4yLmJiID0+
IGR0Y18xLjguMS5iYn0gICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNo
YW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWtlcm5lbC9kdGMve2R0Y18xLjcuMi5iYiA9PiBkdGNfMS44LjEuYmJ9ICg1MSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9kdGMvZHRjXzEuNy4yLmJiIGIvbWV0YS9yZWNp
cGVzLWtlcm5lbC9kdGMvZHRjXzEuOC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggNTElCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvZHRjL2R0Y18xLjcuMi5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWtlcm5lbC9kdGMvZHRjXzEuOC4xLmJiCmluZGV4IGI4Yjc5NTQyYzUuLjg2NDQ5NDgw
NWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvZHRjL2R0Y18xLjcuMi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMta2VybmVsL2R0Yy9kdGNfMS44LjEuYmIKQEAgLTEsMyArMSwyNSBAQAor
IyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5
ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJl
dHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUg
dGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGlu
CisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhh
bXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBU
aGUgY2hhbmdlczoKKyMKKyMgLS0tIFJFQURNRS5saWNlbnNlCisjICsrKyBSRUFETUUubGljZW5z
ZQorIyBAQCAtMjgsNyArMjgsNyBAQAorIyAgbWFrZXMgdGhhdCBpdCBlYXNpZXIgZm9yIHZlbmRv
cnMgb3IgYXV0aG9ycyBvZiBzdWNoIHNvZnR3YXJlIHRvIGRvIHNvLgorIyAgCisjICBUaGlzIGRv
ZXMgbWVhbiB0aGF0IGxpYmZkdCBjb2RlIGNvdWxkIGJlICJzdG9sZW4iIC0gc2F5LCBpbmNsdWRl
ZCBpbiBhCisjIC1wcm9wcmlldGFyeSBmaW13YXJlIGFuZCBleHRlbmRlZCB3aXRob3V0IGNvbnRy
aWJ1dGluZyB0aG9zZSBleHRlbnNpb25zCisjICtwcm9wcmlldGFyeSBmaXJtd2FyZSBhbmQgZXh0
ZW5kZWQgd2l0aG91dCBjb250cmlidXRpbmcgdGhvc2UgZXh0ZW5zaW9ucworIyAgYmFjayB0byB0
aGUgbGliZmR0IG1haW5saW5lLiAgV2hpbGUgSSBob3BlIHRoYXQgZG9lc24ndCBoYXBwZW4sIEkK
KyMgIGJlbGlldmUgdGhlIGdvYWwgb2YgYWxsb3dpbmcgbGliZmR0IHRvIGJlIHdpZGVseSB1c2Vk
IGlzIG1vcmUKKyMgIGltcG9ydGFudCB0aGFuIGF2b2lkaW5nIHRoYXQuICBsaWJmZHQgaXMgcXVp
dGUgc21hbGwsIGFuZCBoYXJkbHkKKyMgCisjCisKIFNVTU1BUlkgPSAiRGV2aWNlIFRyZWUgQ29t
cGlsZXIiCiBIT01FUEFHRSA9ICJodHRwczovL2RldmljZXRyZWUub3JnLyIKIERFU0NSSVBUSU9O
ID0gIlRoZSBEZXZpY2UgVHJlZSBDb21waWxlciBpcyBhIHRvb2xjaGFpbiBmb3Igd29ya2luZyB3
aXRoIGRldmljZSB0cmVlIHNvdXJjZSBhbmQgYmluYXJ5IGZpbGVzLiIKQEAgLTYsMTMgKzI4LDE0
IEBAIExJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5IHwgQlNELTItQ2xhdXNlIgogCiBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9HUEw7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYz
IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0JTRC0yLUNsYXVzZTttZDU9NWQ2MzA2ZDFi
MDhmOGRmNjIzMTc4ZGZkODE4ODA5MjcgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vUkVB
RE1FLmxpY2Vuc2U7bWQ1PWExZWIyMmUzN2YwOWRmNWI1NTExYjhhMjc4OTkyZDBlIgorICAgICAg
ICAgICAgICAgICAgICBmaWxlOi8vUkVBRE1FLmxpY2Vuc2U7bWQ1PWE1Njk2YmQwN2ZjYzcyODVj
YmJhY2M0MmMyMTMyMjQ4IFwKKyAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gIiBc
CiAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS91dGlscy9kdGMvZHRjLmdpdDticmFu
Y2g9bWFpbjtwcm90b2NvbD1odHRwcyBcCiAgICAgZmlsZTovLzAwMDEtRml4LWRpc2NhcmRlZC1j
b25zdC1xdWFsaWZpZXJzLnBhdGNoIFwKICIKLVNSQ1JFViA9ICIyZDEwYWEyYWZlMzU1Mjc3Mjhk
YjMwYjM1ZWM0OTFlY2I2OTU5ZTVjIgorU1JDUkVWID0gIjhmNDg1NjVlNWNmZWRjNzRkM2Y3NTEy
ZjFlMDE4OGU5ZDg1ZGMxZGUiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gInYoP1A8
cHZlcj5cZCsoXC5cZCspKykiCiAKLS0gCjIuNDcuMQoK

--===============6043610404311344848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-250b779ce86dcb8277c5ce4936915cf61ff90ac5"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:250b779ce86dcb8277c5ce4936915cf61ff90ac5"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 133 Local 120 Mirrors 0 Missed 13 Current 464 (90% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 570 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 590 of 597 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1347 of 1528 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_write_config)
NOTE: Running task 1480 of 1528 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_create_recipe_spdx)
NOTE: recipe diffutils-3.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dtc-1.8.1-r0: task do_write_config: Started
NOTE: recipe dtc-1.8.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe dtc-1.8.1-r0: task do_write_config: Succeeded
NOTE: recipe dtc-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1490 of 1528 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_fetch)
NOTE: recipe diffutils-3.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe dtc-1.8.1-r0: task do_fetch: Started
NOTE: recipe dtc-1.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1511 of 1528 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_unpack)
NOTE: Running task 1512 of 1528 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe dtc-1.8.1-r0: task do_unpack: Started
NOTE: recipe dtc-1.8.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe dtc-1.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dtc-1.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dtc-1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1513 of 1528 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_patch)
NOTE: recipe dtc-1.8.1-r0: task do_patch: Started
NOTE: recipe dtc-1.8.1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1513 tasks of which 1507 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611132818.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611132818.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/dtc/1.8.1/temp/log.do_patch.2274380
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
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/dtc/1.8.1/temp/log.do_patch.2274380
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.8.1.bb:do_patch) failed with exit code '1'

--===============6043610404311344848==--

