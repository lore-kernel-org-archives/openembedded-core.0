Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D308C2FC16
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.6020.1689456454263319399
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NM7HYSPZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101895b73a453-ea0d4c3e-0832-4e2b-bddd-877f1dbc2a06-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cu4a4DPwClZmTBDyWWTcKgNCjEKPktU4PX6JPjPeAw8=;
	b=NM7HYSPZF9fJC5JQPKiGk0wT4ZJyg09Qcwg0jveA7lPrGRYwNa7PF2SxIpPEJpuQ
	dWazrgJ2XRRIAA597kQru8EjP4HjnmAf1PLecwhl9xb8RMOv16tZO2bSYOmsFxgZNeA
	LjL65wCSXJqQumE/P0+Jl0lHa+46cX58EADlvh8g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cu4a4DPwClZmTBDyWWTcKgNCjEKPktU4PX6JPjPeAw8=;
	b=qRP+RlTlD1Psob8eUqL1fL9wJbAwPvFFvRm457eZkzteMXil2PST5rJnPozvFKpk
	yB4/xoM54tYOyZ4+RCHhV2xqVv7SD1mOz/cJYC6rtyp3A8TGewl9koN+AQWZkd8E27o
	RbCU1rDAfyJa8QDb77ghiBrT59M6IJBP1GO2BtY0=
Content-Type: multipart/mixed; boundary="===============7018520580238207185=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 6.4.0 FAILED
Message-ID: <010101895b73a453-ea0d4c3e-0832-4e2b-bddd-877f1dbc2a06-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184329

--===============7018520580238207185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iproute2* to *6.4.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-6.3.0-6.4.0.patch
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
From 448d8d3f01b095b6c6e8682be70cb6a7f2949bb5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 06:45:26 +0000
Subject: [PATCH] iproute2: upgrade 6.3.0 -> 6.4.0

