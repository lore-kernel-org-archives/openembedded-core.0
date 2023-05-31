Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED7FC7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 22:25:15 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.191.1685571909291473819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 15:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Vz6QdaM8;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-77483f80522so11600039f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 15:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685571908; x=1688163908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnTglm9Ga6yk73O6fnXpvdvnDcAttAhtxjX14w0oDqo=;
        b=Vz6QdaM8CsopLE0Smt0qGl3NhhTOk67/AIvU2ZTE+mIHF5/YoftN191Asj4mNs6ZMB
         uGarTnmtU5lhQ0fU24xVuHRhmpSxL7dsDqFi2RtiP3zt+jbwy/ZDvzjl+dvIobbiAxY4
         TuyxK3rF70aW2SuOM3cOSLPKj6wQYXUoRe6+4GRQfYjG3kiL5/bsYcN9CAgZmkFBKzYs
         Yg6ZfhrshyitW0s10ff8DOsYYsy2JY7BRLDWlyhu9IzwIm6cWVfx8RKyRLuoY/1BAlxw
         85Z1VixLyb3/DeO3zPQIjiXMvDGyP0/0uimjVOnfwCR3UHJFHGzpB2bZPIzrO0nM06NP
         qVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685571908; x=1688163908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnTglm9Ga6yk73O6fnXpvdvnDcAttAhtxjX14w0oDqo=;
        b=Ol/ZBvvgCdt+3b+2i9n0kAcunhG0RYdQNlncmxCEOsHfDs6Rb4jt7srPgI7aA8KNZ3
         oOlN0tenNuvBHw5qvB+DoAqfD4jJvVey/XzlgYk40W9PB+5LPku0Wcf8ZWs3b14f4Whd
         GSVE247JmEfRyBkATL5QEuP8lZ+99vms0ukz3T6R6LTW7de4XR3+TiiDDisS6GV9D98x
         9qVJzcQtXzG/hgX5LqTw1GwBJYjrElwLIHNijfrx9EFwq3ys1tpCw+W1x0IoB96RrO4k
         YQpda6QGFsfowAL2LL0paDnDot9yIhS4q/8ObHZguM+nlVwcIAqfVuW398K1BPkzhcui
         ovEA==
X-Gm-Message-State: AC+VfDyPgXZn4cUldlp/ZsT0dg9GfyxQM+p/H+SYQ90DGTsLhV+idrip
	NkpufwnV2KTZ3pQ0pag0Y2oiErHX4mRy4u/6TAs=
X-Google-Smtp-Source: ACHHUZ5nePWRMcJ9vmBGMBMOEwlJAEHJG5kDaHtq4l3gIlE+6JYrzdpzAbTjjXcNPp9Jnuu7F26+13jMRXP1rQJ5Y2k=
X-Received: by 2002:a5d:9ccb:0:b0:774:9c64:e0ab with SMTP id
 w11-20020a5d9ccb000000b007749c64e0abmr5388540iow.17.1685571908338; Wed, 31
 May 2023 15:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685558432.git.bruce.ashfield@gmail.com>
 <14b5ba3f7ba79aa1cfa5c50f8458596951adcfb1.camel@linuxfoundation.org>
 <CADkTA4OTDrugNWkFYqDXZy7ruZ+6Qd2EGsQUx+JvSnskoHSCyw@mail.gmail.com> <a0868afea6ac27274253698a0ee9342dc4bca1fd.camel@linuxfoundation.org>
In-Reply-To: <a0868afea6ac27274253698a0ee9342dc4bca1fd.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 May 2023 18:24:57 -0400
Message-ID: <CADkTA4NK26MdiA2jQ_LGg6LkFKwi8fUhqC_BXsECuU2N1iuPGA@mail.gmail.com>
Subject: Re: [PATCH 0/9] kernel/linux-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 22:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182041

On Wed, May 31, 2023 at 6:22=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-05-31 at 18:18 -0400, Bruce Ashfield wrote:
> > On Wed, May 31, 2023 at 6:03=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > Hi Bruce,
> > >
> > > On Wed, 2023-05-31 at 14:48 -0400, bruce.ashfield@gmail.com wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > Richard,
> > > >
> > > > Here's my consolidated queue. I've had some of these in testing for=
 quite
