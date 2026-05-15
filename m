Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDF8CD4F5B
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:34 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34819.1778851226675266815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=binm906n;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=R8F0+hBr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019e2bcba104-1ca5d9db-ca2e-4522-802d-4bd084b8102f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TIxv3w8sR8jIaBbf/3ArF7ANAr1iXaWTl3IrLNRY41I=;
	b=binm906nXewwemV9BD3hV5vY1dM64FIjMxn/tEcUQei54ked2Qr5MLOeBTUB8+xg
	Fy4vEG0f3ag1oPnrCL8qpQNTDnycgoEY6tM7xh/OaGW7C24DfYbAQm5J8ECqPtJEtau
	9/KDrHGcFjiUPoXTb8UUxOjRC0oJa8DP+QkVMoo0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TIxv3w8sR8jIaBbf/3ArF7ANAr1iXaWTl3IrLNRY41I=;
	b=R8F0+hBr74US+KUFC6SLfe3uwmZX1nBlM5aEcepBJYYaGz6aa+hiIKQXH4Up/QYc
	Uwd5dMSaz0PbhQc6vTJHX4ZAGDZNveu6HpGYnoH/W+3/dhX9jmWY1SAYQVOJjz3BasZ
	zsY2E32OZ+cpNLQgpBvbnde+WEmn9FgKEZF4mnnA=
Content-Type: multipart/mixed; boundary="===============0321238448770851366=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>, Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng,libcap-ng-python: upgrading to 0.9.3,0.9.3 FAILED
Message-ID: <0101019e2bcba104-1ca5d9db-ca2e-4522-802d-4bd084b8102f-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237099

--===============0321238448770851366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libcap-ng,libcap-ng-python* to *0.9.3,0.9.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libcap-ng-libcap-ng-python-upgrade-0.9.1-0.9.3-0.9.1.patch
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
From 1f6bf3e47e358635f62985e7a428c8c160a62d22 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 06:38:27 +0000
Subject: [PATCH] libcap-ng,libcap-ng-python: upgrade 0.9.1 -> 0.9.3,0.9.1 ->
 0.9.3

---
 .../{libcap-ng-python_0.9.1.bb => libcap-ng-python_0.9.3.bb}    | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                    | 2 +-
 .../libcap-ng/{libcap-ng_0.9.1.bb => libcap-ng_0.9.3.bb}        | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.9.1.bb => libcap-ng-python_0.9.3.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.9.1.bb => libcap-ng_0.9.3.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 9d65c889bd..f023fe8f01 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "427ed6d2c2b16e9b48f12953e55febfead3ef2e2"
+SRCREV = "0ab44af5a23e8edb69a39c0dc803ce4395ff2086"
 
 inherit lib_package autotools pkgconfig
 
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb
-- 
2.47.1


--===============0321238448770851366==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-ng-libcap-ng-python-upgrade-0.9.1-0.9.3-0.9.1.patch"

