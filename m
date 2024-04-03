Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F044CD1294
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 09:05:36 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.6785.1712135112276795581
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 02:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xhq/2z89;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B26DC000B;
	Wed,  3 Apr 2024 09:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712135110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2TpeaY2qCP+qi9VkAvuB2DAOq1cLwCJyAflGGRAxD8=;
	b=Xhq/2z894Rmduj3Q1aF++IhcxI111WBqXcYh9ShvFcpUFJYGvmky/Pbd+DUPOBiqerc0sN
	R50mA38yKilTfMo0vr61ceGQVCDl0vqdNh6loAk7EbSuF1wX8PRPY6tJ4Ynd98ry5lQ08C
	lArhLfTO5jTt+5KtMOLJsZo3Faq+sRZwwx9fOPkRLcGxxeeTcdombXb7uKLogNCtp/8NOc
	Y3IvsWHIkg+CGvqAY0bOtyrv3c1+QP2PFC9IDMVhN2hAVoOOa3uZd3Wabgzz8joCuL4lMg
	JKQFEu5f/1AMbicxw6kqy/MOrbO5sB3xdoXgyI32fiLq6ngEXVEnBj35csPcHQ==
Date: Wed, 3 Apr 2024 11:05:09 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] iputils: splitting the ping6 as a package
Message-ID: <2024040309050986d492c7@mail.local>
References: <20240401081002.3667193-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240401081002.3667193-1-xiangyu.chen@eng.windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 09:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197914


https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/8810/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4601/ste=
ps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6546/step=
s/14/logs/stdio

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/musl-qemu=
x86/build/build/tmp/work/core2-32-poky-linux-musl/iputils/20240117/temp/log=
=2Edo_install.685043
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/musl-qemux86=
/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot', '/home/poky=
build/yocto-worker/musl-qemux86/build/meta/recipes-devtools/gcc/gcc-cross_1=
3.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/musl-qemux86/bui=
ld/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/ho=
me/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-devtools/opkg-uti=
ls/opkg-utils_0.6.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/=
musl-qemux86/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_popul=
ate_sysroot', '/home/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes=
-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild=
/yocto-worker/musl-qemux86/build/meta/recipes-support/gnutls/gnutls_3.8.4.b=
b:do_populate_sysroot', '/home/pokybuild/yocto-worker/musl-qemux86/build/me=
ta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot', 'virtual:nat=
ive:/home/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-devtools/m=
eson/meson_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/y=
octo-worker/musl-qemux86/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:=
do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/musl-qem=
ux86/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot',=
 'virtual:native:/home/pokybuild/yocto-worker/musl-qemux86/build/meta/recip=
es-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:nativ=
e:/home/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-devtools/pse=
udo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yoc=
to-worker/musl-qemux86/build/meta/recipes-devtools/python/python3_3.12.2.bb=
:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/musl-qe=
mux86/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', '=
bsd-headers', 'libssp-nonshared', 'musl', 'binutils-cross-i686', 'cmake-nat=
ive', 'gcc-cross-i686', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-nati=
ve', 'opkg-utils', 'qemu-native', 'quilt-native', 'libidn2', 'texinfo-dummy=
-native', 'linux-libc-headers', 'gmp', 'gnutls', 'libtasn1', 'libcap', 'lib=
seccomp', 'libunistring', 'nettle', 'openssl-native', 'expat-native', 'gett=
ext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-nativ=
e', 'util-linux-native', 'zlib-native', 'flex-native', 'gnu-config-native',=
 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-na=
