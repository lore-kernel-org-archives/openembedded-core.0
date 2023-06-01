Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB68C77B7A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 07:16:08 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.25142.1685603760546497714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 00:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZyCA+JT+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f3b9c88af8so479372e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 00:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685603758; x=1688195758;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Depq4b/j3mbVGbQHA3HbFi9J8Os86w2kLw2jO/DMsY=;
        b=ZyCA+JT+9mU49IBwlFE8+YpaUua/Z4625p3+pshNbZHzuvE9IddD1v72FCrKw8Gc0a
         kLvqJu7bzoNLyfiIDWxz/qzqviQBH1aP49Fd2JCOabwQ4p3q34pzBsPZ67pF9gTJvGfx
         nzMNkxz4ZctA+NydvoJv2SMMFvD5BSH3ULGpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685603758; x=1688195758;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Depq4b/j3mbVGbQHA3HbFi9J8Os86w2kLw2jO/DMsY=;
        b=Wwgk+35ZIXgg8Qpfo65ByYlYdRu9JENTZujLh9Wq5ZrzmaB++bT3lHK0aGw7qx+KSa
         NEcff8FTIZ2sxS979YsQO62zoK0tkJR2w8Cua1v1foSbWg4NhNGchHEuaQ2yH1+V4trM
         0/IL/snxU20tRQuuu8VrZQUjr2/x0aA+ZYcOqfSKhqXmY7VBe8j/EXZ8/vDYN86Amfw5
         08BJSmlL5lyMVnG9pBJT4mxWZNnrZZ4SanO2RycPjaorkTX409U43ud4/vaYwrdKrX0t
         MtNQhEY0OYVOs5d/XjTmH+fQjgwf0NBvjdRCFJIfth6opDgwnYluvTVasTFDztNBj9ZH
         t8DQ==
X-Gm-Message-State: AC+VfDwh6JrCcGSRyjY6cEIvbIW0uRd4OnhY/4LOsKExS3xY40QAKB4j
	ntzOAEgQDkraKdOLNltF7dNvwQ==
X-Google-Smtp-Source: ACHHUZ5LnydzTytwb/Q6aNVMDSzA4tgH9Vp7jJCftkOGC2igcbOM8vLMopSDIVb8pnyjBJ5/bcMWyA==
X-Received: by 2002:ac2:411a:0:b0:4f3:5038:5857 with SMTP id b26-20020ac2411a000000b004f350385857mr530230lfi.55.1685603758498;
        Thu, 01 Jun 2023 00:15:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5363:779f:9df8:62e7? ([2001:8b0:aba:5f3c:5363:779f:9df8:62e7])
        by smtp.gmail.com with ESMTPSA id u14-20020adfeb4e000000b003062b6a522bsm9033653wrn.96.2023.06.01.00.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 00:15:57 -0700 (PDT)
Message-ID: <80c5755eabc4e55f4e27a5335a642f74908a1e78.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/9] kernel/linux-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 01 Jun 2023 08:15:57 +0100
In-Reply-To: <CADkTA4MXVzuQmovAkmNsWhrD9SDeMV_F4RmVSmG-kUa7jUcpRA@mail.gmail.com>
References: <cover.1685558432.git.bruce.ashfield@gmail.com>
	 <14b5ba3f7ba79aa1cfa5c50f8458596951adcfb1.camel@linuxfoundation.org>
	 <CADkTA4OTDrugNWkFYqDXZy7ruZ+6Qd2EGsQUx+JvSnskoHSCyw@mail.gmail.com>
	 <a0868afea6ac27274253698a0ee9342dc4bca1fd.camel@linuxfoundation.org>
	 <CADkTA4MXVzuQmovAkmNsWhrD9SDeMV_F4RmVSmG-kUa7jUcpRA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 07:16:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182048

On Wed, 2023-05-31 at 19:24 -0400, Bruce Ashfield wrote:
> On Wed, May 31, 2023 at 6:22=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Wed, 2023-05-31 at 18:18 -0400, Bruce Ashfield wrote:
> > > On Wed, May 31, 2023 at 6:03=E2=80=AFPM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > Hi Bruce,
> > > >=20
> > > > On Wed, 2023-05-31 at 14:48 -0400, bruce.ashfield@gmail.com wrote:
> > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > >=20
> > > > > Richard,
> > > > >=20
> > > > > Here's my consolidated queue. I've had some of these in testing f=
or quite
> > > > > a while, as I didn't want to send them right before release or be=
fore my
> > > > > vacation last week.
> > > > >=20
> > > > > Most are -stable updates to 6.1 and finally bumping the -dev reci=
pe to
> > > > > show that we've been testing 6.4 for quite some time.
> > > > >=20
> > > > > The make-mod-scripts rmwork fix was discussed at lenght on the li=
st, and
> > > > > has been tested by myself and people seeing the issues. But with =
all the
> > > > > races and issues we've seen in that area for years, I'll keep a c=
lose eye
> > > > > out for AB issues.
> > > > >=20
> > > > > I've factored things a bit around enabling PAHOLE, I don't expect=
 it
