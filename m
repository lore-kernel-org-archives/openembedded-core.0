Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8663C64E77
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.46760.1669908625001742040
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AEGWT66A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010184ce4f7db1-b217a30e-5279-4317-b8e2-815a3d532813-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=y5gWZe2rgzDFP2b7+tJejMKvSq1REj1FokQD5cgawAc=;
	b=AEGWT66AFUCYa+Wr10pN9s+pBmVsVZX955QnsLPrPqDZOT/pSzgpDMDi6GQvRzq4
	Pva3Kagkt+MwD9Horg6dXba4Vqivu7wcY2u/MpJfpQUdf1ygA4tu7RFkgwKQUhjTh+M
	UNenv7qQUCLuxY74LfTyuJ3ZKUdOGzhPrmfX+AxQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=y5gWZe2rgzDFP2b7+tJejMKvSq1REj1FokQD5cgawAc=;
	b=BsLXo8WhxYvhU1cNb66arX8GJ/RM2zKmHkzlHT6dTY6jCDRW2ek/rfU5bFi4XLPv
	OIJMuG0VczYyLzcFSdrYf4eqWoNgryuMPbgOlBvpOX0iTMMfa0H0qGLjVfLUMHBCYJj
	l2Pc2D9fJE9IZpiXpgDdpnCQtUSsFvbESGz2Zf/o=
Content-Type: multipart/mixed; boundary="===============9161189576520444304=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ghostscript: upgrading to 10.0.0 FAILED
Message-ID: <01010184ce4f7db1-b217a30e-5279-4317-b8e2-815a3d532813-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174157

--===============9161189576520444304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ghostscript* to *10.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ghostscript-upgrade-9.56.1-10.0.0.patch
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
--===============9161189576520444304==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ghostscript-upgrade-9.56.1-10.0.0.patch"

RnJvbSA2MmUxMGMyOTFiZWU5ZDIyMTk2NTk2ZGUyMTNkODMyMDViM2I4NDMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxMDo1MDozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdo
b3N0c2NyaXB0OiB1cGdyYWRlIDkuNTYuMSAtPiAxMC4wLjAKCi0tLQogLi4uL2ZpbGVzL2RvLW5v
dC1jaGVjay1sb2NhbC1saWJwbmctc291cmNlLnBhdGNoICAgICAgICAgIHwgOCArKysrLS0tLQog
Li4uL3tnaG9zdHNjcmlwdF85LjU2LjEuYmIgPT4gZ2hvc3RzY3JpcHRfMTAuMC4wLmJifSAgICAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L3tnaG9zdHNjcmlwdF85
LjU2LjEuYmIgPT4gZ2hvc3RzY3JpcHRfMTAuMC4wLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9maWxlcy9kby1ub3QtY2hlY2stbG9jYWwt
bGlicG5nLXNvdXJjZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9m
aWxlcy9kby1ub3QtY2hlY2stbG9jYWwtbGlicG5nLXNvdXJjZS5wYXRjaAppbmRleCBhOWFmYjk5
NDhjLi5jNzg0MzA2YmU5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3Rz
Y3JpcHQvZmlsZXMvZG8tbm90LWNoZWNrLWxvY2FsLWxpYnBuZy1zb3VyY2UucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2ZpbGVzL2RvLW5vdC1jaGVjay1sb2Nh
bC1saWJwbmctc291cmNlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyYWRhYTczNjYwNjRh
OGYxOGFmODY0ZWRhNzRlNTI4NzdhODk2MjBjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAxODcyN2ZhNjI5N2VkMWFhNWI2MjYzMGNkYzQ5ZTM0MTVjYjAyZGFjIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgog
RGF0ZTogTW9uLCAxOCBKYW4gMjAxNiAwMTowMDozMCAtMDUwMAogU3ViamVjdDogW1BBVENIXSBj
b25maWd1cmUuYWM6IGRvIG5vdCBjaGVjayBsb2NhbCBwbmcgc291cmNlCkBAIC0xNywxMiArMTcs
MTIgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCA2OThhYmQzLi5lNjVh
YzhiIDEwMDY0NAoraW5kZXggYmI1NzgyNS4uMzg5YzQ3MyAxMDA2NDQKIC0tLSBhL2NvbmZpZ3Vy
ZS5hYwogKysrIGIvY29uZmlndXJlLmFjCi1AQCAtMTI0MSw3ICsxMjQxLDcgQEAgZWxzZQorQEAg
LTE0NDEsNyArMTQ0MSw3IEBAIGVsc2UKICAgIFBOR0RFVlM9JycKLSAgIFBOR0RFVlNfQUxMPSdw
bmc0OCBwbmcxNm0gcG5nZ3JheSBwbmdtb25vIHBuZ21vbm9kIHBuZzI1NiBwbmcxNiBwbmdhbHBo
YScKKyAgIFBOR0RFVlNfQUxMPSdwbmc0OCBwbmcxNm0gcG5nZ3JheSBwbmdtb25vIHBuZ21vbm9k
IHBuZzI1NiBwbmcxNiBwbmdhbHBoYSBwbmcxNm1hbHBoYScKICAgIEFDX01TR19DSEVDS0lORyhb
Zm9yIGxvY2FsIHBuZyBsaWJyYXJ5IHNvdXJjZV0pCiAtICBpZiB0ZXN0IC1mICRzcmNkaXIvbGli
cG5nL3BuZ3JlYWQuYzsgdGhlbgogKyAgaWYgZmFsc2U7IHRoZW4KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdF85LjU2LjEuYmIgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHRfMTAuMC4wLmJiCnNpbWls
YXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNj
cmlwdC9naG9zdHNjcmlwdF85LjU2LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdF8xMC4wLjAuYmIKaW5kZXggZTcxYTZjYzBkMy4uNDVl
YWZhNGUyZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2do
b3N0c2NyaXB0XzkuNTYuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3Jp
cHQvZ2hvc3RzY3JpcHRfMTAuMC4wLmJiCkBAIC00NCw3ICs0NCw3IEBAIFNSQ19VUkk6Y2xhc3Mt
bmF0aXZlID0gIiR7U1JDX1VSSV9CQVNFfSBcCiAgICAgICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vYmFzZS1nZW5odC5jLWFkZC1hLXByZXByb2Nlc3Nvci1kZWZpbmUtdG8tYWxsb3ctZm9wZS5w
YXRjaCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICIxNTk4YjlhMzg2NTljY2U4NDQ4ZDQyYTczMDU0YjJmOWNiZmNjNDBhOWI5N2VlZWM1ZjIyZDRk
NmNkMWRlOGU2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImE1Nzc2NGQ3MGNhZjg1ZTJmYzBiMGY1
OWI4M2I5MmUyNTc3NTYzMTcxNGRjZGI5N2NjNmUwY2VhNDE0YmI1YTMiCiAKICMgUHV0IHNvbWV0
aGluZyBsaWtlCiAjCi0tIAoyLjMxLjEKCg==