> > > > a while, as I didn't want to send them right before release or befo=
re my
> > > > vacation last week.
> > > >
> > > > Most are -stable updates to 6.1 and finally bumping the -dev recipe=
 to
> > > > show that we've been testing 6.4 for quite some time.
> > > >
> > > > The make-mod-scripts rmwork fix was discussed at lenght on the list=
, and
> > > > has been tested by myself and people seeing the issues. But with al=
l the
> > > > races and issues we've seen in that area for years, I'll keep a clo=
se eye
> > > > out for AB issues.
> > > >
> > > > I've factored things a bit around enabling PAHOLE, I don't expect i=
t
> > > > to cause issues since it isn't on by default .. but you never know =
with
> > > > these sorts of changes.
> > > >
> > > > I also have a bump for the refernece BSPs (sent to the appropriate
> > > > list shortly) and a documentation commit for the PAHOLE tweaks (als=
o
> > > > sent to that list shortly, once we agree on the this change).
> > >
> > > Thanks for the updates!
> > >
> > > I put these in for testing (along with some other changes) and there
> > > was an issue, probably the same thing showing up but I've not dug int=
o
> > > it:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/715=
9
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/719=
7
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/60=
93/steps/11/logs/stdio
> > >
> >
> > That's odd:
> >
> > ERROR: core-image-sato-sdk-1.0-r0 do_testimage: File
> > /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/deploy/imag=
es/qemux86/core-image-sato-sdk-qemux86.testdata.json
> > not found ([Errno 2] No such file or directory:
> > '/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/deploy/ima=
ges/qemux86/core-image-sato-sdk-qemux86.testdata.json').
>
> That is the QA test failing due to an earlier failure to build the
> image. The earlier failure looks like:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7159/st=
eps/11/logs/stdio
>
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/pkgman-non=
-rpm/build/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/ho=
me/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/binuti=
ls/binutils-cross_2.40.bb:do_populate_sysroot', '/home/pokybuild/yocto-work=
er/pkgman-non-rpm/build/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_popu=
late_sysroot', '/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/reci=
pes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/pokybuild=
/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/quilt/quilt-native=
_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/pkgman-non-rpm=
/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_=
sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build=
/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot', '=
virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recip=
es-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot', 'virtual:nati=
ve:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-core/zlib=
/zlib_1.2.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto=
-worker/pkgman-non-rpm/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_=
populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-=
rpm/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysr=
oot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/met=
a/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:nati=
ve:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/=
pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/poky=
build/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/pseudo/pseudo=
_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/=
pkgman-non-rpm/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysr=
oot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/met=
a/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot', 'virtual:native:/ho=
me/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-kernel/kmod/kmo=
d_30.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/=
pkgman-non-rpm/build/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysr=
oot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/met=
a/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot']
> | NOTE: Installed into sysroot: ['kern-tools-native', 'util-linux-native'=
, 'kmod-native', 'libcap-ng-native', 'libpcre2-native']
> | NOTE: Skipping as already exists in sysroot: ['glibc', 'binutils-cross-=
i686', 'gcc-cross-i686', 'gcc-runtime', 'quilt-native', 'openssl-native', '=
zlib-native', 'bison-native', 'elfutils-native', 'patch-native', 'pkgconfig=
-native', 'pseudo-native', 'bc-native', 'xz-native', 'gmp-native', 'libmpc-=
native', 'linux-libc-headers', 'libgcc', 'gnu-config-native', 'flex-native'=
, 'texinfo-dummy-native', 'libtool-native', 'mpfr-native', 'zstd-native', '=
perl-native', 'gettext-minimal-native', 'ncurses-native', 'util-linux-libuu=
id-native', 'libmicrohttpd-native', 'libarchive-native', 'curl-native', 'sq=
lite3-native', 'readline-native', 'attr-native', 'python3-native', 'm4-nati=
ve', 'gdbm-native', 'make-native', 'gnutls-native', 'libgcrypt-native', 'bz=
ip2-native', 'libedit-native', 'libffi-native', 'libtirpc-native', 'expat-n=
ative', 'libnsl2-native', 'nettle-native', 'libidn2-native', 'libtasn1-nati=
ve', 'libunistring-native', 'libcap-native', 'libgpg-error-native', 'cmake-=
native']
> | DEBUG: sed -e 's:^[^/]*/:/home/pokybuild/yocto-worker/pkgman-non-rpm/bu=
ild/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroo=
t-native/:g' /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/sy=
sroots-components/x86_64/libpcre2-native/fixmepath | xargs sed -i -e 's:FIX=
MESTAGINGDIRTARGET:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/=
tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot:g; s:FIX=
MESTAGINGDIRHOST:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tm=
p/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native:g' =
-e 's:FIXME_PSEUDO_SYSROOT:/home/pokybuild/yocto-worker/pkgman-non-rpm/buil=
d/build/tmp/sysroots-components/x86_64/pseudo-native:g' -e 's:FIXME_HOSTTOO=
LS_DIR:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/hosttool=
s:g' -e 's:FIXME_PKGDATA_DIR:/home/pokybuild/yocto-worker/pkgman-non-rpm/bu=
ild/build/tmp/pkgdata/qemux86:g' -e 's:FIXME_PSEUDO_LOCALSTATEDIR:/home/pok=
ybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/=
make-mod-scripts/1.0-r0/pseudo/:g' -e 's:FIXME_LOGFIFO:/home/pokybuild/yoct=
o-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-sc=
ripts/1.0-r0/temp/fifo.169218:g'
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_configure
> | NOTE: make HOSTCC=3Dgcc  -isystem/home/pokybuild/yocto-worker/pkgman-no=
n-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recip=
e-sysroot-native/usr/include -O2 -pipe -L/home/pokybuild/yocto-worker/pkgma=
n-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/r=
ecipe-sysroot-native/usr/lib                         -L/home/pokybuild/yoct=
o-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-sc=
ripts/1.0-r0/recipe-sysroot-native/lib                         -Wl,--enable=
-new-dtags                         -Wl,-rpath-link,/home/pokybuild/yocto-wo=
rker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-script=
s/1.0-r0/recipe-sysroot-native/usr/lib                         -Wl,-rpath-l=
ink,/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux8=
6-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/lib             =
            -Wl,-rpath,/home/pokybuild/yocto-worker/pkgman-non-rpm/build/bu=
ild/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-nati=
ve/usr/lib                         -Wl,-rpath,/home/pokybuild/yocto-worker/=
pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0=
-r0/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--allow-s=
hlib-undefined -Wl,--dynamic-linker=3D/home/pokybuild/yocto-worker/pkgman-n=
on-rpm/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.=
so.2 -static HOSTCPP=3Dgcc  -E HOSTCXX=3Dg++  -isystem/home/pokybuild/yocto=
-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scr=
ipts/1.0-r0/recipe-sysroot-native/usr/include -O2 -pipe -L/home/pokybuild/y=
octo-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod=
-scripts/1.0-r0/recipe-sysroot-native/usr/lib                         -L/ho=
me/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-=
linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/lib                    =
     -Wl,--enable-new-dtags                         -Wl,-rpath-link,/home/p=
okybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linu=
x/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/lib                    =
     -Wl,-rpath-link,/home/pokybuild/yocto-worker/pkgman-non-rpm/build/buil=
d/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native=
/lib                         -Wl,-rpath,/home/pokybuild/yocto-worker/pkgman=
-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/re=
cipe-sysroot-native/usr/lib                         -Wl,-rpath,/home/pokybu=
ild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/mak=
e-mod-scripts/1.0-r0/recipe-sysroot-native/lib                         -Wl,=
-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/home/pokybuild/yoct=
o-worker/pkgman-non-rpm/build/build/tmp/sysroots-uninative/x86_64-linux/lib=
/ld-linux-x86-64.so.2 -static CROSS_COMPILE=3Di686-poky-linux- CC=3Di686-po=
ky-linux-gcc  -fuse-ld=3Dbfd -fcanon-prefix-map  -fmacro-prefix-map=3D/home=
/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-li=
nux/make-mod-scripts/1.0-r0=3D/usr/src/debug/make-mod-scripts/1.0-r0  -fdeb=
ug-prefix-map=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp=
/work/qemux86-poky-linux/make-mod-scripts/1.0-r0=3D/usr/src/debug/make-mod-=
scripts/1.0-r0  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/pkgman-no=
n-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0=3D/us=
r/src/debug/make-mod-scripts/1.0-r0  -fdebug-prefix-map=3D/home/pokybuild/y=
octo-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod=
-scripts/1.0-r0=3D/usr/src/debug/make-mod-scripts/1.0-r0  -fdebug-prefix-ma=
p=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux8=
6-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot=3D  -fmacro-prefix-map=
=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86=
-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot=3D  -fdebug-prefix-map=
=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86=
-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native=3D  -fdebug-prefi=
x-map=3D/home/pokybui
> d/yocto-worker/pkgman-non-rpm/build/build/tmp/work-shared/qemux86/kernel-=
source=3D/usr/src/kernel -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/=
pkgman-non-rpm/build/build/tmp/work-shared/qemux86/kernel-build-artifacts=
=3D/usr/src/kernel LD=3Di686-poky-linux-ld.bfd  AR=3Di686-poky-linux-ar  OB=
JCOPY=3Di686-poky-linux-objcopy  HOSTPKG_CONFIG=3Dpkg-config --static CRYPT=
O_LIBS=3D-L/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work=
/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/lib/p=
kgconfig/../../../usr/lib -lcrypto -ldl -pthread -C /home/pokybuild/yocto-w=
orker/pkgman-non-rpm/build/build/tmp/work-shared/qemux86/kernel-source O=3D=
/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work-shared/qem=
ux86/kernel-build-artifacts prepare
> | make: Entering directory '/home/pokybuild/yocto-worker/pkgman-non-rpm/b=
uild/build/tmp/work-shared/qemux86/kernel-source'
> |   SYNC    include/config/auto.conf
> |   GEN     Makefile
> |   HOSTCC  scripts/basic/fixdep
> | /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/hosttools/l=
d: cannot find -lc
> | collect2: error: ld returned 1 exit status
> | make[3]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/t=
mp/work-shared/qemux86/kernel-source/scripts/Makefile.host:111: scripts/bas=
ic/fixdep] Error 1
> | make[2]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/t=
mp/work-shared/qemux86/kernel-source/Makefile:640: scripts_basic] Error 2
> | /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work-shared=
/qemux86/kernel-source/Makefile:748: include/config/auto.conf: No such file=
 or directory