> > > > > to cause issues since it isn't on by default .. but you never kno=
w with
> > > > > these sorts of changes.
> > > > >=20
> > > > > I also have a bump for the refernece BSPs (sent to the appropriat=
e
> > > > > list shortly) and a documentation commit for the PAHOLE tweaks (a=
lso
> > > > > sent to that list shortly, once we agree on the this change).
> > > >=20
> > > > Thanks for the updates!
> > > >=20
> > > > I put these in for testing (along with some other changes) and ther=
e
> > > > was an issue, probably the same thing showing up but I've not dug i=
nto
> > > > it:
> > > >=20
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7=
159
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/7=
197
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/=
6093/steps/11/logs/stdio
> > > >=20
> > >=20
> > > That's odd:
> > >=20
> > > ERROR: core-image-sato-sdk-1.0-r0 do_testimage: File
> > > /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/deploy/im=
ages/qemux86/core-image-sato-sdk-qemux86.testdata.json
> > > not found ([Errno 2] No such file or directory:
> > > '/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/deploy/i=
mages/qemux86/core-image-sato-sdk-qemux86.testdata.json').
> >=20
> > That is the QA test failing due to an earlier failure to build the
> > image. The earlier failure looks like:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7159/=
steps/11/logs/stdio
> >=20
> > Log data follows:
> > > DEBUG: Executing python function extend_recipe_sysroot
> > > NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/pkgman-n=
on-rpm/build/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/=
home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/binu=
tils/binutils-cross_2.40.bb:do_populate_sysroot', '/home/pokybuild/yocto-wo=
rker/pkgman-non-rpm/build/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_po=
pulate_sysroot', '/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/re=
cipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/pokybui=
ld/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/quilt/quilt-nati=
ve_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/pkgman-non-r=
pm/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populat=
e_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/bui=
ld/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot',=
 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/rec=
ipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot', 'virtual:na=
tive:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-core/zl=
ib/zlib_1.2.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yoc=
to-worker/pkgman-non-rpm/build/meta/recipes-devtools/bison/bison_3.8.2.bb:d=
o_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-no=
n-rpm/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sy=
sroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/m=
eta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:na=
tive:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtool=
s/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/po=
kybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/pseudo/pseu=
do_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worke=
r/pkgman-non-rpm/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sy=
sroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/m=
eta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot', 'virtual:native:/=
home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-kernel/kmod/k=
mod_30.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worke=
r/pkgman-non-rpm/build/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sy=
sroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/m=
eta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot']
> > > NOTE: Installed into sysroot: ['kern-tools-native', 'util-linux-nativ=
e', 'kmod-native', 'libcap-ng-native', 'libpcre2-native']
> > > NOTE: Skipping as already exists in sysroot: ['glibc', 'binutils-cros=
s-i686', 'gcc-cross-i686', 'gcc-runtime', 'quilt-native', 'openssl-native',=
 'zlib-native', 'bison-native', 'elfutils-native', 'patch-native', 'pkgconf=
ig-native', 'pseudo-native', 'bc-native', 'xz-native', 'gmp-native', 'libmp=
c-native', 'linux-libc-headers', 'libgcc', 'gnu-config-native', 'flex-nativ=
e', 'texinfo-dummy-native', 'libtool-native', 'mpfr-native', 'zstd-native',=
 'perl-native', 'gettext-minimal-native', 'ncurses-native', 'util-linux-lib=
uuid-native', 'libmicrohttpd-native', 'libarchive-native', 'curl-native', '=
sqlite3-native', 'readline-native', 'attr-native', 'python3-native', 'm4-na=
tive', 'gdbm-native', 'make-native', 'gnutls-native', 'libgcrypt-native', '=
bzip2-native', 'libedit-native', 'libffi-native', 'libtirpc-native', 'expat=
-native', 'libnsl2-native', 'nettle-native', 'libidn2-native', 'libtasn1-na=
tive', 'libunistring-native', 'libcap-native', 'libgpg-error-native', 'cmak=
e-native']
> > > DEBUG: sed -e 's:^[^/]*/:/home/pokybuild/yocto-worker/pkgman-non-rpm/=
build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysr=
oot-native/:g' /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/=
sysroots-components/x86_64/libpcre2-native/fixmepath | xargs sed -i -e 's:F=
IXMESTAGINGDIRTARGET:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/buil=
d/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot:g; s:F=
IXMESTAGINGDIRHOST:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/=
tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native:g=
' -e 's:FIXME_PSEUDO_SYSROOT:/home/pokybuild/yocto-worker/pkgman-non-rpm/bu=
ild/build/tmp/sysroots-components/x86_64/pseudo-native:g' -e 's:FIXME_HOSTT=
OOLS_DIR:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/hostto=
ols:g' -e 's:FIXME_PKGDATA_DIR:/home/pokybuild/yocto-worker/pkgman-non-rpm/=
build/build/tmp/pkgdata/qemux86:g' -e 's:FIXME_PSEUDO_LOCALSTATEDIR:/home/p=
okybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linu=
x/make-mod-scripts/1.0-r0/pseudo/:g' -e 's:FIXME_LOGFIFO:/home/pokybuild/yo=
cto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-=
scripts/1.0-r0/temp/fifo.169218:g'
> > > DEBUG: Python function extend_recipe_sysroot finished
> > > DEBUG: Executing shell function do_configure
> > > NOTE: make HOSTCC=3Dgcc  -isystem/home/pokybuild/yocto-worker/pkgman-=
non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/rec=
ipe-sysroot-native/usr/include -O2 -pipe -L/home/pokybuild/yocto-worker/pkg=
man-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0=
/recipe-sysroot-native/usr/lib                         -L/home/pokybuild/yo=
cto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-=
scripts/1.0-r0/recipe-sysroot-native/lib                         -Wl,--enab=
le-new-dtags                         -Wl,-rpath-link,/home/pokybuild/yocto-=
worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scri=
pts/1.0-r0/recipe-sysroot-native/usr/lib                         -Wl,-rpath=
-link,/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemu=
x86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/lib           =
              -Wl,-rpath,/home/pokybuild/yocto-worker/pkgman-non-rpm/build/=
build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-na=
tive/usr/lib                         -Wl,-rpath,/home/pokybuild/yocto-worke=
r/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1=
.0-r0/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--allow=
-shlib-undefined -Wl,--dynamic-linker=3D/home/pokybuild/yocto-worker/pkgman=
-non-rpm/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-6=
4.so.2 -static HOSTCPP=3Dgcc  -E HOSTCXX=3Dg++  -isystem/home/pokybuild/yoc=
to-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-s=
cripts/1.0-r0/recipe-sysroot-native/usr/include -O2 -pipe -L/home/pokybuild=
/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-m=
od-scripts/1.0-r0/recipe-sysroot-native/usr/lib                         -L/=
home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-pok=
y-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/lib                  =
       -Wl,--enable-new-dtags                         -Wl,-rpath-link,/home=
/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-li=
nux/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/lib                  =
       -Wl,-rpath-link,/home/pokybuild/yocto-worker/pkgman-non-rpm/build/bu=
ild/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-nati=
ve/lib                         -Wl,-rpath,/home/pokybuild/yocto-worker/pkgm=
an-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/=
recipe-sysroot-native/usr/lib                         -Wl,-rpath,/home/poky=
build/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/m=
ake-mod-scripts/1.0-r0/recipe-sysroot-native/lib                         -W=
l,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/home/pokybuild/yo=
cto-worker/pkgman-non-rpm/build/build/tmp/sysroots-uninative/x86_64-linux/l=
ib/ld-linux-x86-64.so.2 -static CROSS_COMPILE=3Di686-poky-linux- CC=3Di686-=
poky-linux-gcc  -fuse-ld=3Dbfd -fcanon-prefix-map  -fmacro-prefix-map=3D/ho=
me/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-=
linux/make-mod-scripts/1.0-r0=3D/usr/src/debug/make-mod-scripts/1.0-r0  -fd=
ebug-prefix-map=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/t=
mp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0=3D/usr/src/debug/make-mo=
d-scripts/1.0-r0  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/pkgman-=
non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0=3D/=
usr/src/debug/make-mod-scripts/1.0-r0  -fdebug-prefix-map=3D/home/pokybuild=
/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-m=
od-scripts/1.0-r0=3D/usr/src/debug/make-mod-scripts/1.0-r0  -fdebug-prefix-=
map=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemu=
x86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot=3D  -fmacro-prefix-ma=
p=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux8=
6-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot=3D  -fdebug-prefix-map=
=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86=
-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native=3D  -fdebug-prefi=
x-map=3D/home/pokybui
> > d/yocto-worker/pkgman-non-rpm/build/build/tmp/work-shared/qemux86/kerne=
l-source=3D/usr/src/kernel -fdebug-prefix-map=3D/home/pokybuild/yocto-worke=
r/pkgman-non-rpm/build/build/tmp/work-shared/qemux86/kernel-build-artifacts=
=3D/usr/src/kernel LD=3Di686-poky-linux-ld.bfd  AR=3Di686-poky-linux-ar  OB=
JCOPY=3Di686-poky-linux-objcopy  HOSTPKG_CONFIG=3Dpkg-config --static CRYPT=
O_LIBS=3D-L/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work=
/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/lib/p=
kgconfig/../../../usr/lib -lcrypto -ldl -pthread -C /home/pokybuild/yocto-w=
orker/pkgman-non-rpm/build/build/tmp/work-shared/qemux86/kernel-source O=3D=
/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work-shared/qem=
ux86/kernel-build-artifacts prepare
> > > make: Entering directory '/home/pokybuild/yocto-worker/pkgman-non-rpm=
/build/build/tmp/work-shared/qemux86/kernel-source'
> > >   SYNC    include/config/auto.conf
> > >   GEN     Makefile
> > >   HOSTCC  scripts/basic/fixdep
> > > /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/hosttools=
/ld: cannot find -lc
> > > collect2: error: ld returned 1 exit status
> > > make[3]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build=
/tmp/work-shared/qemux86/kernel-source/scripts/Makefile.host:111: scripts/b=
asic/fixdep] Error 1
> > > make[2]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build=
/tmp/work-shared/qemux86/kernel-source/Makefile:640: scripts_basic] Error 2
> > > /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work-shar=
ed/qemux86/kernel-source/Makefile:748: include/config/auto.conf: No such fi=
le or directory
> > > make[1]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build=
/tmp/work-shared/qemux86/kernel-source/Makefile:805: include/config/auto.co=
nf] Error 2
> > > make[1]: *** [include/config/auto.conf] Deleting file 'include/genera=
ted/rustc_cfg'
> > > make[1]: *** [include/config/auto.conf] Deleting file 'include/genera=
ted/autoconf.h'
> > > make: *** [Makefile:238: __sub-make] Error 2
> > > make: Leaving directory '/home/pokybuild/yocto-worker/pkgman-non-rpm/=
build/build/tmp/work-shared/qemux86/kernel-source'
> > > ERROR: oe_runmake failed
> > > WARNING: /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/=
work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_configure.16921=
8:195 exit 1 from 'exit 1'
> > > WARNING: Backtrace (BB generated script):
> > >       #1: bbfatal_log, /home/pokybuild/yocto-worker/pkgman-non-rpm/bu=
ild/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_c=
onfigure.169218, line 195
> > >       #2: die, /home/pokybuild/yocto-worker/pkgman-non-rpm/build/buil=
d/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_configure=
.169218, line 179
> > >       #3: oe_runmake, /home/pokybuild/yocto-worker/pkgman-non-rpm/bui=
ld/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_co=
nfigure.169218, line 174
> > >       #4: do_configure, /home/pokybuild/yocto-worker/pkgman-non-rpm/b=
uild/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_=
configure.169218, line 164
> > >       #5: main, /home/pokybuild/yocto-worker/pkgman-non-rpm/build/bui=
ld/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_configur=
e.169218, line 208
> > NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Failed
> >=20
> > > It shouldn't be the kernel updates, so I'm assuming something with
> > > make-mod-scripts. I'll have a look at it on Thursday.
> >=20
> > Yes, it is make-mod-scripts, maybe missing static libraries?
>=20
> I was able to build qemux86 on my ubuntu builder, and from the message
> it is looking for -lc and not finding it.
>=20
> It looks like that was alma linux, so no static c library ?
>=20
> I don't have access to anything alma based to test, but I guess a
> dependency on a static native glibc might help ?

If I understand what is being attempted here, what is being asked for
is a static library from the distro the build is running on. We don't
build a native glibc (or gcc).

It is easy to say "just tell people to install that" but it isn't quite
that simple. The work needed off the top of my head is roughly:

* add sanity tests to check it is present and error if not
* documentation updates to tell people to install it
* updating all the autobuilder workers to have it
* update buildtools tarball to contain it
* release a new buildtools
* ensure everything in automated testing uses the new buildtools
release

so I do have to ask if we really need to add this dependency?

Cheers,

Richard






