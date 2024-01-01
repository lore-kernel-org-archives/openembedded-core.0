Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC00C47DAF
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:05 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.4622.1704114718833643868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IDZxKKnA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iNIfkA8W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018cc5270f74-e3cfed1e-6515-4ab8-8a54-05bdea96c457-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Fr/TTkVp0ejFVht/nN2l1LLh/A1yukoJp2hpUyqAMOk=;
	b=IDZxKKnA99IuJaQAKouGIcQuty8GORDekAkYvU19KTGDPqSI5fNmXOJAAn/vXDHd
	CG9R/rQx+t207BYpPy/Hw/agVYatoWaFhCvdjqYYmXMtL+r5xe+4N7tC2//rfGE2APF
	+qdFGqtakdaJ6By43ytfJDDRcB/zQrWxS05pxzX0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Fr/TTkVp0ejFVht/nN2l1LLh/A1yukoJp2hpUyqAMOk=;
	b=iNIfkA8W7Zhzk4JXx91Y5vLuf2i/Lu6tX+53jbzV+T9rlCv8tCfLPYWujADA5SLx
	L4UVw2zxNF2jJ8Ds66bupvK2FaR8oM7wo26HDEGtoB0g860iGLQL3PnAxY68QN4oaUR
	xtM3ow5Mq420BgtHw46t8h+QgjAStg0RNqvqsYCE=
Content-Type: multipart/mixed; boundary="===============3208903261415473328=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng-python: upgrading to 0.8.4 FAILED
Message-ID: <0101018cc5270f74-e3cfed1e-6515-4ab8-8a54-05bdea96c457-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:12:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193174

--===============3208903261415473328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcap-ng-python* to *0.8.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libcap-ng-python-upgrade-0.8.3-0.8.4.patch
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
From b069bebadee2d897686516e42315862aa16750e9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 12:42:20 +0000
Subject: [PATCH] libcap-ng-python: upgrade 0.8.3 -> 0.8.4

---
 .../{libcap-ng-python_0.8.3.bb => libcap-ng-python_0.8.4.bb}    | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                    | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.8.3.bb => libcap-ng-python_0.8.4.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.3.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.8.3.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 55e3287396..a6b5dcf452 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "bed6f6848e22bb2f83b5f764b2aef0ed393054e803a8e3a8711cb2a39e6b492d"
+SRC_URI[sha256sum] = "68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a"
 
 EXTRA_OECONF:append:class-target = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
 EXTRA_OECONF:append:class-nativesdk = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
-- 
2.42.0


--===============3208903261415473328==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-ng-python-upgrade-0.8.3-0.8.4.patch"

RnJvbSBiMDY5YmViYWRlZTJkODk3Njg2NTE2ZTQyMzE1ODYyYWExNjc1MGU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAxMjo0MjoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmNhcC1uZy1weXRob246IHVwZ3JhZGUgMC44LjMgLT4gMC44LjQKCi0tLQogLi4uL3tsaWJjYXAt
bmctcHl0aG9uXzAuOC4zLmJiID0+IGxpYmNhcC1uZy1weXRob25fMC44LjQuYmJ9ICAgIHwgMAog
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZy5pbmMgICAgICAgICAgICAg
ICAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy97bGliY2FwLW5nLXB5
dGhvbl8wLjguMy5iYiA9PiBsaWJjYXAtbmctcHl0aG9uXzAuOC40LmJifSAoMTAwJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLXB5dGhvbl8w
LjguMy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmctcHl0aG9u
XzAuOC40LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLXB5dGhvbl8wLjguMy5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZy1weXRob25fMC44LjQuYmIKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZy5pbmMKaW5kZXggNTVlMzI4
NzM5Ni4uYTZiNWRjZjQ1MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2Fw
LW5nL2xpYmNhcC1uZy5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xp
YmNhcC1uZy5pbmMKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkc7bWQ1PTk0ZDU1ZDUxMmE5YmEzNmNhYTliN2RmMDc5YmFlMTlmIFwKIAogU1JDX1VSSSA9
ICJodHRwczovL3Blb3BsZS5yZWRoYXQuY29tL3NncnViYi9saWJjYXAtbmcvbGliY2FwLW5nLSR7
UFZ9LnRhci5neiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJlZDZmNjg0OGUyMmJiMmY4M2I1
Zjc2NGIyYWVmMGVkMzkzMDU0ZTgwM2E4ZTNhODcxMWNiMmEzOWU2YjQ5MmQiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNjg1ODFkM2IzOGU3NTUzY2I2ZjZkZGY3ODEzYjFmYzk5ZTUyODU2ZjIxNDIx
ZjdiNDc3Y2U1YWJkMjYwNWE4YSIKIAogRVhUUkFfT0VDT05GOmFwcGVuZDpjbGFzcy10YXJnZXQg
PSAiIC0td2l0aC1jYXBhYmlsaXR5X2hlYWRlcj0ke1NUQUdJTkdfSU5DRElSfS9saW51eC9jYXBh
YmlsaXR5LmgiCiBFWFRSQV9PRUNPTkY6YXBwZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgLS13aXRo
LWNhcGFiaWxpdHlfaGVhZGVyPSR7U1RBR0lOR19JTkNESVJ9L2xpbnV4L2NhcGFiaWxpdHkuaCIK
LS0gCjIuNDIuMAoK