> | make[1]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/t=
mp/work-shared/qemux86/kernel-source/Makefile:805: include/config/auto.conf=
] Error 2
> | make[1]: *** [include/config/auto.conf] Deleting file 'include/generate=
d/rustc_cfg'
> | make[1]: *** [include/config/auto.conf] Deleting file 'include/generate=
d/autoconf.h'
> | make: *** [Makefile:238: __sub-make] Error 2
> | make: Leaving directory '/home/pokybuild/yocto-worker/pkgman-non-rpm/bu=
ild/build/tmp/work-shared/qemux86/kernel-source'
> | ERROR: oe_runmake failed
> | WARNING: /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/wo=
rk/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_configure.169218:=
195 exit 1 from 'exit 1'
> | WARNING: Backtrace (BB generated script):
> |       #1: bbfatal_log, /home/pokybuild/yocto-worker/pkgman-non-rpm/buil=
d/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_con=
figure.169218, line 195
> |       #2: die, /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/=
tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_configure.1=
69218, line 179
> |       #3: oe_runmake, /home/pokybuild/yocto-worker/pkgman-non-rpm/build=
/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_conf=
igure.169218, line 174
> |       #4: do_configure, /home/pokybuild/yocto-worker/pkgman-non-rpm/bui=
ld/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_co=
nfigure.169218, line 164
> |       #5: main, /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build=
/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_configure.=
169218, line 208
> NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Failed
>
> > It shouldn't be the kernel updates, so I'm assuming something with
> > make-mod-scripts. I'll have a look at it on Thursday.
>
> Yes, it is make-mod-scripts, maybe missing static libraries?

It could be. We tried to cover all the hosts and kernel versions
during the development, but clearly something slipped through.

Bruce

>
> Cheers,
>
> Richard
>
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

