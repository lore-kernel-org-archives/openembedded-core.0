Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FA5C54FCB
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:15 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.14626.1700059030300910745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e4OQIlzw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qzJULye3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018bd36a2add-f2b40cd0-de49-4e77-9e09-b74330ae3fba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059032;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=8T7eKqSqX0E9QjyKJ//6vaiBIBvgmJ20oGAoGDQ1lzg=;
	b=e4OQIlzwwgacYqNcFZRQcgM5NmrOz6f85wcLat8t0ZK+L1e//GIxglltMNNt/G7H
	11mRg44g5TvFDXcKen+f+PdgB4nlH25d6SXAumKd7mnqJEgtKnkme7M16U+eCA4fCh/
	XfkMbXXqoTUylu6vVXFkzEu6DMV26h6XDvwkYu7Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059032;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=8T7eKqSqX0E9QjyKJ//6vaiBIBvgmJ20oGAoGDQ1lzg=;
	b=qzJULye3NY5zFMrd7CixQxZcieIHsYCW7KahDuaDlbWn8Mi74mPYA5uAunQyJnTl
	htiBrcXFibv/JP8sDbplUwIGp80VO3W+O9BJfeuUo1HN8tp3If0Tujl8b2j0K00BTUb
	pcoBNo1pd609zXPWhDR8TuuaaGyakr/+0bfoZHhc=
Content-Type: multipart/mixed; boundary="===============8463223546580253512=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libxkbcommon: upgrading to 1.6.0 FAILED
Message-ID: <0101018bd36a2add-f2b40cd0-de49-4e77-9e09-b74330ae3fba-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190689

--===============8463223546580253512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxkbcommon* to *1.6.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libxkbcommon-upgrade-1.5.0-1.6.0.patch
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
From 9184908b76f6f184622901418fc0fe0ea0998b10 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 12:18:26 +0000
Subject: [PATCH] libxkbcommon: upgrade 1.5.0 -> 1.6.0

---
 .../xorg-lib/{libxkbcommon_1.5.0.bb => libxkbcommon_1.6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.5.0.bb => libxkbcommon_1.6.0.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb
index 62e9b158e4..4526c43a1d 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "560f11c4bbbca10f495f3ef7d3a6aa4ca62b4f8fb0b52e7d459d18a26e46e017"
+SRC_URI[sha256sum] = "0edc14eccdd391514458bc5f5a4b99863ed2d651e4dd761a90abf4f46ef99c2b"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.39.2


--===============8463223546580253512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-46bedbfc2f637059401d09573493f49013bfc00a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:46bedbfc2f637059401d09573493f49013bfc00a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 172 Local 160 Mirrors 0 Missed 12 Current 379 (93% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 419 of 551 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 420 of 551 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 431 of 551 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: Running task 874 of 1553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_recipe_qa)
NOTE: Running task 898 of 1553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxkbcommon-1.6.0-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_recipe_qa unihash changed to 00442d62f9e6500240efb434127461ec5f4182a7780bb405c00a73016df9c440
NOTE: Setscene tasks completed
NOTE: Running task 1534 of 1553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_fetch)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1535 of 1553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_unpack)
NOTE: Running task 1536 of 1553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1537 of 1553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_patch)
NOTE: Running task 1538 of 1553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1539 of 1553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1540 of 1553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_lic)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_lic: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_deploy_source_date_epoch unihash changed to 8342ecb4cd7594aa84bebf2cb8d3577652cea2efbf455401ea1bc9c194659b64
NOTE: Setscene tasks completed
NOTE: Running task 1541 of 1553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_lic unihash changed to 566e11f8b6104f34dbac9aea274a01c22ebaddc4a4a07bc12fdec15ec685aad7
NOTE: recipe libxkbcommon-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1542 of 1553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1543 of 1553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_install)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 1544 of 1553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_package)
NOTE: Running task 1545 of 1553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1545 tasks of which 1531 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115121752.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115121752.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_package
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libxkbcommon-1.6.0-r0 do_package: QA Issue: libxkbcommon: Files/directories were installed but not shipped in any package:
  /usr/share/bash-completion
  /usr/share/bash-completion/completions
  /usr/share/bash-completion/completions/xkbcli
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libxkbcommon: 3 installed and not shipped files. [installed-vs-shipped]
ERROR: libxkbcommon-1.6.0-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libxkbcommon/1.6.0/temp/log.do_package.966980
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_package) failed with exit code '1'

--===============8463223546580253512==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxkbcommon-upgrade-1.5.0-1.6.0.patch"

RnJvbSA5MTg0OTA4Yjc2ZjZmMTg0NjIyOTAxNDE4ZmMwZmUwZWEwOTk4YjEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTI6MTg6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4a2Jjb21tb246IHVwZ3JhZGUgMS41LjAgLT4gMS42LjAKCi0tLQogLi4uL3hvcmctbGliL3ts
aWJ4a2Jjb21tb25fMS41LjAuYmIgPT4gbGlieGtiY29tbW9uXzEuNi4wLmJifSAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3tsaWJ4a2Jjb21tb25fMS41LjAuYmIgPT4gbGli
eGtiY29tbW9uXzEuNi4wLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy94b3JnLWxpYi9saWJ4a2Jjb21tb25fMS41LjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy1saWIvbGlieGtiY29tbW9uXzEuNi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4a2Jjb21tb25fMS41
LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4a2Jjb21t
b25fMS42LjAuYmIKaW5kZXggNjJlOWIxNThlNC4uNDUyNmM0M2ExZCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhrYmNvbW1vbl8xLjUuMC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGtiY29tbW9uXzEuNi4wLmJiCkBAIC05
LDcgKzksNyBAQCBERVBFTkRTID0gImZsZXgtbmF0aXZlIGJpc29uLW5hdGl2ZSIKIAogU1JDX1VS
SSA9ICJodHRwOi8veGtiY29tbW9uLm9yZy9kb3dubG9hZC8ke0JQTn0tJHtQVn0udGFyLnh6Igog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTYwZjExYzRiYmJjYTEwZjQ5NWYzZWY3ZDNhNmFhNGNh
NjJiNGY4ZmIwYjUyZTdkNDU5ZDE4YTI2ZTQ2ZTAxNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIw
ZWRjMTRlY2NkZDM5MTUxNDQ1OGJjNWY1YTRiOTk4NjNlZDJkNjUxZTRkZDc2MWE5MGFiZjRmNDZl
Zjk5YzJiIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cDovL3hrYmNvbW1vbi5vcmcvIgog
Ci0tIAoyLjM5LjIKCg==

--===============8463223546580253512==--

