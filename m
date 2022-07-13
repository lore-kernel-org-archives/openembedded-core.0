Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16011C43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 07:29:35 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.19455.1657697365619026093
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 00:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oitGGMbi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 43097C0011;
	Wed, 13 Jul 2022 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1657697363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V/ENfnGQ4EweHne7+Mykq5ucD4Nfj4LgCu0CvIqWfuQ=;
	b=oitGGMbip3SOPxu+aFhn7wIDfbPwHLCR4f/AQ5RfDs7fmP3QaZwVCE4HFhRDITqDFXD7ir
	QKayOto9VatPJNGmxNH68SIMxS4pAIF7C7IqnUWsMB1iDqOYr2RFzb/gXw7bkYDQAp1EO7
	1OJ5TT6bmj5YwDYEeUDoxO8bFvQtiQxQjtWLbCB9oJyjueCA3yIvpZ5dV/v3lGmc20+x1I
	xOoa/Bl8fBjaSXOMXPZbTbIpSCyNIT/DcNk4SGi6uHqFk/r+CKw8/iAwPTn9Rxd4Kww8k3
	SbTd+Ax7F6qHn8CLZK+VWGHdrKdEKb/U3wI34UURUCCnLPD5srXETkjcs8IVRA==
Date: Wed, 13 Jul 2022 09:29:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH][V2] u-boot: upgrade 2022.04 -> 2022.07
Message-ID: <Ys50UcQEs9EzTimU@mail.local>
References: <20220712151730.10465-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220712151730.10465-1-sakib.sajal@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 07:29:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167952

Hello Sakib,

This fails with:

| make -f /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/c=
ore2-64-poky-linux/u-boot-tools/1_2022.07-r0/git/scripts/Makefile.build obj=
=3Dscripts/dtc/pylibfdt
|   cat /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/cor=
e2-64-poky-linux/u-boot-tools/1_2022.07-r0/git/scripts/dtc/pylibfdt/libfdt.=
i_shipped > scripts/dtc/pylibfdt/libfdt.i
|   unset CROSS_COMPILE; unset CFLAGS; CC=3D"gcc  -isystem/home/pokybuild/y=
octo-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/u-boot-t=
ools/1_2022.07-r0/recipe-sysroot-native/usr/include -O2 -pipe -L/home/pokyb=
uild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/u-=
boot-tools/1_2022.07-r0/recipe-sysroot-native/usr/lib                      =
   -L/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-=
64-poky-linux/u-boot-tools/1_2022.07-r0/recipe-sysroot-native/lib          =
               -Wl,--enable-new-dtags                         -Wl,-rpath-li=
nk,/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64=
-poky-linux/u-boot-tools/1_2022.07-r0/recipe-sysroot-native/usr/lib        =
                 -Wl,-rpath-link,/home/pokybuild/yocto-worker/qemux86-world=
/build/build/tmp/work/core2-64-poky-linux/u-boot-tools/1_2022.07-r0/recipe-=
sysroot-native/lib                         -Wl,-rpath,/home/pokybuild/yocto=
-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/u-boot-tools=
/1_2022.07-r0/recipe-sysroot-native/usr/lib                         -Wl,-rp=
ath,/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-6=
4-poky-linux/u-boot-tools/1_2022.07-r0/recipe-sysroot-native/lib           =
              -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/h=
ome/pokybuild/yocto-worker/qemux86-world/build/build/tmp/sysroots-uninative=
/x86_64-linux/lib/ld-linux-x86-64.so.2" LDSHARED=3D"gcc  -isystem/home/poky=
build/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/u=
-boot-tools/1_2022.07-r0/recipe-sysroot-native/usr/include -O2 -pipe -L/hom=
e/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-l=
inux/u-boot-tools/1_2022.07-r0/recipe-sysroot-native/usr/lib               =
          -L/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work=
/core2-64-poky-linux/u-boot-tools/1_2022.07-r0/recipe-sysroot-native/lib   =
                      -Wl,--enable-new-dtags                         -Wl,-r=
path-link,/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/c=
ore2-64-poky-linux/u-boot-tools/1_2022.07-r0/recipe-sysroot-native/usr/lib =
                        -Wl,-rpath-link,/home/pokybuild/yocto-worker/qemux8=
6-world/build/build/tmp/work/core2-64-poky-linux/u-boot-tools/1_2022.07-r0/=
recipe-sysroot-native/lib                         -Wl,-rpath,/home/pokybuil=
d/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/u-boo=
t-tools/1_2022.07-r0/recipe-sysroot-native/usr/lib                         =
-Wl,-rpath,/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/=
core2-64-poky-linux/u-boot-tools/1_2022.07-r0/recipe-sysroot-native/lib    =
                     -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-link=
