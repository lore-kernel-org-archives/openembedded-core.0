Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 540006010D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 10:08:36 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id m11-v6so16438897oic.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 03:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=o6FjlfYCeaEL9JRxtgwrfczzMJUknUKRU5AqpRu3j8U=;
	b=K3by8T0HS2HFkyHR3iBMW4DW2eQ+kPoKp0XOsPpHdJFiemVeJdGKeAymz5FKmbL++c
	PRZ8ojuxwAUHwo0zS0CVA//t3c7v2yjVShW9cumSgr+A6wKtcVHeam6LEgE2OD8y/FQn
	2VbSoCMzfm+TNK8k/Kc0b3sUq/71dS7vEF8UcvU5f+Jh+2BSxv+B4h+oag7/1WAA1zso
	cU/OWt8Wcq4p7bnjNl+bRQdRLiGwv0CoUsUvnu2NCChLXXNV9QU3iTM1yOZGgc3YCkYA
	9va19P8xm2eOKpBTNjxhe/MlYiyJHf5aUO7qLUuMOT2JyXZ6NjYdsbPNT0bfm+jY8Rj8
	QKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=o6FjlfYCeaEL9JRxtgwrfczzMJUknUKRU5AqpRu3j8U=;
	b=Aq0m63HN7bPDQVPyDg8JU/JqoSm5RaZDjBPgES+TQ0jMNzQOdP1gp3KR/2b3KAASFg
	qEvNOlOPPVltZm55RK8dp9vCSKoxuIdbQHR+0OoVYd0CrFkQKj2yZg96JzzyAqUEP1e3
	QvDpPLCiBCAlz3UPyEFQTqv2wFrLUIvQA4RAP15plxFzxNAGSBsdRi02WDbZzAcaRn74
	PlPkEK+xSk2BZrGezeFsQDF0AvsJ50lEMDRWO0UZLqvOPa0SztGGMvdxjekOLn06prJi
	qRqkzn4PZIhORJ4wreNP4Be0McDkHlr6LnrvqL1X6BX+5LYaR2mTCIXNIv6Y6twSgqlp
	XOBw==
X-Gm-Message-State: APzg51C/DK9qQ/ZgW+itKOXwzkwCayqb9t6KcQzirpqJr04KbDJNGA+o
	roIEKAXKlwrIjVLVYdn9Uqk05y+qXI1AQGyOZ1rK/g==
X-Google-Smtp-Source: ANB0VdbVouyIJO5Cl1MzR4JpnRL47bQt5nNBsveSSjG06GKE4QtvGX7KYmrA6tI2IMV8WhLOlfaHLhS9c8OXB/hB0UQ=
X-Received: by 2002:aca:2c5:: with SMTP id
	188-v6mr4767709oic.192.1537783717233; 
	Mon, 24 Sep 2018 03:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <153754348673.9161.13447934313277658780@git.openembedded.org>
	<20180921152447.28A71234DE8@git.openembedded.org>
	<CA+chaQcHh7nAJy+k9ZmxB6ERm0r5woFVnUku_5RB0PiakE95CA@mail.gmail.com>
	<CAMKF1sqK1EvH455QgBGcAuT5MpgWVaMFBu3i0db18mm_MZzjug@mail.gmail.com>
In-Reply-To: <CAMKF1sqK1EvH455QgBGcAuT5MpgWVaMFBu3i0db18mm_MZzjug@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Sep 2018 11:08:24 +0100
Message-ID: <CAJTo0LZ_7rkjRisBhGUgawPxomapvQe=15FVeqDdQ0SSXSsLsA@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Sep 2018 10:08:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks like Meson is using the target link flags for linking even when
it knows its doing a native build.  Talking to Meson upstream now and
have a workaround.