RnJvbSAxZjZiZjNlNDdlMzU4NjM1ZjYyOTg1ZTdhNDI4YzhjMTYwYTYyZDIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDY6Mzg6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjYXAtbmcsbGliY2FwLW5nLXB5dGhvbjogdXBncmFkZSAwLjkuMSAtPiAwLjkuMywwLjkuMSAt
PgogMC45LjMKCi0tLQogLi4uL3tsaWJjYXAtbmctcHl0aG9uXzAuOS4xLmJiID0+IGxpYmNhcC1u
Zy1weXRob25fMC45LjMuYmJ9ICAgIHwgMAogbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5n
L2xpYmNhcC1uZy5pbmMgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL2xpYmNhcC1uZy97
bGliY2FwLW5nXzAuOS4xLmJiID0+IGxpYmNhcC1uZ18wLjkuMy5iYn0gICAgICAgIHwgMAogMyBm
aWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy97bGliY2FwLW5nLXB5dGhvbl8wLjkuMS5iYiA9PiBs
aWJjYXAtbmctcHl0aG9uXzAuOS4zLmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJjYXAtbmcve2xpYmNhcC1uZ18wLjkuMS5iYiA9PiBsaWJjYXAtbmdfMC45LjMuYmJ9
ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJj
YXAtbmctcHl0aG9uXzAuOS4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xp
YmNhcC1uZy1weXRob25fMC45LjMuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmctcHl0aG9uXzAuOS4xLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLXB5dGhv
bl8wLjkuMy5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xp
YmNhcC1uZy5pbmMgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLmlu
YwppbmRleCA5ZDY1Yzg4OWJkLi5mMDIzZmU4ZjAxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLmluYworKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJjYXAtbmcvbGliY2FwLW5nLmluYwpAQCAtOCw3ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9OTRkNTVkNTEyYTliYTM2Y2FhOWI3ZGYwNzliYWUxOWYg
XAogCQkgICAgZmlsZTovL0NPUFlJTkcuTElCO21kNT1lM2VkYTAxZDk4MTVmOGQyNGFhZTJkYmQ4
OWI2OGIwNiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3N0ZXZlZ3J1YmIvbGliY2Fw
LW5nLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyO3RhZz12JHtQVn0iCi1TUkNSRVYg
PSAiNDI3ZWQ2ZDJjMmIxNmU5YjQ4ZjEyOTUzZTU1ZmViZmVhZDNlZjJlMiIKK1NSQ1JFViA9ICIw
YWI0NGFmNWEyM2U4ZWRiNjlhMzljMGRjODAzY2U0Mzk1ZmYyMDg2IgogCiBpbmhlcml0IGxpYl9w
YWNrYWdlIGF1dG90b29scyBwa2djb25maWcKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZ18wLjkuMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmNhcC1uZy9saWJjYXAtbmdfMC45LjMuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmdfMC45LjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmdfMC45LjMu
YmIKLS0gCjIuNDcuMQoK

