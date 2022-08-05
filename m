Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F38C32767
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.3948.1659679408215624079
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BLpFT/Es;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101826c99fbbe-bb6a10c9-8528-433a-990b-850653c85911-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=M6p9T6KzbhMdzD4ft8mWCsyqUqgdJi1fBUMjfH12eVI=;
	b=BLpFT/Es+pGk1QUAvPnFREgHRm6/G6snd7Z3jkjpAJ6gcbiYjNMto6n9riL+gSJ6
	mxVkDO5JxZOYA1ASq2VUbx9feQ+1nqhmIKYneGZ97XxEW9Mz+BVQyByYULkU5zjAIxH
	hDcGIcs+s+AaH+Gi0hOdAolFYuTPADUUMDwObpvU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=M6p9T6KzbhMdzD4ft8mWCsyqUqgdJi1fBUMjfH12eVI=;
	b=cwlC5wQMXBuxFxNMtSJ1mFALF6Xwb9zhGlYh7ZTY6L1jAW41jm+avZVJKzlr3/AK
	YApc2DanlztXziBIOIfTNR3ePpyrnXhxPWua2YWHe8bc0wAAu6OZcgaClVLX7UzNClA
	JyqG7IGcd1p1CP1VuT76L7MSEg+o0son9QhMkAvc=
Content-Type: multipart/mixed; boundary="===============7560580213603158760=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux: upgrading to 2.38.1 FAILED
Message-ID: 
 <010101826c99fbbe-bb6a10c9-8528-433a-990b-850653c85911-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:27 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168894

--===============7560580213603158760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux* to *2.38.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-upgrade-2.38-2.38.1.patch
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
--===============7560580213603158760==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-upgrade-2.38-2.38.1.patch"

RnJvbSBmMGU0MzEwMmU2ODEzOGRjZjZhMDg4MDVjMWQ0MjgyMDA2YzFjMmIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNCBBdWcgMjAyMiAyMToxNDozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHV0
aWwtbGludXg6IHVwZ3JhZGUgMi4zOCAtPiAyLjM4LjEKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUv
dXRpbC1saW51eC91dGlsLWxpbnV4LmluYyAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4u
L3V0aWwtbGludXgve3V0aWwtbGludXhfMi4zOC5iYiA9PiB1dGlsLWxpbnV4XzIuMzguMS5iYn0g
ICAgIHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgve3V0aWwtbGludXhfMi4zOC5iYiA9
PiB1dGlsLWxpbnV4XzIuMzguMS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC5pbmMKaW5kZXggYzliZGRmYjdhNi4uZjE1MTFmMDJhOCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYworKysgYi9t
ZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCkBAIC0zNyw0ICszNyw0
IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy91dGlsLWxpbnV4
L3Yke01BSk9SX1ZFUlNJT059L3V0aWwtbGluCiAgICAgICAgICAgIGZpbGU6Ly9hdm9pZF9wYXJh
bGxlbF90ZXN0cy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjZkMTExY2JlNGQ1NWIzMzZkYjJmMWZiZWZmYmM2NWI4OTkwODcwNGMwMTEzNjM3MWQzMmFhOWJl
YzM3M2ViNjQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjA0OTJhMTliNDRlNmNmOWEzZGRmZjY4
MzI1YjMzM2I4YjUyYjZjNTljZTNlYmQ2YTBlY2FhNGM1MTE3ZTg0ZiIKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjM4LmJiIGIvbWV0YS9yZWNp
cGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4XzIuMzguMS5iYgpzaW1pbGFyaXR5IGluZGV4
IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4
XzIuMzguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51
eF8yLjM4LjEuYmIKLS0gCjIuMzEuMQoK