--===============3208903261415473328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1851 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (911 cached, 2 parsed). 1847 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d723b97b5c7a8dc8820f0cb36f280af67a1f1379"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d723b97b5c7a8dc8820f0cb36f280af67a1f1379"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 194 Local 106 Mirrors 0 Missed 88 Current 256 (54% match, 80% complete)
Removing 2 stale sstate objects for arch core2-64...done.
Removing 7 stale sstate objects for arch x86_64...done.
Removing 21 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 288 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 291 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 294 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 297 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 300 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 306 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 307 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 310 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 313 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 316 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 321 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 322 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 325 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 339 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 345 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 350 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 355 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_stash_locale_setscene)
NOTE: Running setscene task 356 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 357 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 384 of 450 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/swig/swig_4.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 385 of 450 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/swig/swig_4.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 414 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe swig-native-4.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe swig-native-4.1.1-r0: task do_create_spdx_setscene: Started
NOTE: Running noexec task 404 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running noexec task 534 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 560 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_fetch)
NOTE: Running setscene task 415 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 419 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 426 of 450 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 427 of 450 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 450 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb:do_create_spdx_setscene)
NOTE: recipe swig-native-4.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 576 of 1291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: Running task 611 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: Running task 616 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_fetch)
NOTE: Running task 617 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 618 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_fetch)
NOTE: Running task 619 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 642 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_fetch: Started
NOTE: recipe autoconf-archive-native-2023.02.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe autoconf-archive-native-2023.02.20-r0: task do_create_spdx_setscene: Started
NOTE: recipe swig-native-4.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: Running setscene task 437 of 450 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/swig/swig_4.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.2.0-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_recipe_qa: Started
NOTE: recipe zlib-1.3-r0: task do_fetch: Succeeded
NOTE: Running task 643 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 438 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.39.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 439 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 644 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_fetch)
NOTE: recipe openssl-3.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 645 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 646 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 647 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: Running task 649 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2023.02.20-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 650 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_unpack)
NOTE: Running task 651 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.39.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 653 of 1291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_unpack)
NOTE: Running task 654 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 655 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: recipe zlib-1.3-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Started
NOTE: recipe swig-native-4.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa unihash changed to 5d27ad9dd31905682c7b88bb9e937d0c2cfdd290233c8563f93a672300ad3618
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe autoconf-archive-native-2023.02.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Started
NOTE: recipe openssl-3.2.0-r0: task do_unpack: Started
NOTE: recipe swig-native-4.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-native-2.39.2-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.39.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 369 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 432 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 659 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_unpack)
NOTE: Running task 671 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 677 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_fetch)
NOTE: Running task 683 of 1291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: Running task 684 of 1291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_patch)
NOTE: Running task 705 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: Running task 706 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_patch)
NOTE: Running task 707 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: Running task 708 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_patch)
NOTE: Running task 709 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: Running task 710 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_patch)
NOTE: Running task 711 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 716 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_unpack)
NOTE: Running task 717 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Started
NOTE: recipe zlib-1.3-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe openssl-3.2.0-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
WARNING: libcap-ng-native-0.8.3-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.3.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-native-0.8.3-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.3.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.3.tar.gz_bad-checksum_bed6f6848e22bb2f83b5f764b2aef0ed393054e803a8e3a8711cb2a39e6b492d
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-native-2.39.2-r0: task do_patch: Started
NOTE: Running task 741 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 742 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 743 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: Running task 745 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Succeeded
NOTE: Running task 746 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 749 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 750 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3-r0: task do_patch: Succeeded
NOTE: Running task 754 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_fetch)
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: Running task 755 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 756 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_fetch)
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: Running task 761 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_fetch)
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Started
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 764 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_fetch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Started
NOTE: Running task 765 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: recipe xz-5.4.4-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_fetch: Succeeded
NOTE: Running task 766 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 767 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_unpack)
NOTE: Running task 768 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 769 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_unpack: Started
NOTE: recipe python3-3.11.5-r0: task do_fetch: Started
NOTE: recipe openssl-3.2.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: Running task 822 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa)
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Started
NOTE: Running task 857 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb:do_recipe_qa)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.39.2-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe xz-5.4.4-r0: task do_unpack: Started
NOTE: recipe python3-3.11.5-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 951 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_unpack)
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 952 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: Running task 953 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_patch)
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa: Started
NOTE: recipe libcap-ng-python-0.8.4-r0: task do_recipe_qa: Started
NOTE: recipe xz-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_unpack: Succeeded
NOTE: Running task 955 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_patch)
NOTE: Running task 956 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_patch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Succeeded
NOTE: Running task 957 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa unihash changed to 5066018d91fb10c45e70515ec1c40af8fc8c1122633043aecc7d6ded46c1193c
NOTE: recipe sqlite3-3_3.44.2-r0: task do_patch: Started
NOTE: recipe xz-5.4.4-r0: task do_patch: Started
NOTE: recipe python3-3.11.5-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Started
NOTE: recipe libcap-ng-python-0.8.4-r0: task do_recipe_qa: Succeeded
WARNING: libcap-ng-native-0.8.3-r0 do_fetch: Checksum failure encountered with download of https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.3.tar.gz - will attempt other sources if available
NOTE: recipe xz-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_patch: Succeeded
WARNING: libcap-ng-native-0.8.3-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.3.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-native-0.8.3-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.3.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.3.tar.gz_bad-checksum_bed6f6848e22bb2f83b5f764b2aef0ed393054e803a8e3a8711cb2a39e6b492d
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 436 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 958 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 963 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: Running task 964 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: Running task 965 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-python-0.8.4-r0: task do_fetch: Started
NOTE: recipe libcap-ng-python-0.8.4-r0: task do_fetch: Succeeded
NOTE: Running task 966 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-python-0.8.4-r0: task do_unpack: Started
NOTE: recipe libcap-ng-python-0.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 968 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb:do_patch)
NOTE: recipe libcap-ng-python-0.8.4-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Succeeded
NOTE: Running task 969 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_patch)
NOTE: recipe libcap-ng-python-0.8.4-r0: task do_patch: Succeeded
NOTE: Running task 970 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 971 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb:do_populate_lic)
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-python-0.8.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-python-0.8.4-r0: task do_populate_lic: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-python-0.8.4-r0: task do_populate_lic: Succeeded
WARNING: libcap-ng-0.8.3-r0 do_fetch: Checksum failure encountered with download of https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.3.tar.gz - will attempt other sources if available
NOTE: recipe libcap-ng-python-0.8.4-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: libcap-ng-0.8.3-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.3.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-0.8.3-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.3.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.3.tar.gz_bad-checksum_bed6f6848e22bb2f83b5f764b2aef0ed393054e803a8e3a8711cb2a39e6b492d
NOTE: recipe python3-3.11.5-r0: task do_unpack: Succeeded
NOTE: Running task 974 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_patch)
NOTE: recipe python3-3.11.5-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 445 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running task 976 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_unpack)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 450 of 450 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Succeeded
NOTE: Running task 991 of 1291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_patch: Started
NOTE: recipe python3-3.11.5-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_fetch: Failed
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Failed
NOTE: recipe linux-libc-headers-6.5-r0: task do_unpack: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 993 tasks of which 921 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101124150.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101124150.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch
Summary: There were 8 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: libcap-ng-native-0.8.3-r0 do_fetch: Checksum failure fetching https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.3.tar.gz
ERROR: libcap-ng-native-0.8.3-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.3.tar.gz\' has sha256 checksum \'bed6f6848e22bb2f83b5f764b2aef0ed393054e803a8e3a8711cb2a39e6b492d\' when \'68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "bed6f6848e22bb2f83b5f764b2aef0ed393054e803a8e3a8711cb2a39e6b492d"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.3.tar.gz')
ERROR: libcap-ng-0.8.3-r0 do_fetch: Checksum failure fetching https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.3.tar.gz
ERROR: libcap-ng-0.8.3-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.3.tar.gz\' has sha256 checksum \'bed6f6848e22bb2f83b5f764b2aef0ed393054e803a8e3a8711cb2a39e6b492d\' when \'68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "bed6f6848e22bb2f83b5f764b2aef0ed393054e803a8e3a8711cb2a39e6b492d"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.3.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/libcap-ng-native/0.8.3/temp/log.do_fetch.2572780
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libcap-ng/0.8.3/temp/log.do_fetch.2574849
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch) failed with exit code '1'

--===============3208903261415473328==--

