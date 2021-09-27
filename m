Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B5AC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 09:02:06 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.28553.1632733325502074410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 02:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hDyzB1ss;
 spf=pass (domain: gmail.com, ip: 209.85.217.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id n17so17273627vsr.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 02:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Isurv28HyJ/NgA37ctVKvpMn5URRtAPhgYqe6qGkvNA=;
        b=hDyzB1ssm06kAQ0KGccXnAxXdnfIeflKquL/+alTSGcHHs1X72iQGAjgeHzsClf/+H
         AkqCgSFUxrmCyBRJsCQjrQJNPy9tntO7ZJBFIM+P96FfOPTEdSY9aHuHAoL4K/s67462
         46XiOG4B6tZBADrd72Lx0VSCIYmFpokJbcSUGi39ElGaqrKtivANnZVaq6eS35k7GJDS
         IXFo7SpQZcs2xUbxdEh5apN+KkXahpDFB7zq50rVl/HGbmMWYZeNhAQ+n2hxROYGhRot
         pJdGa3KlalGh62BD7KgGdljXIr7DXR/ImeDz/m98L4PBeIVWvGuibpKggbcnUUHhmVUu
         U5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Isurv28HyJ/NgA37ctVKvpMn5URRtAPhgYqe6qGkvNA=;
        b=FD80rqYT+QwgWHPL2DKfJaqAhTqUa1FjoGhseREGU2ALPGJnB+3rYWq+8p4X7B8ml0
         iSDKyi6PMgOF8zSHy9hSxeIn2OueQ6u5+HE5J/vVZmuq8Ppk4CabZKZaUgsR5wMpHpYj
         96VuDgj5AJBFd9cZ4YaCro/TttanBA3DrwkZzP9b/vRbb2pBaFJxW5wTCOmyfJj8TQDZ
         prZS/QshTHHGwIwXl/0u0uVacRVyKGOxOUGvJyB/IJiDzqsWNwZHFaVvfM1NGp/A3hR1
         c1G19aPGAX0bJxWKIW4OT3kT3Kk1socAkNcWg+fDSE7rFhhRtCuAficbxXD2/v8w4eIt
         6NFQ==
X-Gm-Message-State: AOAM5325zYYYb+ota8TJnL8U5YtT/cnmypBvqjW22kgufeISe+81tmuL
	eYdI4NtfFRyeScv1tTBYFvTkLejW+A3qkFIRxvQ=
X-Google-Smtp-Source: 
 ABdhPJz+/k0l1EXem71z+uRFA9H4bo9MgdgNZUiSH10BmhQUaLkINPO9Z07q4n6HADKaOra9fXdJjiMmkYIMVHohAAk=
X-Received: by 2002:a67:bb04:: with SMTP id m4mr2235199vsn.18.1632733324462;
 Mon, 27 Sep 2021 02:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210921214318.1494652-1-alex@linutronix.de>
 <587d1f3b-ce02-2117-79b5-4d693652847d@windriver.com>
 <16A8A112ABE29251.12372@lists.openembedded.org>
In-Reply-To: <16A8A112ABE29251.12372@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Sep 2021 11:01:52 +0200
Message-ID: 
 <CANNYZj8AgvmDEaEY+xghsiFpRmQfiefP5Nrr_tmQczJSpXPYgA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] librsvg: update 2.40.21 -> 2.52.0
 (transition to rust!)
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d14f9a05ccf65900"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 09:02:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156376

--000000000000d14f9a05ccf65900
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is the non-repro I am seeing:
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210924-dzc45x=
u6/packages/diff-html/

Alex

