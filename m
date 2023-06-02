Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B290CCA469
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:46 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.7527.1685693431863737309
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GLZOfAYC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101887b287c98-0bb646fc-9bb9-483a-885c-20462583fa91-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693431;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=P+6bWtJHC0ZsIr1wDVC8tY/DuXexf8x7FRNmr5oqT+I=;
	b=GLZOfAYCJ8TE0G94m9NPMuYQALIEtSJBudNJfPR4cc7zvhgbZ8XkJFTOH2ZNfGEM
	PpQoyBpTybWEq7O+jQ8p2SEXVTKZ5z0MlRPccqex+URkb0RfI3Xv3oEDGPxosFLFOI4
	lTeKoYVKav/Z/G2vL6E9MprBbUQl9nM290qdDpf8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693431;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=P+6bWtJHC0ZsIr1wDVC8tY/DuXexf8x7FRNmr5oqT+I=;
	b=MCGWem/pqFb7sBmU8lclrFDlgz9ZeoJaxl7159gBYqxf8Bw6J6obP+IlVXA/QpKU
	j2ZlM2PMSgATvYtu2o2SksfTZCU7XT5+l/Ls3hUMmwxSd8YYDwCrYhU9MHAti+S1RFk
	EPpI+ax27wv9gA14HCPm5DkrGLQDJVQsf9Ts/3Q0=
Content-Type: multipart/mixed; boundary="===============3069501845694768808=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.26.4 FAILED
Message-ID: <010101887b287c98-0bb646fc-9bb9-483a-885c-20462583fa91-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182173

--===============3069501845694768808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.26.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.26.3-3.26.4.patch
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
--===============3069501845694768808==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.26.3-3.26.4.patch"