Ross
On Sun, 23 Sep 2018 at 15:51, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sun, Sep 23, 2018 at 2:20 AM Martin Jansa <martin.jansa@gmail.com> wro=
te:
> >
> > Was this one ever sent to ML? I haven't found it in the archives.
> >
> > With security flags enabled it fails on older hosts (e.g. Ubuntu 14.04 =
with gcc-4.8) now with:
>
> I am seeing same failure on ubuntu 14.04 and centos7 boxes
> this definitely is regression, its being not to right about using
> TARGET_CFLAGS where it should not be using them
>
> >
> > DEBUG: Executing shell function do_compile
> > [1/63] gcc -Igen.tab/gen.tab@@gen-unicode-version@exe -Igen.tab -I../fr=
ibidi-1.0.5/gen.tab -I. -I../fribidi-1.0.5/ -Ilib -I../fribidi-1.0.5/lib -p=
ipe -D_FILE_OFFSET_BITS=3D64 -ansi -fvisibility=3Dhidden -O2 -g -feliminate=
-unused-debug-types -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-web=
os-linux-gnueabi/fribidi/1.0.5-r0=3D/usr/src/debug/fribidi/1.0.5-r0 -fdebug=
-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.=
0.5-r0/recipe-sysroot=3D -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi=
3-webos-linux-gnueabi/fribidi/1.0.5-r0/recipe-sysroot-native=3D -UHAVE_CONF=
IG_H -DHAVE_STRINGIZE -DDONT_HAVE_FRIBIDI_CONFIG_H -DHAVE_STDLIB_H -DHAVE_S=
TRING_H -DHAVE_STRINGS_H -DSTDC_HEADERS=3D1  -MD -MQ 'gen.tab/gen.tab@@gen-=
unicode-version@exe/gen-unicode-version.c.o' -MF 'gen.tab/gen.tab@@gen-unic=
ode-version@exe/gen-unicode-version.c.o.d' -o 'gen.tab/gen.tab@@gen-unicode=
-version@exe/gen-unicode-version.c.o' -c ../fribidi-1.0.5/gen.tab/gen-unico=
de-version.c
> > [2/63] gcc   -o gen.tab/gen-unicode-version 'gen.tab/gen.tab@@gen-unico=
de-version@exe/gen-unicode-version.c.o' -Wl,--no-undefined -Wl,--as-needed =
-O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3DTOPDIR/BUI=
LD/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0=3D/usr/src/debug/=
fribidi/1.0.5-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-=
linux-gnueabi/fribidi/1.0.5-r0/recipe-sysroot=3D -fdebug-prefix-map=3DTOPDI=
R/BUILD/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0/recipe-sysro=
ot-native=3D -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fstack-protect=
or-strong -Wl,-z,relro,-z,now
> > FAILED: gen.tab/gen-unicode-version
> > gcc   -o gen.tab/gen-unicode-version 'gen.tab/gen.tab@@gen-unicode-vers=
ion@exe/gen-unicode-version.c.o' -Wl,--no-undefined -Wl,--as-needed -O2 -pi=
pe -g -feliminate-unused-debug-types -fdebug-prefix-map=3DTOPDIR/BUILD/work=
/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0=3D/usr/src/debug/fribidi=
/1.0.5-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-g=
nueabi/fribidi/1.0.5-r0/recipe-sysroot=3D -fdebug-prefix-map=3DTOPDIR/BUILD=
/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0/recipe-sysroot-nati=
ve=3D -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fstack-protector-stro=
ng -Wl,-z,relro,-z,now
> > gcc: error: unrecognized command line option =E2=80=98-fstack-protector=
-strong=E2=80=99
> > ninja: build stopped: subcommand failed.
> > WARNING: exit code 1 from a shell command.
> >
> > Is meson too active in adding SECURITY_FLAGS even to native part of the=
 build or should we just just remove -fstack-protector-strong completely fo=