er=3D/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/sysroots-un=
inative/x86_64-linux/lib/ld-linux-x86-64.so.2 -shared " LDFLAGS=3D"" VERSIO=
N=3D"u-boot-2022.07" CPPFLAGS=3D" -I/home/pokybuild/yocto-worker/qemux86-wo=
rld/build/build/tmp/work/core2-64-poky-linux/u-boot-tools/1_2022.07-r0/git/=
scripts/dtc/libfdt" OBJDIR=3Dscripts/dtc/pylibfdt SOURCES=3D"/home/pokybuil=
d/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/u-boo=
t-tools/1_2022.07-r0/git/scripts/dtc/libfdt/fdt.c /home/pokybuild/yocto-wor=
ker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/u-boot-tools/1_2=
022.07-r0/git/scripts/dtc/libfdt/fdt_ro.c /home/pokybuild/yocto-worker/qemu=
x86-world/build/build/tmp/work/core2-64-poky-linux/u-boot-tools/1_2022.07-r=
0/git/scripts/dtc/libfdt/fdt_wip.c /home/pokybuild/yocto-worker/qemux86-wor=
ld/build/build/tmp/work/core2-64-poky-linux/u-boot-tools/1_2022.07-r0/git/s=
cripts/dtc/libfdt/fdt_sw.c /home/pokybuild/yocto-worker/qemux86-world/build=
/build/tmp/work/core2-64-poky-linux/u-boot-tools/1_2022.07-r0/git/scripts/d=
tc/libfdt/fdt_rw.c /home/pokybuild/yocto-worker/qemux86-world/build/build/t=
mp/work/core2-64-poky-linux/u-boot-tools/1_2022.07-r0/git/scripts/dtc/libfd=
t/fdt_strerror.c /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp=
/work/core2-64-poky-linux/u-boot-tools/1_2022.07-r0/git/scripts/dtc/libfdt/=
fdt_empty_tree.c /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp=
/work/core2-64-poky-linux/u-boot-tools/1_2022.07-r0/git/scripts/dtc/libfdt/=
fdt_addresses.c /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/=
work/core2-64-poky-linux/u-boot-tools/1_2022.07-r0/git/scripts/dtc/libfdt/f=
dt_overlay.c scripts/dtc/pylibfdt/libfdt.i" SWIG_OPTS=3D"-I/home/pokybuild/=
yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/u-boot-=
tools/1_2022.07-r0/git/scripts/dtc/libfdt -I/home/pokybuild/yocto-worker/qe=
mux86-world/build/build/tmp/work/core2-64-poky-linux/u-boot-tools/1_2022.07=
-r0/git/scripts/dtc/libfdt/.." python3 /home/pokybuild/yocto-worker/qemux86=
-world/build/build/tmp/work/core2-64-poky-linux/u-boot-tools/1_2022.07-r0/g=
it/scripts/dtc/pylibfdt/setup.py --quiet build_ext --inplace
| /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-=
poky-linux/u-boot-tools/1_2022.07-r0/git/scripts/dtc/pylibfdt/setup.py:21: =
DeprecationWarning: The distutils package is deprecated and slated for remo=
val in Python 3.12. Use setuptools or check PEP 632 for potential alternati=
ves
|   from distutils.core import setup, Extension
| error: command 'swig' failed: No such file or directory
| make[3]: *** [/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/=
work/core2-64-poky-linux/u-boot-tools/1_2022.07-r0/git/scripts/dtc/pylibfdt=
/Makefile:30: rebuild] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/qemux86-world/bu=
ild/build/tmp/work/core2-64-poky-linux/u-boot-tools/1_2022.07-r0/build'
| make: Leaving directory '/home/pokybuild/yocto-worker/qemux86-world/build=
/build/tmp/work/core2-64-poky-linux/u-boot-tools/1_2022.07-r0/git'
| make[2]: *** [/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/=
work/core2-64-poky-linux/u-boot-tools/1_2022.07-r0/git/scripts/Makefile.bui=
ld:398: scripts/dtc/pylibfdt] Error 2
| make[1]: *** [/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/=
work/core2-64-poky-linux/u-boot-tools/1_2022.07-r0/git/Makefile:2066: scrip=
ts_dtc] Error 2
| make: *** [Makefile:177: sub-make] Error 2
| ERROR: oe_runmake failed

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/5414/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/3206/ste=
ps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5490/step=
s/11/logs/stdio



On 12/07/2022 11:17:30-0400, Sakib Sajal wrote:
> License change came due to U-Boot commit:
>     fba0882bcd Add valgrind headers to U-Boot
>=20
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-common.inc                     | 4 ++--
>  .../{u-boot-tools_2022.04.bb =3D> u-boot-tools_2022.07.bb}      | 0
>  .../u-boot/{u-boot_2022.04.bb =3D> u-boot_2022.07.bb}           | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-tools_2022.04.bb =3D> u-boot-tool=
s_2022.07.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2022.04.bb =3D> u-boot_2022.07.bb=
} (100%)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp=
/u-boot/u-boot-common.inc
> index 8fc33608d0..d7fd3c7227 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -7,12 +7,12 @@ SECTION =3D "bootloaders"
>  DEPENDS +=3D "flex-native bison-native"
> =20
>  LICENSE =3D "GPL-2.0-or-later"
> -LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D5a7450c57ffe5ae63fd73=
2446b988025"
> +LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D2ca5f2c35c8cc335f0a19=
756634782f1"
>  PE =3D "1"
> =20
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV =3D "e4b6ebd3de982ae7185dbf689a030e73fd06e0d2"
> +SRCREV =3D "e092e3250270a1016c877da7bdd9384f14b1321e"
> =20
>  SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3Dmaster"
> =20
> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2022.04.bb b/meta/recip=
es-bsp/u-boot/u-boot-tools_2022.07.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-tools_2022.04.bb
> rename to meta/recipes-bsp/u-boot/u-boot-tools_2022.07.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.04.bb b/meta/recipes-bsp=
/u-boot/u-boot_2022.07.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2022.04.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2022.07.bb
> --=20
> 2.33.0
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167935): https://lists.openembedded.org/g/openembedde=
d-core/message/167935
> Mute This Topic: https://lists.openembedded.org/mt/92335149/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

