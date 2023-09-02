Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD82CCF998
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:27 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5676.1693650553235930897
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CAOXC6MI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=L2of8GO+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018a55709469-41f4cb73-6f40-4f4f-b16c-36c927353bdf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650556;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=bjmbLkHXoS5crKeOXP7jSAxXl8IuYE+WdN2BSiy3ydw=;
	b=CAOXC6MIjnnXU38hjGbl1rCgWgtoZTl1nU3n+UiDg9lNpEykEneeHiro36bQD1HB
	RHjT6D4W+BCFtomqzFK6pRJal7TmnLEgL8v/9FupzlEGAAQlPcQzU46zqBXu+74By5i
	SkOAdsw6FgyPRHsLwAKibOItg9mn+yUbeyKwkkJ8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650556;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=bjmbLkHXoS5crKeOXP7jSAxXl8IuYE+WdN2BSiy3ydw=;
	b=L2of8GO+ToiTomCQwEp4PBOEDVrb1YQSQpeIDE2Eaokz3T2tEwAHkUgP0cAZHKnn
	eW3/4GE/8QVu+DFSNAE+b4mZLi1/jQGur2erwQcxmoqvHOHsRtU8ppa9xLTFUJLL7eP
	b4S0LGCzSPaQcBq3IHMZ3Srfi1M43Oc+moAjwAuE=
Content-Type: multipart/mixed; boundary="===============6532814264348967644=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] gnutls: upgrading to 3.8.1 FAILED
Message-ID: <0101018a55709469-41f4cb73-6f40-4f4f-b16c-36c927353bdf-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187135

--===============6532814264348967644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnutls* to *3.8.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gnutls-upgrade-3.8.0-3.8.1.patch
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
From 86f9fada637a483912943f60697922d5d868bfe2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 2 Sep 2023 07:07:00 +0000
Subject: [PATCH] gnutls: upgrade 3.8.0 -> 3.8.1