--===============9161189576520444304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1668 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1668 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cadde942b835f83aeff25aea9199210307eb3547"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 140 Local 131 Mirrors 0 Missed 9 Current 334 (93% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1604 of 1697 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb:do_fetch)
NOTE: Running task 1605 of 1697 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb:do_fetch)
NOTE: recipe ghostscript-10.0.0-r0: task do_fetch: Started
NOTE: recipe ghostscript-native-10.0.0-r0: task do_fetch: Started
NOTE: recipe ghostscript-10.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1676 of 1697 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb:do_unpack)
NOTE: recipe ghostscript-native-10.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1677 of 1697 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb:do_unpack)
NOTE: Running task 1678 of 1697 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe ghostscript-10.0.0-r0: task do_unpack: Started
NOTE: recipe ghostscript-native-10.0.0-r0: task do_unpack: Started
NOTE: recipe ghostscript-native-10.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ghostscript-native-10.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ghostscript-10.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1679 of 1697 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb:do_patch)
NOTE: recipe ghostscript-10.0.0-r0: task do_patch: Started
NOTE: recipe ghostscript-10.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1680 of 1697 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1681 of 1697 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb:do_populate_lic)
NOTE: recipe ghostscript-10.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ghostscript-10.0.0-r0: task do_populate_lic: Started
NOTE: recipe ghostscript-10.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe ghostscript-10.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ghostscript-native-10.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1682 of 1697 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb:do_patch)
NOTE: recipe ghostscript-native-10.0.0-r0: task do_patch: Started
NOTE: recipe ghostscript-native-10.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1683 of 1697 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ghostscript-native-10.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ghostscript-native-10.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1684 of 1697 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb:do_configure)
NOTE: recipe ghostscript-native-10.0.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf/autoconf_2.71.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libtool-native', 'quilt-native', 'autoconf-native', 'automake-native', 'libpng-native', 'm4-native', 'texinfo-dummy-native', 'gnu-config-native', 'xz-native', 'zlib-native', 'gettext-minimal-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/usr/share/aclocal-1.16 --force
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: not using Libtool
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/usr/bin/autoconf --force
| autoreconf: configure.ac: not using Autoheader
| autoreconf: configure.ac: not using Automake
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ./configure  --build=x86_64-linux 		  --host=x86_64-linux 		  --target=x86_64-linux 		  --prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/usr 		  --exec_prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/usr 		  --bindir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/usr/bin 		  --sbindir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/usr/sbin 		  --libexecdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/usr/libexec 		  --datadir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/usr/share 		  --sysconfdir=/
 home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/etc 		  --sharedstatedir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/com 		  --localstatedir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/var 		  --libdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/usr/lib 		  --includedir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/usr/include 		  --oldincludedir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/usr/include 		  --infodir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/rec
 ipe-sysroot-native/usr/share/info 		  --mandir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		   --without-x --with-system-libtiff=no                              --without-jbig2dec --without-libpaper                              --with-fontpath=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/recipe-sysroot-native/usr/share/fonts                              --without-libidn --disable-fontconfig                              --enable-freetype --disable-cups  --disable-static                         --without-x
