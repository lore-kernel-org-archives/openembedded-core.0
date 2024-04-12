Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4ACC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 06:46:31 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.40542.1712904385018786201
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 23:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QQxdJYHy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFAA7FF807;
	Fri, 12 Apr 2024 06:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712904383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BD7ryVxZPens/d+L9avlcBCzOC8o6fCxoe5wwsBZkN0=;
	b=QQxdJYHye3rT7XChNp8uIEJ/ZCG4mK0gVCgp6iKcbRTfHHNYKaQ96Bu1emXUfmbAPUpMfy
	unJxBdVsPl6eN03ycOrfyPgi2efld+XEaB8aADqhoeqBPkH92nG/xnpzU7d0LYlk/cFecM
	1unDJg1HeWa1EcjbJrpjw0Oe1uWniSsPmSuto2qsqexiukCfhKgNdIb7SglTarJHucuB53
	9OI+cbTXPLZNETqNFoAti9Vaesqcl4pBnfKV91vJisMBLfBK90SD9/6fER04R8oBuHCiLA
	0bYbfkgiuwQCdsunbnyw4xZH+G5VOLS7TC+/ykl5KQmQQsov0ib1B42gYQbxzg==
Date: Fri, 12 Apr 2024 08:46:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 13/33] librepo: upgrade 1.17.0 -> 1.17.1
Message-ID: <202404120646223f5bd60c@mail.local>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
 <1712646620-16608-13-git-send-email-wangmy@fujitsu.com>
 <202404110910405650fc2b@mail.local>
 <TYWPR01MB11861F688203CF49B1C63E3E9DC042@TYWPR01MB11861.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYWPR01MB11861F688203CF49B1C63E3E9DC042@TYWPR01MB11861.jpnprd01.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 06:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198155

On 12/04/2024 00:52:52+0000, Mingyu Wang (Fujitsu) wrote:
> I use the command git am and patch on master-text to apply this patch, they are all succeeded.
> May I ask what command you used to apply this patch, that would be helpful. Thank you.

I use git am, the patch is definitively mangled as you can see on the
list archive:
https://lore.kernel.org/all/1712646620-16608-13-git-send-email-wangmy@fujitsu.com/