---
 .../recipes-support/gnutls/{gnutls_3.8.0.bb => gnutls_3.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.0.bb => gnutls_3.8.1.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.0.bb b/meta/recipes-support/gnutls/gnutls_3.8.1.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.0.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.1.bb
index 1e3f34b6c5..455031dd47 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.0.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "0ea0d11a1660a1e63f960f157b197abe6d0c8cb3255be24e1fb3815930b9bdc5"
+SRC_URI[sha256sum] = "ba8b9e15ae20aba88f44661978f5b5863494316fe7e722ede9d069fe6294829c"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
-- 
2.39.2


--===============6532814264348967644==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnutls-upgrade-3.8.0-3.8.1.patch"

RnJvbSA4NmY5ZmFkYTYzN2E0ODM5MTI5NDNmNjA2OTc5MjJkNWQ4NjhiZmUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMiBTZXAgMjAyMyAwNzowNzowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdu
dXRsczogdXBncmFkZSAzLjguMCAtPiAzLjguMQoKLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0L2du
dXRscy97Z251dGxzXzMuOC4wLmJiID0+IGdudXRsc18zLjguMS5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnV0bHMve2dudXRsc18zLjguMC5iYiA9PiBnbnV0bHNfMy44LjEuYmJ9ICg5
NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjgu
MC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjEuYmIKc2ltaWxh
cml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2du
dXRsc18zLjguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRs
c18zLjguMS5iYgppbmRleCAxZTNmMzRiNmM1Li40NTUwMzFkZDQ3IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuOC4wLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjEuYmIKQEAgLTI1LDcgKzI1LDcgQEAgU1JDX1VS
SSA9ICJodHRwczovL3d3dy5nbnVwZy5vcmcvZnRwL2djcnlwdC9nbnV0bHMvdiR7U0hSVF9WRVJ9
L2dudXRscy0ke1BWfS50YXIKICAgICAgICAgICAgZmlsZTovL0FkZC1wdGVzdC1zdXBwb3J0LnBh
dGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGVhMGQxMWExNjYw
YTFlNjNmOTYwZjE1N2IxOTdhYmU2ZDBjOGNiMzI1NWJlMjRlMWZiMzgxNTkzMGI5YmRjNSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJiYThiOWUxNWFlMjBhYmE4OGY0NDY2MTk3OGY1YjU4NjM0OTQz
MTZmZTdlNzIyZWRlOWQwNjlmZTYyOTQ4MjljIgogCiBpbmhlcml0IGF1dG90b29scyB0ZXhpbmZv
IHBrZ2NvbmZpZyBnZXR0ZXh0IGxpYl9wYWNrYWdlIGd0ay1kb2MgcHRlc3QKIAotLSAKMi4zOS4y
Cgo=

--===============6532814264348967644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-33aaee0d29c58a432aaab5d4d9e9c56df17f7d16"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:33aaee0d29c58a432aaab5d4d9e9c56df17f7d16"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 306 Local 139 Mirrors 0 Missed 167 Current 294 (45% match, 72% complete)
Removing 56 stale sstate objects for arch qemux86...done.
Removing 4 stale sstate objects for arch x86_64...done.
Removing 10 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Running setscene task 300 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 303 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 306 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 310 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 313 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 314 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 317 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 320 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 329 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 356 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 359 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 366 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 395 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 398 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 403 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 404 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 407 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 409 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 425 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 434 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 435 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 452 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 453 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 461 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 468 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 473 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 474 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 475 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 476 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 482 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 488 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 489 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 495 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 500 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_stash_locale_setscene)
NOTE: Running setscene task 501 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 504 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 505 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 600 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 521 of 600 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-locale-2.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running noexec task 328 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 537 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_recipe_qa_setscene)
NOTE: Running noexec task 479 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: Running task 481 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: Running task 507 of 1686 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_recipe_qa)
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.38-r0: task do_stash_locale_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 538 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 539 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 540 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-locale-2.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 541 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 542 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_recipe_qa_setscene)
NOTE: Running task 666 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 667 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 668 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: Running task 673 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: Running task 681 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 689 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 720 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 721 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_recipe_qa)
NOTE: Running task 723 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 725 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_fetch)
NOTE: Running task 726 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_fetch)
NOTE: Running task 728 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: Running task 734 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_fetch)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 750 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 753 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 543 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 544 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa_setscene)
NOTE: Running task 804 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_fetch)
NOTE: Running setscene task 545 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running task 805 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_fetch)
NOTE: Running task 815 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 547 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 548 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 600 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 552 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_recipe_qa_setscene)
NOTE: Running task 831 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_fetch)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 553 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 835 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 844 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe gnutls-native-3.8.1-r0: task do_recipe_qa: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: Running setscene task 554 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 555 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 556 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 845 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: Running noexec task 852 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_fetch)
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 859 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: Running task 863 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: Running setscene task 557 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: recipe libcap-2.69-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Started
NOTE: Running task 864 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Started
NOTE: Running task 865 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_fetch: Succeeded
NOTE: Running setscene task 558 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 866 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_recipe_qa: Started
NOTE: Running setscene task 559 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 560 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 867 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: Running task 868 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 869 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 562 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 870 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_unpack)
NOTE: Running task 872 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Started
NOTE: recipe binutils-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 874 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_fetch)
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 563 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 881 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 883 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running setscene task 564 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 565 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 884 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 885 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_unpack)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Succeeded
NOTE: Running task 887 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 888 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_collect_spdx_deps: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 890 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_fetch)
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 891 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_unpack)
NOTE: Running task 892 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 893 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_fetch: Started
NOTE: Running task 903 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: Running task 904 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_unpack)
NOTE: Running task 905 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe glibc-2.38-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libcap-2.69-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 567 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 568 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe curl-8.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Succeeded
NOTE: Running task 909 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: Running setscene task 570 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running task 911 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_fetch)
NOTE: Running task 913 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_fetch)
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 571 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running task 915 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 916 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: Running task 918 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 919 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_unpack)
NOTE: Running task 920 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_unpack)
NOTE: Running task 921 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_patch)
NOTE: recipe libarchive-3.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 572 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 573 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_recipe_qa_setscene)
NOTE: Running task 924 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe libedit-20221030-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_fetch: Started
NOTE: Running setscene task 574 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Started
NOTE: Running task 925 of 1686 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_fetch)
NOTE: Running task 926 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: Running task 927 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 575 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 576 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 577 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: Running task 928 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 578 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 579 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 580 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 582 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: Running task 929 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: Running setscene task 583 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 584 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 930 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_fetch)
NOTE: recipe libcap-2.69-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_fetch: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_patch: Started
NOTE: recipe libarchive-3.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_unpack: Started
NOTE: Running task 931 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_fetch: Started
NOTE: recipe elfutils-0.189-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Started
NOTE: Running task 932 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_patch)
NOTE: Running task 933 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe psmisc-23.6-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 934 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: Running task 935 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe glibc-2.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 936 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_fetch)
NOTE: Running task 937 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_patch)
NOTE: Running task 939 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_fetch)
NOTE: Running task 940 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_unpack)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Succeeded
NOTE: Running setscene task 585 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 943 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: Running task 945 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 946 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_fetch: Started
NOTE: Running setscene task 586 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 947 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: Running task 948 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_unpack)
NOTE: recipe mpfr-4.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_unpack: Started
NOTE: Running task 949 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_patch)
NOTE: recipe libcap-2.69-r0: task do_patch: Started
NOTE: recipe libarchive-3.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 951 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 953 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_fetch)
NOTE: recipe gnutls-native-3.8.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 955 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: Running task 957 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: recipe glibc-2.38-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Started
NOTE: Running task 958 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-native-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_unpack: Started
NOTE: recipe xz-5.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: Running task 960 of 1686 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_unpack)
NOTE: Running task 961 of 1686 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Started
NOTE: Running setscene task 587 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 589 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 590 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: Running task 962 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Started
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe psmisc-23.6-r0: task do_unpack: Started
NOTE: Running setscene task 591 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 963 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_unpack)
NOTE: recipe mpfr-4.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 592 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 593 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.1-r0: task do_fetch: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 965 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Started
NOTE: recipe python3-3.11.4-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: Running task 968 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_fetch)
NOTE: Running task 969 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_fetch)
NOTE: Running task 971 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_fetch)
NOTE: Running task 972 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: Running task 973 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_unpack: Started
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 975 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_fetch)
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_fetch: Succeeded
NOTE: recipe file-5.45-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Succeeded
NOTE: Running task 976 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: Running task 978 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 594 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 979 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 595 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 596 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 980 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: Running task 995 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.1-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_unpack: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_fetch: Started
NOTE: recipe curl-8.2.1-r0: task do_fetch: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_fetch: Succeeded
NOTE: Running task 997 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_patch)
NOTE: Running task 998 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 999 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1000 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_unpack: Started
NOTE: recipe shadow-4.13-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 597 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1002 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_fetch)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: Running task 1003 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1004 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_unpack)
NOTE: Running task 1005 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_unpack)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_patch: Succeeded
NOTE: Running task 1008 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_unpack)
NOTE: Running task 1010 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 1011 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_unpack)
NOTE: Running task 1012 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe glibc-2.38-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 84b6d6ea57f547a7367969ea5b14af073f9a724b46599de1def3c55bd473fc29
NOTE: Running task 1013 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Succeeded
NOTE: Running task 1015 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_configure)
NOTE: Running task 1017 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1018 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: Running task 1019 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_unpack)
NOTE: recipe libpam-1.5.3-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: Running task 1021 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: recipe file-5.45-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_unpack: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1024 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1027 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: Running setscene task 598 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: Running task 1028 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.0-r0: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: Running task 1029 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe tzdata-2023c-r0: task do_configure: Started
NOTE: recipe libarchive-3.7.1-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: recipe zlib-1.2.13-r0: task do_patch: Succeeded
NOTE: Running task 1030 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1031 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_patch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1033 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_unpack)
NOTE: recipe xz-5.4.3-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 1034 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_patch)
NOTE: Running task 1036 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_fetch)
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1037 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_unpack)
NOTE: Running task 1038 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_patch)
NOTE: Running task 1039 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.38-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_unpack: Started
NOTE: Running task 1041 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_patch: Started
NOTE: recipe libcap-2.69-r0: task do_patch: Succeeded
NOTE: Running task 1042 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_unpack)
NOTE: Running task 1043 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.6.2-r0: task do_patch: Started
NOTE: Running task 1044 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Succeeded
NOTE: Running task 1045 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_patch)
NOTE: Running task 1047 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 1048 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: recipe xz-5.4.3-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1049 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_patch)
NOTE: recipe openssl-3.1.2-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_patch: Started
NOTE: recipe coreutils-9.3-r0: task do_patch: Started
NOTE: Running task 1052 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Started
NOTE: Running task 1054 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_unpack)
NOTE: Running task 1055 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe shadow-4.13-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe xz-5.4.3-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_unpack: Succeeded
NOTE: Running task 1057 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_patch)
NOTE: Running task 1058 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_patch)
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Started
NOTE: Running task 1059 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_patch)
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe libpam-1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1062 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe openssl-3.1.2-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1064 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: Running task 1066 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_patch)
NOTE: Running task 1067 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: recipe libedit-20221030-3.1-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe xz-5.4.3-r0: task do_patch: Started
NOTE: recipe shadow-4.13-r0: task do_patch: Started
NOTE: recipe tzdata-2023c-r0: task do_configure: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1069 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_compile)
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe xz-5.4.3-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1070 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_unpack: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Succeeded
NOTE: Running task 1074 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe curl-8.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1077 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 1079 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe tzdata-2023c-r0: task do_compile: Started
NOTE: Running task 1080 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_patch)
NOTE: recipe gnutls-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_unpack: Succeeded
NOTE: Running task 1082 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: Running task 1083 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_patch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe coreutils-9.3-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe file-5.45-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1090 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_unpack: Succeeded
NOTE: Running task 1094 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_patch)
NOTE: recipe tzdata-2023c-r0: task do_compile: Succeeded
NOTE: Running task 1095 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_patch)
NOTE: recipe openssl-3.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1096 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe file-5.45-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_patch: Failed
NOTE: Running task 1097 of 1686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_patch)
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_patch: Succeeded
NOTE: recipe file-5.45-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_patch: Succeeded
NOTE: recipe gnutls-native-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_patch: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_patch: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_install: Succeeded
NOTE: recipe binutils-2.41-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.38-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1097 tasks of which 933 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_patch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gnutls-3.8.1-r0 do_patch: QA Issue: Fuzz detected:

Applying patch arm_eabi.patch
patching file tests/seccomp.c
Hunk #1 succeeded at 55 with fuzz 1 (offset 3 lines).


The context lines in the patches can be updated with devtool:

    devtool modify gnutls
    devtool finish --force-patch-refresh gnutls <layer_path>

Don't forget to review changes done by devtool!

Patch log indicates that patches do not apply cleanly. [patch-fuzz]
ERROR: gnutls-3.8.1-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gnutls/3.8.1/temp/log.do_patch.2850847
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_patch) failed with exit code '1'

--===============6532814264348967644==--

