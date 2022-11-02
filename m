Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20F7C64ED5
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.848.1667349633224385035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=G9D/5GrQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018435c85586-2ded5788-519e-4299-91a6-eb4f24771886-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8eWMU32tk7W8YBRN3w3r1LbKka7Sq/EWYvjJNemY3sI=;
	b=G9D/5GrQfD6C2u3yrbedxEDxcIeDY7Ysrb34Qd0XM9KNgS56bd2BkcUCal/cIY/i
	bpeEELcbjISMVdCggHMHGtaLQPfvaBQdX2aPh1H53Hy9xH4ZkW4PepYyhyz2TG3B30W
	8eeENxxqUK4bswIi8ojAo9qsJV7CLId7dZabwTzM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8eWMU32tk7W8YBRN3w3r1LbKka7Sq/EWYvjJNemY3sI=;
	b=iE1whSRn0tIuWAjxVR/U6D+mqE0CJ2bU/4EVscsKIWP6G6lVvWNaOku1ITLpQV5x
	kT224X9iiOGjs/Ne9MEUEtF3Q3ijBe8YfCUzCvGscHFQx/cL/vG0oqs2X1L81EABTUh
	1ilhxN7W+a6oAXCsGoCh2T8yVK1xnjYypzCDglXw=
Content-Type: multipart/mixed; boundary="===============5888678773982629918=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtd-utils: upgrading to 2.1.5 SUCCEEDED
Message-ID: <0101018435c85586-2ded5788-519e-4299-91a6-eb4f24771886-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172420