---
 .../iproute2/{iproute2_6.3.0.bb => iproute2_6.4.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.3.0.bb => iproute2_6.4.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
index 892fa854da..bc16e2ac8f 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "dfb2a98db96e7a653cffc6693335a1a466e29a34b6ac528be48f35e1d2766732"
+SRC_URI[sha256sum] = "4c51b8decbc7e4da159ffb066f590cfb93dbf9af7ff86b1647ce42b7c179a272"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.39.2


--===============7018520580238207185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 6805820 to 6838460 (+0%)
packages/core2-32-poky-linux/iproute2/iproute2-dev: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-dev: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PKGSIZE changed from 267112 to 268136 (+0%)
packages/core2-32-poky-linux/iproute2/iproute2-doc: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-doc: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-genl: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-genl: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-genl: PKGSIZE changed from 123468 to 124492 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PKGSIZE changed from 115244 to 116268 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-ip: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ip: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-ip: PKGSIZE changed from 841860 to 842884 (+0%)
packages/core2-32-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-lnstat: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-locale: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-locale: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PKGSIZE changed from 115244 to 116268 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-rdma: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-rdma: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-routel: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-routel: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PKGSIZE changed from 37364 to 38388 (+3%)
packages/core2-32-poky-linux/iproute2/iproute2-src: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-src: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3625705 to 3641457 (+0%)
packages/core2-32-poky-linux/iproute2/iproute2-ss: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ss: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-ss: PKGSIZE changed from 197584 to 198608 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-staticdev: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-tc: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-tc: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-tc: PKGSIZE changed from 709675 to 710699 (+0%)
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PKGSIZE changed from 176776 to 177800 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2/iproute2: PKGSIZE changed from 296088 to 298136 (+1%)
packages/core2-32-poky-linux/iproute2: PKGV changed from 6.3.0 [default] to 6.4.0 [default]
packages/core2-32-poky-linux/iproute2: PV changed from "6.3.0" to "6.4.0"
packages/core2-32-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.3.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.4.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch"

--===============7018520580238207185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 48 skipped, 0 masked, 0 errors.
Removing 58 recipes from the core2-32 sysroot...done.
Removing 57 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cdd67bb7fee7719d1db5f305f2631308f231817d"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 287 Local 40 Mirrors 0 Missed 247 Current 201 (13% match, 49% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 443 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 448 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 355 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_fetch)
NOTE: Running task 362 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: Running task 480 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 586 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_fetch)
NOTE: Running task 623 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 624 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 626 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: Running task 628 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_fetch)
NOTE: Running task 629 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 630 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: Running task 631 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: Running task 636 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 639 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 654 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 655 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_fetch)
NOTE: Running task 668 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 669 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_fetch)
NOTE: Running task 670 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 671 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: Running task 672 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_fetch)
NOTE: Running task 685 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: Running task 686 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_fetch)
NOTE: Running task 687 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 688 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_fetch)
NOTE: Running task 689 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_fetch)
NOTE: Running task 690 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_fetch)
NOTE: Running task 691 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: Running task 692 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: Running task 693 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: Running task 694 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: Running task 695 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: Running task 696 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: Running task 697 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: Running task 698 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: Running task 699 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 700 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch)
NOTE: Running task 701 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_fetch)
NOTE: Running task 702 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: Running task 703 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_fetch)
NOTE: Running task 706 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 713 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_fetch)
NOTE: Running task 714 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Succeeded
NOTE: Running task 717 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 728 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_fetch)
NOTE: Running task 729 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 730 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_fetch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: Running task 739 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_fetch)
NOTE: Running task 756 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_fetch)
NOTE: Running task 757 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 760 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 768 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 771 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: Running task 776 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Started
NOTE: Running task 823 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: Running setscene task 451 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Started
NOTE: recipe curl-8.1.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_fetch: Started
NOTE: Running task 824 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_unpack)
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Started
NOTE: Running task 825 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: recipe libcap-2.69-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: Running task 826 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: recipe curl-8.1.2-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 827 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe file-5.44-r0: task do_fetch: Started
NOTE: Running task 828 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Started
NOTE: Running task 829 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_unpack)
NOTE: Running task 830 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 831 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_unpack)
NOTE: Running task 832 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.69-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: Running task 833 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: Running task 834 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: recipe elfutils-0.189-r0: task do_fetch: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: Running task 835 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Succeeded
NOTE: Running task 836 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Started
NOTE: Running task 837 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 838 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe shadow-4.13-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 839 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 840 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_unpack)
NOTE: recipe iproute2-6.4.0-r0: task do_fetch: Started
NOTE: Running task 841 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: Running task 842 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_unpack)
NOTE: Running task 843 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: recipe libedit-20221030-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 844 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_unpack)
NOTE: Running task 845 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: Running task 846 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: Running task 847 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: Running task 848 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_unpack)
NOTE: Running task 849 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 850 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: Running task 851 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Started
NOTE: recipe elfutils-0.189-r0: task do_fetch: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Succeeded
NOTE: Running task 852 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe iproute2-6.4.0-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe coreutils-9.3-r0: task do_fetch: Started
NOTE: Running task 853 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_unpack)
NOTE: Running task 854 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 855 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: Running task 856 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_unpack)
NOTE: Running task 857 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: recipe file-5.44-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 858 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_unpack)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: Running task 859 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_fetch: Succeeded
NOTE: Running task 860 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: Running task 861 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: Running task 862 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_unpack)
NOTE: Running task 863 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe python3-3.11.4-r0: task do_fetch: Started
NOTE: Running task 864 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 865 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: Running task 866 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: Running task 867 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_unpack)
NOTE: Running task 868 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_unpack)
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.69-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Started
NOTE: Running task 869 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe python3-3.11.4-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_unpack: Started
NOTE: recipe curl-8.1.2-r0: task do_unpack: Started
NOTE: Running task 870 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: Running task 871 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_unpack)
NOTE: Running task 872 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe xz-5.4.3-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 457 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: Running task 873 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: Running task 874 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Started
NOTE: recipe elfutils-0.189-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: Running task 875 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: Running task 876 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_patch: Started
NOTE: Running task 877 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_patch)
NOTE: recipe xz-5.4.3-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.69-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 878 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: Running task 879 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: Running task 880 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_patch)
NOTE: Running task 881 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: Running task 882 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_patch)
NOTE: Running task 883 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_patch)
NOTE: Running task 884 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 885 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: Running task 886 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: Running task 887 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 889 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: Running task 890 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: Running task 891 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-3.11.4-r0: task do_unpack: Started
NOTE: Running task 892 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_patch: Started
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: recipe nettle-3.9.1-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe xz-5.4.3-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_patch: Started
NOTE: recipe libcap-2.69-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: Running task 893 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: Running task 894 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_patch)
NOTE: Running task 895 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Succeeded
NOTE: Running task 896 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 897 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: Running task 898 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_patch)
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Succeeded
NOTE: Running task 899 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_patch)
NOTE: Running task 900 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_patch)
NOTE: recipe zlib-1.2.13-r0: task do_patch: Succeeded
NOTE: Running task 901 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 902 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Started
NOTE: Running setscene task 465 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: Running task 903 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: Running task 904 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 905 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 906 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: Running task 907 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: Running task 908 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.13-r0: task do_unpack: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 909 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: Running task 910 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 911 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 912 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 913 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_patch)
NOTE: Running task 914 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_patch: Started
NOTE: Running setscene task 466 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 916 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 917 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: Running task 918 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: Running task 919 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 920 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libpam-1.5.3-r0: task do_patch: Started
NOTE: recipe iptables-1.8.9-r0: task do_patch: Started
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 921 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 922 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_patch)
NOTE: Running task 923 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.69-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe curl-8.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 924 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 925 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: Running task 926 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: Running task 927 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 928 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 929 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 930 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 931 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch)
NOTE: Running task 932 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_patch)
NOTE: Running task 933 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: recipe xz-5.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: Running task 934 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_patch)
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: Running task 935 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe iproute2-6.4.0-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 936 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_patch)
NOTE: Running task 937 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 938 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 939 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.13-r0: task do_patch: Started
NOTE: Running task 940 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_populate_lic)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.1.2-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 941 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libedit-20221030-3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe zstd-1.5.5-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 942 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-8.1.2-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 943 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 469 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: Running task 944 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_patch: Started
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.44-r0: task do_patch: Started
NOTE: Running task 945 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: Running task 946 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.1.1-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_populate_lic: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 947 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 948 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 949 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 950 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Succeeded
NOTE: Running task 951 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch)
NOTE: Running task 952 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 472 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.44-r0: task do_patch: Succeeded
NOTE: Running task 958 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_patch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 959 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch)
NOTE: Running task 960 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 961 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe curl-8.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 962 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: recipe coreutils-9.3-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 963 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_patch)
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.4.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_populate_lic unihash changed to 8a62464dd0d1e7f3ba227be44f5861b4bd6dcd89c615dcabaf946e601a1b758b
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 964 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 965 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 966 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_patch: Started
NOTE: Running task 967 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_patch: Succeeded
NOTE: Running task 968 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 969 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.1.1-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 970 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 971 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: recipe curl-8.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 972 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 973 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_patch: Started
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 974 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch)
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 481 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 991 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 992 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 993 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_patch)
NOTE: Running task 994 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe coreutils-9.3-r0: task do_patch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 995 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch)
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Succeeded
NOTE: Running task 996 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 997 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 998 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 999 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_patch: Succeeded
NOTE: Running task 1000 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1001 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 1002 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-3.11.4-r0: task do_unpack: Succeeded
NOTE: Running task 1003 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_patch)
NOTE: recipe elfutils-0.189-r0: task do_patch: Succeeded
NOTE: Running task 1004 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1005 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.11.4-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1016 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1075 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1076 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1077 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1096 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1101 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1102 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_collect_spdx_deps)
NOTE: Running task 1103 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_collect_spdx_deps)
NOTE: Running task 1104 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_collect_spdx_deps)
NOTE: Running task 1105 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_collect_spdx_deps)
NOTE: Running task 1106 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1107 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_collect_spdx_deps)
NOTE: recipe opkg-utils-0.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.2.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe zlib-1.2.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe zstd-1.5.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe expat-2.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-3.11.4-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1108 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1109 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_configure)
NOTE: Running task 1110 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_configure)
NOTE: recipe libtool-cross-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1111 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_configure)
NOTE: Running task 1112 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx)
NOTE: recipe opkg-utils-0.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1113 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_configure)
NOTE: recipe zstd-1.5.5-r0: task do_configure: Started
NOTE: recipe zlib-1.2.13-r0: task do_configure: Started
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1114 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure)
NOTE: recipe python3-3.11.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_configure: Started
NOTE: recipe zstd-1.5.5-r0: task do_configure: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_configure: Started
NOTE: Running task 1115 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_compile)
NOTE: recipe expat-2.5.0-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1116 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_compile)
NOTE: recipe zstd-1.5.5-r0: task do_compile: Started
NOTE: recipe python3-3.11.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_compile: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 1117 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_collect_spdx_deps)
NOTE: Running task 1118 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_collect_spdx_deps)
NOTE: Running task 1119 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_collect_spdx_deps)
NOTE: Running task 1120 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 1121 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_collect_spdx_deps)
NOTE: Running task 1122 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 1123 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_collect_spdx_deps)
NOTE: Running task 1124 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 1125 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_collect_spdx_deps)
NOTE: Running task 1126 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_collect_spdx_deps)
NOTE: Running task 1127 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_collect_spdx_deps)
NOTE: recipe opkg-utils-0.5.0-r0: task do_compile: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1128 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_collect_spdx_deps)
NOTE: recipe gmp-6.2.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1129 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_install)
NOTE: Running task 1130 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_collect_spdx_deps)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1131 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_collect_spdx_deps)
NOTE: recipe bash-completion-2.11-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1132 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_collect_spdx_deps)
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gmp-6.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_configure: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe fts-1.2.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1133 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_configure_ptest_base)
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmnl-1.0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe fts-1.2.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_collect_spdx_deps: Started
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.23-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1134 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_compile)
NOTE: recipe opkg-utils-0.5.0-r0: task do_install: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_compile: Started
NOTE: Running task 1135 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot)
NOTE: Running task 1136 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: Running task 1137 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1138 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1139 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1140 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe openssl-3.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1141 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1142 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe openssl-3.1.1-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe zlib-1.2.13-r0: task do_compile: Succeeded
NOTE: Running task 1143 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.2.13-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.2.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1144 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_install)
NOTE: recipe expat-2.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1145 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.2.13-r0: task do_install: Started
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1146 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile)
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_compile: Started
NOTE: Running task 1147 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata)
NOTE: recipe zlib-1.2.13-r0: task do_install: Succeeded
NOTE: Running task 1148 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_install_ptest_base)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Started
NOTE: recipe zlib-1.2.13-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.2.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1149 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot)
NOTE: Running task 1150 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1151 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_create_spdx)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot: Started
NOTE: recipe zlib-1.2.13-r0: task do_package: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1152 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_collect_spdx_deps)
NOTE: Running task 1153 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_collect_spdx_deps)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1154 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_collect_spdx_deps)
NOTE: Running task 1155 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_collect_spdx_deps)
NOTE: Running task 1156 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_collect_spdx_deps)
NOTE: Running task 1157 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_collect_spdx_deps)
NOTE: recipe bzip2-1.0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe xz-5.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe openssl-3.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe bzip2-1.0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Started
NOTE: recipe ncurses-6.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe xz-5.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_package: Succeeded
NOTE: Running task 1158 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata: Succeeded
NOTE: Running task 1159 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx)
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 1160 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_collect_spdx_deps)
NOTE: recipe cracklib-2.9.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe cracklib-2.9.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1161 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1162 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install)
NOTE: recipe expat-2.5.0-r0: task do_install: Started
NOTE: recipe expat-2.5.0-r0: task do_install: Succeeded
NOTE: Running task 1163 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1164 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot)
NOTE: Running task 1165 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_package)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_package: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1166 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_compile)
NOTE: recipe libtool-cross-2.4.7-r0: task do_compile: Started
NOTE: recipe expat-2.5.0-r0: task do_package: Succeeded
NOTE: Running task 1167 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata)
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1168 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx)
NOTE: recipe expat-2.5.0-r0: task do_create_spdx: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1169 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1170 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1171 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe openssl-3.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1172 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_configure_ptest_base)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe openssl-3.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1173 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_compile: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1174 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_install)
NOTE: recipe libtool-cross-2.4.7-r0: task do_install: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1175 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1176 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1177 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1178 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1179 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1180 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1181 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1182 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1183 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1184 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1185 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1186 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1187 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1188 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1189 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1190 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1191 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1192 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1193 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1194 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1195 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe cracklib-2.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1196 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1197 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1198 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cracklib-2.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1199 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_configure)
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1200 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: Running task 1201 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1202 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_configure)
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1203 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure)
NOTE: Running task 1204 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_configure)
NOTE: Running task 1205 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe xz-5.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1206 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_configure)
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1207 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1208 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure)
NOTE: Running task 1209 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_configure)
NOTE: recipe ncurses-6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: Running task 1210 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_configure)
NOTE: Running task 1211 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: Running task 1212 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1213 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_configure)
NOTE: recipe base-passwd-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1214 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_configure)
NOTE: Running task 1215 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_configure)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: Running task 1216 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_configure: Started
NOTE: Running task 1217 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_configure)
NOTE: Running task 1218 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_configure)
NOTE: Running task 1219 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_configure)
NOTE: recipe gmp-6.2.1-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: Running task 1220 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: Running task 1221 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_configure: Started
NOTE: recipe gdbm-1.23-r0: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Started
NOTE: recipe libffi-3.4.4-r0: task do_configure: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: recipe ncurses-6.4-r0: task do_configure: Started
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Started
NOTE: recipe iptables-1.8.9-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_configure: Succeeded
NOTE: Running task 1222 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_compile)
NOTE: recipe bash-completion-2.11-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1223 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_compile)
NOTE: recipe base-passwd-3.6.1-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1224 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_install)
NOTE: recipe base-passwd-3.6.1-r0: task do_install: Started
NOTE: recipe bash-completion-2.11-r0: task do_compile: Succeeded
NOTE: Running task 1225 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_install)
NOTE: recipe bash-completion-2.11-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_install: Succeeded
NOTE: Running task 1226 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot)
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1227 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1228 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1229 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package)
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1230 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_configure)
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1231 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: Running task 1232 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_compile)
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1233 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1234 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1235 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 1236 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1237 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Succeeded
NOTE: Running task 1238 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_configure: Succeeded
NOTE: Running task 1239 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_compile)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_compile: Started
NOTE: recipe zstd-1.5.5-r0: task do_compile: Succeeded
NOTE: Running task 1240 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_install)
NOTE: recipe zstd-1.5.5-r0: task do_install: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1241 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 1242 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata)
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: Running task 1243 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1244 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: Running task 1245 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1246 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata)
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1247 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1248 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1249 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1250 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot)
NOTE: Running task 1251 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1252 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe cracklib-2.9.11-r0: task do_configure: Succeeded
NOTE: Running task 1253 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_configure: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Started
NOTE: Running task 1254 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_compile: Started
NOTE: Running task 1255 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_configure_ptest_base: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1256 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_compile)
NOTE: recipe libmnl-1.0.5-r0: task do_install: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_compile: Started
NOTE: Running task 1257 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot)
NOTE: Running task 1258 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1259 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Started
NOTE: recipe iptables-1.8.9-r0: task do_configure: Succeeded
NOTE: Running task 1260 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1261 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe iptables-1.8.9-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe libmnl-1.0.5-r0: task do_install: Succeeded
NOTE: Running task 1262 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package)
NOTE: Running task 1263 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 1264 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Started
NOTE: recipe cracklib-2.9.11-r0: task do_compile: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1265 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_install)
NOTE: Running task 1266 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 1267 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1268 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1269 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe cracklib-2.9.11-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe attr-2.5.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1270 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_install)
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1271 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_install)
NOTE: recipe gdbm-1.23-r0: task do_configure: Succeeded
NOTE: Running task 1272 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure_ptest_base)
NOTE: recipe openssl-3.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1273 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_compile_ptest_base)
NOTE: recipe bash-completion-2.11-r0: task do_install: Succeeded
NOTE: Running task 1274 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Started
NOTE: recipe attr-2.5.1-r0: task do_install: Started
NOTE: Running task 1275 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot)
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1276 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe openssl-3.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1277 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_install)
NOTE: recipe gdbm-1.23-r0: task do_compile: Started
NOTE: recipe openssl-3.1.1-r0: task do_install: Started
NOTE: recipe libffi-3.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1278 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_compile)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 1279 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot)
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Succeeded
NOTE: Running task 1280 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_compile: Started
NOTE: Running task 1281 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata: Started
NOTE: recipe attr-2.5.1-r0: task do_install: Succeeded
NOTE: Running task 1282 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_install_ptest_base)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1283 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1284 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1285 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot)
NOTE: Running task 1286 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: Running task 1287 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1288 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Started
NOTE: recipe cracklib-2.9.11-r0: task do_install: Succeeded
NOTE: Running task 1289 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot)
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1290 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_package)
NOTE: Running task 1291 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx)
NOTE: recipe libffi-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1292 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_install)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1293 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata)
NOTE: recipe libffi-3.4.4-r0: task do_install: Started
NOTE: Running task 1294 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Started
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1295 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_configure)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_create_spdx: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1296 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1297 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx)
NOTE: recipe acl-2.3.1-r0: task do_configure: Started
NOTE: recipe libpam-1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx: Started
NOTE: recipe gdbm-1.23-r0: task do_compile: Succeeded
NOTE: Running task 1298 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Started
NOTE: recipe libffi-3.4.4-r0: task do_install: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1299 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_configure)
NOTE: Running task 1300 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot)
NOTE: Running task 1301 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package)
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_configure: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1302 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata)
NOTE: recipe iptables-1.8.9-r0: task do_compile: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Succeeded
NOTE: Running task 1303 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install)
NOTE: Running task 1304 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_install)
NOTE: Running task 1305 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure_ptest_base)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.23-r0: task do_install: Started
NOTE: recipe iptables-1.8.9-r0: task do_install: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1306 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile)
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 1307 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: Running task 1308 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_create_spdx)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 1309 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1310 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_collect_spdx_deps)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1311 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx)
NOTE: recipe libnsl2-2.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Started
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: Running task 1312 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata)
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1313 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata)
NOTE: Running task 1314 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_install: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Started
NOTE: Running task 1315 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_package)
NOTE: Running task 1316 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_populate_sysroot)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.9-r0: task do_package: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_install: Succeeded
NOTE: Running task 1317 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install_ptest_base)
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1318 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata)
NOTE: Running task 1319 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Started
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Started
NOTE: Running task 1320 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx)
NOTE: recipe attr-2.5.1-r0: task do_create_spdx: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1321 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx)
NOTE: Running task 1322 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot)
NOTE: Running task 1323 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 1324 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: Running task 1325 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_collect_spdx_deps)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_configure: Succeeded
NOTE: Running task 1326 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe xz-5.4.3-r0: task do_compile: Started
NOTE: recipe acl-2.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_package: Succeeded
NOTE: Running task 1327 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata: Succeeded
NOTE: Running task 1328 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx)
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1329 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 1330 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Started
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 1331 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_compile: Succeeded
NOTE: Running task 1332 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_install)
NOTE: recipe xz-5.4.3-r0: task do_install: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: Running task 1333 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata)
NOTE: recipe zstd-1.5.5-r0: task do_install: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1334 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot)
NOTE: Running task 1335 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: Running task 1336 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_package)
NOTE: recipe gdbm-1.23-r0: task do_packagedata: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Started
NOTE: recipe zstd-1.5.5-r0: task do_package: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata: Succeeded
NOTE: Running task 1337 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_create_spdx: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1338 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Started
NOTE: recipe gdbm-1.23-r0: task do_create_spdx: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Succeeded
NOTE: Running task 1339 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile_ptest_base)
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1340 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_configure_ptest_base)
NOTE: Running task 1341 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot)
NOTE: Running task 1342 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1343 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1344 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_compile)
NOTE: recipe acl-2.3.1-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Running task 1345 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_compile)
NOTE: recipe gmp-6.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1346 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_compile)
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1347 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe gmp-6.2.1-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1348 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe acl-2.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1349 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install: Succeeded
NOTE: Running task 1350 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install_ptest_base)
NOTE: recipe xz-5.4.3-r0: task do_install: Succeeded
NOTE: Running task 1351 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot)
NOTE: Running task 1352 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_package)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_configure: Succeeded
NOTE: Running task 1353 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_compile)
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe xz-5.4.3-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1354 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot)
NOTE: Running task 1355 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_package)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_package: Started
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1356 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_install)
NOTE: recipe zstd-1.5.5-r0: task do_package: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_install: Started
NOTE: Running task 1357 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata)
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1358 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata: Started
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1359 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx)
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1360 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_configure)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_compile: Succeeded
NOTE: Running task 1361 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_install)
NOTE: recipe file-5.44-r0: task do_configure: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1362 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe iptables-1.8.9-r0: task do_package: Succeeded
NOTE: Running task 1363 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_packagedata)
NOTE: recipe acl-2.3.1-r0: task do_install: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_install: Started
NOTE: Running task 1364 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_install_ptest_base)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.9-r0: task do_packagedata: Started
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1365 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_create_spdx: Started
NOTE: Running task 1366 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot)
NOTE: Running task 1367 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: Running task 1368 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1369 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_create_spdx)
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1370 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_create_spdx)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1371 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_install: Succeeded
NOTE: Running task 1372 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot)
NOTE: Running task 1373 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_create_spdx: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1374 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1375 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1376 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe libgpg-error-1.47-r0: task do_package: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_configure: Succeeded
NOTE: Running task 1377 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_compile)
NOTE: Running task 1378 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata)
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Succeeded
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Succeeded
NOTE: Running task 1379 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx)
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Succeeded
NOTE: Running task 1380 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata: Started
NOTE: recipe xz-5.4.3-r0: task do_package: Succeeded
NOTE: Running task 1381 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata)
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1382 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: Running task 1383 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_create_spdx)
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: Running task 1384 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: Running task 1385 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_create_spdx: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1386 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_create_spdx: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_create_spdx: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1387 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx)
NOTE: Running task 1388 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe acl-2.3.1-r0: task do_create_spdx: Started
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1389 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_collect_spdx_deps)
NOTE: recipe acl-2.3.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1390 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_collect_spdx_deps)
NOTE: recipe file-5.44-r0: task do_collect_spdx_deps: Started
NOTE: recipe libarchive-3.6.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-5.44-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1391 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Succeeded
NOTE: Running task 1392 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: recipe gmp-6.2.1-r0: task do_install: Succeeded
NOTE: Running task 1393 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot)
NOTE: Running task 1394 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: Running task 1395 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot)
NOTE: Running task 1396 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: Running task 1397 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 1398 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1399 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_compile)
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1400 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure)
NOTE: recipe libpam-1.5.3-r0: task do_compile: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Running task 1401 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1402 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx)
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Succeeded
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Running task 1403 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata)
NOTE: recipe sed-4.9-r0: task do_packagedata: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Running task 1404 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata)
NOTE: recipe sed-4.9-r0: task do_packagedata: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Started
NOTE: recipe file-5.44-r0: task do_configure: Succeeded
NOTE: Running task 1405 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_compile)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1406 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_create_spdx)
NOTE: recipe file-5.44-r0: task do_compile: Started
NOTE: recipe gmp-6.2.1-r0: task do_create_spdx: Started
NOTE: recipe gmp-6.2.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1407 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_collect_spdx_deps)
NOTE: recipe nettle-3.9.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe nettle-3.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_configure: Succeeded
NOTE: Running task 1408 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1409 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile)
NOTE: recipe nettle-3.9.1-r0: task do_compile: Started
NOTE: recipe ncurses-6.4-r0: task do_compile: Succeeded
NOTE: Running task 1410 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_install)
NOTE: recipe file-5.44-r0: task do_compile: Succeeded
NOTE: Running task 1411 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_install)
NOTE: recipe ncurses-6.4-r0: task do_install: Started
NOTE: recipe file-5.44-r0: task do_install: Started
NOTE: recipe file-5.44-r0: task do_install: Succeeded
NOTE: Running task 1412 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot)
NOTE: Running task 1413 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package)
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.44-r0: task do_package: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_package: Succeeded
NOTE: Running task 1414 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_packagedata)
NOTE: recipe file-5.44-r0: task do_packagedata: Started
NOTE: recipe file-5.44-r0: task do_packagedata: Succeeded
NOTE: Running task 1415 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_create_spdx)
NOTE: recipe file-5.44-r0: task do_create_spdx: Started
NOTE: recipe file-5.44-r0: task do_create_spdx: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1416 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1417 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1418 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install)
NOTE: recipe nettle-3.9.1-r0: task do_install: Started
NOTE: recipe nettle-3.9.1-r0: task do_install: Succeeded
NOTE: Running task 1419 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1420 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot)
NOTE: Running task 1421 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_package)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.9.1-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1422 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe libpam-1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1423 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1424 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 1425 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 1426 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.3-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_install: Succeeded
NOTE: Running task 1427 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot)
NOTE: Running task 1428 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot: Started
NOTE: recipe ncurses-6.4-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 1429 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1430 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_create_spdx)
NOTE: recipe libarchive-3.6.2-r0: task do_create_spdx: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1431 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1432 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libedit-20221030-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1433 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1434 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: recipe libedit-20221030-3.1-r0: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: recipe openssl-3.1.1-r0: task do_install: Succeeded
NOTE: Running task 1435 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_install_ptest_base)
NOTE: recipe openssl-3.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.9.1-r0: task do_package: Succeeded
NOTE: Running task 1436 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1437 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx)
NOTE: recipe libpam-1.5.3-r0: task do_install: Succeeded
NOTE: Running task 1438 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_install_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.5.3-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1439 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot)
NOTE: Running task 1440 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.3-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1441 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1442 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1443 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot)
NOTE: Running task 1444 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_package)
NOTE: recipe libcap-2.69-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.1.1-r0: task do_package: Started
NOTE: recipe libcap-2.69-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1445 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_configure)
NOTE: recipe libcap-2.69-r0: task do_configure: Started
NOTE: recipe shadow-4.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1446 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_configure)
NOTE: recipe libcap-2.69-r0: task do_configure: Succeeded
NOTE: Running task 1447 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_compile)
NOTE: recipe shadow-4.13-r0: task do_configure: Started
NOTE: recipe libcap-2.69-r0: task do_compile: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-2.69-r0: task do_compile: Succeeded
NOTE: Running task 1448 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_install)
NOTE: recipe libcap-2.69-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_compile: Succeeded
NOTE: Running task 1449 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_install)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_install: Succeeded
NOTE: Running task 1450 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot)
NOTE: Running task 1451 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_package)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_package: Started
NOTE: recipe libcap-2.69-r0: task do_install: Succeeded
NOTE: Running task 1452 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1453 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1454 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1455 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure)
NOTE: recipe coreutils-9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1456 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_configure)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Started
NOTE: recipe coreutils-9.3-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_package: Succeeded
NOTE: Running task 1457 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_configure: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1458 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_compile)
NOTE: Running task 1459 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_create_spdx)
NOTE: recipe libedit-20221030-3.1-r0: task do_compile: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_create_spdx: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_create_spdx: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_package: Succeeded
NOTE: Running task 1460 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata)
NOTE: recipe ncurses-6.4-r0: task do_packagedata: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_compile: Succeeded
NOTE: Running task 1461 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_install)
NOTE: recipe libpam-1.5.3-r0: task do_package: Succeeded
NOTE: Running task 1462 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata)
NOTE: recipe libedit-20221030-3.1-r0: task do_install: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1463 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx)
NOTE: recipe ncurses-6.4-r0: task do_create_spdx: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_install: Succeeded
NOTE: Running task 1464 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot)
NOTE: Running task 1465 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_package)
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1466 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_package)
NOTE: Running task 1467 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx)
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1468 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.69-r0: task do_package: Started
NOTE: recipe python3-3.11.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1469 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_configure)
NOTE: recipe python3-3.11.4-r0: task do_configure: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1470 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_collect_spdx_deps)
NOTE: recipe libedit-20221030-3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1471 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_collect_spdx_deps)
NOTE: recipe libcap-2.69-r0: task do_collect_spdx_deps: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_package: Succeeded
NOTE: Running task 1472 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata)
NOTE: recipe libcap-2.69-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1473 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_create_spdx)
NOTE: recipe libedit-20221030-3.1-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.69-r0: task do_package: Succeeded
NOTE: Running task 1474 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata)
NOTE: recipe libedit-20221030-3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata: Succeeded
NOTE: Running task 1475 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx)
NOTE: recipe libcap-2.69-r0: task do_create_spdx: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: Running task 1476 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure_ptest_base)
NOTE: recipe libcap-2.69-r0: task do_create_spdx: Succeeded
NOTE: Running task 1477 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_collect_spdx_deps)
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1478 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile)
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe bash-5.2.15-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.13-r0: task do_configure: Succeeded
NOTE: Running task 1479 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_compile)
NOTE: recipe shadow-4.13-r0: task do_compile: Started
NOTE: recipe shadow-4.13-r0: task do_compile: Succeeded
NOTE: Running task 1480 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_install)
NOTE: recipe shadow-4.13-r0: task do_install: Started
NOTE: recipe bash-5.2.15-r0: task do_compile: Succeeded
NOTE: Running task 1481 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1482 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1483 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Started
NOTE: recipe shadow-4.13-r0: task do_install: Succeeded
NOTE: Running task 1484 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot)
NOTE: Running task 1485 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot: Started
NOTE: recipe shadow-4.13-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1486 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1487 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_install)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1488 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_configure)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_configure: Succeeded
NOTE: Running task 1489 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_compile)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_compile: Started
NOTE: recipe libunistring-1.1-r0: task do_install: Succeeded
NOTE: Running task 1490 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot)
NOTE: Running task 1491 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_compile: Succeeded
NOTE: Running task 1492 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_install: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1493 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1494 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1495 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_install)
NOTE: recipe bash-5.2.15-r0: task do_install: Started
NOTE: recipe shadow-4.13-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata)
NOTE: recipe shadow-4.13-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Succeeded
NOTE: Running task 1497 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata)
NOTE: recipe shadow-4.13-r0: task do_packagedata: Succeeded
NOTE: Running task 1498 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1499 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_create_spdx)
NOTE: recipe libunistring-1.1-r0: task do_create_spdx: Started
NOTE: recipe libunistring-1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1500 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_collect_spdx_deps)
NOTE: recipe libidn2-2.3.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libidn2-2.3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_package: Succeeded
NOTE: Running task 1501 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1502 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1503 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Started
NOTE: recipe bash-5.2.15-r0: task do_install: Succeeded
NOTE: Running task 1504 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_install_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Succeeded
NOTE: Running task 1505 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1506 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot)
NOTE: Running task 1507 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1508 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package)
NOTE: recipe bash-5.2.15-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Succeeded
NOTE: Running task 1509 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1510 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_configure_ptest_base)
NOTE: recipe python3-3.11.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1512 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_compile)
NOTE: recipe python3-3.11.4-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_package: Succeeded
NOTE: Running task 1513 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata)
NOTE: recipe bash-5.2.15-r0: task do_packagedata: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1514 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1515 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Started
NOTE: recipe openssl-3.1.1-r0: task do_package: Succeeded
NOTE: Running task 1516 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata)
NOTE: recipe openssl-3.1.1-r0: task do_packagedata: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1517 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_create_spdx)
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.3-r0: task do_configure: Succeeded
NOTE: Running task 1518 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.3-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1519 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_compile)
NOTE: Running task 1520 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_install)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Started
NOTE: recipe coreutils-9.3-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 1521 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 1522 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1523 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1524 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1525 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_configure)
NOTE: recipe curl-8.1.2-r0: task do_configure: Started
NOTE: recipe python3-3.11.4-r0: task do_compile: Succeeded
NOTE: Running task 1526 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1527 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Started
NOTE: recipe python3-3.11.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.11.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1528 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_install)
NOTE: recipe python3-3.11.4-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 1529 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1530 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_create_spdx)
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx: Started
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1531 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_collect_spdx_deps)
NOTE: recipe gnutls-3.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnutls-3.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_compile: Succeeded
NOTE: Running task 1532 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.3-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1533 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_install)
NOTE: recipe coreutils-9.3-r0: task do_install: Started
NOTE: recipe coreutils-9.3-r0: task do_install: Succeeded
NOTE: Running task 1534 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.3-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1535 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package)
NOTE: recipe coreutils-9.3-r0: task do_package: Started
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1536 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_collect_spdx_deps)
NOTE: Running task 1537 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_collect_spdx_deps)
NOTE: recipe curl-8.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-3.11.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe curl-8.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1538 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_configure_ptest_base)
NOTE: recipe curl-8.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1539 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_compile)
NOTE: recipe curl-8.1.2-r0: task do_compile: Started
NOTE: recipe coreutils-9.3-r0: task do_package: Succeeded
NOTE: Running task 1540 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata)
NOTE: recipe coreutils-9.3-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata: Succeeded
NOTE: recipe curl-8.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1541 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_compile_ptest_base)
NOTE: recipe curl-8.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1542 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_install)
NOTE: recipe curl-8.1.2-r0: task do_install: Started
NOTE: recipe curl-8.1.2-r0: task do_install: Succeeded
NOTE: Running task 1543 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_install_ptest_base)
NOTE: recipe curl-8.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe curl-8.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1544 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_populate_sysroot)
NOTE: Running task 1545 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_package)
NOTE: recipe curl-8.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe curl-8.1.2-r0: task do_package: Started
NOTE: recipe curl-8.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_install: Succeeded
NOTE: Running task 1546 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_install_ptest_base)
NOTE: recipe python3-3.11.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.11.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1547 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package)
NOTE: recipe python3-3.11.4-r0: task do_package: Started
NOTE: recipe curl-8.1.2-r0: task do_package: Succeeded
NOTE: Running task 1548 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_packagedata)
NOTE: recipe curl-8.1.2-r0: task do_packagedata: Started
NOTE: recipe curl-8.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1549 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_create_spdx)
NOTE: recipe curl-8.1.2-r0: task do_create_spdx: Started
NOTE: recipe curl-8.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1550 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1551 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile)
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Started
NOTE: recipe python3-3.11.4-r0: task do_package: Succeeded
NOTE: Running task 1552 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata)
NOTE: recipe python3-3.11.4-r0: task do_packagedata: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1553 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx)
NOTE: Running task 1554 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm)
NOTE: recipe python3-3.11.4-r0: task do_create_spdx: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1555 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1556 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_install: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1557 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1558 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1559 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1560 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1561 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1562 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1563 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_create_spdx)
NOTE: recipe gnutls-3.8.0-r0: task do_create_spdx: Started
NOTE: recipe gnutls-3.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1564 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_configure: Succeeded
NOTE: Running task 1565 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_compile: Succeeded
NOTE: Running task 1566 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_install: Succeeded
NOTE: Running task 1567 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot)
NOTE: Running task 1568 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1569 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.189-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1570 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_configure)
NOTE: recipe elfutils-0.189-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package: Succeeded
NOTE: Running task 1571 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata: Succeeded
NOTE: Running task 1572 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Succeeded
NOTE: Running task 1573 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_configure: Succeeded
NOTE: Running task 1574 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1575 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_compile)
NOTE: recipe elfutils-0.189-r0: task do_compile: Started
NOTE: recipe elfutils-0.189-r0: task do_compile: Succeeded
NOTE: Running task 1576 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1577 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_install)
NOTE: recipe elfutils-0.189-r0: task do_install: Started
NOTE: recipe elfutils-0.189-r0: task do_install: Succeeded
NOTE: Running task 1578 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1579 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package)
NOTE: Running task 1580 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_package: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1581 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1582 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_configure)
NOTE: recipe iproute2-6.4.0-r0: task do_configure: Started
NOTE: recipe iproute2-6.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1583 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_compile)
NOTE: recipe iproute2-6.4.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56 CC=i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot KERNEL_INCLUDE=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include DOCDIR=/usr/share/doc/iproute2 SUBDIRS=lib tc ip bridge misc genl devlink tipc SBINDIR=/sbin LIBDIR=/usr/lib CCOPTS= -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/iproute2-6.4.0=/usr/src/debug/iproute2/6.4.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/iproute2-6.4
 .0=/usr/src/debug/iproute2/6.4.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/iproute2-6.4.0=/usr/src/debug/iproute2/6.4.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/iproute2-6.4.0=/usr/src/debug/iproute2/6.4.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot-native=
