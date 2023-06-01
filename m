Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FEBC77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 13:42:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.31903.1685626924749945664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 06:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=YVo7XVev;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f6d01d390bso8942515e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 06:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685626923; x=1688218923;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VfVC5yXcVBcq3WT+XvCRnZpv1/9lC7Gc4EryLYc976g=;
        b=YVo7XVevpJpn54t3R6IpLI5XIZZhX8wO4KBsFie4cLFWoBazVuKT4BVddW8/GgSo9Y
         MUK5RepRYJHl8gU2nn5YRT73s/svk+oEwIW9xpRaoNLZ3YZdkEJtu52MCIdB3dX+aOlT
         YvmNUkuXK42Sv5WtHMlPywULgtPMueL+Xts6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685626923; x=1688218923;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VfVC5yXcVBcq3WT+XvCRnZpv1/9lC7Gc4EryLYc976g=;
        b=NOGH89tpXDcOqAle+wr+4QxkGJS8e6EQtDtkOg8Auu2F322Lo8yLmRBg4VizMkFD7R
         +COA+B6Q81UgB/pjwfrYX3CSKYmJOf0VmRn2CAl1cepMDFrn1yxF60n/0KwEWkor5en5
         MZo8sMRxceWCS2DK5ufbe6ZthUEQHmf/THWVowAToMjKW+IK5xxADcBucvT0ZDlHS02w
         HO9ce9JZOcISlAJ4/G0NFUKKDQiB3B2jaarRhzDqeiyJCxZC0q49giNOB/z8aAJIVVQ+
         trW/cCNl5kMXvDoY++Eb96UiAAMHKtJL27MPIdUrbTenOpWX90OHfTOcufALbvPcQZWv
         OPwg==
X-Gm-Message-State: AC+VfDyTg9FhXokGjVLomiJ11f9a+S2XWxZADbbSd/OKh5Ws3bLSaYyz
	7Xeo15J96MbHmcz5jZDVietUsQ==
X-Google-Smtp-Source: ACHHUZ7WV23Lxp8rUaBgCLmIMFvPAz1YmvnAbHcpidk2Jf067yMCQ3w7+OIqPHg3r5XK7nQqmKnXwQ==
X-Received: by 2002:a7b:c846:0:b0:3f6:984:4e43 with SMTP id c6-20020a7bc846000000b003f609844e43mr2314894wml.21.1685626923000;
        Thu, 01 Jun 2023 06:42:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5363:779f:9df8:62e7? ([2001:8b0:aba:5f3c:5363:779f:9df8:62e7])
        by smtp.gmail.com with ESMTPSA id hn17-20020a05600ca39100b003f42a75ac2asm2424854wmb.23.2023.06.01.06.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 06:42:02 -0700 (PDT)
Message-ID: <bc01062444278af3f207fbf22e126c70af3b4b0a.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/9] kernel/linux-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 01 Jun 2023 14:42:01 +0100
In-Reply-To: <CADkTA4MUoegZm0N087cBqmXaHeqP0nN_B5t9h3FR09FRjQsNsA@mail.gmail.com>
References: <cover.1685558432.git.bruce.ashfield@gmail.com>
	 <14b5ba3f7ba79aa1cfa5c50f8458596951adcfb1.camel@linuxfoundation.org>
	 <CADkTA4OTDrugNWkFYqDXZy7ruZ+6Qd2EGsQUx+JvSnskoHSCyw@mail.gmail.com>
	 <a0868afea6ac27274253698a0ee9342dc4bca1fd.camel@linuxfoundation.org>
	 <CADkTA4MXVzuQmovAkmNsWhrD9SDeMV_F4RmVSmG-kUa7jUcpRA@mail.gmail.com>
	 <80c5755eabc4e55f4e27a5335a642f74908a1e78.camel@linuxfoundation.org>
	 <CADkTA4MUoegZm0N087cBqmXaHeqP0nN_B5t9h3FR09FRjQsNsA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 13:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182108

