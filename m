Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352F4C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 18:26:22 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.1439.1667845574572005055
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 10:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aMO04J7A;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id cb2-20020a056830618200b00661b6e5dcd8so7029974otb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 10:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=miY7v5ar4VF/tWc1IlcR388QGqsIfKzJazNGTliZ2Oc=;
        b=aMO04J7AUpr+DiUbt2zlHcDW2Jv21aZo6dKuTq+EwDffhhkaXqxx76r2YYsDN7ACkY
         2vy2u4rfd0KEtshs4vCmOZZMdFSacZjXW+jyEnmFrP4VoVsX4vor1Db/AyGPoz0tAcve
         KJF+3jQKtiZ+0C8fpeNkiVSbqhSV1M2fz4Khb1Jmo25sPnYQQKd4ILSMxUE6FndzcWTm
         RkimI4oPE50Ir/t9UTNMfVezEf8UuvukRNJKaOEp5r4QpxKKcAk1iAK91Px2+Aun8Mi4
         QjOKwPyhUL0v6kQNN9f3uehnq2X+4hSsQ/kdtzlQWJca/GvCx/XnR1pk+s4t1dl6bO95
         eZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=miY7v5ar4VF/tWc1IlcR388QGqsIfKzJazNGTliZ2Oc=;
        b=2ejyWv0Z93qLwcEu1CqDykG4nZIteYqZgpoF0Qr+tB8UM4KrT/aUJSnaajA/+RRmte
         nQY/tU1/bOpYxCAmzvQM9CT6PWuN7bLgwC2HDatbiWcXIyW08qADIy0dm1zY8kZdhx1j
         T/NglVKU2pRGMoApc4TS0Q8kXq5e4sOFv1YSNYYvGaOV67y3kRizp1xY7Fwr3z7r8WBP
         EI2XSFI/pjYkoXrDiFtuxhwtmNhudnPykLUVCRfZssaf5lmeAcVF1YTiHDeDNLz0Cysl
         tbAmAAgJyIo8qEJ6ZUsX25DC9ldk7lbI6KDThtDwaDPqmYjqPPb2r4BnTKsjNGPiGGhS
         VktA==
X-Gm-Message-State: ACrzQf3541cnI2LJtFFmoepDSSwR+6LaiY8o+umDN7oQLFYSTxtUphz0
	pBkIY5HI+Tm/alex8t4C63uu0PnwdtTNn829LOw=
X-Google-Smtp-Source: AMsMyM78ctgASVn6iZJckkGqq4q18bhcbKgXr0oLvaN4hpuGdh7s0JKPBDPaZF7Sdk3/iTwndVASOBvSLRphCPQygSQ=
X-Received: by 2002:a9d:65c9:0:b0:66c:5124:909a with SMTP id
 z9-20020a9d65c9000000b0066c5124909amr21748394oth.111.1667845573749; Mon, 07
 Nov 2022 10:26:13 -0800 (PST)
MIME-Version: 1.0
References: <20221107145508.1051404-1-alex@linutronix.de> <20221107145508.1051404-44-alex@linutronix.de>
In-Reply-To: <20221107145508.1051404-44-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Nov 2022 10:25:47 -0800
Message-ID: <CAMKF1srHNxbP7b57jdbwAFq5+ZTgno6QcMF=VgwCGAXVxeFqAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 44/48] selftest: add a copy of previous
 mtd-utils version to meta-selftest
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 18:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172929

On Mon, Nov 7, 2022 at 6:56 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> The latest version update eliminated all custom patches, and the selftest
> expects them.
>

