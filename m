Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E795AC04FDE
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:11 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.8643.1698848703154130801
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PwQU9F0j;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=M+Jn0+SX;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b8b460d5f-462b86ac-186b-4702-8ef6-42006cc60219-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=gvIUbuVqkLKksgGJfTz7lhuYYvbSITXXIbPDPZtEZbw=;
	b=PwQU9F0jLpYR9J0+oFrnfbk3i1Lv8OW1VtYZvtgiSwscVW3qDqyKouzSWBpUi0i9
	kTi4Y7AKlGwrI7U1fnZoftV7Y0yjlW2qJT2L+rAF9bFfwGBIvvIBkiu+8BWLZZGJmhH
	75qYc2Tkj+u4PvE+bro2TFPO28YuBhS8vyQQc1/U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=gvIUbuVqkLKksgGJfTz7lhuYYvbSITXXIbPDPZtEZbw=;
	b=M+Jn0+SX9dpUN3jCPLU3g6yhyX3ZQjAnaKvq1DDdVX0/HK/Gu+80WEwKsSrL6Rpd
	PaIriBKixzPXUUsc6U/L6wdyW/rlhctgb7zD1pkXl3IybMc7Am9T23jIH8ddrifACuo
	4CfzfyLAzVvVig1mInUF7GVOS8+gktCartz3v6qc=
Content-Type: multipart/mixed; boundary="===============7514916529882614722=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libxkbcommon: upgrading to 1.6.0 FAILED
Message-ID: <0101018b8b460d5f-462b86ac-186b-4702-8ef6-42006cc60219-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190029

--===============7514916529882614722==
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
From 84d74402db143fbe9b850377ba06713f52750191 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 13:22:08 +0000
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


--===============7514916529882614722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-0c4169c2145802e0b88588951c8d5c4b5724c74c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0c4169c2145802e0b88588951c8d5c4b5724c74c"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 64 Local 54 Mirrors 0 Missed 10 Current 474 (84% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 498 of 538 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 507 of 538 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1349 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_recipe_qa)
NOTE: Running task 1423 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_write_config)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1502 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_fetch)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1503 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_unpack)
NOTE: Running task 1504 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1505 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_patch)
NOTE: Running task 1506 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1507 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1508 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_lic)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_lic: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1509 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1510 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1511 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_install)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 1512 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_package)
NOTE: Running task 1513 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1513 tasks of which 1499 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_package
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libxkbcommon-1.6.0-r0 do_package: QA Issue: libxkbcommon: Files/directories were installed but not shipped in any package:
  /usr/share/bash-completion
  /usr/share/bash-completion/completions
  /usr/share/bash-completion/completions/xkbcli
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libxkbcommon: 3 installed and not shipped files. [installed-vs-shipped]
ERROR: libxkbcommon-1.6.0-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxkbcommon/1.6.0/temp/log.do_package.2368385
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_package) failed with exit code '1'

--===============7514916529882614722==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxkbcommon-upgrade-1.5.0-1.6.0.patch"

RnJvbSA4NGQ3NDQwMmRiMTQzZmJlOWI4NTAzNzdiYTA2NzEzZjUyNzUwMTkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMzoyMjowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhrYmNvbW1vbjogdXBncmFkZSAxLjUuMCAtPiAxLjYuMAoKLS0tCiAuLi4veG9yZy1saWIve2xp
YnhrYmNvbW1vbl8xLjUuMC5iYiA9PiBsaWJ4a2Jjb21tb25fMS42LjAuYmJ9ICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve2xpYnhrYmNvbW1vbl8xLjUuMC5iYiA9PiBsaWJ4
a2Jjb21tb25fMS42LjAuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctbGliL2xpYnhrYmNvbW1vbl8xLjUuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWxpYi9saWJ4a2Jjb21tb25fMS42LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhrYmNvbW1vbl8xLjUu
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhrYmNvbW1v
bl8xLjYuMC5iYgppbmRleCA2MmU5YjE1OGU0Li40NTI2YzQzYTFkIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGtiY29tbW9uXzEuNS4wLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4a2Jjb21tb25fMS42LjAuYmIKQEAgLTks
NyArOSw3IEBAIERFUEVORFMgPSAiZmxleC1uYXRpdmUgYmlzb24tbmF0aXZlIgogCiBTUkNfVVJJ
ID0gImh0dHA6Ly94a2Jjb21tb24ub3JnL2Rvd25sb2FkLyR7QlBOfS0ke1BWfS50YXIueHoiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1NjBmMTFjNGJiYmNhMTBmNDk1ZjNlZjdkM2E2YWE0Y2E2
MmI0ZjhmYjBiNTJlN2Q0NTlkMThhMjZlNDZlMDE3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBl
ZGMxNGVjY2RkMzkxNTE0NDU4YmM1ZjVhNGI5OTg2M2VkMmQ2NTFlNGRkNzYxYTkwYWJmNGY0NmVm
OTljMmIiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwOi8veGtiY29tbW9uLm9yZy8iCiAK
LS0gCjIuMzkuMgoK

--===============7514916529882614722==--