> 
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, China
> TEL：+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> 
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Alexandre
> > Belloni via lists.openembedded.org
> > Sent: Thursday, April 11, 2024 5:11 PM
> > To: Wang, Mingyu/王 鸣瑜 <wangmy@fujitsu.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 13/33] librepo: upgrade 1.17.0 -> 1.17.1
> > 
> > On 09/04/2024 15:10:00+0800, wangmy via lists.openembedded.org wrote:
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > 0001-gpg_gpgme.c-fix-build-errors-with-older-gcc.patch
> > > removed since it's included in 1.17.1
> > >
> > > Changelog:
> > > =============
> > > -gpg_gpgme.c: fix build errors with older gcc -Fix some compiler
> > > warnings -Change header files to match a configured ABI regarding a
> > > zchunk support -Fix building zchunk code if zchunk is enabled
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  ...me.c-fix-build-errors-with-older-gcc.patch | 36
> > > -------------------  .../{librepo_1.17.0.bb => librepo_1.17.1.bb}  |
> > > 3 +-
> > >  2 files changed, 1 insertion(+), 38 deletions(-)  delete mode 100644
> > > meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.c-fix-build-error
> > > s-with-older-gcc.patch  rename
> > > meta/recipes-devtools/librepo/{librepo_1.17.0.bb => librepo_1.17.1.bb}
> > > (88%)
> > >
> > > diff --git
> > > a/meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.c-fix-build-err
> > > ors-with-older-gcc.patch
> > > b/meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.c-fix-build-err
> > > ors-with-older-gcc.patch
> > > deleted file mode 100644
> > > index 8727b181b3..0000000000
> > > ---
> > > a/meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.c-fix-build-err
> > > ors-with-older-gcc.patch
> > > +++ /dev/null
> > > @@ -1,36 +0,0 @@
> > > -From b525cdec3051d1c6ff0c3cd38bf3070b18d6fb50 Mon Sep 17 00:00:00
> > > 2001
> > > -From: Alexander Kanavin <alex@linutronix.de>
> > > -Date: Wed, 6 Mar 2024 10:13:38 +0100
> > > -Subject: [PATCH] gpg_gpgme.c: fix build errors with older gcc
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=UTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -When selinux is not enabled, older gcc versions error out this way:
> > > -
> > > -| /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-193
> > > -| 8845/tmp-mc-tiny/hosttools/gcc -DG_LOG_DOMAIN=\"librepo\"
> > > -| -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
> > -D_LARGEFILE_SOURCE
> > > -| -Dlibrepo_EXPORTS
> > > -| -I/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1
> > > -| 938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/git
> > > -| -I/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1
> > > -| 938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/recipe-
> > > -| sysroot-native/usr/lib/pkgconfig/../../../usr/include/libmount
> > > -| -I/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1
> > > -| 938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/recipe-
> > > -| sysroot-native/usr/lib/pkgconfig/../../../usr/include/blkid
> > > -| -I/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1
> > > -| 938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/recipe-
> > > -| sysroot-native/usr/lib/pkgconfig/../../../usr/include/glib-2.0
> > > -| -I/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1
> > > -| 9
> > >
> > > 38845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/recipe-sysr
> > > oot-native/usr/lib/pkgconfig/../../../usr/lib/glib-2.0/include
> > > -I/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938
> > > 845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/recipe-sysroo
> > > t-native/usr/lib/pkgconfig/../../../usr/include/libxml2
> > > -isystem/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-s
> > > t-1938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/recipe-
> > > sysroot-native/usr/include -O2 -pipe -std=c99 -Wall -fPIC -MD -MT
> > > librepo/CMakeFiles/librepo.dir/gpg_gpgme.c.o -MF
> > > librepo/CMakeFiles/librepo.dir/gpg_gpgme.c.o.d -o
> > > librepo/CMakeFiles/librepo.dir/gpg_gpgme.c.o -c
> > > /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-193884
> > > 5/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/git/librepo/gpg
> > > _gpgme.c
> > 
> > This line has been mangled so the patch doesn't apply
> > 
> > > -|
> > /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp
> > -mc-tiny/work/aarch64-linux/librepo-native/1.17.0/git/librepo/gpg_gpgme.c: In
> > function ‘lr_gpg_ensure_socket_dir_exists’:
> > > -|
> > /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp
> > -mc-tiny/work/aarch64-linux/librepo-native/1.17.0/git/librepo/gpg_gpgme.c:13
> > 5:1: error: label at end of compound statement
> > > -|   135 | exit:
> > > -|       | ^~~~
> > > -
> > > -Ensuring the exit: block is not empty fixes the issue.
> > > -
> > > -Upstream-Status: Submitted
> > > [https://github.com/rpm-software-management/librepo/pull/300]
> > > -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ----
> > > - librepo/gpg_gpgme.c | 1 +
> > > - 1 file changed, 1 insertion(+)
> > > -
> > > -diff --git a/librepo/gpg_gpgme.c b/librepo/gpg_gpgme.c -index
> > > c4addb2..47c3153 100644
> > > ---- a/librepo/gpg_gpgme.c
> > > -+++ b/librepo/gpg_gpgme.c
> > > -@@ -144,6 +144,7 @@ exit:
> > > -     }
> > > -     freecon(old_default_context);
> > > - #endif
> > > -+    return;
> > > - }
> > > -
> > > - static gpgme_ctx_t
> > > diff --git a/meta/recipes-devtools/librepo/librepo_1.17.0.bb
> > > b/meta/recipes-devtools/librepo/librepo_1.17.1.bb
> > > similarity index 88%
> > > rename from meta/recipes-devtools/librepo/librepo_1.17.0.bb
> > > rename to meta/recipes-devtools/librepo/librepo_1.17.1.bb
> > > index 810191459d..beb8baf8d6 100644
> > > --- a/meta/recipes-devtools/librepo/librepo_1.17.0.bb
> > > +++ b/meta/recipes-devtools/librepo/librepo_1.17.1.bb
> > > @@ -8,10 +8,9 @@ LIC_FILES_CHKSUM =
> > "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> > >  SRC_URI =
> > "git://github.com/rpm-software-management/librepo.git;branch=master;proto
> > col=https \
> > >
> > file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
> > >
> > file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
> > > -           file://0001-gpg_gpgme.c-fix-build-errors-with-older-gcc.patch \
> > >             "
> > >
> > > -SRCREV = "ae727d99086f70f39fba5695af5460e1da908c1b"
> > > +SRCREV = "4ff11d85cb06026943f297bc3e06f047dd73bf0b"
> > >
> > >  S = "${WORKDIR}/git"
> > >
> > > --
> > > 2.34.1
> > >
> > 
> > >
> > >
> > >
> > 
> > 
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

