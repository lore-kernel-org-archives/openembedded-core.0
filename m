Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C106AF42133
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19812.1776261873807100432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=24rvZeSD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kC/bP/dL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d917549ba-4ae9c978-3054-4eee-9077-dcb412dd7784-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261876;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7y35290LDxOjj/1AnLivY2VW9xfbT/K6vq6ayuBxkOI=;
	b=24rvZeSDCc1PZDYZ0fRB3JfjESF8p+V3RJ3j5MbETu3mnCR3XwlzCakGkNTdxsjW
	+QW4kvKPMlHoKOQOdCfmVubRn87aEoUpM2cYSAGpRPtASYB0S+FMCfuSAhTam+y/Jtl
	1wxMExGjhg5zLHnkXtoISf7E11wGDZVl/niJ9PXA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261876;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7y35290LDxOjj/1AnLivY2VW9xfbT/K6vq6ayuBxkOI=;
	b=kC/bP/dLFUxz1Saw+1Ra3DW5yHGb+ZsGBnYQL2OBxf0/jSxPjGrod8VWOG3FxzVs
	+MhsNpUUqKGERfbH47roRfhhBTPcUu87pXYEEirqo06xJi11ROTf5KrgPevRc4ZZSAD
	onL5AA7B8XxclusG/P3Y8YSKD8SNMJ2CE+qdilrw=
Content-Type: multipart/mixed; boundary="===============2132602953839725683=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtd-utils: upgrading to 2.3.1 FAILED
Message-ID: <0101019d917549ba-4ae9c978-3054-4eee-9077-dcb412dd7784-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235225

--===============2132602953839725683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mtd-utils* to *2.3.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-mtd-utils-upgrade-2.3.0-2.3.1.patch
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
From 45afda4ef086ee4c9ecb055a9b830e3e75420469 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 07:09:34 +0000
Subject: [PATCH] mtd-utils: upgrade 2.3.0 -> 2.3.1

---
 .../mtd/{mtd-utils_2.3.0.bb => mtd-utils_2.3.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtd/{mtd-utils_2.3.0.bb => mtd-utils_2.3.1.bb} (98%)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb b/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb
similarity index 98%
rename from meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
rename to meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb
index 545f0d68d5..17cdaf8cb7 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb
@@ -11,7 +11,7 @@ inherit autotools pkgconfig systemd update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
 
-SRCREV = "4594fc1f4496a0ed55cabd31fbeba4e3fbf05602"
+SRCREV = "053ee1038e5dedae61a88cadfb7bdfe9894d8bb6"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
            file://0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch \
            file://0002-ubifs-utils-journal-Include-sys-stat.h.patch \
-- 
2.47.1


--===============2132602953839725683==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtd-utils-upgrade-2.3.0-2.3.1.patch"

RnJvbSA0NWFmZGE0ZWYwODZlZTRjOWVjYjA1NWE5YjgzMGUzZTc1NDIwNDY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDc6MDk6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
dGQtdXRpbHM6IHVwZ3JhZGUgMi4zLjAgLT4gMi4zLjEKCi0tLQogLi4uL210ZC97bXRkLXV0aWxz
XzIuMy4wLmJiID0+IG10ZC11dGlsc18yLjMuMS5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL210ZC97bXRkLXV0aWxzXzIuMy4wLmJiID0+IG10ZC11dGlsc18yLjMu
MS5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRkL210ZC11
dGlsc18yLjMuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdGQvbXRkLXV0aWxzXzIuMy4x
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tdGQvbXRkLXV0aWxzXzIuMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bXRkL210ZC11dGlsc18yLjMuMS5iYgppbmRleCA1NDVmMGQ2OGQ1Li4xN2NkYWY4Y2I3IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRkL210ZC11dGlsc18yLjMuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRkL210ZC11dGlsc18yLjMuMS5iYgpAQCAtMTEsNyAr
MTEsNyBAQCBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgc3lzdGVtZCB1cGRhdGUtYWx0ZXJu
YXRpdmVzCiBERVBFTkRTID0gInpsaWIgZTJmc3Byb2dzIHV0aWwtbGludXgiCiBSREVQRU5EUzpt
dGQtdXRpbHMtdGVzdHMgKz0gImJhc2giCiAKLVNSQ1JFViA9ICI0NTk0ZmMxZjQ0OTZhMGVkNTVj
YWJkMzFmYmViYTRlM2ZiZjA1NjAyIgorU1JDUkVWID0gIjA1M2VlMTAzOGU1ZGVkYWU2MWE4OGNh
ZGZiN2JkZmU5ODk0ZDhiYjYiCiBTUkNfVVJJID0gImdpdDovL2dpdC5pbmZyYWRlYWQub3JnL210
ZC11dGlscy5naXQ7YnJhbmNoPW1hc3RlciBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXViaWZz
LXV0aWxzLXViaWZzLmgtSW5jbHVkZS1mY250bC5oLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTov
LzAwMDItdWJpZnMtdXRpbHMtam91cm5hbC1JbmNsdWRlLXN5cy1zdGF0LmgucGF0Y2ggXAotLSAK
Mi40Ny4xCgo=

--===============2132602953839725683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-f07deb90ce51b5780da525fde028b961a18fc5aa"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f07deb90ce51b5780da525fde028b961a18fc5aa"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 212 Local 198 Mirrors 0 Missed 14 Current 403 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 500 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 530 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 564 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lzo/lzo_2.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 567 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_create_spdx_setscene)
NOTE: Running task 1054 of 1537 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb:do_recipe_qa)
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtd-utils-2.3.1-r0: task do_recipe_qa: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 585 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe lzo-2.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 587 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lzo/lzo_2.10.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 590 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 594 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 595 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 597 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mtd-utils-2.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb:do_recipe_qa unihash changed to a5e08ae3121dc90f8071af5efe3f9f66044b94f91f684d9d169106c7f0667a21
NOTE: recipe e2fsprogs-1.47.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1181 of 1537 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 598 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 600 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 601 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe mtd-utils-2.3.1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 603 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 604 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_spdx_setscene)
NOTE: recipe mtd-utils-2.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1190 of 1537 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx_setscene: Started
NOTE: recipe mtd-utils-2.3.1-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 607 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 608 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_recipe_spdx_setscene)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx_setscene: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 614 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 1412 of 1537 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe mtd-utils-2.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 1519 of 1537 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb:do_create_recipe_spdx)
NOTE: recipe mtd-utils-2.3.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe mtd-utils-2.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1522 of 1537 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb:do_patch)
NOTE: recipe mtd-utils-2.3.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe mtd-utils-2.3.1-r0: task do_patch: Started
NOTE: recipe mtd-utils-2.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtd-utils-2.3.1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1522 tasks of which 1516 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415070921.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415070921.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/mtd-utils/2.3.1/temp/log.do_patch.1776863
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: mtd-utils-2.3.1-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/mtd-utils/2.3.1/sources/mtd-utils-2.3.1'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/mtd-utils/2.3.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch
patching file ubifs-utils/libubifs/ubifs.h
Hunk #1 FAILED at 11.
1 out of 1 hunk FAILED -- rejects in file ubifs-utils/libubifs/ubifs.h
Patch 0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/mtd-utils/2.3.1/temp/log.do_patch.1776863
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb:do_patch) failed with exit code '1'

--===============2132602953839725683==--