| configure: WARNING: unrecognized options: --disable-silent-rules, --disable-dependency-tracking, --disable-static
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-pc-linux-gnu
| checking for x86_64-linux-gcc... gcc
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... no
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether gcc  accepts -g... yes
| checking for gcc  option to enable C11 features... none needed
| checking how to run the C preprocessor... gcc  -E
| checking for a sed that does not truncate output... (cached) sed
| checking for x86_64-linux-ranlib... ranlib -D
| checking for x86_64-linux-pkg-config... no
| checking for pkg-config... no
| checking for x86_64-linux-strip... no
| checking for strip... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/strip
| checking if compiler supports restrict... yes
| checking supported compiler flags...    -O2
|    -DNDEBUG
|    -Wall
|    -Wstrict-prototypes
|    -Wundef
|    -Wmissing-declarations
|    -Wmissing-prototypes
|    -Wwrite-strings
|    -fno-strict-aliasing
|    -Werror=declaration-after-statement
|    -fno-builtin
|    -fno-common
|    -Werror=return-type
|    -gdwarf-2
|    -g3
|    -O0
|    -fvisibility=hidden
|  ...done.
| checking compiler/linker address santizer support...  ...done.
| checking compiler/linker address santizer build warnings support... extra warnings not supported
|  ...done.
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for vfork.h... no
| checking whether byte ordering is bigendian... (cached) no
| checking sse2 support... yes
| checking for dirent.h that defines DIR... yes
| checking for library containing opendir... none required
| checking for errno.h... yes
| checking for fcntl.h... yes
| checking for limits.h... yes
| checking for malloc.h... yes
| checking for memory.h... yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for sys/ioctl.h... yes
| checking for sys/param.h... yes
| checking for sys/time.h... yes
| checking for sys/times.h... yes
| checking for syslog.h... yes
| checking for unistd.h... (cached) yes
| checking for dirent.h... yes
| checking for ndir.h... no
| checking for sys/dir.h... yes
| checking for sys/ndir.h... no
| checking for inttypes.h... (cached) yes
| checking for make... yes
| checking if make is GNU make... yes
| checking for sys/window.h... no
| checking for an ANSI C-conforming const... yes
| checking for inline... inline
| checking for mode_t... yes
| checking for off_t... yes
| checking for size_t... yes
| checking for struct stat.st_blocks... yes
| checking whether struct tm is in sys/time.h or time.h... time.h
| checking for dlopen in -ldl... yes
| checking for dlfcn.h... yes
| checking size of unsigned long long... 8
| checking for cos in -lm... yes
| checking for pread... yes
| checking for pwrite... yes
| checking for gcc  options needed to detect all undeclared functions... none needed
| checking whether pwrite is declared... yes
| checking whether pread is declared... yes
| checking whether popen is declared... yes
| checking for pthread_create in -lpthread... yes
| checking for recursive mutexes... PTHREAD_MUTEX_RECURSIVE
| checking for local Tesseract library source... yes
| checking whether the compiler supports GNU C++... yes
| checking whether g++  accepts -g... yes
| checking for g++  option to enable C++11 features... none needed
| checking supported C++ compiler flags...    -std=c++17
| -std=c++17
| checking sse4.1 support... yes
| checking avx support... yes
| checking avx2 support... yes
| checking fma support... yes
| checking neon support... no
| checking for iconv_open... yes
| checking for dbus_message_iter_get_basic in -ldbus... no
| checking for local freetype library source... yes
| checking for local jpeg library source... jpeg
| checking for jmemsys.h... yes
| checking for local zlib source... yes
| checking for local png library source... no
| checking for png_create_write_struct in -lpng... yes
| checking for png.h... yes
| checking for local lcms2mt library source... yes
| checking for local libtiff source... yes
| configure: Could not find local copy of libtiff.
| Disabling tiff output devices.
| checking for local ijs library source... yes
| checking for fseeko... yes
| checking whether lrintf is declared... yes
| checking for local OpenJPEG library source... yes
| checking for memalign... yes
| checking for URF support... checking for local CAL library source... no
| checking for X... disabled
| configure: error: No JBIG2 decoder available, required for PDF support
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/ghostscript-10.0.0/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/temp/run.do_configure.2717420:292 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/temp/run.do_configure.2717420, line 292
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/temp/run.do_configure.2717420, line 268
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/temp/run.do_configure.2717420, line 238
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/temp/run.do_configure.2717420, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/temp/run.do_configure.2717420, line 296
NOTE: recipe ghostscript-native-10.0.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1684 tasks of which 1673 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: ghostscript-native-10.0.0-r0 do_configure: configure failed
ERROR: ghostscript-native-10.0.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/temp/run.do_configure.2717420', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/ghostscript-native/10.0.0-r0/temp/log.do_configure.2717420
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb:do_configure) failed with exit code '1'

--===============9161189576520444304==--