On Thu, 2023-06-01 at 09:18 -0400, Bruce Ashfield wrote:
> On Thu, Jun 1, 2023 at 3:15=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Wed, 2023-05-31 at 19:24 -0400, Bruce Ashfield wrote:
> > > On Wed, May 31, 2023 at 6:22=E2=80=AFPM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > On Wed, 2023-05-31 at 18:18 -0400, Bruce Ashfield wrote:
> > > > > On Wed, May 31, 2023 at 6:03=E2=80=AFPM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > >=20
> > > > > > Hi Bruce,
> > > > > >=20
> > > > > > On Wed, 2023-05-31 at 14:48 -0400, bruce.ashfield@gmail.com wro=
te:
> > > > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > >=20
> > > > > > > Richard,
> > > > > > >=20
> > > > > > > Here's my consolidated queue. I've had some of these in testi=
ng for quite
> > > > > > > a while, as I didn't want to send them right before release o=
r before my
> > > > > > > vacation last week.
> > > > > > >=20
> > > > > > > Most are -stable updates to 6.1 and finally bumping the -dev =
recipe to
> > > > > > > show that we've been testing 6.4 for quite some time.
> > > > > > >=20
> > > > > > > The make-mod-scripts rmwork fix was discussed at lenght on th=
e list, and
> > > > > > > has been tested by myself and people seeing the issues. But w=
ith all the
> > > > > > > races and issues we've seen in that area for years, I'll keep=
 a close eye
> > > > > > > out for AB issues.
> > > > > > >=20
> > > > > > > I've factored things a bit around enabling PAHOLE, I don't ex=
pect it
> > > > > > > to cause issues since it isn't on by default .. but you never=
 know with