RnJvbSAxNzZlMjZhYzgxNGQ2M2M1MzMzMjdiZTRkNzY5ZjkxOTU1OWQwNGEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAwOTozMDozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlOiB1cGdyYWRlIDMuMjYuMyAtPiAzLjI2LjQKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlLmluYyAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiAuLi5ha2VEZXRl
cm1pbmVTeXN0ZW0tdXNlLW9lLWVudmlyb25tZW50LXZhcnMtdG8tbG9hZC5wYXRjaCB8IDYgKysr
LS0tCiAuLi4vY21ha2Uve2NtYWtlXzMuMjYuMy5iYiA9PiBjbWFrZV8zLjI2LjQuYmJ9ICAgICAg
ICAgICAgICB8IDAKIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS97Y21ha2VfMy4yNi4zLmJi
ID0+IGNtYWtlXzMuMjYuNC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFr
ZS5pbmMKaW5kZXggMmI2NTU0NjkwYi4uNzc4OGE1YzQ1YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y21ha2UvY21ha2UuaW5jCkBAIC0xOSw3ICsxOSw3IEBAIENNQUtFX01BSk9SX1ZFUlNJT04gPSAi
JHtAJy4nLmpvaW4oZC5nZXRWYXIoJ1BWJykuc3BsaXQoJy4nKVswOjJdKX0iCiBTUkNfVVJJID0g
Imh0dHBzOi8vY21ha2Uub3JnL2ZpbGVzL3Yke0NNQUtFX01BSk9SX1ZFUlNJT059L2NtYWtlLSR7
UFZ9LnRhci5neiBcCiAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiYmQ4ZDM5MjE3NTA5ZDE2
M2NiNTQ0YTQwZDY0MjhhYzY2NmRkYzgzZTIyOTA1ZDNlNTJjOTI1NzgxZjBmNjU5IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjMxM2I2ODgwYzI5MWJkNGZlMzFjMGFhNTFkNmU2MjY1OTI4MmE1MjFl
Njk1ZjMwZDVjYzBkMjVhYmJkNWMyMDgiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImNtYWtl
LSg/UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZURldGVybWluZVN5c3RlbS11c2Utb2UtZW52
aXJvbm1lbnQtdmFycy10by1sb2FkLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtl
L2NtYWtlLzAwMDEtQ01ha2VEZXRlcm1pbmVTeXN0ZW0tdXNlLW9lLWVudmlyb25tZW50LXZhcnMt
dG8tbG9hZC5wYXRjaAppbmRleCBkMTNjMzY3ZTc4Li4yOGIwODU3MDA1IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZURldGVybWluZVN5c3Rl
bS11c2Utb2UtZW52aXJvbm1lbnQtdmFycy10by1sb2FkLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlRGV0ZXJtaW5lU3lzdGVtLXVzZS1vZS1l
bnZpcm9ubWVudC12YXJzLXRvLWxvYWQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVhY2Zj
YjJhYmExYTU2NDFkMzkwNTU4ZmRmMjg4MzczZjVlMzljYjUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDY2YzQ5MjdjYTVjYjlkMTJlYzc2ZWRlN2RlY2MyYWNhNzkzNWI0M2MgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDb2R5IFAgU2NoYWZlciA8ZGV2QGNvZHlwcy5jb20+
CiBEYXRlOiBUaHUsIDI3IEFwciAyMDE3IDExOjM1OjA1IC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hd
IENNYWtlRGV0ZXJtaW5lU3lzdGVtOiB1c2Ugb2UgZW52aXJvbm1lbnQgdmFycyB0byBsb2FkIGRl
ZmF1bHQKQEAgLTI1LDEwICsyNSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBPdGF2aW8gU2FsdmFkb3Ig
PG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyPgogIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykKIAogZGlmZiAtLWdpdCBhL01vZHVsZXMvQ01ha2VEZXRlcm1pbmVTeXN0ZW0uY21ha2UgYi9N
b2R1bGVzL0NNYWtlRGV0ZXJtaW5lU3lzdGVtLmNtYWtlCi1pbmRleCAyYzJjMmFjMy4uZmFlNGY5
N2YgMTAwNjQ0CitpbmRleCBkNGRjYzYyZi4uYjJhOTI4Y2EgMTAwNjQ0CiAtLS0gYS9Nb2R1bGVz
L0NNYWtlRGV0ZXJtaW5lU3lzdGVtLmNtYWtlCiArKysgYi9Nb2R1bGVzL0NNYWtlRGV0ZXJtaW5l
U3lzdGVtLmNtYWtlCi1AQCAtMTEyLDYgKzExMiwxMyBAQCBlbHNlKCkKK0BAIC0xMzYsNiArMTM2
LDEzIEBAIGVsc2UoKQogICAgZW5kaWYoKQogIGVuZGlmKCkKICAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI2LjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2UvY21ha2VfMy4yNi40LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4yNi4zLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4yNi40LmJiCi0tIAoyLjM5LjIK
Cg==