--===============7560580213603158760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1659 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (886 cached, 2 parsed). 1659 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9d97433e20e6d78b04a3d8b85a7902d249a26f8a"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9d97433e20e6d78b04a3d8b85a7902d249a26f8a"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 328 Local 69 Mirrors 0 Missed 259 Current 233 (21% match, 53% complete)
Removing 4 stale sstate objects for arch allarch...done.
Removing 55 stale sstate objects for arch core2-32...done.
Removing 23 stale sstate objects for arch x86_64...done.
Removing 94 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 242 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 255 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 275 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 282 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 301 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 304 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 306 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 328 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 337 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 346 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 353 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 358 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 361 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 366 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 375 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 379 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 380 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 383 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 384 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 386 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 387 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 391 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 395 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 400 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 403 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 420 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 426 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 429 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 432 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 435 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 446 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 459 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 462 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 465 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 469 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 474 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 475 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 479 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 480 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 481 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 482 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 488 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 491 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 492 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 495 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 498 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 512 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 513 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 516 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 527 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iproute2-5.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_251.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.64-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-7.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iproute2-5.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_251.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.64-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 554 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-7.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 555 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 556 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 557 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 194 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_patch)
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 558 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 560 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 297 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: Running task 327 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_fetch)
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 335 of 1990 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_fetch)
NOTE: Running task 342 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_fetch)
NOTE: Running task 343 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 344 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: recipe file-5.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 379 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 408 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_fetch)
NOTE: Running task 409 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_fetch)
NOTE: Running task 417 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_fetch)
NOTE: Running task 428 of 1990 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-5.16-r0: task do_patch: Started
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 443 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_fetch)
NOTE: Running task 444 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_fetch)
NOTE: Running task 445 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_fetch)
NOTE: Running task 446 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_fetch)
NOTE: Running task 447 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_fetch)
NOTE: Running task 448 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 449 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_fetch)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: Running task 520 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_fetch)
NOTE: Running task 521 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_fetch)
NOTE: Running task 522 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_fetch: Started
NOTE: recipe file-5.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 573 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 595 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_fetch)
NOTE: Running task 599 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_fetch)
NOTE: Running task 625 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: recipe zlib-1.2.12-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running task 626 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: recipe flex-2.6.4-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_fetch: Started
NOTE: Running task 627 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.28-r0: task do_fetch: Started
NOTE: Running task 628 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: Running task 629 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch)
NOTE: Running task 630 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 631 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_fetch)
NOTE: Running task 632 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_fetch)
NOTE: Running task 634 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 640 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_fetch)
NOTE: Running task 649 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 655 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_fetch)
NOTE: Running task 675 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_fetch)
NOTE: Running task 676 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 686 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_write_config)
NOTE: Running task 690 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 692 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_fetch)
NOTE: Running task 700 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_write_config)
NOTE: Running task 701 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: Running task 702 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_fetch)
NOTE: Running task 703 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_fetch)
NOTE: Running task 705 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 706 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 707 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: Running task 708 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_fetch)
NOTE: Running task 711 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 712 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_fetch)
NOTE: Running task 714 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_fetch)
NOTE: Running task 718 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 720 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: recipe openssl-3.0.5-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_fetch: Started
NOTE: recipe readline-8.1.2-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe nettle-3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 721 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_fetch)
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_fetch: Started
WARNING: util-linux-libuuid-2.38-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-2.38-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz_bad-checksum_6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64
NOTE: Running task 722 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_unpack)
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 723 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: Running task 724 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_unpack)
NOTE: Running task 725 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_unpack)
NOTE: recipe xz-5.2.5-r0: task do_fetch: Started
NOTE: Running task 726 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_fetch)
NOTE: recipe cracklib-2.9.7-r0: task do_fetch: Started
NOTE: Running task 727 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_unpack)
NOTE: recipe sqlite3-3_3.39.1-r0: task do_fetch: Succeeded
NOTE: Running task 728 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_unpack)
NOTE: recipe readline-8.1.2-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 729 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.38.1-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.38.1-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 561 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_patch: Succeeded
NOTE: Running task 730 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: recipe python3-3.10.5-r0: task do_fetch: Started
NOTE: Running task 731 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 732 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_unpack)
NOTE: Running task 733 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_unpack)
NOTE: Running task 734 of 1990 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_unpack)
NOTE: recipe expat-2.4.8-r0: task do_fetch: Started
NOTE: Running task 735 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe expat-2.4.8-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_fetch: Started
NOTE: Running task 736 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_unpack)
NOTE: Running task 737 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_unpack)
NOTE: Running task 738 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: recipe libxml2-2.9.14-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: Running noexec task 740 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_configure)
NOTE: recipe libidn2-2.3.3-r0: task do_fetch: Started
NOTE: recipe curl-7.84.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.64-r0: task do_fetch: Started
NOTE: Running noexec task 741 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_compile)
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: Running task 742 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_install)
NOTE: Running task 743 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_unpack)
NOTE: Running task 744 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 745 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Running task 746 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: Running task 747 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_unpack)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.1-r0: task do_write_config: Started
NOTE: Running task 748 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_unpack)
NOTE: recipe libcap-2.64-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.84.0-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe file-5.42-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Started
NOTE: Running task 749 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: recipe python3-3.10.5-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.1-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: Running task 750 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_unpack)
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_write_config: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Succeeded
NOTE: Running task 751 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_unpack)
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_fetch: Started
NOTE: Running task 752 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_unpack)
NOTE: Running task 753 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_unpack)
NOTE: Running task 754 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 755 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_unpack)
NOTE: Running task 756 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_unpack)
NOTE: Running task 757 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_fetch)
NOTE: Running task 760 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_fetch)
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: Running task 761 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.36-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: Running task 762 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: Running task 764 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_fetch)
NOTE: Running task 767 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.5-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe util-linux-2.38.1-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 768 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: Running task 769 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: recipe elfutils-0.187-r0: task do_fetch: Started
NOTE: recipe nettle-3.8-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: Running task 770 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_unpack)
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Started
NOTE: Running task 772 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_unpack)
NOTE: Running task 775 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Succeeded
NOTE: Running task 776 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: Running task 777 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_unpack)
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: recipe file-5.42-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_unpack: Started
NOTE: Running task 778 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: recipe linux-libc-headers-5.16-r0: task do_install: Started
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Started
NOTE: Running task 779 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_unpack)
NOTE: recipe ncurses-6.3+20220423-r0: task do_unpack: Started
NOTE: Running task 780 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_unpack)
NOTE: Running task 781 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_unpack)
NOTE: Running task 782 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 783 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.28-r0: task do_unpack: Started
NOTE: recipe readline-8.1.2-r0: task do_unpack: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: Running task 784 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_unpack)
NOTE: recipe xz-5.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.7-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
WARNING: util-linux-libuuid-2.38-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-2.38-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz_bad-checksum_6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Succeeded
WARNING: util-linux-libuuid-2.38-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.tar.xz - will attempt other sources if available
NOTE: Running task 785 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe sqlite3-3_3.39.1-r0: task do_unpack: Succeeded
NOTE: Running task 786 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_patch)
NOTE: Running task 787 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_unpack)
NOTE: Running task 788 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 789 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 790 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_patch)
NOTE: recipe flex-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.38.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
NOTE: Running task 792 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
NOTE: Running task 793 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_patch)
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 794 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_patch)
NOTE: recipe libxcrypt-4.4.28-r0: task do_unpack: Succeeded
NOTE: Running task 795 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_patch)
NOTE: Running task 796 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_unpack: Succeeded
NOTE: Running task 797 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_patch)
NOTE: Running task 798 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 799 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_patch)
NOTE: Running task 800 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 801 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_patch)
NOTE: Running task 802 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: Running task 803 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Started
NOTE: recipe expat-2.4.8-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe libxml2-2.9.14-r0: task do_unpack: Started
NOTE: recipe libcap-2.64-r0: task do_unpack: Started
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.3-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.1-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: recipe curl-7.84.0-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.38.1-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_fetch: Started
NOTE: Running task 804 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_patch)
NOTE: recipe bash-5.1.16-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: Running task 805 of 1990 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 806 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: Running task 807 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe shadow-4.11.1-r0: task do_fetch: Started
NOTE: Running task 815 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Started
NOTE: recipe python3-3.10.5-r0: task do_unpack: Started
NOTE: Running task 821 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.3.bb:do_fetch)
NOTE: recipe shadow-4.11.1-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Started
NOTE: recipe expat-2.4.8-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe libcap-2.64-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Started
NOTE: recipe nettle-3.8-r0: task do_unpack: Started
NOTE: recipe file-5.42-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: Running task 824 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 825 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_patch)
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.2-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_patch: Started
NOTE: Running task 826 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe xz-5.2.5-r0: task do_unpack: Started
NOTE: Running task 827 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_patch)
NOTE: Running task 828 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: Running task 829 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_patch)
NOTE: recipe libidn2-2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.12-r0: task do_patch: Started
NOTE: recipe readline-8.1.2-r0: task do_patch: Started
NOTE: Running task 830 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_patch)
NOTE: recipe libtirpc-1.3.2-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_patch: Started
NOTE: recipe flex-2.6.4-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_unpack: Succeeded
NOTE: Running task 831 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: recipe libpam-1.5.2-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: Running task 832 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: Running task 833 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_patch)
NOTE: Running task 834 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: recipe openssl-3.0.5-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.7-r0: task do_patch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_patch: Started
NOTE: Running task 835 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe xz-5.2.5-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: Running task 836 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Started
NOTE: Running task 837 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_patch)
NOTE: recipe bash-5.1.16-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.8-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_unpack: Succeeded
NOTE: Running task 838 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: recipe kmod-30-r0: task do_fetch: Succeeded
NOTE: Running task 840 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_patch)
NOTE: Running task 841 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: Running task 843 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: Running task 845 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_unpack)
NOTE: recipe elfutils-0.187-r0: task do_unpack: Started
NOTE: Running task 846 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_unpack)
NOTE: recipe libtirpc-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe util-linux-native-2.38.1-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_unpack: Started
NOTE: recipe expat-2.4.8-r0: task do_patch: Started
NOTE: recipe libcap-2.64-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: recipe systemd-1_251.3-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_patch: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_patch: Started
NOTE: Running task 856 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_patch)
NOTE: Running task 860 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: Running task 864 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_unpack)
NOTE: Running task 872 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 873 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_unpack)
NOTE: Running task 878 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 893 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_patch)
NOTE: recipe libpam-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_251.3-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe expat-2.4.8-r0: task do_patch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_patch: Succeeded
NOTE: recipe curl-7.84.0-r0: task do_unpack: Succeeded
NOTE: Running task 903 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.3.bb:do_unpack)
NOTE: Running task 904 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_write_config)
NOTE: Running task 921 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: Running task 923 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_patch)
NOTE: Running task 924 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_write_config)
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Started
NOTE: Running task 945 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_generate_toolchain_file)
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Started
NOTE: Running task 951 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.3.bb:do_warn_musl)
NOTE: Running task 952 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.3.bb:do_write_config)
NOTE: Running task 960 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: Running task 964 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: Running task 965 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_fetch)
NOTE: Running task 979 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.18.0.bb:do_fetch)
NOTE: Running task 1014 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe nettle-3.8-r0: task do_patch: Started
NOTE: recipe xorgproto-2022.1-r0: task do_patch: Started
NOTE: Running task 1024 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.36-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_patch: Succeeded
WARNING: util-linux-libuuid-2.38-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-2.38-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz_bad-checksum_6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64
NOTE: recipe kmod-30-r0: task do_unpack: Started
NOTE: recipe bash-5.1.16-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: Running task 1025 of 1990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_fetch: Failed
NOTE: recipe file-5.42-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: recipe shadow-4.11.1-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_write_config: Started
NOTE: recipe zlib-1.2.12-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: recipe libcap-2.64-r0: task do_patch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.84.0-r0: task do_patch: Started
NOTE: recipe expat-2.4.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Started
NOTE: recipe iproute2-5.18.0-r0: task do_fetch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_write_config: Succeeded
NOTE: recipe iproute2-5.18.0-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_251.3-r0: task do_unpack: Started
NOTE: recipe xz-5.2.5-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_patch: Started
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_patch: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_fetch: Started
NOTE: recipe systemd-1_251.3-r0: task do_write_config: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_251.3-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_251.3-r0: task do_warn_musl: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.38.1-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_251.3-r0: task do_write_config: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Succeeded
WARNING: util-linux-libuuid-native-2.38-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.38-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz_bad-checksum_6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
WARNING: util-linux-libuuid-native-2.38-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.tar.xz - will attempt other sources if available
NOTE: recipe curl-7.84.0-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.8-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_251.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_install: Succeeded
WARNING: util-linux-libuuid-native-2.38-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.38-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz_bad-checksum_6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 1048 tasks of which 872 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_fetch
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_fetch
Summary: There were 13 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: util-linux-libuuid-2.38-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.tar.xz
ERROR: util-linux-libuuid-2.38-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz\' has sha256 checksum \'6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64\' when \'60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/util-linux-libuuid/2.38-r0/temp/log.do_fetch.3870316
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_fetch) failed with exit code '1'
ERROR: util-linux-libuuid-native-2.38-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.tar.xz
ERROR: util-linux-libuuid-native-2.38-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz\' has sha256 checksum \'6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64\' when \'60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/util-linux-libuuid-native/2.38-r0/temp/log.do_fetch.3870244
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_fetch) failed with exit code '1'

--===============7560580213603158760==--

