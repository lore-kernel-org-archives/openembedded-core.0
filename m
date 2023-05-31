Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC977C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 22:22:15 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.127.1685571725120508307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 15:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=AOqPQibD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30ae967ef74so135628f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 15:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685571723; x=1688163723;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JiIZpE8+P8aOrNVkG4FURXRqj1mJOPjVhDMmgvnfhHA=;
        b=AOqPQibDixsiODhOq2XlifL7irjqp6TomrY13gq1tytRG1f5U4lg4woSjCyiknaiap
         YxqrS97U98b/pFd+uJSdx1nBpGNYQSp/SVuhNDQiu/CsfNEtoyd3XzmtF2rAtkeUhkHN
         T6qytt6mIgoFKFrGcSk+9h20oSf5XhD2hpA/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685571723; x=1688163723;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JiIZpE8+P8aOrNVkG4FURXRqj1mJOPjVhDMmgvnfhHA=;
        b=lR1f5gp0MLIWPkh6B00Iinsjas357zt33qxIcBKpGU1WFw3jtf+eliz4a7WfPlETAQ
         ufQONZTZ1+PzcRW3baySjvsFNlEmGg4j+sixo4UZeFsGXgVf7SMB5mlzk/g7Y4XMxf3d
         pX2LX8or8dMZA65UPUgqW9q9ZHocL+W/32HeW1JqAx3Y1EhwFsfvCXF8hGBlb1R/vZAZ
         yg9OTknps7omiEOxQsFPQjI1YNPsNqITl4nVhNvJMfeBAtVIYNoVvt+Q3FL3H6wlYb5W
         ZVCJHxwrJxPAsg+yyp9YFX/IwNtKCvNYyyKxkv0I6VPWSJfTKDMURWv468EqPJaFLlE+
         01+Q==
X-Gm-Message-State: AC+VfDyIxCWoavauO9GHoYkEt0t/90cDC72f6rMHtSadKySCDaykJshU
	MieDx3Hk6zQot8lx3tPFsIbczQ==
X-Google-Smtp-Source: ACHHUZ64ufZv4l8eZxFm+dLCiCy1quA4jQxQjBq1QuSqwAxQLJytKVR5Xb3FxVnkrZm29sJisVUaHQ==
X-Received: by 2002:a5d:5412:0:b0:30a:e66f:7571 with SMTP id g18-20020a5d5412000000b0030ae66f7571mr392306wrv.4.1685571723279;
        Wed, 31 May 2023 15:22:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5363:779f:9df8:62e7? ([2001:8b0:aba:5f3c:5363:779f:9df8:62e7])
        by smtp.gmail.com with ESMTPSA id v12-20020a5d4a4c000000b003077a19cf75sm8115284wrs.60.2023.05.31.15.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 15:22:02 -0700 (PDT)
Message-ID: <a0868afea6ac27274253698a0ee9342dc4bca1fd.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/9] kernel/linux-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2023 23:22:02 +0100
In-Reply-To: <CADkTA4OTDrugNWkFYqDXZy7ruZ+6Qd2EGsQUx+JvSnskoHSCyw@mail.gmail.com>
References: <cover.1685558432.git.bruce.ashfield@gmail.com>
	 <14b5ba3f7ba79aa1cfa5c50f8458596951adcfb1.camel@linuxfoundation.org>
	 <CADkTA4OTDrugNWkFYqDXZy7ruZ+6Qd2EGsQUx+JvSnskoHSCyw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 22:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182040

On Wed, 2023-05-31 at 18:18 -0400, Bruce Ashfield wrote:
> On Wed, May 31, 2023 at 6:03=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > Hi Bruce,
> >=20
> > On Wed, 2023-05-31 at 14:48 -0400, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >=20
> > > Richard,
> > >=20
> > > Here's my consolidated queue. I've had some of these in testing for q=
uite
> > > a while, as I didn't want to send them right before release or before=
 my
> > > vacation last week.
> > >=20
> > > Most are -stable updates to 6.1 and finally bumping the -dev recipe t=
o
> > > show that we've been testing 6.4 for quite some time.
> > >=20
> > > The make-mod-scripts rmwork fix was discussed at lenght on the list, =
and
> > > has been tested by myself and people seeing the issues. But with all =
the
> > > races and issues we've seen in that area for years, I'll keep a close=
 eye
