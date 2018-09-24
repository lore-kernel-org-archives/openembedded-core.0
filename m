Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
	[209.85.210.46])
	by mail.openembedded.org (Postfix) with ESMTP id BA0EC793D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 19:28:44 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id 36-v6so21235346oth.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 12:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jaPDasU2jnf2OkPivpOunV8CI2D1oHArD7+BAMR/0BI=;
	b=g88kQTUQurNHc1+7tVM+ZnKCgY4CXXzlR0hGzvLa8E7095w50LMheDmsq2waPI3WXg
	5CJqnbnBQOBGu+xXRecTCua8Gdgroj5CmOjsMDcgUTlznqhU/nRtyxa+mVwTXTFdtryu
	wsA9dDsv2iQV56xjJesmi7jLJewuGuOioq+uDAqF3aByBZvt/h6UfoV1mtGgW/5NEtZp
	aerO21fZnUROjrFj/xz4C9tKKUX3TH/xEI54bqtHHHo2Uh/GC1gqsVz6lHnrQxskB3st
	foQOFPMMf9/UVw7vsA6vT3pLNJYTpGik/7AnAw1WsaJfuKZpFoge7J8KtjW/GBcq6FVa
	PKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jaPDasU2jnf2OkPivpOunV8CI2D1oHArD7+BAMR/0BI=;
	b=a2Fi07T4tGbPRZaVgysr7b72KBuI1j1o6+EQVkHJHIZznLqnKOx2bszXKl646n4vdn
	INfPMxPVmk86Nt8RxcDl1+IITpQUa7IrsaSapXT9tu3nptYoI9wL3/CgwRPpNH+FlaaZ
	Nzw7pp8/GO+i4VbaP6yWAPGbpwEUx/rQ4Cd58oGmvIgSGaRod3LstJgTJRJGVlobKMFO
	PLJN7BMQwXrEJuBv2wrj5AddSRoNaf1e7mCThAJbNFhx5K9Znxu4Q0ebT8lWrdgtmJkw
	HSHJqEWcpaETyMARpqhAqwXybsU8IhAvX4/DZr898b18XTDiEzjDIJUqUe/6skvtZwu1
	vhCA==
X-Gm-Message-State: ABuFfojVoi38vBtT/Crbh4E6GL1ZhCYoJX3O8HeTwATsFeFm+EWXe8dO
	+X4NEqBX0G7hyGe+leT874BiIlpb2ToEsiCOjqjpIQ==
X-Google-Smtp-Source: ACcGV63qxtFRdDtN+m9pfMhKmUyU+3M675p27ZUQKbm4gWg0roM5v2IAwcqSBQ2WLPggrIEDf1ajGcMeO1NAb4/0Rs0=
X-Received: by 2002:a9d:48f9:: with SMTP id
	a54-v6mr191436otj.343.1537817325500; 
	Mon, 24 Sep 2018 12:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <153754348673.9161.13447934313277658780@git.openembedded.org>
	<20180921152447.28A71234DE8@git.openembedded.org>
	<CA+chaQcHh7nAJy+k9ZmxB6ERm0r5woFVnUku_5RB0PiakE95CA@mail.gmail.com>
	<CAMKF1sqK1EvH455QgBGcAuT5MpgWVaMFBu3i0db18mm_MZzjug@mail.gmail.com>
	<CAJTo0LZ_7rkjRisBhGUgawPxomapvQe=15FVeqDdQ0SSXSsLsA@mail.gmail.com>
	<CAJTo0LZ0ASe42H8TQBQTaPWtd+mB76kAN_4mxYY9j6L4z=qwVw@mail.gmail.com>
	<CAMKF1srJMrumXJxoe5Sw0NXy1KpeSu=Nu80kz10AGcUEtdVOpw@mail.gmail.com>