r fribidi?
> >
> >
> >
> > On Fri, Sep 21, 2018 at 5:24 PM <git@git.openembedded.org> wrote:
> >>
> >> This is an automated email from the git hooks/post-receive script.
> >>
> >> rpurdie pushed a commit to branch master-next
> >> in repository openembedded-core.
> >>
> >> commit d297f7ebf3f62528d055e1938a9693d6f3a61935
> >> Author: Ross Burton <ross.burton@intel.com>
> >> AuthorDate: Fri Sep 14 00:28:39 2018 +0100
> >>
> >>     fribidi: use Meson instead of autotools
> >>
> >>     Upstream is moving to Meson, so backport a patch to use that inste=
ad of
> >>     autotools.
> >>
> >>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> >> ---
> >>  meta/recipes-support/fribidi/fribidi/meson.patch | 44 +++++++++++++++=
+++++++++
> >>  meta/recipes-support/fribidi/fribidi_1.0.5.bb    |  8 ++---
> >>  2 files changed, 47 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/meta/recipes-support/fribidi/fribidi/meson.patch b/meta/r=
ecipes-support/fribidi/fribidi/meson.patch
> >> new file mode 100644
> >> index 0000000..8b3c4a9
> >> --- /dev/null
> >> +++ b/meta/recipes-support/fribidi/fribidi/meson.patch
> >> @@ -0,0 +1,44 @@
> >> +Upstream-Status: Backport
> >> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> >> +
> >> +From f5feb6c599adb52f24656f8589868039b0d14272 Mon Sep 17 00:00:00 200=
1
> >> +From: Heiko Becker <heirecka@exherbo.org>
> >> +Date: Fri, 7 Sep 2018 20:57:11 +0200
> >> +Subject: [PATCH] Build generator executables natively
> >> +
> >> +They are run during the build and not installed in the end. Without
> >> +this one gets the following error from meson: "ERROR: Can not use
> >> +target gen-unicode-version as a generator because it is cross-built
> >> +and no exe wrapper is defined. You might want to set it to native
> >> +instead."
> >> +
> >> +Closes #87.
> >> +
> >> +---
> >> + gen.tab/meson.build | 6 ++++--
> >> + 1 file changed, 4 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/gen.tab/meson.build b/gen.tab/meson.build
> >> +index 6006d98..8c21e98 100644
> >> +--- a/gen.tab/meson.build
> >> ++++ b/gen.tab/meson.build
> >> +@@ -33,7 +33,8 @@ gen_unicode_version =3D executable('gen-unicode-ver=
sion',
> >> +   'gen-unicode-version.c',
> >> +   include_directories: incs,
> >> +   c_args: native_args,
> >> +-  install: false)
> >> ++  install: false,
> >> ++  native: true)
> >> +
> >> + fribidi_unicode_version_h =3D custom_target('fribidi-unicode-version=
.h',
> >> +   input: files('unidata/ReadMe.txt', 'unidata/BidiMirroring.txt'),
> >> +@@ -67,7 +68,8 @@ foreach tab : tabs
> >> +     gen_prog_src, 'packtab.c',
> >> +     include_directories: incs,
> >> +     c_args: native_args,
> >> +-    install: false)
> >> ++    install: false,
> >> ++    native: true)
> >> +
> >> +   tab_inc_file =3D custom_target(gen_prog_name,
> >> +     input: gen_prog_inputs,
> >> diff --git a/meta/recipes-support/fribidi/fribidi_1.0.5.bb b/meta/reci=
pes-support/fribidi/fribidi_1.0.5.bb
> >> index 303ccb7..63b2da6 100644
> >> --- a/meta/recipes-support/fribidi/fribidi_1.0.5.bb
> >> +++ b/meta/recipes-support/fribidi/fribidi_1.0.5.bb
> >> @@ -3,16 +3,14 @@ SECTION =3D "libs"
> >>  LICENSE =3D "LGPLv2.1+"
> >>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e631dd8edb742=
4769c7"
> >>
> >> -SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV=
}/${BP}.tar.bz2"
> >> +SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV=
}/${BP}.tar.bz2 \
> >> +           file://meson.patch"
> >>  SRC_URI[md5sum] =3D "0f97f65038545340316ec0f4bd53df0b"
> >>  SRC_URI[sha256sum] =3D "6a64f2a687f5c4f203a46fa659f43dd43d1f8b845df8d=
723107e8a7e6158e4ce"
> >>
> >>  UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releases"
> >>
> >> -inherit autotools lib_package pkgconfig
> >> -
> >> -# TODO use Meson instead of autotools when
> >> -# https://github.com/fribidi/fribidi/issues/87 is solved
> >> +inherit meson lib_package pkgconfig
> >>
> >>  CVE_PRODUCT =3D "gnu_fribidi"
> >>
> >>
> >> --
> >> To stop receiving notification emails like this one, please contact
> >> the administrator of this repository.
> >> --
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