interesting, is it used for testing the patching mechanism during selftest ?
in that case it might be possible to use package which has a sticky
patch instead.
we can avoid maintaining another recipe.

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...used-linux-fs.h-header-from-includes.patch | 31 ++++++++
>  .../mtd/mtd-utils-selftest_git.bb             | 77 +++++++++++++++++++
>  meta/lib/oeqa/selftest/cases/devtool.py       |  4 +-
>  3 files changed, 110 insertions(+), 2 deletions(-)
>  create mode 100644 meta-selftest/recipes-devtools/mtd/mtd-utils-selftest/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
>  create mode 100644 meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
>
> diff --git a/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
> new file mode 100644
> index 0000000000..73d4a8475f
> --- /dev/null
> +++ b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
> @@ -0,0 +1,31 @@
> +From 6fb10bd18488ed84776675bc1b2982800a51d839 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 6 Aug 2022 20:14:38 -0700
> +Subject: [mtd-utils][PATCH] tests: Remove unused linux/fs.h header from includes
> +
> +This header is not needed, moreover it includes linux/mount.h which is
> +now in conflict[1] with glibc provided sys/mount.h from glibc 2.36 onwards
> +
> +[1] https://sourceware.org/glibc/wiki/Release/2.36
> +
> +Upstream-Status: Submitted [https://lists.infradead.org/pipermail/linux-mtd/2022-August/094667.html]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + tests/fs-tests/lib/tests.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/tests/fs-tests/lib/tests.c b/tests/fs-tests/lib/tests.c
> +index d1a2e0c..3db0426 100644
> +--- a/tests/fs-tests/lib/tests.c
> ++++ b/tests/fs-tests/lib/tests.c
> +@@ -35,7 +35,6 @@
> + #include <sys/vfs.h>
> + #include <sys/mount.h>
> + #include <sys/statvfs.h>
> +-#include <linux/fs.h>
> + #include <linux/jffs2.h>
> +
> + #include "tests.h"
> +--
> +2.37.1
> +
> diff --git a/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
> new file mode 100644
> index 0000000000..ca2141c972
> --- /dev/null
> +++ b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
> @@ -0,0 +1,77 @@
> +SUMMARY = "Tools for managing memory technology devices"
> +HOMEPAGE = "http://www.linux-mtd.infradead.org/"
> +DESCRIPTION = "mtd-utils tool is a generic Linux subsystem for memory devices, especially Flash devices."
> +SECTION = "base"
> +LICENSE = "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> +                    file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
> +
> +inherit autotools pkgconfig update-alternatives
> +
> +DEPENDS = "zlib e2fsprogs util-linux"
> +RDEPENDS:mtd-utils-tests += "bash"
> +
> +PV = "2.1.4"
> +
> +SRCREV = "c7f1bfa44a84d02061787e2f6093df5cc40b9f5c"
> +SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
> +           file://0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +# xattr support creates an additional compile-time dependency on acl because
> +# the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
> +# regardless whether acl is enabled or disabled in the distro should be okay.
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)} lzo jffs ubifs"
> +PACKAGECONFIG[lzo] = "--with-lzo,--without-lzo,lzo"
> +PACKAGECONFIG[xattr] = "--with-xattr,--without-xattr,acl"
> +PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,openssl"
> +PACKAGECONFIG[jffs] = "--with-jffs,--without-jffs"
> +PACKAGECONFIG[ubifs] = "--with-ubifs,--without-ubifs"
> +PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
> +
> +CPPFLAGS:append:riscv64  = " -pthread -D_REENTRANT"
> +
> +EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=${S}'"
> +
> +# Use higher priority than corresponding BusyBox-provided applets
> +ALTERNATIVE_PRIORITY = "100"
> +
> +ALTERNATIVE:${PN} = "flashcp flash_eraseall flash_lock flash_unlock nanddump nandwrite"
> +ALTERNATIVE:${PN}-ubifs = "ubiattach ubidetach ubimkvol ubirename ubirmvol ubirsvol ubiupdatevol"
> +
> +ALTERNATIVE_LINK_NAME[nandwrite] = "${sbindir}/nandwrite"
> +ALTERNATIVE_LINK_NAME[nanddump] = "${sbindir}/nanddump"
> +ALTERNATIVE_LINK_NAME[ubiattach] = "${sbindir}/ubiattach"
> +ALTERNATIVE_LINK_NAME[ubidetach] = "${sbindir}/ubidetach"
> +ALTERNATIVE_LINK_NAME[ubimkvol] = "${sbindir}/ubimkvol"
> +ALTERNATIVE_LINK_NAME[ubirename] = "${sbindir}/ubirename"
> +ALTERNATIVE_LINK_NAME[ubirmvol] = "${sbindir}/ubirmvol"
> +ALTERNATIVE_LINK_NAME[ubirsvol] = "${sbindir}/ubirsvol"
> +ALTERNATIVE_LINK_NAME[ubiupdatevol] = "${sbindir}/ubiupdatevol"
> +ALTERNATIVE_LINK_NAME[flash_eraseall] = "${sbindir}/flash_eraseall"
> +ALTERNATIVE_LINK_NAME[flash_lock] = "${sbindir}/flash_lock"
> +ALTERNATIVE_LINK_NAME[flash_unlock] = "${sbindir}/flash_unlock"
> +ALTERNATIVE_LINK_NAME[flashcp] = "${sbindir}/flashcp"
> +
> +do_install () {
> +       oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
> +}
> +
> +PACKAGES =+ "mtd-utils-misc mtd-utils-tests"
> +PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "jffs", "mtd-utils-jffs2", "", d)}"
> +PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "ubifs", "mtd-utils-ubifs", "", d)}"
> +
> +FILES:mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/jffs2reader ${sbindir}/sumtool"
> +FILES:mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
> +FILES:mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
> +FILES:mtd-utils-tests = "${libexecdir}/mtd-utils/*"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +# git/.compr.c.dep:46: warning: NUL character seen; rest of line ignored
> +# git/.compr.c.dep:47: *** missing separator.  Stop.
> +PARALLEL_MAKE = ""
> +
> +EXCLUDE_FROM_WORLD = "1"
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
> index 142932e12f..0cb7403f16 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -954,7 +954,7 @@ class DevtoolUpdateTests(DevtoolBase):
>
>      def test_devtool_update_recipe_git(self):
>          # Check preconditions
> -        testrecipe = 'mtd-utils'
> +        testrecipe = 'mtd-utils-selftest'
>          bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
>          recipefile = bb_vars['FILE']
>          src_uri = bb_vars['SRC_URI']
> @@ -1075,7 +1075,7 @@ class DevtoolUpdateTests(DevtoolBase):
>
>      def test_devtool_update_recipe_append_git(self):
>          # Check preconditions
> -        testrecipe = 'mtd-utils'
> +        testrecipe = 'mtd-utils-selftest'
>          bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
>          recipefile = bb_vars['FILE']
>          src_uri = bb_vars['SRC_URI']
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172895): https://lists.openembedded.org/g/openembedded-core/message/172895
> Mute This Topic: https://lists.openembedded.org/mt/94867621/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