In-Reply-To: <CAMKF1srJMrumXJxoe5Sw0NXy1KpeSu=Nu80kz10AGcUEtdVOpw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Sep 2018 20:28:30 +0100
Message-ID: <CAJTo0LZEzWgPGotSOoyj_nQO3fpk7ptzJJHqO05zVfFg4YWuMQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-commits@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 02/45: fribidi: use Meson instead of autotools
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2018 19:28:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Turns out that fix promptly breaks something else...

Digging into Meson today and trying to fix some target/host confusion.

Ross
On Mon, 24 Sep 2018 at 19:58, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Sep 24, 2018 at 4:10 AM Burton, Ross <ross.burton@intel.com> wrot=
e:
> >
> > I can't seem to replicate this on our centos7 box:
> >
> > [ross@centos7 build]$ gcc --version
> > gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-28)
> > [ross@centos7 build]$ gcc -ffdjsj
> > gcc: error: unrecognized command line option =E2=80=98-ffdjsj=E2=80=99
> > gcc: fatal error: no input files
> > compilation terminated.
> > [ross@centos7 build]$ gcc -fstack-protector-strong
> > gcc: fatal error: no input files
> > compilation terminated.
> >
> > Presumably we've upgraded gcc at some point...
> >
> > However I did replicate the same sort of problem outside of OE.  Can
> > one of you test
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dross=
/mut&id=3D1e32317ad77457d2a026eaa67ea7c6eebe58b127
> > for me please?
> >
>
> this solves the issue, thanks for prompt turnaround for fixing it
>
> > Cheers,
> > Ross
> > On Mon, 24 Sep 2018 at 11:08, Burton, Ross <ross.burton@intel.com> wrot=
e:
> > >
> > > Looks like Meson is using the target link flags for linking even when
> > > it knows its doing a native build.  Talking to Meson upstream now and
> > > have a workaround.
> > >
> > > Ross
> > > On Sun, 23 Sep 2018 at 15:51, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Sun, Sep 23, 2018 at 2:20 AM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
> > > > >
> > > > > Was this one ever sent to ML? I haven't found it in the archives.
> > > > >
> > > > > With security flags enabled it fails on older hosts (e.g. Ubuntu =
14.04 with gcc-4.8) now with:
> > > >
> > > > I am seeing same failure on ubuntu 14.04 and centos7 boxes
> > > > this definitely is regression, its being not to right about using
> > > > TARGET_CFLAGS where it should not be using them
> > > >
> > > > >
> > > > > DEBUG: Executing shell function do_compile
> > > > > [1/63] gcc -Igen.tab/gen.tab@@gen-unicode-version@exe -Igen.tab -=
I../fribidi-1.0.5/gen.tab -I. -I../fribidi-1.0.5/ -Ilib -I../fribidi-1.0.5/=
lib -pipe -D_FILE_OFFSET_BITS=3D64 -ansi -fvisibility=3Dhidden -O2 -g -feli=
minate-unused-debug-types -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberryp=
i3-webos-linux-gnueabi/fribidi/1.0.5-r0=3D/usr/src/debug/fribidi/1.0.5-r0 -=
fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/frib=
idi/1.0.5-r0/recipe-sysroot=3D -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspb=
errypi3-webos-linux-gnueabi/fribidi/1.0.5-r0/recipe-sysroot-native=3D -UHAV=
E_CONFIG_H -DHAVE_STRINGIZE -DDONT_HAVE_FRIBIDI_CONFIG_H -DHAVE_STDLIB_H -D=
HAVE_STRING_H -DHAVE_STRINGS_H -DSTDC_HEADERS=3D1  -MD -MQ 'gen.tab/gen.tab=
@@gen-unicode-version@exe/gen-unicode-version.c.o' -MF 'gen.tab/gen.tab@@ge=
n-unicode-version@exe/gen-unicode-version.c.o.d' -o 'gen.tab/gen.tab@@gen-u=
nicode-version@exe/gen-unicode-version.c.o' -c ../fribidi-1.0.5/gen.tab/gen=
-unicode-version.c
> > > > > [2/63] gcc   -o gen.tab/gen-unicode-version 'gen.tab/gen.tab@@gen=
-unicode-version@exe/gen-unicode-version.c.o' -Wl,--no-undefined -Wl,--as-n=
eeded -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3DTOPD=
IR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0=3D/usr/src/=
debug/fribidi/1.0.5-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-=
webos-linux-gnueabi/fribidi/1.0.5-r0/recipe-sysroot=3D -fdebug-prefix-map=
=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0/reci=
pe-sysroot-native=3D -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fstack=
-protector-strong -Wl,-z,relro,-z,now
> > > > > FAILED: gen.tab/gen-unicode-version
> > > > > gcc   -o gen.tab/gen-unicode-version 'gen.tab/gen.tab@@gen-unicod=
e-version@exe/gen-unicode-version.c.o' -Wl,--no-undefined -Wl,--as-needed -=
O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3DTOPDIR/BUIL=
D/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0=3D/usr/src/debug/f=
ribidi/1.0.5-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-l=
inux-gnueabi/fribidi/1.0.5-r0/recipe-sysroot=3D -fdebug-prefix-map=3DTOPDIR=
/BUILD/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0/recipe-sysroo=
t-native=3D -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fstack-protecto=
r-strong -Wl,-z,relro,-z,now
> > > > > gcc: error: unrecognized command line option =E2=80=98-fstack-pro=
tector-strong=E2=80=99
> > > > > ninja: build stopped: subcommand failed.
> > > > > WARNING: exit code 1 from a shell command.
> > > > >
> > > > > Is meson too active in adding SECURITY_FLAGS even to native part =
of the build or should we just just remove -fstack-protector-strong complet=
ely for fribidi?
> > > > >
> > > > >
> > > > >
> > > > > On Fri, Sep 21, 2018 at 5:24 PM <git@git.openembedded.org> wrote:
> > > > >>
> > > > >> This is an automated email from the git hooks/post-receive scrip=
t.
> > > > >>
> > > > >> rpurdie pushed a commit to branch master-next
> > > > >> in repository openembedded-core.
> > > > >>
> > > > >> commit d297f7ebf3f62528d055e1938a9693d6f3a61935
> > > > >> Author: Ross Burton <ross.burton@intel.com>
> > > > >> AuthorDate: Fri Sep 14 00:28:39 2018 +0100
> > > > >>
> > > > >>     fribidi: use Meson instead of autotools
> > > > >>
> > > > >>     Upstream is moving to Meson, so backport a patch to use that=
 instead of