> > > > > > > these sorts of changes.
> > > > > > >=20
> > > > > > > I also have a bump for the refernece BSPs (sent to the approp=
riate
> > > > > > > list shortly) and a documentation commit for the PAHOLE tweak=
s (also
> > > > > > > sent to that list shortly, once we agree on the this change).
> > > > > >=20
> > > > > > Thanks for the updates!
> > > > > >=20
> > > > > > I put these in for testing (along with some other changes) and =
there
> > > > > > was an issue, probably the same thing showing up but I've not d=
ug into
> > > > > > it:
> > > > > >=20
> > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/buil=
ds/7159
> > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/buil=
ds/7197
> > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/104/bui=
lds/6093/steps/11/logs/stdio
> > > > > >=20
> > > > >=20
> > > > > That's odd:
> > > > >=20
> > > > > ERROR: core-image-sato-sdk-1.0-r0 do_testimage: File
> > > > > /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/deplo=
y/images/qemux86/core-image-sato-sdk-qemux86.testdata.json
> > > > > not found ([Errno 2] No such file or directory:
> > > > > '/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/depl=
oy/images/qemux86/core-image-sato-sdk-qemux86.testdata.json').
> > > >=20
> > > > That is the QA test failing due to an earlier failure to build the
> > > > image. The earlier failure looks like:
> > > >=20
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7=
159/steps/11/logs/stdio
> > > >=20
> > > > Log data follows:
> > > > > DEBUG: Executing python function extend_recipe_sysroot
> > > > > NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/pkgm=
an-non-rpm/build/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot'=
, '/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/=
binutils/binutils-cross_2.40.bb:do_populate_sysroot', '/home/pokybuild/yoct=
o-worker/pkgman-non-rpm/build/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:d=
o_populate_sysroot', '/home/pokybuild/yocto-worker/pkgman-non-rpm/build/met=
a/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/pok=
ybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/quilt/quilt-=
native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/pkgman-n=
on-rpm/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_pop=
ulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm=
/build/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysro=
ot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta=
/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot', 'virtua=
l:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-cor=
e/zlib/zlib_1.2.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild=
/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/bison/bison_3.8.2.=
bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgma=
n-non-rpm/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populat=
e_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/bui=
ld/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtua=
l:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-dev=
tools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/hom=
e/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/pseudo/=
pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-w=
orker/pkgman-non-rpm/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_populat=
e_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/bui=
ld/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot', 'virtual:nati=
ve:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-kernel/km=
od/kmod_30.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-w=
orker/pkgman-non-rpm/build/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populat=
e_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/bui=
ld/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot']
> > > > > NOTE: Installed into sysroot: ['kern-tools-native', 'util-linux-n=
ative', 'kmod-native', 'libcap-ng-native', 'libpcre2-native']
> > > > > NOTE: Skipping as already exists in sysroot: ['glibc', 'binutils-=
cross-i686', 'gcc-cross-i686', 'gcc-runtime', 'quilt-native', 'openssl-nati=
ve', 'zlib-native', 'bison-native', 'elfutils-native', 'patch-native', 'pkg=
config-native', 'pseudo-native', 'bc-native', 'xz-native', 'gmp-native', 'l=
ibmpc-native', 'linux-libc-headers', 'libgcc', 'gnu-config-native', 'flex-n=
ative', 'texinfo-dummy-native', 'libtool-native', 'mpfr-native', 'zstd-nati=
ve', 'perl-native', 'gettext-minimal-native', 'ncurses-native', 'util-linux=
-libuuid-native', 'libmicrohttpd-native', 'libarchive-native', 'curl-native=
', 'sqlite3-native', 'readline-native', 'attr-native', 'python3-native', 'm=
4-native', 'gdbm-native', 'make-native', 'gnutls-native', 'libgcrypt-native=
', 'bzip2-native', 'libedit-native', 'libffi-native', 'libtirpc-native', 'e=
xpat-native', 'libnsl2-native', 'nettle-native', 'libidn2-native', 'libtasn=
1-native', 'libunistring-native', 'libcap-native', 'libgpg-error-native', '=
cmake-native']
> > > > > DEBUG: sed -e 's:^[^/]*/:/home/pokybuild/yocto-worker/pkgman-non-=
rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-=
sysroot-native/:g' /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/=
tmp/sysroots-components/x86_64/libpcre2-native/fixmepath | xargs sed -i -e =
's:FIXMESTAGINGDIRTARGET:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/=
build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot:g;=
 s:FIXMESTAGINGDIRHOST:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/bu=
ild/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-nati=
ve:g' -e 's:FIXME_PSEUDO_SYSROOT:/home/pokybuild/yocto-worker/pkgman-non-rp=
m/build/build/tmp/sysroots-components/x86_64/pseudo-native:g' -e 's:FIXME_H=
OSTTOOLS_DIR:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/ho=
sttools:g' -e 's:FIXME_PKGDATA_DIR:/home/pokybuild/yocto-worker/pkgman-non-=
rpm/build/build/tmp/pkgdata/qemux86:g' -e 's:FIXME_PSEUDO_LOCALSTATEDIR:/ho=
me/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-=
linux/make-mod-scripts/1.0-r0/pseudo/:g' -e 's:FIXME_LOGFIFO:/home/pokybuil=
d/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-=
mod-scripts/1.0-r0/temp/fifo.169218:g'
> > > > > DEBUG: Python function extend_recipe_sysroot finished
> > > > > DEBUG: Executing shell function do_configure
> > > > > NOTE: make HOSTCC=3Dgcc  -isystem/home/pokybuild/yocto-worker/pkg=
man-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0=
/recipe-sysroot-native/usr/include -O2 -pipe -L/home/pokybuild/yocto-worker=
/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.=
0-r0/recipe-sysroot-native/usr/lib                         -L/home/pokybuil=
d/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-=
mod-scripts/1.0-r0/recipe-sysroot-native/lib                         -Wl,--=
enable-new-dtags                         -Wl,-rpath-link,/home/pokybuild/yo=
cto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-=
scripts/1.0-r0/recipe-sysroot-native/usr/lib                         -Wl,-r=
path-link,/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/=
qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/lib       =
                  -Wl,-rpath,/home/pokybuild/yocto-worker/pkgman-non-rpm/bu=
ild/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroo=
t-native/usr/lib                         -Wl,-rpath,/home/pokybuild/yocto-w=
orker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scrip=
ts/1.0-r0/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--a=
llow-shlib-undefined -Wl,--dynamic-linker=3D/home/pokybuild/yocto-worker/pk=
gman-non-rpm/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x=
86-64.so.2 -static HOSTCPP=3Dgcc  -E HOSTCXX=3Dg++  -isystem/home/pokybuild=
/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-m=
od-scripts/1.0-r0/recipe-sysroot-native/usr/include -O2 -pipe -L/home/pokyb=
uild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/ma=
ke-mod-scripts/1.0-r0/recipe-sysroot-native/usr/lib                        =
 -L/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86=
-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/lib              =
           -Wl,--enable-new-dtags                         -Wl,-rpath-link,/=
home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-pok=
y-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/lib              =
           -Wl,-rpath-link,/home/pokybuild/yocto-worker/pkgman-non-rpm/buil=
d/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-=
native/lib                         -Wl,-rpath,/home/pokybuild/yocto-worker/=
pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0=
-r0/recipe-sysroot-native/usr/lib                         -Wl,-rpath,/home/=
pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-lin=
ux/make-mod-scripts/1.0-r0/recipe-sysroot-native/lib                       =
  -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/home/pokybuil=
d/yocto-worker/pkgman-non-rpm/build/build/tmp/sysroots-uninative/x86_64-lin=
ux/lib/ld-linux-x86-64.so.2 -static CROSS_COMPILE=3Di686-poky-linux- CC=3Di=
686-poky-linux-gcc  -fuse-ld=3Dbfd -fcanon-prefix-map  -fmacro-prefix-map=
=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86=
-poky-linux/make-mod-scripts/1.0-r0=3D/usr/src/debug/make-mod-scripts/1.0-r=
0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/b=
uild/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0=3D/usr/src/debug/m=
ake-mod-scripts/1.0-r0  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/p=
kgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-=
r0=3D/usr/src/debug/make-mod-scripts/1.0-r0  -fdebug-prefix-map=3D/home/pok=
ybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/=
make-mod-scripts/1.0-r0=3D/usr/src/debug/make-mod-scripts/1.0-r0  -fdebug-p=
refix-map=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/wor=
k/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot=3D  -fmacro-pre=
fix-map=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/=
qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot=3D  -fdebug-prefi=
x-map=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qe=
mux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native=3D  -fdebug-=
prefix-map=3D/home/pokybui
> > > > d/yocto-worker/pkgman-non-rpm/build/build/tmp/work-shared/qemux86/k=
ernel-source=3D/usr/src/kernel -fdebug-prefix-map=3D/home/pokybuild/yocto-w=
orker/pkgman-non-rpm/build/build/tmp/work-shared/qemux86/kernel-build-artif=
acts=3D/usr/src/kernel LD=3Di686-poky-linux-ld.bfd  AR=3Di686-poky-linux-ar=
  OBJCOPY=3Di686-poky-linux-objcopy  HOSTPKG_CONFIG=3Dpkg-config --static C=
RYPTO_LIBS=3D-L/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/=
work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/l=
ib/pkgconfig/../../../usr/lib -lcrypto -ldl -pthread -C /home/pokybuild/yoc=
to-worker/pkgman-non-rpm/build/build/tmp/work-shared/qemux86/kernel-source =
O=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work-shared=
/qemux86/kernel-build-artifacts prepare
> > > > > make: Entering directory '/home/pokybuild/yocto-worker/pkgman-non=
-rpm/build/build/tmp/work-shared/qemux86/kernel-source'
> > > > >   SYNC    include/config/auto.conf
> > > > >   GEN     Makefile
> > > > >   HOSTCC  scripts/basic/fixdep
> > > > > /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/hostt=
ools/ld: cannot find -lc
> > > > > collect2: error: ld returned 1 exit status
> > > > > make[3]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build/b=
uild/tmp/work-shared/qemux86/kernel-source/scripts/Makefile.host:111: scrip=
ts/basic/fixdep] Error 1
> > > > > make[2]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build/b=
uild/tmp/work-shared/qemux86/kernel-source/Makefile:640: scripts_basic] Err=
or 2
> > > > > /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work-=
shared/qemux86/kernel-source/Makefile:748: include/config/auto.conf: No suc=
h file or directory
> > > > > make[1]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build/b=
uild/tmp/work-shared/qemux86/kernel-source/Makefile:805: include/config/aut=
o.conf] Error 2
> > > > > make[1]: *** [include/config/auto.conf] Deleting file 'include/ge=
nerated/rustc_cfg'
> > > > > make[1]: *** [include/config/auto.conf] Deleting file 'include/ge=
nerated/autoconf.h'
> > > > > make: *** [Makefile:238: __sub-make] Error 2
> > > > > make: Leaving directory '/home/pokybuild/yocto-worker/pkgman-non-=
rpm/build/build/tmp/work-shared/qemux86/kernel-source'
> > > > > ERROR: oe_runmake failed
> > > > > WARNING: /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/=
tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_configure.1=
69218:195 exit 1 from 'exit 1'
> > > > > WARNING: Backtrace (BB generated script):
> > > > >       #1: bbfatal_log, /home/pokybuild/yocto-worker/pkgman-non-rp=
m/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.=
do_configure.169218, line 195
> > > > >       #2: die, /home/pokybuild/yocto-worker/pkgman-non-rpm/build/=
build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_confi=
gure.169218, line 179
> > > > >       #3: oe_runmake, /home/pokybuild/yocto-worker/pkgman-non-rpm=
/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.d=
o_configure.169218, line 174
> > > > >       #4: do_configure, /home/pokybuild/yocto-worker/pkgman-non-r=
pm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run=
.do_configure.169218, line 164
> > > > >       #5: main, /home/pokybuild/yocto-worker/pkgman-non-rpm/build=
/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_conf=
igure.169218, line 208
> > > > NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Failed
> > > >=20
> > > > > It shouldn't be the kernel updates, so I'm assuming something wit=
h
> > > > > make-mod-scripts. I'll have a look at it on Thursday.
> > > >=20
> > > > Yes, it is make-mod-scripts, maybe missing static libraries?
> > >=20
> > > I was able to build qemux86 on my ubuntu builder, and from the messag=
e
> > > it is looking for -lc and not finding it.
> > >=20
> > > It looks like that was alma linux, so no static c library ?
> > >=20
> > > I don't have access to anything alma based to test, but I guess a
> > > dependency on a static native glibc might help ?
> >=20
> > If I understand what is being attempted here, what is being asked for
> > is a static library from the distro the build is running on. We don't
> > build a native glibc (or gcc).
> >=20
> > It is easy to say "just tell people to install that" but it isn't quite
> > that simple. The work needed off the top of my head is roughly:
> >=20
> > * add sanity tests to check it is present and error if not
> > * documentation updates to tell people to install it
> > * updating all the autobuilder workers to have it
> > * update buildtools tarball to contain it
> > * release a new buildtools
> > * ensure everything in automated testing uses the new buildtools
> > release
> >=20
> > so I do have to ask if we really need to add this dependency?
> >=20
>=20
> If we want to try and fix the rm_work issues with the output of
> make-mod-scripts via statically linked tools, then I don't see another
> way to do it. Distros that have a static libc don't have the issue of
> course.
>=20
> If we can't get the static linking working across kernel versions and
> host distros, then we are into the rpathLDPATH or other ideas that
> were floated in the original discussion to save the dynamic libraries
> to the kernel build artifacts directory and then have the scripts be
> able to locate them at runtime.
>=20
> I do find it strange that -lc isn't being found though, because that
> implies that no one ever does static linking on alma linux .. and that
> doesn't make sense, so maybe there's something else going on that I'm
> missing.

It implies nobody does that on alma linux without installing the static
library packages. We have minimal installs of the distros on the
autobuilder for this reason so we catch dependency issues like this.

Cheers,

Richard

