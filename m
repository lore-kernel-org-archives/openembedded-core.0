Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 163C9607AC;
	Wed, 26 Sep 2018 15:57:19 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id s129-v6so13206393qke.5;
	Wed, 26 Sep 2018 08:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0gPyUumMFyCm/hruBP8Wrj9XZYlSOTwdAIqRdffHzX4=;
	b=plLQjLZEfohIVoiDLoo7a9jkXQdtz08yLql/IubcvlsVDRVW1XWlOsQmkWtlUSGJ+u
	q9lbOOdN8N8XXSHADW13OPxSYzVDdwgiL414wLgLZGGkELpzY27807Y41HKbBDs9WOL8
	x8BhbLVIhQUGNNik4rCBGPSo8M/Qh4BE1L3bFMcDyzTQl/whNQL0KfM5fEoqCrBJgW5g
	lYn1ESsDVVnEKe9YZu93jZxGJMP1jSbdELKce9vBIhqKfaHYlWLx38qAtaEG3H7kMtCm
	8sYPSLpfMJUMLvAllescJXcifxh5kor81sr9EaA6tkKOcoaEMTofOZzyrBMlZ+MVxlnT
	ZVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0gPyUumMFyCm/hruBP8Wrj9XZYlSOTwdAIqRdffHzX4=;
	b=C+i/kpVyw3nmyBRTdO6TnpZO4FT/ux+6zpvChg91jIbmGacp6WIPrP0CcZYKgAWtvR
	EOuibDfpsFWPNBkr8senHqOTqdguIplvkUoT8/DSwaqEj3Basm3Djw6KZgdCS9g7NMBA
	Nw6BTs1qcqQEm2ETQtoM+wGC1mhNqiFeJyRMbPEF8J/J2b5XpLftX+Sx9ItZDff/1d+X
	J0GgYp/8XRcIjoInNqwMr9lxzUeMde48YmWYSO/9w6kekAH6iKMpwLMeJ8ho22UbwPeD
	QlrSeU138YWL509+hSgql44J8Krb1k2ja98isiU1qcpS2o1VlB5VStoxAnQqXGTHnLR7
	yAZw==
X-Gm-Message-State: ABuFfogIGi1OETyjIxHj08O6VrUqxkN3TsLE3UrHwx2HopAyYY/8L45e
	Bzbz2jVN3hbGIr8Y2odH+dzMwUtjEfPl8EpTBVs=
X-Google-Smtp-Source: ACcGV60VHbEoIz6YoI2SL3IdUPBo6DLDuCIjKRClIxjdXCm3z/ZALwi9hA8AszEhPcVR8h/sFfkQ1vxfAiUcxGZhT0c=
X-Received: by 2002:a37:655:: with SMTP id 82-v6mr4663452qkg.223.1537977440748;
	Wed, 26 Sep 2018 08:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <153754348673.9161.13447934313277658780@git.openembedded.org>
	<20180921152447.28A71234DE8@git.openembedded.org>
	<CA+chaQcHh7nAJy+k9ZmxB6ERm0r5woFVnUku_5RB0PiakE95CA@mail.gmail.com>
	<CAMKF1sqK1EvH455QgBGcAuT5MpgWVaMFBu3i0db18mm_MZzjug@mail.gmail.com>
	<CAJTo0LZ_7rkjRisBhGUgawPxomapvQe=15FVeqDdQ0SSXSsLsA@mail.gmail.com>
	<CAJTo0LZ0ASe42H8TQBQTaPWtd+mB76kAN_4mxYY9j6L4z=qwVw@mail.gmail.com>
	<CAMKF1srJMrumXJxoe5Sw0NXy1KpeSu=Nu80kz10AGcUEtdVOpw@mail.gmail.com>
	<CAJTo0LZEzWgPGotSOoyj_nQO3fpk7ptzJJHqO05zVfFg4YWuMQ@mail.gmail.com>
	<CAMKF1srQ+x3fv5GWSQ5kahHxYAO6CA6MjBuZGtBV9eX6r8Ws3g@mail.gmail.com>
	<CAJTo0LZ3xSR2RC9fv+LNQZAA6DTxSgVJKLnWa4WJ1qzxJsrgjg@mail.gmail.com>