| 
| lib
|     CC       libgenl.o
|     CC       libnetlink.o
|     CC       mnl_utils.o
|     CC       utils.o
|     CC       utils_math.o
|     CC       rt_names.o
|     CC       ll_map.o
|     CC       ll_types.o
|     CC       ll_proto.o
|     CC       ll_addr.o
|     CC       inet_proto.o
|     CC       namespace.o
|     CC       json_writer.o
|     CC       json_print.o
|     CC       json_print_math.o
|     CC       names.o
|     CC       color.o
|     CC       bpf_legacy.o
|     CC       bpf_glue.o
|     CC       exec.o
|     CC       fs.o
|     CC       cg_map.o
|     CC       ppp_proto.o
|     CC       ax25_ntop.o
|     CC       mpls_ntop.o
|     CC       rose_ntop.o
|     CC       mpls_pton.o
|     CC       netrom_ntop.o
| In file included from ll_types.c:20:
| ../include/uapi/linux/sockios.h:45: warning: "SIOCGSTAMP" redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ll_types.c:12:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:108: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |
| ../include/uapi/linux/sockios.h:47: warning: "SIOCGSTAMPNS" redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:109: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |
| In file included from ll_proto.c:21:
| ../include/uapi/linux/sockios.h:45: warning: "SIOCGSTAMP" redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ll_proto.c:13:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:108: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |
| ../include/uapi/linux/sockios.h:47: warning: "SIOCGSTAMPNS" redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:109: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |
| In file included from ll_addr.c:20:
| ../include/uapi/linux/sockios.h:45: warning: "SIOCGSTAMP" redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ll_addr.c:12:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:108: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |
| ../include/uapi/linux/sockios.h:47: warning: "SIOCGSTAMPNS" redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:109: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |
| In file included from rose_ntop.c:16:
| ../include/uapi/linux/sockios.h:45: warning: "SIOCGSTAMP" redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from rose_ntop.c:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:108: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |
| ../include/uapi/linux/sockios.h:47: warning: "SIOCGSTAMPNS" redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:109: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |
| utils.c: In function 'print_timestamp':
| utils.c:1229:38: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'suseconds_t' {aka 'long long int'} [-Wformat=]
|  1229 |                 fprintf(fp, "[%s.%06ld] ", tshort, tv.tv_usec);
|       |                                  ~~~~^             ~~~~~~~~~~
|       |                                      |               |
|       |                                      long int        suseconds_t {aka long long int}
|       |                                  %06lld
| utils.c:1234:46: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'suseconds_t' {aka 'long long int'} [-Wformat=]
|  1234 |                 fprintf(fp, "Timestamp: %s %ld usec\n",
|       |                                            ~~^
|       |                                              |
|       |                                              long int
|       |                                            %lld
|  1235 |                         tstr, tv.tv_usec);
|       |                               ~~~~~~~~~~
|       |                                 |
|       |                                 suseconds_t {aka long long int}
| bpf_legacy.c: In function 'bpf_obj_hash':
| bpf_legacy.c:1353:64: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'off_t' {aka 'long long int'} [-Wformat=]
|  1353 |                 fprintf(stderr, "Error from sendfile (%zd vs %zu bytes): %s\n",
|       |                                                              ~~^
|       |                                                                |
|       |                                                                unsigned int
|       |                                                              %llu
|  1354 |                         size, stbuff.st_size, strerror(errno));
|       |                               ~~~~~~~~~~~~~~
|       |                                     |
|       |                                     off_t {aka long long int}
|     AR       libnetlink.a
|     AR       libutil.a
| 
| tc
|     CC       tc.o
|     CC       tc_qdisc.o
|     CC       tc_class.o
|     CC       tc_filter.o
|     CC       tc_util.o
|     CC       tc_monitor.o
|     CC       tc_exec.o
|     CC       m_police.o
|     CC       m_estimator.o
|     CC       m_action.o
|     CC       m_ematch.o
|     YACC     emp_ematch.tab.c
|     LEX      emp_ematch.lex.c
|     CC       q_fifo.o
|     CC       q_sfq.o
|     CC       q_prio.o
|     CC       q_red.o
|     CC       q_skbprio.o
|     CC       q_tbf.o
|     CC       q_cbq.o
|     CC       q_multiq.o
|     CC       q_netem.o
|     CC       q_sfb.o
|     CC       q_choke.o
|     CC       f_rsvp.o
|     CC       f_u32.o
|     CC       f_route.o
|     CC       f_fw.o
|     CC       f_basic.o
|     CC       f_bpf.o
|     CC       f_flow.o
|     CC       f_flower.o
|     CC       f_cgroup.o
|     CC       q_dsmark.o
|     CC       q_gred.o
|     CC       f_tcindex.o
|     CC       q_ingress.o
|     CC       q_hfsc.o
|     CC       q_htb.o
|     CC       q_drr.o
|     CC       q_qfq.o
|     CC       m_gact.o
|     CC       m_mirred.o
|     CC       m_mpls.o
|     CC       m_nat.o
|     CC       m_pedit.o
|     CC       m_ife.o
| In file included from ../include/uapi/linux/netdevice.h:29,
|                  from ../include/uapi/linux/if_arp.h:27,
|                  from f_flower.c:14:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from f_flower.c:12:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
|     CC       m_skbedit.o
|     CC       m_skbmod.o
|     CC       m_csum.o
|     CC       m_simple.o
|     CC       m_vlan.o
|     CC       m_connmark.o
|     CC       m_ctinfo.o
|     CC       m_bpf.o
|     CC       m_tunnel_key.o
|     CC       m_sample.o
|     CC       m_ct.o
|     CC       m_gate.o
|     CC       p_ip.o
|     CC       p_ip6.o
|     CC       p_icmp.o
|     CC       p_eth.o
|     CC       p_tcp.o
|     CC       p_udp.o
|     CC       em_nbyte.o
|     CC       em_cmp.o
|     CC       em_u32.o
|     CC       em_canid.o
|     CC       em_meta.o
|     CC       q_mqprio.o
|     CC       q_codel.o
|     CC       q_fq_codel.o
|     CC       q_fq.o
|     CC       q_pie.o
|     CC       q_fq_pie.o
|     CC       q_cake.o
|     CC       q_hhf.o
|     CC       q_clsact.o
|     CC       e_bpf.o
|     CC       f_matchall.o
|     CC       q_cbs.o
|     CC       q_etf.o
|     CC       q_taprio.o
|     CC       q_plug.o
|     CC       q_ets.o
|     CC       em_ipt.o
|     CC       em_ipset.o
|     CC       tc_core.o
|     CC       tc_red.o
|     CC       tc_cbq.o
|     CC       tc_estimator.o
|     CC       tc_stab.o
|     CC       tc_qevent.o
|     CC       m_xt.so
|     CC       emp_ematch.tab.o
| In file included from tc_util.h:7,
|                  from m_ematch.h:11,
|                  from em_ipset.c:39:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from ../include/xtables.h:17,
|                  from em_ipset.c:23:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
|     CC       emp_ematch.lex.o
| In file included from tc_util.h:7,
|                  from m_ematch.h:11,
|                  from em_ipt.c:13:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from ../include/xtables.h:17,
|                  from em_ipt.c:12:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
| In file included from ../include/uapi/linux/netfilter_ipv4/ip_tables.h:21,
|                  from m_xt.c:15:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from m_xt.c:12:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
|     AR       libtc.a
|     LINK     tc
| rm emp_ematch.lex.c
| 
| ip
|     CC       ip.o
|     CC       ipaddress.o
|     CC       ipaddrlabel.o
|     CC       iproute.o
|     CC       iprule.o
|     CC       ipnetns.o
|     CC       rtm_map.o
|     CC       iptunnel.o
|     CC       ip6tunnel.o
|     CC       tunnel.o
|     CC       ipneigh.o
|     CC       ipntable.o
|     CC       iplink.o
|     CC       ipmaddr.o
|     CC       ipmonitor.o
|     CC       ipmroute.o
|     CC       ipprefix.o
|     CC       iptuntap.o
|     CC       ipxfrm.o
|     CC       iptoken.o
|     CC       xfrm_state.o
|     CC       xfrm_policy.o
|     CC       xfrm_monitor.o
|     CC       iplink_dummy.o
|     CC       iplink_nlmon.o
|     CC       iplink_ifb.o
|     CC       iplink_team.o
|     CC       iplink_vcan.o
|     CC       iplink_vxcan.o
|     CC       iplink_vlan.o
|     CC       link_veth.o
|     CC       link_gre.o
|     CC       iplink_can.o
|     CC       iplink_xdp.o
|     CC       iplink_macvlan.o
|     CC       ipl2tp.o
|     CC       link_vti.o
|     CC       link_vti6.o
|     CC       link_xfrm.o
|     CC       tcp_metrics.o
|     CC       iplink_vxlan.o
|     CC       iplink_ipoib.o
|     CC       ipnetconf.o
| In file included from ipmaddr.c:21:
| ../include/uapi/linux/sockios.h:45: warning: "SIOCGSTAMP" redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ipmaddr.c:12:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:108: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |
| ../include/uapi/linux/sockios.h:47: warning: "SIOCGSTAMPNS" redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:109: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from iptunnel.c:19:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from iptunnel.c:16:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
|     CC       link_ip6tnl.o
| In file included from ipaddress.c:26:
| ../include/uapi/linux/sockios.h:45: warning: "SIOCGSTAMP" redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ipaddress.c:14:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:108: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |
| ../include/uapi/linux/sockios.h:47: warning: "SIOCGSTAMPNS" redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:109: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |
|     CC       link_iptnl.o
|     CC       link_gre6.o
|     CC       iplink_bond.o
|     CC       iplink_bond_slave.o
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_vti6.c:17:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from link_vti6.c:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_gre.c:15:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from link_gre.c:9:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
| In file included from ipmroute.c:22:
| ../include/uapi/linux/sockios.h:45: warning: "SIOCGSTAMP" redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ipmroute.c:13:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:108: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |
| ../include/uapi/linux/sockios.h:47: warning: "SIOCGSTAMPNS" redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:109: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_vti.c:16:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from link_vti.c:10:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
|     CC       iplink_hsr.o
|     CC       iplink_bridge.o
|     CC       iplink_bridge_slave.o
|     CC       iplink_dsa.o
|     CC       ipfou.o
|     CC       iplink_ipvlan.o
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_gre6.c:15:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from link_gre6.c:9:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_ip6tnl.c:15:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from link_ip6tnl.c:9:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
|     CC       iplink_geneve.o
|     CC       iplink_vrf.o
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_iptnl.c:16:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from link_iptnl.c:9:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
| xfrm_policy.c: In function 'xfrm_policy_default_print':
|     CC       iproute_lwtunnel.o
| xfrm_policy.c:1226:60: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
|  1226 |                         "BUG: short nlmsg len %u (expect %lu) for XFRM_MSG_GETDEFAULT\n",
|       |                                                          ~~^
|       |                                                            |
|       |                                                            long unsigned int
|       |                                                          %u
|     CC       ipmacsec.o
|     CC       ipila.o
|     CC       ipvrf.o
|     CC       iplink_xstats.o
|     CC       ipseg6.o
|     CC       iplink_netdevsim.o
|     CC       iplink_rmnet.o
|     CC       ipnexthop.o
|     CC       ipmptcp.o
|     CC       iplink_bareudp.o
|     CC       iplink_wwan.o
|     CC       ipioam6.o
|     CC       iplink_amt.o
| ipnexthop.c: In function 'ipnh_parse_nhmsg':
| ipnexthop.c:375:78: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
|   375 |                         fprintf(fp, "<nexthop id %u invalid gateway length %lu>\n",
|       |                                                                            ~~^
|       |                                                                              |
|       |                                                                              long unsigned int
|       |                                                                            %u
|     CC       iplink_batadv.o
|     CC       iplink_gtp.o
|     CC       iplink_virt_wifi.o
|     CC       ipstats.o
|     CC       rtmon.o
|     LINK     rtmon
|     LINK     ip
| 
| bridge
|     CC       bridge.o
|     CC       fdb.o
|     CC       monitor.o
|     CC       link.o
|     CC       mdb.o
|     CC       vlan.o
|     CC       vni.o
| In file included from vlan.c:14:
| ../include/json_print.h:84:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
|    84 | _PRINT_FUNC(tv, const struct timeval *)
|       |                              ^~~~~~~
| ../include/json_print.h:54:37: note: in definition of macro '_PRINT_FUNC'
|    54 |                                     type value);                        \
|       |                                     ^~~~
| ../include/json_print.h:84:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
|    84 | _PRINT_FUNC(tv, const struct timeval *)
|       |                              ^~~~~~~
| ../include/json_print.h:59:45: note: in definition of macro '_PRINT_FUNC'
|    59 |                                             type value)                 \
|       |                                             ^~~~
| ../include/json_print.h: In function 'print_tv':
| ../include/json_print.h:62:48: warning: passing argument 5 of 'print_color_tv' from incompatible pointer type [-Wincompatible-pointer-types]
|    62 |                                                value);                  \
|       |                                                ^~~~~
|       |                                                |
|       |                                                const struct timeval *
| ../include/json_print.h:84:1: note: in expansion of macro '_PRINT_FUNC'
|    84 | _PRINT_FUNC(tv, const struct timeval *)
|       | ^~~~~~~~~~~
| ../include/json_print.h:54:42: note: expected 'const struct timeval *' but argument is of type 'const struct timeval *'
|    54 |                                     type value);                        \
|       |                                          ^
| ../include/json_print.h:84:1: note: in expansion of macro '_PRINT_FUNC'
|    84 | _PRINT_FUNC(tv, const struct timeval *)
|       | ^~~~~~~~~~~
| In file included from vni.c:19:
| ../include/json_print.h:84:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
|    84 | _PRINT_FUNC(tv, const struct timeval *)
|       |                              ^~~~~~~
| ../include/json_print.h:54:37: note: in definition of macro '_PRINT_FUNC'
|    54 |                                     type value);                        \
|       |                                     ^~~~
| ../include/json_print.h:84:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
|    84 | _PRINT_FUNC(tv, const struct timeval *)
|       |                              ^~~~~~~
| ../include/json_print.h:59:45: note: in definition of macro '_PRINT_FUNC'
|    59 |                                             type value)                 \
|       |                                             ^~~~
| ../include/json_print.h: In function 'print_tv':
| ../include/json_print.h:62:48: warning: passing argument 5 of 'print_color_tv' from incompatible pointer type [-Wincompatible-pointer-types]
|    62 |                                                value);                  \
|       |                                                ^~~~~
|       |                                                |
|       |                                                const struct timeval *
| ../include/json_print.h:84:1: note: in expansion of macro '_PRINT_FUNC'
|    84 | _PRINT_FUNC(tv, const struct timeval *)
|       | ^~~~~~~~~~~
| ../include/json_print.h:54:42: note: expected 'const struct timeval *' but argument is of type 'const struct timeval *'
|    54 |                                     type value);                        \
|       |                                          ^
| ../include/json_print.h:84:1: note: in expansion of macro '_PRINT_FUNC'
|    84 | _PRINT_FUNC(tv, const struct timeval *)
|       | ^~~~~~~~~~~
| mdb.c: In function 'mdb_parse_dst_port':
| mdb.c:650:27: error: 'USHRT_MAX' undeclared (first use in this function)
|   650 |         } else if (port > USHRT_MAX) {
|       |                           ^~~~~~~~~
| mdb.c:24:1: note: 'USHRT_MAX' is defined in header '<limits.h>'; did you forget to '#include <limits.h>'?
|    23 | #include "json_print.h"
|   +++ |+#include <limits.h>
|    24 |
| mdb.c:650:27: note: each undeclared identifier is reported only once for each function it appears in
|   650 |         } else if (port > USHRT_MAX) {
|       |                           ^~~~~~~~~
| mdb.c: In function 'mdb_parse_vni':
| mdb.c:666:47: error: 'ULONG_MAX' undeclared (first use in this function)
|   666 |         if ((endptr && *endptr) || vni_num == ULONG_MAX)
|       |                                               ^~~~~~~~~
| mdb.c:666:47: note: 'ULONG_MAX' is defined in header '<limits.h>'; did you forget to '#include <limits.h>'?
| make[1]: *** [../config.mk:44: mdb.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make: *** [Makefile:77: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/temp/run.do_compile.4161097:179 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/temp/run.do_compile.4161097, line 179
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/temp/run.do_compile.4161097, line 164
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/temp/run.do_compile.4161097, line 169
| 	#4: base_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/temp/run.do_compile.4161097, line 147
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/temp/run.do_compile.4161097, line 141
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/temp/run.do_compile.4161097, line 189
NOTE: recipe iproute2-6.4.0-r0: task do_compile: Failed
NOTE: recipe elfutils-0.189-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1583 tasks of which 882 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.4.0-r0 do_compile: oe_runmake failed
ERROR: iproute2-6.4.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/temp/run.do_compile.4161097', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0-r0/temp/log.do_compile.4161097
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_compile) failed with exit code '1'

--===============7018520580238207185==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-6.3.0-6.4.0.patch"

RnJvbSA0NDhkOGQzZjAxYjA5NWI2YzZlODY4MmJlNzBjYjZhN2YyOTQ5YmI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMDY6NDU6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
cHJvdXRlMjogdXBncmFkZSA2LjMuMCAtPiA2LjQuMAoKLS0tCiAuLi4vaXByb3V0ZTIve2lwcm91
dGUyXzYuMy4wLmJiID0+IGlwcm91dGUyXzYuNC4wLmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL3tpcHJvdXRlMl82LjMuMC5iYiA9PiBpcHJvdXRl
Ml82LjQuMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2lwcm91dGUyL2lwcm91dGUyXzYuMy4wLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9p
cHJvdXRlMi9pcHJvdXRlMl82LjQuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzYuMy4wLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzYuNC4w
LmJiCmluZGV4IDg5MmZhODU0ZGEuLmJjMTZlMmFjOGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi4zLjAuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMl82LjQuMC5iYgpAQCAtMTUsNyArMTUs
NyBAQCBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvdXRpbHMvbmV0LyR7QlBO
fS8ke0JQfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1saWJjLWNvbXBhdC5oLWFk
ZC1tdXNsLXdvcmthcm91bmQucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJkZmIyYTk4ZGI5NmU3YTY1M2NmZmM2NjkzMzM1YTFhNDY2ZTI5YTM0YjZhYzUyOGJl
NDhmMzVlMWQyNzY2NzMyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRjNTFiOGRlY2JjN2U0ZGEx
NTlmZmIwNjZmNTkwY2ZiOTNkYmY5YWY3ZmY4NmIxNjQ3Y2U0MmI3YzE3OWEyNzIiCiAKIGluaGVy
aXQgdXBkYXRlLWFsdGVybmF0aXZlcyBiYXNoLWNvbXBsZXRpb24gcGtnY29uZmlnCiAKLS0gCjIu
MzkuMgoK

--===============7018520580238207185==--