--===============0321238448770851366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1974 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-3990204011ae3b9b33a9d593c6d325f1295f5a30"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:3990204011ae3b9b33a9d593c6d325f1295f5a30"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 308 Local 169 Mirrors 0 Missed 139 Current 244 (54% match, 74% complete)
done.
Removing 9 stale sstate objects for arch x86_64...done.
Removing 19 stale sstate objects for arch qemux86_64...done.
Removing 53 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 368 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/swig/swig_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 411 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 428 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 441 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 444 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 449 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 452 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 456 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 458 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 460 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 461 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 464 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 467 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 470 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 472 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 474 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.46.bb:do_create_spdx_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe swig-native-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 477 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 482 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 483 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_spdx_setscene)
NOTE: Running setscene task 485 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 490 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 493 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 495 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 496 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 501 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 505 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 509 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 510 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe swig-native-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 512 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 513 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 516 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.46.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gawk-native-5.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 517 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-native-2.78-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.46-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.43+git-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-native-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 518 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 519 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 520 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 521 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/swig/swig_4.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 523 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 524 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/swig/swig_4.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-native-2.78-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 526 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-native-5.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 531 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 535 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.46-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 538 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glibc-2.43+git-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-native-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 543 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 545 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 547 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe swig-native-4.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-native-0.194-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe swig-native-4.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-native-2.78-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe elfutils-native-0.194-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: Running task 400 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_fetch)
NOTE: recipe libarchive-native-3.8.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe swig-native-4.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcap-native-2.78-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 521 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa)
NOTE: Running task 531 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_fetch)
NOTE: Running task 539 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_fetch)
NOTE: Running task 541 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_fetch)
NOTE: recipe util-linux-libuuid-native-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 610 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_write_config)
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running noexec task 629 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_fetch)
NOTE: Running task 634 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_fetch)
NOTE: Running task 637 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_fetch)
NOTE: Running setscene task 549 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Succeeded
NOTE: Running task 668 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_unpack)
NOTE: Running task 669 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 671 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_fetch)
NOTE: Running task 678 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_fetch)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_fetch: Started
NOTE: Running noexec task 709 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_fetch)
NOTE: Running task 735 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe swig-native-4.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 737 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running setscene task 551 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/swig/swig_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_write_config: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_recipe_qa: Started
NOTE: recipe glibc-2.43+git-r1: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_write_config: Succeeded
NOTE: Running task 740 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe util-linux-native-2.41.3-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-native-3.8.7-r0: task do_fetch: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_fetch: Started
NOTE: Running task 741 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.194-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_fetch: Succeeded
NOTE: Running task 742 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_unpack)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-native-0.194-r0: task do_fetch: Succeeded
NOTE: recipe swig-native-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 747 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_unpack)
NOTE: recipe gawk-native-5.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 805 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: Running task 807 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: Running task 846 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_fetch)
NOTE: Running task 858 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: recipe swig-native-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 859 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_unpack: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-native-0.194-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: Running task 860 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_unpack)
NOTE: recipe expat-2.8.1-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 861 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: Running task 862 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_fetch)
NOTE: recipe xz-5.8.3-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 863 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 864 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_fetch)
NOTE: Running task 865 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_unpack: Started
NOTE: recipe glibc-2.43+git-r1: task do_fetch: Succeeded
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa unihash changed to 942437bf965f3f7f101ab85c21bdc78fca332e91f4564284096fe8c98f9dfbd4
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.6-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: recipe libarchive-native-3.8.7-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 866 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_fetch)
NOTE: Running task 867 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_unpack)
NOTE: Running task 868 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_patch)
NOTE: Running task 869 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: Running task 871 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_unpack)
NOTE: Running task 881 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: Running task 882 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_unpack)
NOTE: Running task 883 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Started
NOTE: Running task 884 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_fetch: Started
NOTE: recipe xz-5.8.3-r0: task do_unpack: Started
NOTE: recipe glibc-2.43+git-r1: task do_unpack: Started
NOTE: recipe expat-2.8.1-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 885 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe libarchive-native-3.8.7-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: Running task 887 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_unpack)
NOTE: Running task 888 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: recipe xz-5.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 889 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_patch)
NOTE: recipe util-linux-native-2.41.3-r0: task do_patch: Started
NOTE: recipe expat-2.8.1-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 890 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: recipe openssl-3.5.6-r0: task do_unpack: Started
NOTE: recipe xz-5.8.3-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 891 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe expat-2.8.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 892 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe xz-5.8.3-r0: task do_patch: Succeeded
NOTE: Running task 893 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: Running task 894 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_patch)
NOTE: recipe expat-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 903 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_generate_toolchain_file)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.8.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 907 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_create_recipe_spdx)
NOTE: recipe expat-2.8.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 914 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: recipe elfutils-native-0.194-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 915 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_patch)
NOTE: Running task 933 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 935 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_fetch)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 936 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_fetch)
NOTE: recipe libffi-3.5.2-r0: task do_fetch: Started
NOTE: recipe libffi-3.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 937 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.194-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_fetch: Succeeded
NOTE: Running task 938 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: Running task 939 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_fetch: Succeeded
NOTE: Running task 940 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_fetch)
NOTE: recipe util-linux-native-2.41.3-r0: task do_patch: Succeeded
NOTE: Running task 945 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_fetch)
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Started
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 946 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 957 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_unpack)
NOTE: recipe libedit-20251016-3.1-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 958 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_unpack)
NOTE: recipe python3-3.14.5-r0: task do_fetch: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: recipe libffi-3.5.2-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 959 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_unpack)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 960 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx)
NOTE: recipe python3-3.14.5-r0: task do_fetch: Succeeded
NOTE: Running task 961 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_unpack: Started
NOTE: recipe libffi-3.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 962 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_unpack: Started
NOTE: Running task 964 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_unpack: Succeeded
NOTE: Running task 965 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_patch)
NOTE: Running task 966 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_patch)
NOTE: recipe libedit-20251016-3.1-r0: task do_unpack: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_recipe_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 967 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_patch)
NOTE: recipe libffi-3.5.2-r0: task do_patch: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 968 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_patch)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_patch: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_patch: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_patch: Succeeded
NOTE: Running task 971 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_unpack)
NOTE: recipe libedit-20251016-3.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 972 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-native-0.194-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_patch: Succeeded
NOTE: Running task 981 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa)
NOTE: Running task 987 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_recipe_qa)
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_patch: Succeeded
NOTE: Running task 988 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_create_recipe_spdx)
NOTE: recipe openssl-3.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 1018 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_patch)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.14.5-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_recipe_qa: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_patch: Succeeded
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe openssl-3.5.6-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_unpack: Succeeded
NOTE: Running task 1033 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_patch)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_recipe_qa unihash changed to ae2adfde23677497481a1a280a473dcb43c42426824a73aa98ac4e5a8b20e38e
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_patch: Started
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_deploy_source_date_epoch unihash changed to 9b4e9b5d6ca05ca76ca5352e73db82c36641f5398890ca7c29c4a77265b10266
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa unihash changed to 394938f3276873e1a0f007ddf8e1a21eb7a36ce45bbd88509929ebde66e5adc2
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1034 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_configure)
NOTE: Running task 1036 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_recipe_spdx)
NOTE: Running task 1037 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: Running task 1038 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: Running task 1039 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_fetch)
NOTE: Running task 1040 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_fetch: Started
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_fetch: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libcap-ng-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 1043 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_unpack)
NOTE: recipe libcap-ng-0.9.3-r0: task do_unpack: Started
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1045 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_unpack)
NOTE: Running task 1046 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 1047 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_unpack)
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.5-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1048 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_patch)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_unpack: Started
NOTE: recipe glibc-2.43+git-r1: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1049 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_patch)
NOTE: recipe python3-3.14.5-r0: task do_patch: Started
NOTE: recipe glibc-2.43+git-r1: task do_patch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1050 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 1051 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx)
NOTE: Running task 1052 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx)
NOTE: Running task 1053 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_patch)
NOTE: Running task 1054 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_create_recipe_spdx)
NOTE: Running task 1055 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx)
NOTE: Running task 1056 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_recipe_spdx)
NOTE: Running task 1057 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx)
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1058 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 1059 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1060 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_lic)
NOTE: recipe libcap-ng-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_lic: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1062 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx)
NOTE: Running task 1063 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_recipe_spdx)
NOTE: Running task 1064 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_create_recipe_spdx)
NOTE: Running task 1065 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_recipe_spdx)
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_lic: Succeeded
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1066 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_lic unihash changed to 3b971e1b4f18639be757d4e138445a494eafbe8ecc28a3ba19bda3d3b7ba039d
NOTE: Running task 1067 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_create_recipe_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_deploy_source_date_epoch unihash changed to 243669373b29f2a8d4d463b3f9480415897097a1da2c13409f5a09669233625c
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_create_recipe_spdx: Started
NOTE: Setscene tasks completed
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1069 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1070 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_populate_lic)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_populate_lic: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1071 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx)
NOTE: Running task 1072 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx)
NOTE: Running task 1073 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx)
NOTE: Running task 1074 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.5-r0: task do_patch: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_populate_lic: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_populate_lic unihash changed to b7f56664e65f12846dc593a465af23f7e00fc1a05ea9163face9beaf4c125bcb
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_deploy_source_date_epoch unihash changed to c18021c87e28ed69c84b5d8ad82e42a180191aebbeab389f3be0f5f5680ed082
NOTE: Setscene tasks completed
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1076 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_create_recipe_spdx)
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1077 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx)
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1078 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_patch: Succeeded
NOTE: Running noexec task 1080 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_configure)
NOTE: Running noexec task 1081 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_compile)
NOTE: Running task 1082 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_install)
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1083 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_unpack)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 1098 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_patch)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 1099 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_compile)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_compile: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1100 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1101 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_patch: Succeeded
NOTE: Running task 1102 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_generate_toolchain_file)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_compile: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_unpack: Succeeded
NOTE: Running task 1104 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_install)
NOTE: Running task 1105 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_patch)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_install: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 1107 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1108 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1109 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_create_spdx)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_spdx: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1110 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_configure)
NOTE: recipe util-linux-native-2.41.3-r0: task do_configure: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_configure: Succeeded
NOTE: Running task 1111 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_compile)
NOTE: recipe util-linux-native-2.41.3-r0: task do_compile: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_compile: Succeeded
NOTE: Running task 1112 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_install)
NOTE: recipe util-linux-native-2.41.3-r0: task do_install: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_install: Succeeded
NOTE: Running task 1113 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot)
NOTE: recipe util-linux-native-2.41.3-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1114 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1115 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1116 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_spdx: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_spdx: Succeeded
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1117 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_configure)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1118 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_configure)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_configure: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_configure: Succeeded
NOTE: Running task 1119 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_compile)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_compile: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_configure: Succeeded
NOTE: Running task 1120 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_compile)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_compile: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_compile: Succeeded
NOTE: Running task 1121 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_install)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_install: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_compile: Succeeded
NOTE: Running task 1122 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_install)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_install: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_install: Succeeded
NOTE: Running task 1123 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_populate_sysroot)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1124 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1125 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_create_spdx)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_spdx: Started
NOTE: recipe glibc-2.43+git-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_install: Succeeded
NOTE: Running task 1126 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_populate_sysroot)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_spdx: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot: Started
NOTE: recipe glibc-2.43+git-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1127 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_configure)
NOTE: recipe glibc-2.43+git-r1: task do_configure: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1128 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-native-3.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1129 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_configure)
NOTE: recipe libarchive-native-3.8.7-r0: task do_configure: Started
NOTE: recipe glibc-2.43+git-r1: task do_configure: Succeeded
NOTE: Running task 1130 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_compile)
NOTE: recipe glibc-2.43+git-r1: task do_compile: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_configure: Succeeded
NOTE: Running task 1131 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_compile)
NOTE: recipe libarchive-native-3.8.7-r0: task do_compile: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_compile: Succeeded
NOTE: Running task 1132 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_install)
NOTE: recipe libarchive-native-3.8.7-r0: task do_install: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_install: Succeeded
NOTE: Running task 1133 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_populate_sysroot)
NOTE: recipe libarchive-native-3.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1134 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-native-0.194-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-native-0.194-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1135 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_configure)
NOTE: recipe elfutils-native-0.194-r0: task do_configure: Started
NOTE: recipe elfutils-native-0.194-r0: task do_configure: Succeeded
NOTE: Running task 1136 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_compile)
NOTE: recipe elfutils-native-0.194-r0: task do_compile: Started
NOTE: recipe elfutils-native-0.194-r0: task do_compile: Succeeded
NOTE: Running task 1137 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_install)
NOTE: recipe elfutils-native-0.194-r0: task do_install: Started
NOTE: recipe elfutils-native-0.194-r0: task do_install: Succeeded
NOTE: Running task 1138 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_populate_sysroot)
NOTE: recipe elfutils-native-0.194-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-native-0.194-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1139 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1140 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_prepare_recipe_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1141 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_configure)
NOTE: Running task 1142 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_configure)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_configure: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1143 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_compile)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1144 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_install)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Succeeded
NOTE: Running task 1145 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_configure: Succeeded
NOTE: Running task 1146 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_compile)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_compile: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_compile: Succeeded
NOTE: Running task 1147 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_install)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_install: Succeeded
NOTE: Running task 1148 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_populate_sysroot)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1149 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package)
NOTE: recipe linux-libc-headers-6.18-r0: task do_package: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package unihash changed to 6fcd005e1247f1baab2f567008e2c4fa3e5f64cf36463ac5e8529b82f76d3400
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_spdx became valid
NOTE: Running setscene task 545 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.43+git-r1: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1154 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_install)
NOTE: recipe glibc-2.43+git-r1: task do_install: Started
NOTE: recipe glibc-2.43+git-r1: task do_install: Succeeded
NOTE: Running task 1155 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_stash_locale)
NOTE: recipe glibc-2.43+git-r1: task do_stash_locale: Started
NOTE: recipe glibc-2.43+git-r1: task do_stash_locale: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_stash_locale unihash changed to 1d158aac4cb7e00b484eba7ee5ae4d730316ae748ebc98fdfb7b0fa7a3b5cd73
NOTE: Setscene tasks completed
NOTE: Running task 1156 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot)
NOTE: Running task 1157 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_package)
NOTE: recipe glibc-2.43+git-r1: task do_populate_sysroot: Started
NOTE: recipe glibc-2.43+git-r1: task do_package: Started
NOTE: recipe glibc-2.43+git-r1: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot unihash changed to 9734e27e27cd2ad48eafbd63772d35e0a84a22673ce3f2fba1c27db7c652434a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot became valid
NOTE: Running setscene task 493 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 544 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 546 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 551 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1158 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcc-15.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-15.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1159 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_configure)
NOTE: recipe libgcc-15.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-15.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1160 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_compile)
NOTE: recipe libgcc-15.2.0-r0: task do_compile: Started
NOTE: recipe libgcc-15.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1161 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_install)
NOTE: recipe libgcc-15.2.0-r0: task do_install: Started
NOTE: recipe libgcc-15.2.0-r0: task do_install: Succeeded
NOTE: Running task 1162 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_multilib_install)
NOTE: recipe libgcc-15.2.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-15.2.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1163 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_extra_symlinks)
NOTE: recipe libgcc-15.2.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-15.2.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1165 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1166 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_configure)
NOTE: recipe glibc-2.43+git-r1: task do_package: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_package unihash changed to 277adc8e650e62555ac4da80db1229dfb236e6707f1d8bf10995eddee679e5e4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_packagedata became valid
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.43+git-r1: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.43+git-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1168 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package)
NOTE: Running task 1169 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_spdx)
NOTE: recipe libgcc-15.2.0-r0: task do_package: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package unihash changed to 4c937c7bc48c8212b242609910d1bc1a896ac798f7cc13a1e84b6428be97d078
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata became valid
NOTE: Running setscene task 544 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1171 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_spdx)
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1172 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_compile)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1173 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_install)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_install: Succeeded
NOTE: Running task 1180 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1181 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1182 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1183 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1184 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_package)
NOTE: Running task 1185 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1186 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1187 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1188 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1189 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1190 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1191 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1192 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_configure)
NOTE: Running task 1193 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1194 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_configure: Started
NOTE: recipe libffi-3.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1195 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_configure: Started
NOTE: Running task 1196 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_configure)
NOTE: recipe expat-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1197 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_configure)
NOTE: recipe libxcrypt-4.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1198 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_configure)
NOTE: Running task 1199 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1200 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_configure)
NOTE: recipe gdbm-1.26-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_configure: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_configure: Started
NOTE: Running task 1201 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile)
NOTE: recipe expat-2.8.1-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_configure: Started
NOTE: Running task 1202 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe libcap-ng-0.9.3-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1203 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1204 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1206 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1207 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1208 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1209 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1210 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile)
NOTE: recipe xz-5.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1211 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_configure)
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1212 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_configure)
NOTE: Running task 1213 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: Running task 1214 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_configure)
NOTE: recipe openssl-3.5.6-r0: task do_configure: Started
NOTE: recipe xz-5.8.3-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe ncurses-6.6-r0: task do_configure: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1215 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1216 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_install)
NOTE: recipe zlib-1.3.2-r0: task do_install: Started
NOTE: recipe expat-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1217 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1218 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_install_ptest_base)
NOTE: recipe expat-2.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1219 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_compile)
NOTE: recipe zlib-1.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_configure: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_compile: Started
NOTE: Running task 1220 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_compile)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_compile: Started
NOTE: recipe expat-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1222 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_compile_ptest_base)
NOTE: recipe expat-2.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1223 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_install)
NOTE: recipe expat-2.8.1-r0: task do_install: Started
NOTE: recipe expat-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 1224 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_install_ptest_base)
NOTE: recipe expat-2.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1226 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1227 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_package unihash changed to 0c5ebf2bfac5066d3d63383a550b494f78f30487dade3aea89b2d0dbedefd8ae
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata became valid
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1229 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: Running task 1230 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx)
NOTE: Running task 1231 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_package)
NOTE: Running task 1232 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx: Started
NOTE: recipe expat-2.8.1-r0: task do_package: Started
NOTE: recipe zlib-1.3.2-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1233 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1234 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_compile)
NOTE: Running task 1235 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe libcap-ng-0.9.3-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1236 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1237 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe libffi-3.5.2-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 1238 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_compile)
NOTE: recipe libffi-3.5.2-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_configure: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1240 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure_ptest_base)
NOTE: recipe expat-2.8.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_package unihash changed to bd4b092622417c6a7d6ea9d50f7b0ab6c737fb94d881b7d15fba1c0eee9a439a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata became valid
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: Running task 1241 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile)
NOTE: recipe openssl-3.5.6-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to beb74ebeb60b2faa32f94cd11ecb75c3edca8b600ccb2357abadfa3335405c91
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Running setscene task 551 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running task 1242 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_configure_ptest_base)
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_package: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_configure_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package unihash changed to 8cdc197cca2293b2f446ee6694b80c535cb6c9e3d4a22cf7ddbc033e40ee48ff
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata became valid
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running task 1244 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_spdx)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1246 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_compile)
NOTE: Running task 1247 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: Running task 1248 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_create_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe openssl-3.5.6-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx: Started
NOTE: recipe libffi-3.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1249 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_install)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1251 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx)
NOTE: recipe libffi-3.5.2-r0: task do_install: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe expat-2.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 1252 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_install)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_install: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1253 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_compile)
NOTE: recipe libxcrypt-4.5.2-r0: task do_compile: Started
NOTE: recipe libffi-3.5.2-r0: task do_install: Succeeded
NOTE: Running task 1255 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_package)
NOTE: recipe libffi-3.5.2-r0: task do_package: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 1256 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_package)
NOTE: Running task 1257 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libcap-ng-0.9.3-r0: task do_package: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe gdbm-1.26-r0: task do_compile: Succeeded
NOTE: Running task 1258 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile_ptest_base)
NOTE: recipe libxcrypt-4.5.2-r0: task do_compile: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Started
NOTE: Running task 1259 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_install)
NOTE: recipe libxcrypt-4.5.2-r0: task do_install: Started
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_install: Succeeded
NOTE: Running task 1260 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install)
NOTE: Running task 1262 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_package)
NOTE: recipe libxcrypt-4.5.2-r0: task do_package: Started
NOTE: recipe gdbm-1.26-r0: task do_install: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_package unihash changed to 0112893ca7d65f195b292d851ac5d2a3e1a0ba390212008e1a2f1e5cec194f2e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 146abf5f25f572537f4bdfad6cf0d62f75a9949b25bfce7cc8c85c9aeb894e39
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1264 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1266 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Started
NOTE: recipe gdbm-1.26-r0: task do_install: Succeeded
NOTE: Running task 1267 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install_ptest_base)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_package unihash changed to d6ee2a05a0307a79eabbd84ee85699ec8623c6aeb8c878b878e9f64199b77d21
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1269 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_spdx)
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx: Started
NOTE: recipe xz-5.8.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1270 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_configure_ptest_base)
NOTE: recipe xz-5.8.3-r0: task do_configure_ptest_base: Started
NOTE: recipe xz-5.8.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1271 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_compile)
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_compile: Started
NOTE: Running task 1273 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package)
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_package: Started
NOTE: recipe xz-5.8.3-r0: task do_compile: Succeeded
NOTE: Running task 1274 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_compile_ptest_base)
NOTE: recipe xz-5.8.3-r0: task do_compile_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_package: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_package: Failed
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package unihash changed to 71c5b0c6078867ecab43bbcb3b0df9d54c22b8603fab571264811d961bc15078
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata became valid
NOTE: recipe xz-5.8.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_compile: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_configure: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_compile: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1274 tasks of which 1004 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515063309.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515063309.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libcap-ng/0.9.3/temp/log.do_package.4125470
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libcap-ng-0.9.3-r0 do_package: QA Issue: libcap-ng: Files/directories were installed but not shipped in any package:
  /usr/share/bash-completion
  /usr/share/bash-completion/completions
  /usr/share/bash-completion/completions/libcap-ng.bash_completion
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libcap-ng: 3 installed and not shipped files. [installed-vs-shipped]
ERROR: libcap-ng-0.9.3-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libcap-ng/0.9.3/temp/log.do_package.4125470
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_package) failed with exit code '1'

--===============0321238448770851366==--