> > > > >>     autotools.
> > > > >>
> > > > >>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > > >> ---
> > > > >>  meta/recipes-support/fribidi/fribidi/meson.patch | 44 +++++++++=
+++++++++++++++
> > > > >>  meta/recipes-support/fribidi/fribidi_1.0.5.bb    |  8 ++---
> > > > >>  2 files changed, 47 insertions(+), 5 deletions(-)
> > > > >>
> > > > >> diff --git a/meta/recipes-support/fribidi/fribidi/meson.patch b/=
meta/recipes-support/fribidi/fribidi/meson.patch
> > > > >> new file mode 100644
> > > > >> index 0000000..8b3c4a9
> > > > >> --- /dev/null
> > > > >> +++ b/meta/recipes-support/fribidi/fribidi/meson.patch
> > > > >> @@ -0,0 +1,44 @@
> > > > >> +Upstream-Status: Backport
> > > > >> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > > >> +
> > > > >> +From f5feb6c599adb52f24656f8589868039b0d14272 Mon Sep 17 00:00:=
00 2001
> > > > >> +From: Heiko Becker <heirecka@exherbo.org>
> > > > >> +Date: Fri, 7 Sep 2018 20:57:11 +0200
> > > > >> +Subject: [PATCH] Build generator executables natively
> > > > >> +
> > > > >> +They are run during the build and not installed in the end. Wit=
hout
> > > > >> +this one gets the following error from meson: "ERROR: Can not u=
se
> > > > >> +target gen-unicode-version as a generator because it is cross-b=
uilt
> > > > >> +and no exe wrapper is defined. You might want to set it to nati=
ve
> > > > >> +instead."
> > > > >> +
> > > > >> +Closes #87.
> > > > >> +
> > > > >> +---
> > > > >> + gen.tab/meson.build | 6 ++++--
> > > > >> + 1 file changed, 4 insertions(+), 2 deletions(-)
> > > > >> +
> > > > >> +diff --git a/gen.tab/meson.build b/gen.tab/meson.build
> > > > >> +index 6006d98..8c21e98 100644
> > > > >> +--- a/gen.tab/meson.build
> > > > >> ++++ b/gen.tab/meson.build
> > > > >> +@@ -33,7 +33,8 @@ gen_unicode_version =3D executable('gen-unico=
de-version',
> > > > >> +   'gen-unicode-version.c',
> > > > >> +   include_directories: incs,
> > > > >> +   c_args: native_args,
> > > > >> +-  install: false)
> > > > >> ++  install: false,
> > > > >> ++  native: true)
> > > > >> +
> > > > >> + fribidi_unicode_version_h =3D custom_target('fribidi-unicode-v=
ersion.h',
> > > > >> +   input: files('unidata/ReadMe.txt', 'unidata/BidiMirroring.tx=
t'),
> > > > >> +@@ -67,7 +68,8 @@ foreach tab : tabs
> > > > >> +     gen_prog_src, 'packtab.c',
> > > > >> +     include_directories: incs,
> > > > >> +     c_args: native_args,
> > > > >> +-    install: false)
> > > > >> ++    install: false,
> > > > >> ++    native: true)
> > > > >> +
> > > > >> +   tab_inc_file =3D custom_target(gen_prog_name,
> > > > >> +     input: gen_prog_inputs,
> > > > >> diff --git a/meta/recipes-support/fribidi/fribidi_1.0.5.bb b/met=
a/recipes-support/fribidi/fribidi_1.0.5.bb
> > > > >> index 303ccb7..63b2da6 100644
> > > > >> --- a/meta/recipes-support/fribidi/fribidi_1.0.5.bb
> > > > >> +++ b/meta/recipes-support/fribidi/fribidi_1.0.5.bb
> > > > >> @@ -3,16 +3,14 @@ SECTION =3D "libs"
> > > > >>  LICENSE =3D "LGPLv2.1+"
> > > > >>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e631dd8=
edb7424769c7"
> > > > >>
> > > > >> -SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download=
/v${PV}/${BP}.tar.bz2"
> > > > >> +SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download=
/v${PV}/${BP}.tar.bz2 \
> > > > >> +           file://meson.patch"
> > > > >>  SRC_URI[md5sum] =3D "0f97f65038545340316ec0f4bd53df0b"
> > > > >>  SRC_URI[sha256sum] =3D "6a64f2a687f5c4f203a46fa659f43dd43d1f8b8=
45df8d723107e8a7e6158e4ce"
> > > > >>
> > > > >>  UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releas=
es"
> > > > >>
> > > > >> -inherit autotools lib_package pkgconfig
> > > > >> -
> > > > >> -# TODO use Meson instead of autotools when
> > > > >> -# https://github.com/fribidi/fribidi/issues/87 is solved
> > > > >> +inherit meson lib_package pkgconfig
> > > > >>
> > > > >>  CVE_PRODUCT =3D "gnu_fribidi"
> > > > >>
> > > > >>
> > > > >> --
> > > > >> To stop receiving notification emails like this one, please cont=
act
> > > > >> the administrator of this repository.
> > > > >> --
> > > > >> _______________________________________________
> > > > >> Openembedded-commits mailing list
> > > > >> Openembedded-commits@lists.openembedded.org
> > > > >> http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-core mailing list
> > > > > Openembedded-core@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