--===============5888678773982629918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mtd-utils* to *2.1.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtd-utils-upgrade-2.1.4-2.1.5.patch
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
--===============5888678773982629918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mtd-utils: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils: SRC_URI changed from "git://git.infradead.org/mtd-utils.git;branch=master file://0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch" to "git://git.infradead.org/mtd-utils.git;branch=master"
packages/core2-32-poky-linux/mtd-utils: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PKGSIZE changed from 6269572 to 6271856 (+0%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dev: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dev: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-doc: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-doc: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-jffs2: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-jffs2: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-locale: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-locale: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-misc: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-misc: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-src: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-src: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-src: PKGSIZE changed from 1427768 to 1428194 (+0%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-staticdev: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-staticdev: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-tests: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-tests: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/mtd-utils/mtd-utils: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils: PV changed from "2.1.4" to "2.1.5"

--===============5888678773982629918==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtd-utils-upgrade-2.1.4-2.1.5.patch"

RnJvbSAyYWYwOWE0NGExZThhMDg2YzhiMWI2ZjVlYjU5MTNmNmJmYzJjNDdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwODoyODowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG10
ZC11dGlsczogdXBncmFkZSAyLjEuNCAtPiAyLjEuNQoKLS0tCiAuLi51c2VkLWxpbnV4LWZzLmgt
aGVhZGVyLWZyb20taW5jbHVkZXMucGF0Y2ggfCAzMSAtLS0tLS0tLS0tLS0tLS0tLS0tCiBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbXRkL210ZC11dGlsc19naXQuYmIgICAgfCAgOCArKy0tLQogMiBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tdGQvbXRkLXV0aWxzLzAwMDEtdGVzdHMt
UmVtb3ZlLXVudXNlZC1saW51eC1mcy5oLWhlYWRlci1mcm9tLWluY2x1ZGVzLnBhdGNoCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210ZC9tdGQtdXRpbHMvMDAwMS10ZXN0cy1S
ZW1vdmUtdW51c2VkLWxpbnV4LWZzLmgtaGVhZGVyLWZyb20taW5jbHVkZXMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbXRkL210ZC11dGlscy8wMDAxLXRlc3RzLVJlbW92ZS11bnVzZWQt
bGludXgtZnMuaC1oZWFkZXItZnJvbS1pbmNsdWRlcy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggNzNkNGE4NDc1Zi4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbXRkL210ZC11dGlscy8wMDAxLXRlc3RzLVJlbW92ZS11bnVzZWQtbGludXgtZnMuaC1o
ZWFkZXItZnJvbS1pbmNsdWRlcy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDMxICswLDAgQEAK
LUZyb20gNmZiMTBiZDE4NDg4ZWQ4NDc3NjY3NWJjMWIyOTgyODAwYTUxZDgzOSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci1EYXRl
OiBTYXQsIDYgQXVnIDIwMjIgMjA6MTQ6MzggLTA3MDAKLVN1YmplY3Q6IFttdGQtdXRpbHNdW1BB
VENIXSB0ZXN0czogUmVtb3ZlIHVudXNlZCBsaW51eC9mcy5oIGhlYWRlciBmcm9tIGluY2x1ZGVz
Ci0KLVRoaXMgaGVhZGVyIGlzIG5vdCBuZWVkZWQsIG1vcmVvdmVyIGl0IGluY2x1ZGVzIGxpbnV4
L21vdW50Lmggd2hpY2ggaXMKLW5vdyBpbiBjb25mbGljdFsxXSB3aXRoIGdsaWJjIHByb3ZpZGVk
IHN5cy9tb3VudC5oIGZyb20gZ2xpYmMgMi4zNiBvbndhcmRzCi0KLVsxXSBodHRwczovL3NvdXJj
ZXdhcmUub3JnL2dsaWJjL3dpa2kvUmVsZWFzZS8yLjM2Ci0KLVVwc3RyZWFtLVN0YXR1czogU3Vi
bWl0dGVkIFtodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8y
MDIyLUF1Z3VzdC8wOTQ2NjcuaHRtbF0KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+Ci0tLS0KLSB0ZXN0cy9mcy10ZXN0cy9saWIvdGVzdHMuYyB8IDEgLQotIDEg
ZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS90ZXN0cy9mcy10ZXN0
cy9saWIvdGVzdHMuYyBiL3Rlc3RzL2ZzLXRlc3RzL2xpYi90ZXN0cy5jCi1pbmRleCBkMWEyZTBj
Li4zZGIwNDI2IDEwMDY0NAotLS0tIGEvdGVzdHMvZnMtdGVzdHMvbGliL3Rlc3RzLmMKLSsrKyBi
L3Rlc3RzL2ZzLXRlc3RzL2xpYi90ZXN0cy5jCi1AQCAtMzUsNyArMzUsNiBAQAotICNpbmNsdWRl
IDxzeXMvdmZzLmg+Ci0gI2luY2x1ZGUgPHN5cy9tb3VudC5oPgotICNpbmNsdWRlIDxzeXMvc3Rh
dHZmcy5oPgotLSNpbmNsdWRlIDxsaW51eC9mcy5oPgotICNpbmNsdWRlIDxsaW51eC9qZmZzMi5o
PgotIAotICNpbmNsdWRlICJ0ZXN0cy5oIgotLS0gCi0yLjM3LjEKLQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL210ZC9tdGQtdXRpbHNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL210ZC9tdGQtdXRpbHNfZ2l0LmJiCmluZGV4IDk0MzY2NmU1MjkuLjJkNzY5OTFkMmYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdGQvbXRkLXV0aWxzX2dpdC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRkL210ZC11dGlsc19naXQuYmIKQEAgLTExLDEy
ICsxMSwxMCBAQCBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgdXBkYXRlLWFsdGVybmF0aXZl
cwogREVQRU5EUyA9ICJ6bGliIGUyZnNwcm9ncyB1dGlsLWxpbnV4IgogUkRFUEVORFM6bXRkLXV0
aWxzLXRlc3RzICs9ICJiYXNoIgogCi1QViA9ICIyLjEuNCIKK1BWID0gIjIuMS41IgogCi1TUkNS
RVYgPSAiYzdmMWJmYTQ0YTg0ZDAyMDYxNzg3ZTJmNjA5M2RmNWNjNDBiOWY1YyIKLVNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0LmluZnJhZGVhZC5vcmcvbXRkLXV0aWxzLmdpdDticmFuY2g9bWFzdGVyIFwK
LSAgICAgICAgICAgZmlsZTovLzAwMDEtdGVzdHMtUmVtb3ZlLXVudXNlZC1saW51eC1mcy5oLWhl
YWRlci1mcm9tLWluY2x1ZGVzLnBhdGNoIFwKLSAgICAgICAgICAgIgorU1JDUkVWID0gIjNmM2I0
Y2M2YzMxMjAxMDdlN2FhYTIxYzY0MTU3NzJhMjU1YWM0OWMiCitTUkNfVVJJID0gImdpdDovL2dp
dC5pbmZyYWRlYWQub3JnL210ZC11dGlscy5naXQ7YnJhbmNoPW1hc3RlciIKIAogUyA9ICIke1dP
UktESVJ9L2dpdCIKIAotLSAKMi4zMS4xCgo=

--===============5888678773982629918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0f0380dd1d6f618cb9c3fa81b18b301084d89689"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 9 Mirrors 0 Missed 16 Current 244 (36% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 245 of 269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_populate_sysroot_setscene)
NOTE: Running task 761 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 762 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 814 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_fetch)
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 924 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 925 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtd-utils-2.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 926 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_unpack)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 928 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libxcrypt/4.4.28-r0/temp/log.do_packagedata_setscene.2049484
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 268 of 269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_package_setscene)
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: Running task 929 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_unpack: Succeeded
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: Running task 930 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_patch)
NOTE: recipe mtd-utils-2.1.5-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: Running task 931 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe mtd-utils-2.1.5-r0: task do_patch: Succeeded
NOTE: Running task 932 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 933 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_populate_lic)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 934 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe mtd-utils-2.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_populate_lic: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_populate_lic: Succeeded
NOTE: Running task 935 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_populate_lic unihash changed to 2e83e724dd1ad48e4970d5ac9951ed6498096614bd627f3c9bc1015d91ad43c3
NOTE: recipe mtd-utils-2.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_package_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 936 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcrypt-4.4.28-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 961 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot)
NOTE: Running task 963 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1000 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1001 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: Running task 1002 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: Running task 1003 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1004 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile)
NOTE: Running task 1005 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe lzo-2.10-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_compile: Succeeded
NOTE: Running task 1006 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1007 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install)
NOTE: recipe lzo-2.10-r0: task do_install: Started
NOTE: recipe lzo-2.10-r0: task do_install: Succeeded
NOTE: Running task 1008 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1009 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot)
NOTE: Running task 1010 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: Running task 1011 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1012 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1013 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1014 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1015 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1016 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1017 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtd-utils-2.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1018 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_configure)
NOTE: recipe mtd-utils-2.1.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1019 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1020 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_compile)
NOTE: recipe mtd-utils-2.1.5-r0: task do_compile: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1021 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_install)
NOTE: recipe mtd-utils-2.1.5-r0: task do_install: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_install: Succeeded
NOTE: Running task 1022 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_package)
NOTE: Running task 1023 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_populate_sysroot)
NOTE: recipe mtd-utils-2.1.5-r0: task do_package: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_package: Succeeded
NOTE: Running task 1024 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_packagedata)
NOTE: recipe mtd-utils-2.1.5-r0: task do_packagedata: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1025 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_package_write_rpm)
NOTE: Running task 1026 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_package_qa)
NOTE: recipe mtd-utils-2.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_package_qa: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_package_qa: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1027 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1027 tasks of which 982 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5888678773982629918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0f0380dd1d6f618cb9c3fa81b18b301084d89689"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 9 Mirrors 0 Missed 16 Current 244 (36% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 245 of 269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_populate_sysroot_setscene)
NOTE: Running task 761 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 762 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 814 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_fetch)
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 924 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 925 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtd-utils-2.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 926 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_unpack)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 928 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libxcrypt/4.4.28-r0/temp/log.do_packagedata_setscene.2084544
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 268 of 269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_package_setscene)
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 929 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 930 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_patch)
NOTE: recipe mtd-utils-2.1.5-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: Running task 931 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe mtd-utils-2.1.5-r0: task do_patch: Succeeded
NOTE: Running task 932 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 933 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_populate_lic)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 934 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe mtd-utils-2.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_populate_lic: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_populate_lic: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_populate_lic unihash changed to 2e83e724dd1ad48e4970d5ac9951ed6498096614bd627f3c9bc1015d91ad43c3
NOTE: recipe mtd-utils-2.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 935 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe libxcrypt-4.4.28-r0: task do_package_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 936 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcrypt-4.4.28-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 961 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot)
NOTE: Running task 963 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1000 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1001 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1002 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1003 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: Running task 1004 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1005 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile)
NOTE: recipe lzo-2.10-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_compile: Succeeded
NOTE: Running task 1006 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1007 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install)
NOTE: recipe lzo-2.10-r0: task do_install: Started
NOTE: recipe lzo-2.10-r0: task do_install: Succeeded
NOTE: Running task 1008 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1009 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot)
NOTE: Running task 1010 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: Running task 1011 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1012 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1013 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1014 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1015 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1016 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1017 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtd-utils-2.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1018 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_configure)
NOTE: recipe mtd-utils-2.1.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1019 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1020 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_compile)
NOTE: recipe mtd-utils-2.1.5-r0: task do_compile: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1021 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_install)
NOTE: recipe mtd-utils-2.1.5-r0: task do_install: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_install: Succeeded
NOTE: Running task 1022 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_package)
NOTE: Running task 1023 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_populate_sysroot)
NOTE: recipe mtd-utils-2.1.5-r0: task do_package: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_package: Succeeded
NOTE: Running task 1024 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_packagedata)
NOTE: recipe mtd-utils-2.1.5-r0: task do_packagedata: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1025 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_package_write_rpm)
NOTE: Running task 1026 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_package_qa)
NOTE: recipe mtd-utils-2.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_package_qa: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_package_qa: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1027 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1027 tasks of which 982 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5888678773982629918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0f0380dd1d6f618cb9c3fa81b18b301084d89689"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 9 Mirrors 0 Missed 16 Current 244 (36% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 245 of 269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_populate_sysroot_setscene)
NOTE: Running task 761 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 762 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 814 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_fetch)
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 924 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 925 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtd-utils-2.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 926 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_unpack)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 928 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libxcrypt/4.4.28-r0/temp/log.do_packagedata_setscene.2120392
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 268 of 269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_package_setscene)
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: Running task 929 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 930 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_patch)
NOTE: recipe mtd-utils-2.1.5-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: Running task 931 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe mtd-utils-2.1.5-r0: task do_patch: Succeeded
NOTE: Running task 932 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 933 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_populate_lic)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_populate_lic: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 934 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_populate_lic: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: Running task 935 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_populate_lic unihash changed to 2e83e724dd1ad48e4970d5ac9951ed6498096614bd627f3c9bc1015d91ad43c3
NOTE: recipe mtd-utils-2.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_package_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 936 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcrypt-4.4.28-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 961 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot)
NOTE: Running task 963 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1000 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1001 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: Running task 1002 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1003 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1004 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1005 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe lzo-2.10-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_compile: Succeeded
NOTE: Running task 1006 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1007 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install)
NOTE: recipe lzo-2.10-r0: task do_install: Started
NOTE: recipe lzo-2.10-r0: task do_install: Succeeded
NOTE: Running task 1008 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1009 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot)
NOTE: Running task 1010 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: Running task 1011 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1012 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1013 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1014 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1015 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1016 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1017 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtd-utils-2.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1018 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_configure)
NOTE: recipe mtd-utils-2.1.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1019 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1020 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_compile)
NOTE: recipe mtd-utils-2.1.5-r0: task do_compile: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1021 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_install)
NOTE: recipe mtd-utils-2.1.5-r0: task do_install: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_install: Succeeded
NOTE: Running task 1022 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_package)
NOTE: Running task 1023 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_populate_sysroot)
NOTE: recipe mtd-utils-2.1.5-r0: task do_package: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_package: Succeeded
NOTE: Running task 1024 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_packagedata)
NOTE: recipe mtd-utils-2.1.5-r0: task do_packagedata: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1025 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_package_write_rpm)
NOTE: Running task 1026 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_package_qa)
NOTE: recipe mtd-utils-2.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_package_qa: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_package_qa: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1027 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1027 tasks of which 982 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5888678773982629918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0f0380dd1d6f618cb9c3fa81b18b301084d89689"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 9 Mirrors 0 Missed 16 Current 244 (36% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 245 of 269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_populate_sysroot_setscene)
NOTE: Running task 761 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 762 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 814 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_fetch)
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 924 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 925 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtd-utils-2.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 926 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_unpack)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 927 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxcrypt/4.4.28-r0/temp/log.do_packagedata_setscene.2014054
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 268 of 269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_package_setscene)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: Running task 929 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 930 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_patch)
NOTE: recipe mtd-utils-2.1.5-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: Running task 931 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe mtd-utils-2.1.5-r0: task do_patch: Succeeded
NOTE: Running task 932 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 933 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_populate_lic)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_populate_lic: Started
NOTE: Running task 934 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_populate_lic: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_populate_lic unihash changed to 2e83e724dd1ad48e4970d5ac9951ed6498096614bd627f3c9bc1015d91ad43c3
NOTE: recipe mtd-utils-2.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 935 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_package_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 936 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcrypt-4.4.28-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 961 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot)
NOTE: Running task 963 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1000 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1001 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1002 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1003 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: Running task 1004 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1005 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile)
NOTE: recipe lzo-2.10-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_compile: Succeeded
NOTE: Running task 1006 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1007 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install)
NOTE: recipe lzo-2.10-r0: task do_install: Started
NOTE: recipe lzo-2.10-r0: task do_install: Succeeded
NOTE: Running task 1008 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1009 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot)
NOTE: Running task 1010 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: Running task 1011 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1012 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1013 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1014 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1015 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1016 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1017 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtd-utils-2.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1018 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_configure)
NOTE: recipe mtd-utils-2.1.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1019 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1020 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_compile)
NOTE: recipe mtd-utils-2.1.5-r0: task do_compile: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1021 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_install)
NOTE: recipe mtd-utils-2.1.5-r0: task do_install: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_install: Succeeded
NOTE: Running task 1022 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_package)
NOTE: Running task 1023 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_populate_sysroot)
NOTE: recipe mtd-utils-2.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_package: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_package: Succeeded
NOTE: Running task 1024 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_packagedata)
NOTE: recipe mtd-utils-2.1.5-r0: task do_packagedata: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1025 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_package_write_rpm)
NOTE: Running task 1026 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_package_qa)
NOTE: recipe mtd-utils-2.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_package_qa: Started
NOTE: recipe mtd-utils-2.1.5-r0: task do_package_qa: Succeeded
NOTE: recipe mtd-utils-2.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1027 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1027 tasks of which 982 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.29-r0 to 0:4.4.28-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.28-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5888678773982629918==--