> > > out for AB issues.
> > >=20
> > > I've factored things a bit around enabling PAHOLE, I don't expect it
> > > to cause issues since it isn't on by default .. but you never know wi=
th
> > > these sorts of changes.
> > >=20
> > > I also have a bump for the refernece BSPs (sent to the appropriate
> > > list shortly) and a documentation commit for the PAHOLE tweaks (also
> > > sent to that list shortly, once we agree on the this change).
> >=20
> > Thanks for the updates!
> >=20
> > I put these in for testing (along with some other changes) and there
> > was an issue, probably the same thing showing up but I've not dug into
> > it:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7159
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/7197
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6093=
/steps/11/logs/stdio
> >=20
>=20
> That's odd:
>=20
> ERROR: core-image-sato-sdk-1.0-r0 do_testimage: File
> /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/deploy/images=
/qemux86/core-image-sato-sdk-qemux86.testdata.json
> not found ([Errno 2] No such file or directory:
> '/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/deploy/image=
s/qemux86/core-image-sato-sdk-qemux86.testdata.json').

That is the QA test failing due to an earlier failure to build the
image. The earlier failure looks like:

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7159/step=
s/11/logs/stdio

Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/pkgman-non-r=
pm/build/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home=
/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/binutils=
/binutils-cross_2.40.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker=
/pkgman-non-rpm/build/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_popula=
te_sysroot', '/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipe=
s-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/pokybuild/y=
octo-worker/pkgman-non-rpm/build/meta/recipes-devtools/quilt/quilt-native_0=
.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/pkgman-non-rpm/b=
uild/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sy=
sroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/m=
eta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot', 'vi=
rtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes=
-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot', 'virtual:native=
:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-core/zlib/z=
lib_1.2.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-w=
orker/pkgman-non-rpm/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_po=
pulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rp=
m/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroo=
t', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/=
recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native=
:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/pk=
gconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybu=
ild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/pseudo/pseudo_g=
it.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pk=
gman-non-rpm/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroo=
t', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/=
recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot', 'virtual:native:/home=
/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-kernel/kmod/kmod_=
30.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pk=
gman-non-rpm/build/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroo=
t', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/=
recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: ['kern-tools-native', 'util-linux-native', =
'kmod-native', 'libcap-ng-native', 'libpcre2-native']
| NOTE: Skipping as already exists in sysroot: ['glibc', 'binutils-cross-i6=
86', 'gcc-cross-i686', 'gcc-runtime', 'quilt-native', 'openssl-native', 'zl=
ib-native', 'bison-native', 'elfutils-native', 'patch-native', 'pkgconfig-n=
ative', 'pseudo-native', 'bc-native', 'xz-native', 'gmp-native', 'libmpc-na=
tive', 'linux-libc-headers', 'libgcc', 'gnu-config-native', 'flex-native', =
'texinfo-dummy-native', 'libtool-native', 'mpfr-native', 'zstd-native', 'pe=
rl-native', 'gettext-minimal-native', 'ncurses-native', 'util-linux-libuuid=
-native', 'libmicrohttpd-native', 'libarchive-native', 'curl-native', 'sqli=
te3-native', 'readline-native', 'attr-native', 'python3-native', 'm4-native=
', 'gdbm-native', 'make-native', 'gnutls-native', 'libgcrypt-native', 'bzip=
2-native', 'libedit-native', 'libffi-native', 'libtirpc-native', 'expat-nat=
ive', 'libnsl2-native', 'nettle-native', 'libidn2-native', 'libtasn1-native=
', 'libunistring-native', 'libcap-native', 'libgpg-error-native', 'cmake-na=
tive']
| DEBUG: sed -e 's:^[^/]*/:/home/pokybuild/yocto-worker/pkgman-non-rpm/buil=
d/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-=
native/:g' /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/sysr=
oots-components/x86_64/libpcre2-native/fixmepath | xargs sed -i -e 's:FIXME=
STAGINGDIRTARGET:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tm=
p/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot:g; s:FIXME=
STAGINGDIRHOST:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/=
work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native:g' -e=
 's:FIXME_PSEUDO_SYSROOT:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/=
build/tmp/sysroots-components/x86_64/pseudo-native:g' -e 's:FIXME_HOSTTOOLS=
_DIR:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/hosttools:=
g' -e 's:FIXME_PKGDATA_DIR:/home/pokybuild/yocto-worker/pkgman-non-rpm/buil=
d/build/tmp/pkgdata/qemux86:g' -e 's:FIXME_PSEUDO_LOCALSTATEDIR:/home/pokyb=
uild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/ma=
ke-mod-scripts/1.0-r0/pseudo/:g' -e 's:FIXME_LOGFIFO:/home/pokybuild/yocto-=
worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scri=
pts/1.0-r0/temp/fifo.169218:g'
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: make HOSTCC=3Dgcc  -isystem/home/pokybuild/yocto-worker/pkgman-non-=
rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-=
sysroot-native/usr/include -O2 -pipe -L/home/pokybuild/yocto-worker/pkgman-=
non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/rec=
ipe-sysroot-native/usr/lib                         -L/home/pokybuild/yocto-=
worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scri=
pts/1.0-r0/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/home/pokybuild/yocto-work=
er/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/=
1.0-r0/recipe-sysroot-native/usr/lib                         -Wl,-rpath-lin=
k,/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-=
poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/lib               =
          -Wl,-rpath,/home/pokybuild/yocto-worker/pkgman-non-rpm/build/buil=
d/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native=
/usr/lib                         -Wl,-rpath,/home/pokybuild/yocto-worker/pk=
gman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r=
0/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--allow-shl=
ib-undefined -Wl,--dynamic-linker=3D/home/pokybuild/yocto-worker/pkgman-non=
-rpm/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so=
.2 -static HOSTCPP=3Dgcc  -E HOSTCXX=3Dg++  -isystem/home/pokybuild/yocto-w=
orker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scrip=
ts/1.0-r0/recipe-sysroot-native/usr/include -O2 -pipe -L/home/pokybuild/yoc=
to-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-s=
cripts/1.0-r0/recipe-sysroot-native/usr/lib                         -L/home=
/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-li=
nux/make-mod-scripts/1.0-r0/recipe-sysroot-native/lib                      =
   -Wl,--enable-new-dtags                         -Wl,-rpath-link,/home/pok=
ybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/=
make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/lib                      =
   -Wl,-rpath-link,/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/=
tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/l=
ib                         -Wl,-rpath,/home/pokybuild/yocto-worker/pkgman-n=
on-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/reci=
pe-sysroot-native/usr/lib                         -Wl,-rpath,/home/pokybuil=
d/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-=
mod-scripts/1.0-r0/recipe-sysroot-native/lib                         -Wl,-O=
1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/home/pokybuild/yocto-=
worker/pkgman-non-rpm/build/build/tmp/sysroots-uninative/x86_64-linux/lib/l=
d-linux-x86-64.so.2 -static CROSS_COMPILE=3Di686-poky-linux- CC=3Di686-poky=
-linux-gcc  -fuse-ld=3Dbfd -fcanon-prefix-map  -fmacro-prefix-map=3D/home/p=
okybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linu=
x/make-mod-scripts/1.0-r0=3D/usr/src/debug/make-mod-scripts/1.0-r0  -fdebug=
-prefix-map=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/w=
ork/qemux86-poky-linux/make-mod-scripts/1.0-r0=3D/usr/src/debug/make-mod-sc=
ripts/1.0-r0  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/pkgman-non-=
rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0=3D/usr/=
src/debug/make-mod-scripts/1.0-r0  -fdebug-prefix-map=3D/home/pokybuild/yoc=
to-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-s=
cripts/1.0-r0=3D/usr/src/debug/make-mod-scripts/1.0-r0  -fdebug-prefix-map=
=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86=
-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot=3D  -fmacro-prefix-map=
=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86=
-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot=3D  -fdebug-prefix-map=
=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86=
-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native=3D  -fdebug-prefi=
x-map=3D/home/pokybui
d/yocto-worker/pkgman-non-rpm/build/build/tmp/work-shared/qemux86/kernel-so=
urce=3D/usr/src/kernel -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/pk=
gman-non-rpm/build/build/tmp/work-shared/qemux86/kernel-build-artifacts=3D/=
usr/src/kernel LD=3Di686-poky-linux-ld.bfd  AR=3Di686-poky-linux-ar  OBJCOP=
Y=3Di686-poky-linux-objcopy  HOSTPKG_CONFIG=3Dpkg-config --static CRYPTO_LI=
BS=3D-L/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qem=
ux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/lib/pkgco=
nfig/../../../usr/lib -lcrypto -ldl -pthread -C /home/pokybuild/yocto-worke=
r/pkgman-non-rpm/build/build/tmp/work-shared/qemux86/kernel-source O=3D/hom=
e/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work-shared/qemux86=
/kernel-build-artifacts prepare
| make: Entering directory '/home/pokybuild/yocto-worker/pkgman-non-rpm/bui=
ld/build/tmp/work-shared/qemux86/kernel-source'
|   SYNC    include/config/auto.conf
|   GEN     Makefile
|   HOSTCC  scripts/basic/fixdep
| /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/hosttools/ld:=
 cannot find -lc
| collect2: error: ld returned 1 exit status
| make[3]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp=
/work-shared/qemux86/kernel-source/scripts/Makefile.host:111: scripts/basic=
/fixdep] Error 1
| make[2]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp=
/work-shared/qemux86/kernel-source/Makefile:640: scripts_basic] Error 2
| /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work-shared/q=
emux86/kernel-source/Makefile:748: include/config/auto.conf: No such file o=
r directory
| make[1]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp=
/work-shared/qemux86/kernel-source/Makefile:805: include/config/auto.conf] =
Error 2
| make[1]: *** [include/config/auto.conf] Deleting file 'include/generated/=
rustc_cfg'
| make[1]: *** [include/config/auto.conf] Deleting file 'include/generated/=
autoconf.h'
| make: *** [Makefile:238: __sub-make] Error 2
| make: Leaving directory '/home/pokybuild/yocto-worker/pkgman-non-rpm/buil=
d/build/tmp/work-shared/qemux86/kernel-source'
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work=
/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_configure.169218:19=
5 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build=
/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_configure.=
169218, line 195
| 	#2: die, /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/wor=
k/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_configure.169218, =
line 179
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/=
tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_configure.1=
69218, line 174
| 	#4: do_configure, /home/pokybuild/yocto-worker/pkgman-non-rpm/build/buil=
d/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_configure=
.169218, line 164
| 	#5: main, /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/wo=
rk/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_configure.169218,=
 line 208
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Failed

> It shouldn't be the kernel updates, so I'm assuming something with
> make-mod-scripts. I'll have a look at it on Thursday.

Yes, it is make-mod-scripts, maybe missing static libraries?

Cheers,

Richard