tive', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-n=
ative', 'python3-flit-core-native', 'python3-installer-native', 'python3-pa=
ckaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-nati=
ve', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-nat=
ive', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-=
native', 'gdbm-native', 'gmp-native', 'libcap-ng-native', 'libcap-native', =
'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-n=
ative', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| Installing ping/ping to /home/pokybuild/yocto-worker/musl-qemux86/build/b=
uild/tmp/work/core2-32-poky-linux-musl/iputils/20240117/image/bin
| Installing tracepath to /home/pokybuild/yocto-worker/musl-qemux86/build/b=
uild/tmp/work/core2-32-poky-linux-musl/iputils/20240117/image/bin
| Installing clockdiff to /home/pokybuild/yocto-worker/musl-qemux86/build/b=
uild/tmp/work/core2-32-poky-linux-musl/iputils/20240117/image/bin
| Installing arping to /home/pokybuild/yocto-worker/musl-qemux86/build/buil=
d/tmp/work/core2-32-poky-linux-musl/iputils/20240117/image/bin
| ln: failed to create symbolic link '/home/pokybuild/yocto-worker/musl-qem=
ux86/build/build/tmp/work/core2-32-poky-linux-musl/iputils/20240117/image//=
usr/bin/ping6': No such file or directory
| WARNING: /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/c=
ore2-32-poky-linux-musl/iputils/20240117/temp/run.do_install.685043:154 exi=
t 1 from 'ln -sf ping /home/pokybuild/yocto-worker/musl-qemux86/build/build=
/tmp/work/core2-32-poky-linux-musl/iputils/20240117/image//usr/bin/ping6'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /home/pokybuild/yocto-worker/musl-qemux86/build/build/tm=
p/work/core2-32-poky-linux-musl/iputils/20240117/temp/run.do_install.685043=
, line 154
| 	#2: main, /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work=
/core2-32-poky-linux-musl/iputils/20240117/temp/run.do_install.685043, line=
 164
NOTE: recipe iputils-20240117-r0: task do_install: Failed
ERROR: Task (/home/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-e=
xtended/iputils/iputils_20240117.bb:do_install) failed with exit code '1'

On 01/04/2024 16:10:02+0800, Xiangyu Chen wrote:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>=20
> The iputils merged the ping4 and ping6 command into the ping since the
> commit ebad35fe[1], currently, iputils ping support being called using
> "ping -6" or "ping6" symlinks.
>=20
> In oe-core, there are two packages provide ipv6 ping, inetutils and iputi=
ls,
> the inetutils-ping6 doesn't support "-I" option to bind the interface, th=
at
> cause some of scripts(e.g. LTP test[2]) which was based on iputils-ping6 =
fails.
>=20
> If someone or a package needs iputils-ping6, they can enable it in local.=
conf
> or add it into rdepends directly.
>=20
> Ref:
> [1] https://github.com/iputils/iputils/commit/e3de851b809c7b72ccc654a72b6=
af61d
> [2] https://github.com/linux-test-project/ltp/blob/master/testcases/kerne=
l/ \
>     containers/netns/netns_comm.sh#L25
>=20
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  meta/recipes-extended/iputils/iputils_20240117.bb | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/iputils/iputils_20240117.bb b/meta/rec=
ipes-extended/iputils/iputils_20240117.bb
> index 5a5e15528e..72a7aeb777 100644
> --- a/meta/recipes-extended/iputils/iputils_20240117.bb
> +++ b/meta/recipes-extended/iputils/iputils_20240117.bb
> @@ -35,7 +35,11 @@ ALTERNATIVE_PRIORITY =3D "100"
>  ALTERNATIVE:${PN}-ping =3D "ping"
>  ALTERNATIVE_LINK_NAME[ping] =3D "${base_bindir}/ping"
> =20
> -SPLITPKGS =3D "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff"
> +ALTERNATIVE:${PN}-ping6 =3D "ping6"
> +ALTERNATIVE_LINK_NAME[ping6] =3D "${base_bindir}/ping6"
> +
> +SPLITPKGS =3D "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff \
> +             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ping=
6', '', d)}"
>  PACKAGES +=3D "${SPLITPKGS}"
> =20
>  ALLOW_EMPTY:${PN} =3D "1"
> @@ -43,6 +47,13 @@ RDEPENDS:${PN} +=3D "${SPLITPKGS}"
> =20
>  FILES:${PN} =3D ""
>  FILES:${PN}-ping =3D "${base_bindir}/ping.${BPN}"
> +FILES:${PN}-ping6 =3D "${base_bindir}/ping6.${BPN}"
>  FILES:${PN}-arping =3D "${base_bindir}/arping"
>  FILES:${PN}-tracepath =3D "${base_bindir}/tracepath"
>  FILES:${PN}-clockdiff =3D "${base_bindir}/clockdiff"
> +
> +do_install:append() {
> +	if ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'false', d)}=
; then
> +		ln -sf ping ${D}/${bindir}/ping6
> +	fi
> +}
> --=20
> 2.35.5
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197675): https://lists.openembedded.org/g/openembedde=
d-core/message/197675
> Mute This Topic: https://lists.openembedded.org/mt/105259616/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