In-Reply-To: <CAJTo0LZ3xSR2RC9fv+LNQZAA6DTxSgVJKLnWa4WJ1qzxJsrgjg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Sep 2018 08:56:54 -0700
Message-ID: <CAMKF1spvxcNWQEJwmqSYa=REAfFQ-vsAcmj99z94Vk9LnU=LHg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-commits@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 26 Sep 2018 15:57:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, it works.
On Tue, Sep 25, 2018 at 6:23 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> Can you try again with poky-contrib:ross/meson?  Pulling that thread
> turned out to be more complex than expected...
>
> Ross
> On Mon, 24 Sep 2018 at 21:18, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Ross
> >
> > I am seeing some extra fails which could be related to your proposed ch=
anges
> >
> > http://errors.yoctoproject.org/Errors/Build/68805/
> >
> > see the first three
> > On Mon, Sep 24, 2018 at 12:28 PM Burton, Ross <ross.burton@intel.com> w=
rote:
> > >
> > > Turns out that fix promptly breaks something else...
> > >
> > > Digging into Meson today and trying to fix some target/host confusion=
.
> > >
> > > Ross
> > > On Mon, 24 Sep 2018 at 19:58, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Mon, Sep 24, 2018 at 4:10 AM Burton, Ross <ross.burton@intel.com=
> wrote:
> > > > >
> > > > > I can't seem to replicate this on our centos7 box:
> > > > >
> > > > > [ross@centos7 build]$ gcc --version
> > > > > gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-28)
> > > > > [ross@centos7 build]$ gcc -ffdjsj
> > > > > gcc: error: unrecognized command line option =E2=80=98-ffdjsj=E2=
=80=99
> > > > > gcc: fatal error: no input files
> > > > > compilation terminated.
> > > > > [ross@centos7 build]$ gcc -fstack-protector-strong
> > > > > gcc: fatal error: no input files
> > > > > compilation terminated.
> > > > >
> > > > > Presumably we've upgraded gcc at some point...
> > > > >
> > > > > However I did replicate the same sort of problem outside of OE.  =
Can
> > > > > one of you test
> > > > > http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=
=3Dross/mut&id=3D1e32317ad77457d2a026eaa67ea7c6eebe58b127
> > > > > for me please?
> > > > >
> > > >
> > > > this solves the issue, thanks for prompt turnaround for fixing it
> > > >
> > > > > Cheers,
> > > > > Ross
> > > > > On Mon, 24 Sep 2018 at 11:08, Burton, Ross <ross.burton@intel.com=
> wrote:
> > > > > >
> > > > > > Looks like Meson is using the target link flags for linking eve=
n when
> > > > > > it knows its doing a native build.  Talking to Meson upstream n=
ow and
> > > > > > have a workaround.
> > > > > >
> > > > > > Ross
> > > > > > On Sun, 23 Sep 2018 at 15:51, Khem Raj <raj.khem@gmail.com> wro=
te:
> > > > > > >
> > > > > > > On Sun, Sep 23, 2018 at 2:20 AM Martin Jansa <martin.jansa@gm=
ail.com> wrote:
> > > > > > > >
> > > > > > > > Was this one ever sent to ML? I haven't found it in the arc=
hives.
> > > > > > > >
> > > > > > > > With security flags enabled it fails on older hosts (e.g. U=
buntu 14.04 with gcc-4.8) now with:
> > > > > > >
> > > > > > > I am seeing same failure on ubuntu 14.04 and centos7 boxes
> > > > > > > this definitely is regression, its being not to right about u=
sing
> > > > > > > TARGET_CFLAGS where it should not be using them
> > > > > > >
> > > > > > > >
> > > > > > > > DEBUG: Executing shell function do_compile
> > > > > > > > [1/63] gcc -Igen.tab/gen.tab@@gen-unicode-version@exe -Igen=
.tab -I../fribidi-1.0.5/gen.tab -I. -I../fribidi-1.0.5/ -Ilib -I../fribidi-=
1.0.5/lib -pipe -D_FILE_OFFSET_BITS=3D64 -ansi -fvisibility=3Dhidden -O2 -g=
 -feliminate-unused-debug-types -fdebug-prefix-map=3DTOPDIR/BUILD/work/rasp=
berrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0=3D/usr/src/debug/fribidi/1.0.=
5-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueab=
i/fribidi/1.0.5-r0/recipe-sysroot=3D -fdebug-prefix-map=3DTOPDIR/BUILD/work=
/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0/recipe-sysroot-native=3D=
 -UHAVE_CONFIG_H -DHAVE_STRINGIZE -DDONT_HAVE_FRIBIDI_CONFIG_H -DHAVE_STDLI=