--===============3069501845694768808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1800 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (895 cached, 2 parsed). 1800 targets, 37 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b7780a04623cdcdb3ef91e5edef1b8e5f9df48ca"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 95 Local 33 Mirrors 0 Missed 62 Current 139 (34% match, 73% complete)
Removing 4 stale sstate objects for arch core2-32...done.
Removing 20 stale sstate objects for arch qemux86...done.
Removing 11 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 150 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 156 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 157 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 160 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 163 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 166 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 169 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 175 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 176 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 179 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 184 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 187 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 190 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 195 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 196 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 201 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 206 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_stash_locale_setscene)
NOTE: Running setscene task 207 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 208 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 211 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 212 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 216 of 234 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 302 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.26.3.bb:do_fetch)
NOTE: recipe zstd-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running noexec task 342 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running noexec task 432 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_fetch)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 549 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.26.4.bb:do_fetch)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_stash_locale_setscene: Started
NOTE: recipe cmake-native-3.26.3-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Started
WARNING: cmake-native-3.26.3-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.26.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.26.3-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.26.3.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.26.3.tar.gz_bad-checksum_bbd8d39217509d163cb544a40d6428ac666ddc83e22905d3e52c925781f0f659
NOTE: recipe zstd-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 550 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_fetch)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 551 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 552 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 553 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_fetch)
NOTE: Running task 554 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 555 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 556 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 557 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_fetch)
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 558 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_fetch)
NOTE: Running task 559 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_fetch)
NOTE: Running task 560 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: Running task 561 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 562 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 563 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 564 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 565 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_fetch)
NOTE: Running task 566 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cmake-3.26.4-r0: task do_fetch: Started
NOTE: recipe libgcc-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cmake-3.26.4-r0: task do_fetch: Succeeded
NOTE: Running task 567 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.26.4.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe xz-5.4.3-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.4-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 572 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_unpack)
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: Running task 573 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 574 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 575 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: Running task 576 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_unpack)
NOTE: Running task 577 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_unpack)
NOTE: Running task 578 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: Running task 579 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: Running task 580 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe openssl-3.1.0-r0: task do_fetch: Succeeded
NOTE: recipe cmake-3.26.4-r0: task do_unpack: Started
NOTE: Running task 581 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 582 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_unpack)
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 583 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: Running task 584 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_unpack)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: Running task 585 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: Running task 586 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 587 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 588 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: recipe zstd-1.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 589 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.37-r1: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 228 of 234 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 229 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 230 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe xz-5.4.3-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.0-r0: task do_unpack: Started
NOTE: recipe curl-8.1.1-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.4-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: Running task 594 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: Running task 595 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_patch)
NOTE: recipe libgcc-initial-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: Running task 596 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: recipe glibc-2.37-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 597 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_patch)
NOTE: recipe util-linux-native-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 598 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe zlib-1.2.13-r0: task do_patch: Started
NOTE: recipe glibc-2.37-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 599 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: Running task 600 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 601 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: Running task 602 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe libgcc-initial-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 231 of 234 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_patch: Started
NOTE: Running task 604 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe glibc-2.37-r1: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: Running task 608 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: Running task 610 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.37-r1: task do_fetch: Succeeded
NOTE: Running task 612 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 613 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_unpack)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 617 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: recipe zstd-1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 619 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.37-r1: task do_unpack: Started
NOTE: Running task 639 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe curl-8.1.1-r0: task do_patch: Started
NOTE: recipe openssl-3.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 640 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_patch)
NOTE: recipe curl-8.1.1-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: Running task 643 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe openssl-3.1.0-r0: task do_patch: Started
NOTE: recipe zstd-1.5.4-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.26.4-r0: task do_unpack: Succeeded
NOTE: Running task 649 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.26.4.bb:do_patch)
WARNING: cmake-native-3.26.3-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.26/cmake-3.26.3.tar.gz - will attempt other sources if available
NOTE: recipe cmake-3.26.4-r0: task do_patch: Started
NOTE: recipe cmake-3.26.4-r0: task do_patch: Succeeded
NOTE: Running task 650 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.26.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 651 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.26.4.bb:do_generate_toolchain_file)
NOTE: Running task 652 of 913 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.26.4.bb:do_populate_lic)
WARNING: cmake-native-3.26.3-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.26.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.26.3-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.26.3.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.26.3.tar.gz_bad-checksum_bbd8d39217509d163cb544a40d6428ac666ddc83e22905d3e52c925781f0f659
NOTE: recipe cmake-native-3.26.3-r0: task do_fetch: Failed
NOTE: recipe cmake-3.26.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cmake-3.26.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe cmake-3.26.4-r0: task do_populate_lic: Started
NOTE: recipe cmake-3.26.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cmake-3.26.4-r0: task do_populate_lic: Succeeded
NOTE: recipe cmake-3.26.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe glibc-2.37-r1: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 652 tasks of which 589 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.26.3.bb:do_fetch
Summary: There were 6 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cmake-native-3.26.3-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.26/cmake-3.26.3.tar.gz
ERROR: cmake-native-3.26.3-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.26.3.tar.gz\' has sha256 checksum \'bbd8d39217509d163cb544a40d6428ac666ddc83e22905d3e52c925781f0f659\' when \'313b6880c291bd4fe31c0aa51d6e62659282a521e695f30d5cc0d25abbd5c208\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "bbd8d39217509d163cb544a40d6428ac666ddc83e22905d3e52c925781f0f659"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.26/cmake-3.26.3.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cmake-native/3.26.3-r0/temp/log.do_fetch.1776015
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.26.3.bb:do_fetch) failed with exit code '1'

--===============3069501845694768808==--