On Mon, 27 Sept 2021 at 10:39, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> Thanks Randy, I had already ran this on the autobuilder, and there's
> several additional fixes. One issue I haven't yet tracked down is
> non-reproducibility of new librsvg. The tentative fix didn't help. The
> patches are collected at
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dakanavin/packa=
ge-version-updates
>
> FWIW, webkit hasn't used librsvg for a long time, and I have already
> dropped the dependency. So we have two consumers: adwaita-icon-theme need=
s
> -native, and the rsvg plugin in gstreamer.
>
> Alex
>
> On Mon, 27 Sept 2021 at 02:38, Randy MacLeod <randy.macleod@windriver.com=
>
> wrote:
>
>> On 2021-09-21 5:43 p.m., Alexander Kanavin wrote:
>> > After some poking and hacking I have arrived to the settings that work=
.
>> > Please refer to the commit for details.
>> >
>> > Some of these issues may re-occur in other components; in that case
>> > we need to come up with more generic solutions or upstream fixes.
>> >
>> > So far, it's a learning exercise for everybody in getting to know the
>> rust toolchain.
>>
>>
>> Thanks Alex! The uprev looks good to me.
>>
>> Testing results so far:
>>
>> BUILDALL-QEMU LOG FOR librsvg
>>
>> START TIME: 2021-09-26_15:33:44
>>
>> HOSTNAME: ala-lpggp3
>>
>> HOST OS: Ubuntu 18.04.3 LTS
>>
>> HOST KERNEL: 5.4.0-81-generic
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> BUILD RESULTS:
>>
>> [glibc]
>>
>> FAIL: qemuriscv32
>>
>> PASS: qemuarmv5
>>
>> FAIL: qemumips
>>
>> PASS: qemux86-64
>>
>> PASS: qemuarm64
>>
>> FAIL: qemumips64
>>
>> PASS: qemuarm
>>
>> ... more to come
>>
>>
>> An epiphany build for qx86 was also fine and worked when tested.
>>
>> Installing the rsvg package and running rsvg-convert foo.svg > foo.jpg
>> worked
>> for qemux86-64.
>>
>>
>> That's it for tonight, tomorrow, I'll reply with the rest of the
>> buildall-qemu
>> results and test gstreamer1.0-plugins-bad, which has:
>>     PACKAGECONFIG[rsvg]            =3D
>> "-Drsvg=3Denabled,-Drsvg=3Ddisabled,librsvg"
>>
>>
>> Also, I'll compare the full result to what I get for buildall-qemu
>> rust-hello-world.
>>
>> There are some tests in the librsvg package that I plan to add as
>> ptests. See below.
>>
>> ../Randy
>>
>>
>> tests/README.md
>> ---
>> Librsvg test suite
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>>
>>
>> Librsvg's test suite is split like this:
>>
>>
>>
>> * Unit tests in the Rust code, run normally with "cargo test".
>>
>>
>>
>> * Rust integration tests in this tests/ directory.
>>
>>
>>
>> * C API tests in this tests/ directory.
>>
>> ---
>>
>> ../Randy
>>
>>
>> >
>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > ---
>> >   ...t-Bsymbolic-fixes-configure-on-macOS.patch | 35 -----------
>> >   ...-rust-target-to-cargo-also-when-not-.patch | 47 +++++++++++++++
>> >   .../0001-Remove-non-reproducible-SRCDIR.patch | 30 ----------
>> >   ...lib.rs-do-not-probe-into-harcoded-li.patch | 53 ++++++++++++++++
>> >   .../librsvg/librsvg/gtk-option.patch          | 60 -----------------=
--
>> >   .../{librsvg_2.40.21.bb =3D> librsvg_2.52.0.bb} | 42 +++++++++----
>> >   6 files changed, 130 insertions(+), 137 deletions(-)
>> >   delete mode 100644
>> meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fixes-conf=
igure-on-macOS.patch
>> >   create mode 100644
>> meta/recipes-gnome/librsvg/librsvg/0001-Makefile.am-pass-rust-target-to-=
cargo-also-when-not-.patch
>> >   delete mode 100644
>> meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-reproducible-SRCDIR.p=
atch
>> >   create mode 100644
>> meta/recipes-gnome/librsvg/librsvg/0001-system-deps-src-lib.rs-do-not-pr=
obe-into-harcoded-li.patch
>> >   delete mode 100644 meta/recipes-gnome/librsvg/librsvg/gtk-option.pat=
ch
>> >   rename meta/recipes-gnome/librsvg/{librsvg_2.40.21.bb =3D>
>> librsvg_2.52.0.bb} (51%)
>> >
>> > diff --git
>> a/meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fixes-co=
nfigure-on-macOS.patch
>> b/meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fixes-co=
nfigure-on-macOS.patch
>> > deleted file mode 100644
>> > index 954bb60880c..00000000000
>> > ---
>> a/meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fixes-co=
nfigure-on-macOS.patch
>> > +++ /dev/null
>> > @@ -1,35 +0,0 @@
>> > -From b99891e31eb6ce550e7e1cb2ca592095b3050a93 Mon Sep 17 00:00:00 200=
1
>> > -From: Brion Vibber <brion@pobox.com>
>> > -Date: Sun, 25 Feb 2018 18:42:36 -0800
>> > -Subject: Auto-detect -Bsymbolic, fixes configure on macOS
>> > -
>> > -The -Bsymbolic linker option is ELF-specific, and was breaking
>> > -configure on macOS unless --disable-Bsymbolic was explicitly passed.
>> > -
>> > -Switching the behavior from requiring -Bsymbolic to be available
>> > -by default to just warning and continuing on without.
>> > -
>> > -Fixes https://gitlab.gnome.org/GNOME/librsvg/issues/211
>> > -
>> > -Upstream-Status: Backport
>> > -Signed-off-by: Adrian Bunk <bunk@stusta.de>
>> > ----
>> > - configure.ac | 2 +-
>> > - 1 file changed, 1 insertion(+), 1 deletion(-)
>> > -
>> > -diff --git a/configure.ac b/configure.ac
>> > -index 15b26b2d..9f8dce29 100644
>> > ---- a/configure.ac
>> > -+++ b/configure.ac
>> > -@@ -216,7 +216,7 @@ AM_CONDITIONAL([ENABLE_PIXBUF_LOADER],[test
>> "$enable_pixbuf_loader" =3D "yes"])
>> > - AC_ARG_ENABLE([Bsymbolic],
>> > -   [AS_HELP_STRING([--disable-Bsymbolic],
>> > -                   [disable linking with -Bsymbolic])],
>> > --  [],[enable_Bsymbolic=3Dyes])
>> > -+  [enable_Bsymbolic=3Dno],[enable_Bsymbolic=3Dauto])
>> > -
>> > - BSYMBOLIC_LDFLAG=3D
>> > - if test "$enable_Bsymbolic" !=3D "no"; then
>> > ---
>> > -2.20.1
>> > -
>> > diff --git
>> a/meta/recipes-gnome/librsvg/librsvg/0001-Makefile.am-pass-rust-target-t=
o-cargo-also-when-not-.patch
>> b/meta/recipes-gnome/librsvg/librsvg/0001-Makefile.am-pass-rust-target-t=
o-cargo-also-when-not-.patch
>> > new file mode 100644
>> > index 00000000000..d7487c234cf
>> > --- /dev/null
>> > +++
>> b/meta/recipes-gnome/librsvg/librsvg/0001-Makefile.am-pass-rust-target-t=
o-cargo-also-when-not-.patch
>> > @@ -0,0 +1,47 @@
>> > +From 95b2cd0169cb1b4694c2bce67169b1aa1d5e2be0 Mon Sep 17 00:00:00 200=
1
>> > +From: Alexander Kanavin <alex@linutronix.de>
>> > +Date: Tue, 21 Sep 2021 16:27:14 +0200
>> > +Subject: [PATCH] Makefile.am: pass rust target to cargo also when not
>> cross
>> > + compiling
>> > +
>> > +Otherwise oe-core's native build doesn't work either.
>> > +
>> > +Upstream-Status: Inappropriate [oe-core specific]
>> > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > +---
>> > + Makefile.am  | 2 --
>> > + configure.ac | 4 +---
>> > + 2 files changed, 1 insertion(+), 5 deletions(-)
>> > +
>> > +diff --git a/Makefile.am b/Makefile.am
>> > +index e93714e..effe5d3 100644
>> > +--- a/Makefile.am
>> > ++++ b/Makefile.am
>> > +@@ -137,9 +137,7 @@ else
>> > + CARGO_RELEASE_ARGS=3D--release
>> > + endif
>> > +
>> > +-if CROSS_COMPILING
>> > + CARGO_TARGET_ARGS=3D--target=3D$(RUST_TARGET)
>> > +-endif
>> > +
>> > + CARGO_VERBOSE =3D $(cargo_verbose_$(V))
>> > + cargo_verbose_ =3D $(cargo_verbose_$(AM_DEFAULT_VERBOSITY))
>> > +diff --git a/configure.ac b/configure.ac
>> > +index 41590ca..84cd56b 100644
>> > +--- a/configure.ac
>> > ++++ b/configure.ac
>> > +@@ -255,9 +255,7 @@ AC_ARG_VAR(RUST_TARGET, [Set rust target
>> (default=3D$host)])
>> > + : ${RUST_TARGET:=3D$host}
>> > +
>> > + AM_CONDITIONAL([CROSS_COMPILING], [test "x$cross_compiling" =3D xyes=
])
>> > +-AS_IF([test "x$cross_compiling" =3D "xyes"], [
>> > +-    RUST_TARGET_SUBDIR=3D"$RUST_TARGET/$RUST_TARGET_SUBDIR"
>> > +-])
>> > ++RUST_TARGET_SUBDIR=3D"$RUST_TARGET/$RUST_TARGET_SUBDIR"
>> > + AC_SUBST([RUST_TARGET_SUBDIR])
>> > +
>> > + dnl
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> > +--
>> > +2.20.1
>> > +
>> > diff --git
>> a/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-reproducible-SRCDIR=
.patch
>> b/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-reproducible-SRCDIR=
.patch
>> > deleted file mode 100644
>> > index 75fc7f9d0b9..00000000000
>> > ---
>> a/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-reproducible-SRCDIR=
.patch
>> > +++ /dev/null
>> > @@ -1,30 +0,0 @@
>> > -From bea5156cd7e7122715b26c769c35928141a1da2c Mon Sep 17 00:00:00 200=
1
>> > -From: Joshua Watt <JPEWhacker@gmail.com>
>> > -Date: Mon, 18 Nov 2019 14:46:34 -0600
>> > -Subject: [PATCH] Remove non-reproducible SRCDIR
>> > -
>> > -Removes SRCDIR as the prefix for finding the test font. This wouldn't
>> > -work anyway, since that path is not present on the target.
>> > -
>> > -This patch is specific to OE, since it appears that this entire metho=
d
>> > -of testing was removed when upstream was re-written in rust
>> > -
>> > -Upstream-Status: Inappropriate [OE-specific, no longer present
>> upstream]
>> > -Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> > ----
>> > - rsvg-cairo-draw.c | 2 +-
>> > - 1 file changed, 1 insertion(+), 1 deletion(-)
>> > -
>> > -diff --git a/rsvg-cairo-draw.c b/rsvg-cairo-draw.c
>> > -index caa9104..cfb7ed2 100644
>> > ---- a/rsvg-cairo-draw.c
>> > -+++ b/rsvg-cairo-draw.c
>> > -@@ -398,7 +398,7 @@ set_font_options_for_testing (PangoContext
>> *context)
>> > - static void
>> > - create_font_config_for_testing (RsvgCairoRender *render)
>> > - {
>> > --    const char *font_path =3D SRCDIR
>> "/tests/resources/LiberationSans-Regular.ttf";
>> > -+    const char *font_path =3D
>> "/tests/resources/LiberationSans-Regular.ttf";
>> > -
>> > -     if (render->font_config_for_testing !=3D NULL)
>> > -         return;
>> > diff --git
>> a/meta/recipes-gnome/librsvg/librsvg/0001-system-deps-src-lib.rs-do-not-=
probe-into-harcoded-li.patch
>> b/meta/recipes-gnome/librsvg/librsvg/0001-system-deps-src-lib.rs-do-not-=
probe-into-harcoded-li.patch
>> > new file mode 100644
>> > index 00000000000..849dd98c5f0
>> > --- /dev/null
>> > +++
>> b/meta/recipes-gnome/librsvg/librsvg/0001-system-deps-src-lib.rs-do-not-=
probe-into-harcoded-li.patch
>> > @@ -0,0 +1,53 @@
>> > +From 6d1f0740b111e86e99dcaf0222f3d1d67d3bf1e6 Mon Sep 17 00:00:00 200=
1
>> > +From: Alexander Kanavin <alex@linutronix.de>
>> > +Date: Tue, 21 Sep 2021 16:54:23 +0200
>> > +Subject: [PATCH] system-deps/src/lib.rs: do not probe into harcoded
>> list of
>> > + targets
>> > +
>> > +Oe-core defines custom targets, and this probe fails.
>> > +
>> > +Upstream-Status: Inappropriate [oe-core specific]
>> > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > +---
>> > + vendor/system-deps/.cargo-checksum.json |  2 +-
>> > + vendor/system-deps/src/lib.rs           | 16 +---------------
>> > + 2 files changed, 2 insertions(+), 16 deletions(-)
>> > +
>> > +diff --git a/vendor/system-deps/.cargo-checksum.json
>> b/vendor/system-deps/.cargo-checksum.json
>> > +index ecebb94..30d594e 100644
>> > +--- a/vendor/system-deps/.cargo-checksum.json
>> > ++++ b/vendor/system-deps/.cargo-checksum.json
>> > +@@ -1 +1 @@
>> >
>> +-{"files":{"Cargo.toml":"56ab5070dc9019b039c5e9904bb466b0879c33a7f69dd0=
30b97abab321b7cc04","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d=
059d3249e0bc93b36de45f759f2","LICENSE-MIT":"23f18e03dc49df91622fe2a76176497=
404e46ced8a715d9d2b67a7446571cca3","README.md":"3fe7396637bf9233908f41c6001=
cfcb00a379225e06e36e508c8b3d7264a8aae","src/
>> lib.rs
>> ":"015518f4337d80249d12c7e6c55e9063705a0b8805ebf46a445c89253edc5de0","sr=
c/
>> metadata.rs
>> ":"4c8d6ac2c88646a5b97ecb50ed44b65e5b2865cce6897add85b29ca2ae08c2bb","sr=
c/
>> test.rs
>> ":"1ec48d1e443a0a4ac8035a2b60ff0321543aa2fa998fee72cf7762a936bf5f8c","sr=
c/tests/testanotherlib.pc":"bb4fd942324e6d49ce3becd827aa5c948d1924ca6681904=
a3695c19b1424eb3c","src/tests/testdata.pc":"43f481e989c03674fed5ef78c6420b3=
f8d36a2ce001928d86c418d1844acd5e7","src/tests/testlib-2.0.pc":"152eb0c70c14=
c3d948118408f3d1fd3bb7531b02aa792db85bd957f7db90b45b","src/tests/testlib-3.=
0.pc":"cd39c2ef88f6828c9291150cc4b624e769abef484674eaebaa4f67979501315f","s=
rc/tests/testlib.pc":"75c0d8a5345f65794f583c83e1cf0dbf3385af6e6abea1d61bb86=
eef707a52db","src/tests/toml-missing-file/no-cargo-toml-here":"6ab4da4b56f1=
5315df6538610cfcd2ba3d0f9a7a8414678ff00ab5a78f7d41fa"},"package":"480c269f8=
70722b3b08d2f13053ce0c2ab722839f472863c3e2d61ff3a1c2fa6"}
>> > +\ No newline at end of file
>> >
>> ++{"files":{"Cargo.toml":"56ab5070dc9019b039c5e9904bb466b0879c33a7f69dd0=
30b97abab321b7cc04","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d=
059d3249e0bc93b36de45f759f2","LICENSE-MIT":"23f18e03dc49df91622fe2a76176497=
404e46ced8a715d9d2b67a7446571cca3","README.md":"3fe7396637bf9233908f41c6001=
cfcb00a379225e06e36e508c8b3d7264a8aae","src/
>> lib.rs
>> ":"594e5f14180590adc9ea0a8ba1cc35f9a8a260322d08de3037efac3ce1dc729b","sr=
c/
>> metadata.rs
>> ":"4c8d6ac2c88646a5b97ecb50ed44b65e5b2865cce6897add85b29ca2ae08c2bb","sr=
c/
>> test.rs
>> ":"1ec48d1e443a0a4ac8035a2b60ff0321543aa2fa998fee72cf7762a936bf5f8c","sr=
c/tests/testanotherlib.pc":"bb4fd942324e6d49ce3becd827aa5c948d1924ca6681904=
a3695c19b1424eb3c","src/tests/testdata.pc":"43f481e989c03674fed5ef78c6420b3=
f8d36a2ce001928d86c418d1844acd5e7","src/tests/testlib-2.0.pc":"152eb0c70c14=
c3d948118408f3d1fd3bb7531b02aa792db85bd957f7db90b45b","src/tests/testlib-3.=
0.pc":"cd39c2ef88f6828c9291150cc4b624e769abef484674eaebaa4f67979501315f","s=
rc/tests/testlib.pc":"75c0d8a5345f65794f583c83e1cf0dbf3385af6e6abea1d61bb86=
eef707a52db","src/tests/toml-missing-file/no-cargo-toml-here":"6ab4da4b56f1=
5315df6538610cfcd2ba3d0f9a7a8414678ff00ab5a78f7d41fa"},"package":"480c269f8=
70722b3b08d2f13053ce0c2ab722839f472863c3e2d61ff3a1c2fa6"}
>> > +diff --git a/vendor/system-deps/src/lib.rs b/vendor/system-deps/src/
>> lib.rs
>> > +index a0d4f00..a666817 100644
>> > +--- a/vendor/system-deps/src/lib.rs
>> > ++++ b/vendor/system-deps/src/lib.rs
>> > +@@ -725,21 +725,7 @@ impl Config {
>> > +     }
>> > +
>> > +     fn check_cfg(&self, cfg: &cfg_expr::Expression) -> Result<bool,
>> Error> {
>> > +-        use cfg_expr::{targets::get_builtin_target_by_triple,
>> Predicate};
>> > +-
>> > +-        let target =3D self
>> > +-            .env
>> > +-            .get("TARGET")
>> > +-            .expect("no TARGET env variable defined");
>> > +-        let target =3D get_builtin_target_by_triple(&target)
>> > +-            .unwrap_or_else(|| panic!("Invalid TARGET: {}", target))=
;
>> > +-
>> > +-        let res =3D cfg.eval(|pred| match pred {
>> > +-            Predicate::Target(tp) =3D> Some(tp.matches(target)),
>> > +-            _ =3D> None,
>> > +-        });
>> > +-
>> > +-        res.ok_or_else(||
>> Error::UnsupportedCfg(cfg.original().to_string()))
>> > ++        Ok(true)
>> > +     }
>> > + }
>> > +
>> > +--
>> > +2.20.1
>> > +
>> > diff --git a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
>> b/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
>> > deleted file mode 100644
>> > index 6c23071cd34..00000000000
>> > --- a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
>> > +++ /dev/null
>> > @@ -1,60 +0,0 @@
>> > -From 4e0ce3f22d45033a108cbacca3e5ec6728bd44f3 Mon Sep 17 00:00:00 200=
1
>> > -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> > -Date: Tue, 11 Aug 2015 16:25:38 +0300
>> > -Subject: [PATCH] configure: add option to enable/disable use of GTK+
>> > -
>> > -Distro packagers like predictability and automatically detected
>> optional
>> > -dependencies are not predicable.  Add a --with-gtk3 option (default t=
o
>> "auto")
>> > -for forcibly controlling whether GTK+ will be used or not.
>> > -
>> > -Upstream-Status: Submitted [
>> https://bugzilla.gnome.org/show_bug.cgi?id=3D712693]
>> > -
>> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
>> > -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> > ----
>> > - configure.ac | 17 +++++++++++------
>> > - 1 file changed, 11 insertions(+), 6 deletions(-)
>> > -
>> > -diff --git a/configure.ac b/configure.ac
>> > -index e61a952..c3aae84 100644
>> > ---- a/configure.ac
>> > -+++ b/configure.ac
>> > -@@ -130,17 +130,22 @@ AC_CHECK_FUNCS(strtok_r)
>> > - # GTK
>> > - #
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> > -
>> > --PKG_CHECK_MODULES([GTK3],[gtk+-3.0 >=3D
>> $GTK3_REQUIRED],[have_gtk_3=3Dyes],[have_gtk_3=3Dno])
>> > --
>> > - GTK3_BINARY_VERSION=3D
>> > -
>> > --if test "$have_gtk_3" =3D "yes"; then
>> > --    GTK3_BINARY_VERSION=3D"`$PKG_CONFIG --variable=3Dgtk_binary_vers=
ion
>> gtk+-3.0`"
>> > -+AC_MSG_CHECKING([whether to use GTK+ 3])
>> > -+AC_ARG_WITH([gtk3],
>> > -+  [AS_HELP_STRING([--without-gtk3],[Don't build GTK+3 tools
>> (default=3Dauto)])],
>> > -+  [],[PKG_CHECK_EXISTS([gtk+-3.0 >=3D
>> $GTK3_REQUIRED],[with_gtk3=3Dyes],[with_gtk3=3Dno])])
>> > -+AC_MSG_RESULT([$with_gtk3])
>> > -+
>> > -+if test "$with_gtk3" =3D "yes"; then
>> > -+  PKG_CHECK_MODULES(GTK3, [gtk+-3.0 >=3D $GTK3_REQUIRED])
>> > -+  GTK3_BINARY_VERSION=3D"`$PKG_CONFIG --variable=3Dgtk_binary_versio=
n
>> gtk+-3.0`"
>> > - fi
>> > -
>> > - AC_SUBST([GTK3_BINARY_VERSION])
>> > -
>> > --AM_CONDITIONAL([HAVE_GTK_3],[test "$have_gtk_3" =3D "yes"])
>> > -+AM_CONDITIONAL([HAVE_GTK_3],[test "$with_gtk3" =3D "yes"])
>> > -
>> > - dnl
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> > - dnl GDK-Pixbuf SVG loader
>> > -@@ -298,6 +303,6 @@ librsvg-$VERSION
>> > -     Build introspectable bindings:  ${found_introspection}
>> > -     Build Vala bindings:            ${enable_vala}
>> > -     Build GdkPixbuf loader:         ${enable_pixbuf_loader}
>> > --        GTK+ $GTK3_REQUIRED or later:           ${have_gtk_3}
>> > -+        GTK+ $GTK3_REQUIRED or later:           ${with_gtk_3}
>> > -     Build miscellaneous tools:      ${build_misc_tools}
>> > - "
>> > ---
>> > -2.1.4
>> > -
>> > diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
>> b/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb
>> > similarity index 51%
>> > rename from meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
>> > rename to meta/recipes-gnome/librsvg/librsvg_2.52.0.bb
>> > index 39b9aeca5d7..4e3febc6a2f 100644
>> > --- a/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
>> > +++ b/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb
>> > @@ -6,24 +6,44 @@ the screen or to generate output for printing."
>> >   HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/librsvg"
>> >   BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/librsvg/issues"
>> >
>> > -RECIPE_NO_UPDATE_REASON =3D "Versions from 2.41.0 requires Rust compi=
ler
>> to build it"
>> > -
>> > -LICENSE =3D "LGPLv2+"
>> > -LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f \
>> > -
>> file://rsvg.h;beginline=3D3;endline=3D24;md5=3D20b4113c4909bbf0d67e00677=
8302bc6"
>> > +LICENSE =3D "LGPLv2.1+"
>> > +LIC_FILES_CHKSUM =3D
>> "file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
>> > +                   "
>> >
>> >   SECTION =3D "x11/utils"
>> >   DEPENDS =3D "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
>> >   BBCLASSEXTEND =3D "native nativesdk"
>> >
>> > -inherit gnomebase gtk-doc pixbufcache upstream-version-is-even
>> gobject-introspection
>> > +inherit gnomebase gtk-doc pixbufcache upstream-version-is-even
>> gobject-introspection rust
>> >
>> > -SRC_URI +=3D "file://gtk-option.patch \
>> > -
>> file://0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch \
>> > -            file://0001-Remove-non-reproducible-SRCDIR.patch \
>> > +SRC_URI +=3D "
>> file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch \
>> > +
>>  file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch =
\
>> >   "
>> >
>> > -SRC_URI[archive.sha256sum] =3D
>> "f7628905f1cada84e87e2b14883ed57d8094dca3281d5bcb24ece4279e9a92ba"
>> > +SRC_URI[archive.sha256sum] =3D
>> "bd821fb3e16494b61f5185addd23b726b064f203122b3ab4b3d5d7a44e6bf393"
>> > +
>> > +# librsvg is still autotools-based, but is calling cargo from its
>> automake-driven makefiles
>> > +# so we cannot use cargo class directly, but still need bits and
>> pieces from it
>> > +# for cargo to be happy
>> > +BASEDEPENDS:append =3D " cargo-native"
>> > +
>> > +export RUST_BACKTRACE =3D "full"
>> > +export RUSTFLAGS
>> > +export RUST_TARGET_PATH
>> > +
>> > +export RUST_TARGET =3D "${HOST_SYS}"
>> > +
>> > +# rust-cross writes the target linker binary into target json
>> definition without any flags.
>> > +# This breaks here because the linker isn't going to work without at
>> least knowing where
>> > +# the sysroot is. So copy the json to workdir, and patch in the path
>> to wrapper from rust class
>> > +# which supplies the needed flags.
>> > +do_compile:prepend() {
>> > +    cp ${STAGING_LIBDIR_NATIVE}/rustlib/${HOST_SYS}.json ${WORKDIR}
>> > +    cp ${STAGING_LIBDIR_NATIVE}/rustlib/${BUILD_SYS}.json ${WORKDIR}
>> > +    sed -ie 's,"linker": ".*","linker": "${RUST_TARGET_CC}",g'
>> ${WORKDIR}/${HOST_SYS}.json
>> > +    RUST_TARGET_PATH=3D"${WORKDIR}"
>> > +    export RUST_TARGET_PATH
>> > +}
>> >
>> >   # Issue only on windows
>> >   CVE_CHECK_WHITELIST +=3D "CVE-2018-1000041"
>> > @@ -33,8 +53,6 @@ CACHED_CONFIGUREVARS =3D
>> "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=3D${STAGING_LIBDIR_NATI
>> >   PACKAGECONFIG ??=3D "gdkpixbuf"
>> >   # The gdk-pixbuf loader
>> >   PACKAGECONFIG[gdkpixbuf] =3D
>> "--enable-pixbuf-loader,--disable-pixbuf-loader,gdk-pixbuf-native"
>> > -# GTK+ test application (rsvg-view)
>> > -PACKAGECONFIG[gtk] =3D "--with-gtk3,--without-gtk3,gtk+3"
>> >
>> >   do_install:append() {
>> >       # Loadable modules don't need .a or .la on Linux
>> >
>> >
>> >
>> >
>> >
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156374):
> https://lists.openembedded.org/g/openembedded-core/message/156374
> Mute This Topic: https://lists.openembedded.org/mt/85776774/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d14f9a05ccf65900
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is the non-repro I am seeing:</div><div><a href=
=3D"https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210924-dz=
c45xu6/packages/diff-html/">https://autobuilder.yocto.io/pub/repro-fail/oe-=
reproducible-20210924-dzc45xu6/packages/diff-html/</a></div><div><br></div>=
<div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, 27 Sept 2021 at 10:39, Alexander Kanavin via <a =
href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;alex.=
kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lis=
ts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div>Thanks Randy, I had already ran th=
is on the autobuilder, and there&#39;s several additional fixes. One issue =
I haven&#39;t yet tracked down is non-reproducibility of new librsvg. The t=
entative fix didn&#39;t help. The patches are collected at</div><div><a hre=
f=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dakanavin/pa=
ckage-version-updates" target=3D"_blank">http://git.yoctoproject.org/cgit.c=
gi/poky-contrib/log/?h=3Dakanavin/package-version-updates</a></div><div><br=
></div><div>FWIW, webkit hasn&#39;t used librsvg for a long time, and I hav=
e already dropped the dependency. So we have two consumers: adwaita-icon-th=
eme needs -native, and the rsvg plugin in gstreamer.</div><div><br></div><d=
iv>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, 27 Sept 2021 at 02:38, Randy MacLeod &lt;<a href=
=3D"mailto:randy.macleod@windriver.com" target=3D"_blank">randy.macleod@win=
driver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 2021-09-21 5:43 p.m., Alexander Kanavin wrote:<br>
&gt; After some poking and hacking I have arrived to the settings that work=
.<br>
&gt; Please refer to the commit for details.<br>
&gt; <br>
&gt; Some of these issues may re-occur in other components; in that case<br=
>
&gt; we need to come up with more generic solutions or upstream fixes.<br>
&gt; <br>
&gt; So far, it&#39;s a learning exercise for everybody in getting to know =
the rust toolchain.<br>
<br>
<br>
Thanks Alex! The uprev looks good to me.<br>
<br>
Testing results so far:<br>
<br>
BUILDALL-QEMU LOG FOR librsvg<br>
<br>
START TIME: 2021-09-26_15:33:44<br>
<br>
HOSTNAME: ala-lpggp3<br>
<br>
HOST OS: Ubuntu 18.04.3 LTS<br>
<br>
HOST KERNEL: 5.4.0-81-generic<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
BUILD RESULTS:<br>
<br>
[glibc]<br>
<br>
FAIL: qemuriscv32<br>
<br>
PASS: qemuarmv5<br>
<br>
FAIL: qemumips<br>
<br>
PASS: qemux86-64<br>
<br>
PASS: qemuarm64<br>
<br>
FAIL: qemumips64<br>
<br>
PASS: qemuarm<br>
<br>
... more to come<br>
<br>
<br>
An epiphany build for qx86 was also fine and worked when tested.<br>
<br>
Installing the rsvg package and running rsvg-convert foo.svg &gt; foo.jpg <=
br>
worked<br>
for qemux86-64.<br>
<br>
<br>
That&#39;s it for tonight, tomorrow, I&#39;ll reply with the rest of the <b=
r>
buildall-qemu<br>
results and test gstreamer1.0-plugins-bad, which has:<br>
=C2=A0 =C2=A0 PACKAGECONFIG[rsvg]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D <br>
&quot;-Drsvg=3Denabled,-Drsvg=3Ddisabled,librsvg&quot;<br>
<br>
<br>
Also, I&#39;ll compare the full result to what I get for buildall-qemu <br>
rust-hello-world.<br>
<br>
There are some tests in the librsvg package that I plan to add as <br>
ptests. See below.<br>
<br>
../Randy<br>
<br>
<br>
tests/README.md<br>
---<br>
Librsvg test suite<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
<br>
<br>
Librsvg&#39;s test suite is split like this:<br>
<br>
<br>
<br>
* Unit tests in the Rust code, run normally with &quot;cargo test&quot;.<br=
>
<br>
<br>
<br>
* Rust integration tests in this tests/ directory.<br>
<br>
<br>
<br>
* C API tests in this tests/ directory.<br>
<br>
---<br>
<br>
../Randy<br>
<br>
<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0...t-Bsymbolic-fixes-configure-on-macOS.patch | 35 -------=
----<br>
&gt;=C2=A0 =C2=A0...-rust-target-to-cargo-also-when-not-.patch | 47 +++++++=
++++++++<br>
&gt;=C2=A0 =C2=A0.../0001-Remove-non-reproducible-SRCDIR.patch | 30 -------=
---<br>
&gt;=C2=A0 =C2=A0...lib.rs-do-not-probe-into-harcoded-li.patch | 53 +++++++=
+++++++++<br>
&gt;=C2=A0 =C2=A0.../librsvg/librsvg/gtk-option.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 60 -------------------<br>
&gt;=C2=A0 =C2=A0.../{<a href=3D"http://librsvg_2.40.21.bb" rel=3D"noreferr=
er" target=3D"_blank">librsvg_2.40.21.bb</a> =3D&gt; <a href=3D"http://libr=
svg_2.52.0.bb" rel=3D"noreferrer" target=3D"_blank">librsvg_2.52.0.bb</a>} =
| 42 +++++++++----<br>
&gt;=C2=A0 =C2=A06 files changed, 130 insertions(+), 137 deletions(-)<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-gnome/librsvg/librsvg/0001=
-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001=
-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-gnome/librsvg/librsvg/0001=
-Remove-non-reproducible-SRCDIR.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001=
-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-gnome/librsvg/librsvg/gtk-=
option.patch<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-gnome/librsvg/{<a href=3D"http://librs=
vg_2.40.21.bb" rel=3D"noreferrer" target=3D"_blank">librsvg_2.40.21.bb</a> =
=3D&gt; <a href=3D"http://librsvg_2.52.0.bb" rel=3D"noreferrer" target=3D"_=
blank">librsvg_2.52.0.bb</a>} (51%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymb=
olic-fixes-configure-on-macOS.patch b/meta/recipes-gnome/librsvg/librsvg/00=
01-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 954bb60880c..00000000000<br>
&gt; --- a/meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fi=
xes-configure-on-macOS.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,35 +0,0 @@<br>
&gt; -From b99891e31eb6ce550e7e1cb2ca592095b3050a93 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Brion Vibber &lt;<a href=3D"mailto:brion@pobox.com" target=3D"_=
blank">brion@pobox.com</a>&gt;<br>
&gt; -Date: Sun, 25 Feb 2018 18:42:36 -0800<br>
&gt; -Subject: Auto-detect -Bsymbolic, fixes configure on macOS<br>
&gt; -<br>
&gt; -The -Bsymbolic linker option is ELF-specific, and was breaking<br>
&gt; -configure on macOS unless --disable-Bsymbolic was explicitly passed.<=
br>
&gt; -<br>
&gt; -Switching the behavior from requiring -Bsymbolic to be available<br>
&gt; -by default to just warning and continuing on without.<br>
&gt; -<br>
&gt; -Fixes <a href=3D"https://gitlab.gnome.org/GNOME/librsvg/issues/211" r=
el=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/librsvg/=
issues/211</a><br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -Signed-off-by: Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de" targ=
et=3D"_blank">bunk@stusta.de</a>&gt;<br>
&gt; ----<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 15b26b2d..9f8dce29 100644<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -@@ -216,7 +216,7 @@ AM_CONDITIONAL([ENABLE_PIXBUF_LOADER],[test &quot=
;$enable_pixbuf_loader&quot; =3D &quot;yes&quot;])<br>
&gt; - AC_ARG_ENABLE([Bsymbolic],<br>
&gt; -=C2=A0 =C2=A0[AS_HELP_STRING([--disable-Bsymbolic],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
[disable linking with -Bsymbolic])],<br>
&gt; --=C2=A0 [],[enable_Bsymbolic=3Dyes])<br>
&gt; -+=C2=A0 [enable_Bsymbolic=3Dno],[enable_Bsymbolic=3Dauto])<br>
&gt; -<br>
&gt; - BSYMBOLIC_LDFLAG=3D<br>
&gt; - if test &quot;$enable_Bsymbolic&quot; !=3D &quot;no&quot;; then<br>
&gt; ---<br>
&gt; -2.20.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Makefile.am-pass-=
rust-target-to-cargo-also-when-not-.patch b/meta/recipes-gnome/librsvg/libr=
svg/0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..d7487c234cf<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-gnome/librsvg/librsvg/0001-Makefile.am-pass-rust-ta=
rget-to-cargo-also-when-not-.patch<br>
&gt; @@ -0,0 +1,47 @@<br>
&gt; +From 95b2cd0169cb1b4694c2bce67169b1aa1d5e2be0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" tar=
get=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; +Date: Tue, 21 Sep 2021 16:27:14 +0200<br>
&gt; +Subject: [PATCH] Makefile.am: pass rust target to cargo also when not=
 cross<br>
&gt; + compiling<br>
&gt; +<br>
&gt; +Otherwise oe-core&#39;s native build doesn&#39;t work either.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; +---<br>
&gt; + Makefile.am=C2=A0 | 2 --<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 4 +---<br>
&gt; + 2 files changed, 1 insertion(+), 5 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/Makefile.am b/Makefile.am<br>
&gt; +index e93714e..effe5d3 100644<br>
&gt; +--- a/Makefile.am<br>
&gt; ++++ b/Makefile.am<br>
&gt; +@@ -137,9 +137,7 @@ else<br>
&gt; + CARGO_RELEASE_ARGS=3D--release<br>
&gt; + endif<br>
&gt; +<br>
&gt; +-if CROSS_COMPILING<br>
&gt; + CARGO_TARGET_ARGS=3D--target=3D$(RUST_TARGET)<br>
&gt; +-endif<br>
&gt; +<br>
&gt; + CARGO_VERBOSE =3D $(cargo_verbose_$(V))<br>
&gt; + cargo_verbose_ =3D $(cargo_verbose_$(AM_DEFAULT_VERBOSITY))<br>
&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index 41590ca..84cd56b 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; +@@ -255,9 +255,7 @@ AC_ARG_VAR(RUST_TARGET, [Set rust target (default=
=3D$host)])<br>
&gt; + : ${RUST_TARGET:=3D$host}<br>
&gt; +<br>
&gt; + AM_CONDITIONAL([CROSS_COMPILING], [test &quot;x$cross_compiling&quot=
; =3D xyes])<br>
&gt; +-AS_IF([test &quot;x$cross_compiling&quot; =3D &quot;xyes&quot;], [<b=
r>
&gt; +-=C2=A0 =C2=A0 RUST_TARGET_SUBDIR=3D&quot;$RUST_TARGET/$RUST_TARGET_S=
UBDIR&quot;<br>
&gt; +-])<br>
&gt; ++RUST_TARGET_SUBDIR=3D&quot;$RUST_TARGET/$RUST_TARGET_SUBDIR&quot;<br=
>
&gt; + AC_SUBST([RUST_TARGET_SUBDIR])<br>
&gt; +<br>
&gt; + dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>
&gt; +--<br>
&gt; +2.20.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-reprod=
ucible-SRCDIR.patch b/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-re=
producible-SRCDIR.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 75fc7f9d0b9..00000000000<br>
&gt; --- a/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-reproducible-=
SRCDIR.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,30 +0,0 @@<br>
&gt; -From bea5156cd7e7122715b26c769c35928141a1da2c Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=
=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt; -Date: Mon, 18 Nov 2019 14:46:34 -0600<br>
&gt; -Subject: [PATCH] Remove non-reproducible SRCDIR<br>
&gt; -<br>
&gt; -Removes SRCDIR as the prefix for finding the test font. This wouldn&#=
39;t<br>
&gt; -work anyway, since that path is not present on the target.<br>
&gt; -<br>
&gt; -This patch is specific to OE, since it appears that this entire metho=
d<br>
&gt; -of testing was removed when upstream was re-written in rust<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [OE-specific, no longer present upstre=
am]<br>
&gt; -Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com=
" target=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - rsvg-cairo-draw.c | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/rsvg-cairo-draw.c b/rsvg-cairo-draw.c<br>
&gt; -index caa9104..cfb7ed2 100644<br>
&gt; ---- a/rsvg-cairo-draw.c<br>
&gt; -+++ b/rsvg-cairo-draw.c<br>
&gt; -@@ -398,7 +398,7 @@ set_font_options_for_testing (PangoContext *conte=
xt)<br>
&gt; - static void<br>
&gt; - create_font_config_for_testing (RsvgCairoRender *render)<br>
&gt; - {<br>
&gt; --=C2=A0 =C2=A0 const char *font_path =3D SRCDIR &quot;/tests/resource=
s/LiberationSans-Regular.ttf&quot;;<br>
&gt; -+=C2=A0 =C2=A0 const char *font_path =3D &quot;/tests/resources/Liber=
ationSans-Regular.ttf&quot;;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (render-&gt;font_config_for_testing !=3D NULL)=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-system-deps-src-l=
ib.rs-do-not-probe-into-harcoded-li.patch b/meta/recipes-gnome/librsvg/libr=
svg/0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..849dd98c5f0<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-gnome/librsvg/librsvg/0001-system-deps-src-lib.rs-d=
o-not-probe-into-harcoded-li.patch<br>
&gt; @@ -0,0 +1,53 @@<br>
&gt; +From 6d1f0740b111e86e99dcaf0222f3d1d67d3bf1e6 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" tar=
get=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; +Date: Tue, 21 Sep 2021 16:54:23 +0200<br>
&gt; +Subject: [PATCH] system-deps/src/<a href=3D"http://lib.rs" rel=3D"nor=
eferrer" target=3D"_blank">lib.rs</a>: do not probe into harcoded list of<b=
r>
&gt; + targets<br>
&gt; +<br>
&gt; +Oe-core defines custom targets, and this probe fails.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; +---<br>
&gt; + vendor/system-deps/.cargo-checksum.json |=C2=A0 2 +-<br>
&gt; + vendor/system-deps/src/<a href=3D"http://lib.rs" rel=3D"noreferrer" =
target=3D"_blank">lib.rs</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 +=
---------------<br>
&gt; + 2 files changed, 2 insertions(+), 16 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/vendor/system-deps/.cargo-checksum.json b/vendor/system-=
deps/.cargo-checksum.json<br>
&gt; +index ecebb94..30d594e 100644<br>
&gt; +--- a/vendor/system-deps/.cargo-checksum.json<br>
&gt; ++++ b/vendor/system-deps/.cargo-checksum.json<br>
&gt; +@@ -1 +1 @@<br>
&gt; +-{&quot;files&quot;:{&quot;Cargo.toml&quot;:&quot;56ab5070dc9019b039c=
5e9904bb466b0879c33a7f69dd030b97abab321b7cc04&quot;,&quot;LICENSE-APACHE&qu=
ot;:&quot;a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2&=
quot;,&quot;LICENSE-MIT&quot;:&quot;23f18e03dc49df91622fe2a76176497404e46ce=
d8a715d9d2b67a7446571cca3&quot;,&quot;README.md&quot;:&quot;3fe7396637bf923=
3908f41c6001cfcb00a379225e06e36e508c8b3d7264a8aae&quot;,&quot;src/<a href=
=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a>&quot;:&q=
uot;015518f4337d80249d12c7e6c55e9063705a0b8805ebf46a445c89253edc5de0&quot;,=
&quot;src/<a href=3D"http://metadata.rs" rel=3D"noreferrer" target=3D"_blan=
k">metadata.rs</a>&quot;:&quot;4c8d6ac2c88646a5b97ecb50ed44b65e5b2865cce689=
7add85b29ca2ae08c2bb&quot;,&quot;src/<a href=3D"http://test.rs" rel=3D"nore=
ferrer" target=3D"_blank">test.rs</a>&quot;:&quot;1ec48d1e443a0a4ac8035a2b6=
0ff0321543aa2fa998fee72cf7762a936bf5f8c&quot;,&quot;src/tests/testanotherli=
b.pc&quot;:&quot;bb4fd942324e6d49ce3becd827aa5c948d1924ca6681904a3695c19b14=
24eb3c&quot;,&quot;src/tests/testdata.pc&quot;:&quot;43f481e989c03674fed5ef=
78c6420b3f8d36a2ce001928d86c418d1844acd5e7&quot;,&quot;src/tests/testlib-2.=
0.pc&quot;:&quot;152eb0c70c14c3d948118408f3d1fd3bb7531b02aa792db85bd957f7db=
90b45b&quot;,&quot;src/tests/testlib-3.0.pc&quot;:&quot;cd39c2ef88f6828c929=
1150cc4b624e769abef484674eaebaa4f67979501315f&quot;,&quot;src/tests/testlib=
.pc&quot;:&quot;75c0d8a5345f65794f583c83e1cf0dbf3385af6e6abea1d61bb86eef707=
a52db&quot;,&quot;src/tests/toml-missing-file/no-cargo-toml-here&quot;:&quo=
t;6ab4da4b56f15315df6538610cfcd2ba3d0f9a7a8414678ff00ab5a78f7d41fa&quot;},&=
quot;package&quot;:&quot;480c269f870722b3b08d2f13053ce0c2ab722839f472863c3e=
2d61ff3a1c2fa6&quot;}<br>
&gt; +\ No newline at end of file<br>
&gt; ++{&quot;files&quot;:{&quot;Cargo.toml&quot;:&quot;56ab5070dc9019b039c=
5e9904bb466b0879c33a7f69dd030b97abab321b7cc04&quot;,&quot;LICENSE-APACHE&qu=
ot;:&quot;a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2&=
quot;,&quot;LICENSE-MIT&quot;:&quot;23f18e03dc49df91622fe2a76176497404e46ce=
d8a715d9d2b67a7446571cca3&quot;,&quot;README.md&quot;:&quot;3fe7396637bf923=
3908f41c6001cfcb00a379225e06e36e508c8b3d7264a8aae&quot;,&quot;src/<a href=
=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a>&quot;:&q=
uot;594e5f14180590adc9ea0a8ba1cc35f9a8a260322d08de3037efac3ce1dc729b&quot;,=
&quot;src/<a href=3D"http://metadata.rs" rel=3D"noreferrer" target=3D"_blan=
k">metadata.rs</a>&quot;:&quot;4c8d6ac2c88646a5b97ecb50ed44b65e5b2865cce689=
7add85b29ca2ae08c2bb&quot;,&quot;src/<a href=3D"http://test.rs" rel=3D"nore=
ferrer" target=3D"_blank">test.rs</a>&quot;:&quot;1ec48d1e443a0a4ac8035a2b6=
0ff0321543aa2fa998fee72cf7762a936bf5f8c&quot;,&quot;src/tests/testanotherli=
b.pc&quot;:&quot;bb4fd942324e6d49ce3becd827aa5c948d1924ca6681904a3695c19b14=
24eb3c&quot;,&quot;src/tests/testdata.pc&quot;:&quot;43f481e989c03674fed5ef=
78c6420b3f8d36a2ce001928d86c418d1844acd5e7&quot;,&quot;src/tests/testlib-2.=
0.pc&quot;:&quot;152eb0c70c14c3d948118408f3d1fd3bb7531b02aa792db85bd957f7db=
90b45b&quot;,&quot;src/tests/testlib-3.0.pc&quot;:&quot;cd39c2ef88f6828c929=
1150cc4b624e769abef484674eaebaa4f67979501315f&quot;,&quot;src/tests/testlib=
.pc&quot;:&quot;75c0d8a5345f65794f583c83e1cf0dbf3385af6e6abea1d61bb86eef707=
a52db&quot;,&quot;src/tests/toml-missing-file/no-cargo-toml-here&quot;:&quo=
t;6ab4da4b56f15315df6538610cfcd2ba3d0f9a7a8414678ff00ab5a78f7d41fa&quot;},&=
quot;package&quot;:&quot;480c269f870722b3b08d2f13053ce0c2ab722839f472863c3e=
2d61ff3a1c2fa6&quot;}<br>
&gt; +diff --git a/vendor/system-deps/src/<a href=3D"http://lib.rs" rel=3D"=
noreferrer" target=3D"_blank">lib.rs</a> b/vendor/system-deps/src/<a href=
=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a><br>
&gt; +index a0d4f00..a666817 100644<br>
&gt; +--- a/vendor/system-deps/src/<a href=3D"http://lib.rs" rel=3D"norefer=
rer" target=3D"_blank">lib.rs</a><br>
&gt; ++++ b/vendor/system-deps/src/<a href=3D"http://lib.rs" rel=3D"norefer=
rer" target=3D"_blank">lib.rs</a><br>
&gt; +@@ -725,21 +725,7 @@ impl Config {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fn check_cfg(&amp;self, cfg: &amp;cfg_expr::Expre=
ssion) -&gt; Result&lt;bool, Error&gt; {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 use cfg_expr::{targets::get_builtin_targ=
et_by_triple, Predicate};<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 let target =3D self<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .env<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .get(&quot;TARGET&quot;)<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .expect(&quot;no TARGET en=
v variable defined&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 let target =3D get_builtin_target_by_tri=
ple(&amp;target)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .unwrap_or_else(|| panic!(=
&quot;Invalid TARGET: {}&quot;, target));<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 let res =3D cfg.eval(|pred| match pred {=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Predicate::Target(tp) =3D&=
gt; Some(tp.matches(target)),<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _ =3D&gt; None,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 res.ok_or_else(|| Error::UnsupportedCfg(=
cfg.original().to_string()))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 Ok(true)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.20.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch b/met=
a/recipes-gnome/librsvg/librsvg/gtk-option.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 6c23071cd34..00000000000<br>
&gt; --- a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,60 +0,0 @@<br>
&gt; -From 4e0ce3f22d45033a108cbacca3e5ec6728bd44f3 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com" =
target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
&gt; -Date: Tue, 11 Aug 2015 16:25:38 +0300<br>
&gt; -Subject: [PATCH] configure: add option to enable/disable use of GTK+<=
br>
&gt; -<br>
&gt; -Distro packagers like predictability and automatically detected optio=
nal<br>
&gt; -dependencies are not predicable.=C2=A0 Add a --with-gtk3 option (defa=
ult to &quot;auto&quot;)<br>
&gt; -for forcibly controlling whether GTK+ will be used or not.<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://bugzilla.gnome.org/sho=
w_bug.cgi?id=3D712693" rel=3D"noreferrer" target=3D"_blank">https://bugzill=
a.gnome.org/show_bug.cgi?id=3D712693</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@in=
tel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
&gt; ----<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 17 +++++++++++------<br>
&gt; - 1 file changed, 11 insertions(+), 6 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index e61a952..c3aae84 100644<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -@@ -130,17 +130,22 @@ AC_CHECK_FUNCS(strtok_r)<br>
&gt; - # GTK<br>
&gt; - # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
&gt; -<br>
&gt; --PKG_CHECK_MODULES([GTK3],[gtk+-3.0 &gt;=3D $GTK3_REQUIRED],[have_gtk=
_3=3Dyes],[have_gtk_3=3Dno])<br>
&gt; --<br>
&gt; - GTK3_BINARY_VERSION=3D<br>
&gt; -<br>
&gt; --if test &quot;$have_gtk_3&quot; =3D &quot;yes&quot;; then<br>
&gt; --=C2=A0 =C2=A0 GTK3_BINARY_VERSION=3D&quot;`$PKG_CONFIG --variable=3D=
gtk_binary_version gtk+-3.0`&quot;<br>
&gt; -+AC_MSG_CHECKING([whether to use GTK+ 3])<br>
&gt; -+AC_ARG_WITH([gtk3],<br>
&gt; -+=C2=A0 [AS_HELP_STRING([--without-gtk3],[Don&#39;t build GTK+3 tools=
 (default=3Dauto)])],<br>
&gt; -+=C2=A0 [],[PKG_CHECK_EXISTS([gtk+-3.0 &gt;=3D $GTK3_REQUIRED],[with_=
gtk3=3Dyes],[with_gtk3=3Dno])])<br>
&gt; -+AC_MSG_RESULT([$with_gtk3])<br>
&gt; -+<br>
&gt; -+if test &quot;$with_gtk3&quot; =3D &quot;yes&quot;; then<br>
&gt; -+=C2=A0 PKG_CHECK_MODULES(GTK3, [gtk+-3.0 &gt;=3D $GTK3_REQUIRED])<br=
>
&gt; -+=C2=A0 GTK3_BINARY_VERSION=3D&quot;`$PKG_CONFIG --variable=3Dgtk_bin=
ary_version gtk+-3.0`&quot;<br>
&gt; - fi<br>
&gt; -<br>
&gt; - AC_SUBST([GTK3_BINARY_VERSION])<br>
&gt; -<br>
&gt; --AM_CONDITIONAL([HAVE_GTK_3],[test &quot;$have_gtk_3&quot; =3D &quot;=
yes&quot;])<br>
&gt; -+AM_CONDITIONAL([HAVE_GTK_3],[test &quot;$with_gtk3&quot; =3D &quot;y=
es&quot;])<br>
&gt; -<br>
&gt; - dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>
&gt; - dnl GDK-Pixbuf SVG loader<br>
&gt; -@@ -298,6 +303,6 @@ librsvg-$VERSION<br>
&gt; -=C2=A0 =C2=A0 =C2=A0Build introspectable bindings:=C2=A0 ${found_intr=
ospection}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0Build Vala bindings:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ${enable_vala}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0Build GdkPixbuf loader:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${enable_pixbuf_loader}<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 GTK+ $GTK3_REQUIRED or later:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${have_gtk_3}<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GTK+ $GTK3_REQUIRED or later:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${with_gtk_3}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0Build miscellaneous tools:=C2=A0 =C2=A0 =C2=A0 ${=
build_misc_tools}<br>
&gt; - &quot;<br>
&gt; ---<br>
&gt; -2.1.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.40=
.21.bb" rel=3D"noreferrer" target=3D"_blank">librsvg_2.40.21.bb</a> b/meta/=
recipes-gnome/librsvg/<a href=3D"http://librsvg_2.52.0.bb" rel=3D"noreferre=
r" target=3D"_blank">librsvg_2.52.0.bb</a><br>
&gt; similarity index 51%<br>
&gt; rename from meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.40.=
21.bb" rel=3D"noreferrer" target=3D"_blank">librsvg_2.40.21.bb</a><br>
&gt; rename to meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.52.0.=
bb" rel=3D"noreferrer" target=3D"_blank">librsvg_2.52.0.bb</a><br>
&gt; index 39b9aeca5d7..4e3febc6a2f 100644<br>
&gt; --- a/meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.40.21.bb"=
 rel=3D"noreferrer" target=3D"_blank">librsvg_2.40.21.bb</a><br>
&gt; +++ b/meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.52.0.bb" =
rel=3D"noreferrer" target=3D"_blank">librsvg_2.52.0.bb</a><br>
&gt; @@ -6,24 +6,44 @@ the screen or to generate output for printing.&quot;=
<br>
&gt;=C2=A0 =C2=A0HOMEPAGE =3D &quot;<a href=3D"https://gitlab.gnome.org/GNO=
ME/librsvg" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/G=
NOME/librsvg</a>&quot;<br>
&gt;=C2=A0 =C2=A0BUGTRACKER =3D &quot;<a href=3D"https://gitlab.gnome.org/G=
NOME/librsvg/issues" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gn=
ome.org/GNOME/librsvg/issues</a>&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -RECIPE_NO_UPDATE_REASON =3D &quot;Versions from 2.41.0 requires Rust =
compiler to build it&quot;<br>
&gt; -<br>
&gt; -LICENSE =3D &quot;LGPLv2+&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9ba36caa9b7=
df079bae19f \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://rsvg.h;beginline=3D3;endline=3D24;md5=3D20b4113c4909bbf0d67e0067783=
02bc6&quot;<br>
&gt; +LICENSE =3D &quot;LGPLv2.1+&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING.LIB;md5=3D4fbd65380cdd25595=
1079008b364516c \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SECTION =3D &quot;x11/utils&quot;<br>
&gt;=C2=A0 =C2=A0DEPENDS =3D &quot;cairo gdk-pixbuf glib-2.0 libcroco libxm=
l2 pango&quot;<br>
&gt;=C2=A0 =C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobjec=
t-introspection<br>
&gt; +inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobjec=
t-introspection rust<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -SRC_URI +=3D &quot;file://gtk-option.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Auto-detect-Bsy=
mbolic-fixes-configure-on-macOS.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Remove-non-repr=
oducible-SRCDIR.patch \<br>
&gt; +SRC_URI +=3D &quot; file://0001-Makefile.am-pass-rust-target-to-cargo=
-also-when-not-.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-system-de=
ps-src-lib.rs-do-not-probe-into-harcoded-li.patch \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -SRC_URI[archive.sha256sum] =3D &quot;f7628905f1cada84e87e2b14883ed57d=
8094dca3281d5bcb24ece4279e9a92ba&quot;<br>
&gt; +SRC_URI[archive.sha256sum] =3D &quot;bd821fb3e16494b61f5185addd23b726=
b064f203122b3ab4b3d5d7a44e6bf393&quot;<br>
&gt; +<br>
&gt; +# librsvg is still autotools-based, but is calling cargo from its aut=
omake-driven makefiles<br>
&gt; +# so we cannot use cargo class directly, but still need bits and piec=
es from it<br>
&gt; +# for cargo to be happy<br>
&gt; +BASEDEPENDS:append =3D &quot; cargo-native&quot;<br>
&gt; +<br>
&gt; +export RUST_BACKTRACE =3D &quot;full&quot;<br>
&gt; +export RUSTFLAGS<br>
&gt; +export RUST_TARGET_PATH<br>
&gt; +<br>
&gt; +export RUST_TARGET =3D &quot;${HOST_SYS}&quot;<br>
&gt; +<br>
&gt; +# rust-cross writes the target linker binary into target json definit=
ion without any flags.<br>
&gt; +# This breaks here because the linker isn&#39;t going to work without=
 at least knowing where<br>
&gt; +# the sysroot is. So copy the json to workdir, and patch in the path =
to wrapper from rust class<br>
&gt; +# which supplies the needed flags.<br>
&gt; +do_compile:prepend() {<br>
&gt; +=C2=A0 =C2=A0 cp ${STAGING_LIBDIR_NATIVE}/rustlib/${HOST_SYS}.json ${=
WORKDIR}<br>
&gt; +=C2=A0 =C2=A0 cp ${STAGING_LIBDIR_NATIVE}/rustlib/${BUILD_SYS}.json $=
{WORKDIR}<br>
&gt; +=C2=A0 =C2=A0 sed -ie &#39;s,&quot;linker&quot;: &quot;.*&quot;,&quot=
;linker&quot;: &quot;${RUST_TARGET_CC}&quot;,g&#39; ${WORKDIR}/${HOST_SYS}.=
json<br>
&gt; +=C2=A0 =C2=A0 RUST_TARGET_PATH=3D&quot;${WORKDIR}&quot;<br>
&gt; +=C2=A0 =C2=A0 export RUST_TARGET_PATH<br>
&gt; +}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Issue only on windows<br>
&gt;=C2=A0 =C2=A0CVE_CHECK_WHITELIST +=3D &quot;CVE-2018-1000041&quot;<br>
&gt; @@ -33,8 +53,6 @@ CACHED_CONFIGUREVARS =3D &quot;ac_cv_path_GDK_PIXBUF=
_QUERYLOADERS=3D${STAGING_LIBDIR_NATI<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG ??=3D &quot;gdkpixbuf&quot;<br>
&gt;=C2=A0 =C2=A0# The gdk-pixbuf loader<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[gdkpixbuf] =3D &quot;--enable-pixbuf-loader,=
--disable-pixbuf-loader,gdk-pixbuf-native&quot;<br>
&gt; -# GTK+ test application (rsvg-view)<br>
&gt; -PACKAGECONFIG[gtk] =3D &quot;--with-gtk3,--without-gtk3,gtk+3&quot;<b=
r>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0do_install:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Loadable modules don&#39;t need .a or .la =
on Linux<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156374): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156374" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156374</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85776774/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/85776774/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d14f9a05ccf65900--