B_H -DHAVE_STRING_H -DHAVE_STRINGS_H -DSTDC_HEADERS=3D1  -MD -MQ 'gen.tab/g=
en.tab@@gen-unicode-version@exe/gen-unicode-version.c.o' -MF 'gen.tab/gen.t=
ab@@gen-unicode-version@exe/gen-unicode-version.c.o.d' -o 'gen.tab/gen.tab@=
@gen-unicode-version@exe/gen-unicode-version.c.o' -c ../fribidi-1.0.5/gen.t=
ab/gen-unicode-version.c
> > > > > > > > [2/63] gcc   -o gen.tab/gen-unicode-version 'gen.tab/gen.ta=
b@@gen-unicode-version@exe/gen-unicode-version.c.o' -Wl,--no-undefined -Wl,=
--as-needed -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=
=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0=3D/u=
sr/src/debug/fribidi/1.0.5-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspbe=
rrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0/recipe-sysroot=3D -fdebug-prefi=
x-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0=
/recipe-sysroot-native=3D -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -f=
stack-protector-strong -Wl,-z,relro,-z,now
> > > > > > > > FAILED: gen.tab/gen-unicode-version
> > > > > > > > gcc   -o gen.tab/gen-unicode-version 'gen.tab/gen.tab@@gen-=
unicode-version@exe/gen-unicode-version.c.o' -Wl,--no-undefined -Wl,--as-ne=
eded -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3DTOPDI=
R/BUILD/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0=3D/usr/src/d=
ebug/fribidi/1.0.5-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-w=
ebos-linux-gnueabi/fribidi/1.0.5-r0/recipe-sysroot=3D -fdebug-prefix-map=3D=
TOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0/recipe-=
sysroot-native=3D -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fstack-pr=
otector-strong -Wl,-z,relro,-z,now
> > > > > > > > gcc: error: unrecognized command line option =E2=80=98-fsta=
ck-protector-strong=E2=80=99
> > > > > > > > ninja: build stopped: subcommand failed.
> > > > > > > > WARNING: exit code 1 from a shell command.
> > > > > > > >
> > > > > > > > Is meson too active in adding SECURITY_FLAGS even to native=
 part of the build or should we just just remove -fstack-protector-strong c=
ompletely for fribidi?
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > On Fri, Sep 21, 2018 at 5:24 PM <git@git.openembedded.org> =
wrote:
> > > > > > > >>
> > > > > > > >> This is an automated email from the git hooks/post-receive=
 script.
> > > > > > > >>
> > > > > > > >> rpurdie pushed a commit to branch master-next
> > > > > > > >> in repository openembedded-core.
> > > > > > > >>
> > > > > > > >> commit d297f7ebf3f62528d055e1938a9693d6f3a61935
> > > > > > > >> Author: Ross Burton <ross.burton@intel.com>
> > > > > > > >> AuthorDate: Fri Sep 14 00:28:39 2018 +0100
> > > > > > > >>
> > > > > > > >>     fribidi: use Meson instead of autotools
> > > > > > > >>
> > > > > > > >>     Upstream is moving to Meson, so backport a patch to us=
e that instead of
> > > > > > > >>     autotools.
> > > > > > > >>
> > > > > > > >>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > > > > > >> ---
> > > > > > > >>  meta/recipes-support/fribidi/fribidi/meson.patch | 44 +++=
+++++++++++++++++++++
> > > > > > > >>  meta/recipes-support/fribidi/fribidi_1.0.5.bb    |  8 ++-=
--
> > > > > > > >>  2 files changed, 47 insertions(+), 5 deletions(-)
> > > > > > > >>
> > > > > > > >> diff --git a/meta/recipes-support/fribidi/fribidi/meson.pa=
tch b/meta/recipes-support/fribidi/fribidi/meson.patch
> > > > > > > >> new file mode 100644
> > > > > > > >> index 0000000..8b3c4a9
> > > > > > > >> --- /dev/null
> > > > > > > >> +++ b/meta/recipes-support/fribidi/fribidi/meson.patch
> > > > > > > >> @@ -0,0 +1,44 @@
> > > > > > > >> +Upstream-Status: Backport
> > > > > > > >> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > > > > > >> +
> > > > > > > >> +From f5feb6c599adb52f24656f8589868039b0d14272 Mon Sep 17 =
00:00:00 2001
> > > > > > > >> +From: Heiko Becker <heirecka@exherbo.org>
> > > > > > > >> +Date: Fri, 7 Sep 2018 20:57:11 +0200
> > > > > > > >> +Subject: [PATCH] Build generator executables natively
> > > > > > > >> +
> > > > > > > >> +They are run during the build and not installed in the en=
d. Without
> > > > > > > >> +this one gets the following error from meson: "ERROR: Can=
 not use
> > > > > > > >> +target gen-unicode-version as a generator because it is c=
ross-built
> > > > > > > >> +and no exe wrapper is defined. You might want to set it t=
o native
> > > > > > > >> +instead."
> > > > > > > >> +
> > > > > > > >> +Closes #87.
> > > > > > > >> +
> > > > > > > >> +---
> > > > > > > >> + gen.tab/meson.build | 6 ++++--
> > > > > > > >> + 1 file changed, 4 insertions(+), 2 deletions(-)
> > > > > > > >> +
> > > > > > > >> +diff --git a/gen.tab/meson.build b/gen.tab/meson.build
> > > > > > > >> +index 6006d98..8c21e98 100644
> > > > > > > >> +--- a/gen.tab/meson.build
> > > > > > > >> ++++ b/gen.tab/meson.build
> > > > > > > >> +@@ -33,7 +33,8 @@ gen_unicode_version =3D executable('gen=
-unicode-version',
> > > > > > > >> +   'gen-unicode-version.c',
> > > > > > > >> +   include_directories: incs,
> > > > > > > >> +   c_args: native_args,
> > > > > > > >> +-  install: false)
> > > > > > > >> ++  install: false,
> > > > > > > >> ++  native: true)
> > > > > > > >> +
> > > > > > > >> + fribidi_unicode_version_h =3D custom_target('fribidi-uni=
code-version.h',
> > > > > > > >> +   input: files('unidata/ReadMe.txt', 'unidata/BidiMirror=
ing.txt'),
> > > > > > > >> +@@ -67,7 +68,8 @@ foreach tab : tabs
> > > > > > > >> +     gen_prog_src, 'packtab.c',
> > > > > > > >> +     include_directories: incs,
> > > > > > > >> +     c_args: native_args,
> > > > > > > >> +-    install: false)
> > > > > > > >> ++    install: false,
> > > > > > > >> ++    native: true)
> > > > > > > >> +
> > > > > > > >> +   tab_inc_file =3D custom_target(gen_prog_name,
> > > > > > > >> +     input: gen_prog_inputs,
> > > > > > > >> diff --git a/meta/recipes-support/fribidi/fribidi_1.0.5.bb=
 b/meta/recipes-support/fribidi/fribidi_1.0.5.bb
> > > > > > > >> index 303ccb7..63b2da6 100644
> > > > > > > >> --- a/meta/recipes-support/fribidi/fribidi_1.0.5.bb
> > > > > > > >> +++ b/meta/recipes-support/fribidi/fribidi_1.0.5.bb
> > > > > > > >> @@ -3,16 +3,14 @@ SECTION =3D "libs"
> > > > > > > >>  LICENSE =3D "LGPLv2.1+"
> > > > > > > >>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e=
631dd8edb7424769c7"
> > > > > > > >>
> > > > > > > >> -SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/do=
wnload/v${PV}/${BP}.tar.bz2"
> > > > > > > >> +SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/do=
wnload/v${PV}/${BP}.tar.bz2 \
> > > > > > > >> +           file://meson.patch"
> > > > > > > >>  SRC_URI[md5sum] =3D "0f97f65038545340316ec0f4bd53df0b"
> > > > > > > >>  SRC_URI[sha256sum] =3D "6a64f2a687f5c4f203a46fa659f43dd43=
d1f8b845df8d723107e8a7e6158e4ce"
> > > > > > > >>
> > > > > > > >>  UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/=
releases"
> > > > > > > >>
> > > > > > > >> -inherit autotools lib_package pkgconfig
> > > > > > > >> -
> > > > > > > >> -# TODO use Meson instead of autotools when
> > > > > > > >> -# https://github.com/fribidi/fribidi/issues/87 is solved
> > > > > > > >> +inherit meson lib_package pkgconfig
> > > > > > > >>
> > > > > > > >>  CVE_PRODUCT =3D "gnu_fribidi"
> > > > > > > >>
> > > > > > > >>
> > > > > > > >> --
> > > > > > > >> To stop receiving notification emails like this one, pleas=
e contact
> > > > > > > >> the administrator of this repository.
> > > > > > > >> --
> > > > > > > >> _______________________________________________
> > > > > > > >> Openembedded-commits mailing list
> > > > > > > >> Openembedded-commits@lists.openembedded.org
> > > > > > > >> http://lists.openembedded.org/mailman/listinfo/openembedde=
d-commits
> > > > > > > >
> > > > > > > > --
> > > > > > > > _______________________________________________
> > > > > > > > Openembedded-core mailing list
> > > > > > > > Openembedded-core@lists.openembedded.org
> > > > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded=
-core

