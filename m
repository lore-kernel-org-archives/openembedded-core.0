Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB62EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 19:05:05 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.4265.1689707105031722380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 12:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ba45Jx+N;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-783698a37beso352402639f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 12:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689707104; x=1692299104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0dynG2NuDmZjUllQSBj2vJzYh8Hl4GnlF2Dfk8HK/U=;
        b=Ba45Jx+Nijx3CGz6g+50PFgzaGc4LoZu48tL27B5FV79mLxh0Za8NnOvFd35LO2TBj
         dErkdOY7HKjnXWnGd97uH8ste/1xYqgDNKx57i6pB7NMPTR4vN1geiU2D8qJuDbfw4Is
         tM9mn0b+PgeoRT1tOuv2XCTW+mfgAcT474OlKdZxo1Uso/ZtU7NWANgo2dGYEpCEs7GM
         wuM0WOKNEhTGfJj1yj3wTRKEIlo7zAJeAOfJvMfB91wEvOTIWcw3UCMyAAgcWPaUlLGo
         4Ua4AD7BAKkCk2g4StFT5Dk/Z/3y/8C049r81NML7oMgz+qwLfCFRGE/jpfG2BKyW0/K
         BR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689707104; x=1692299104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0dynG2NuDmZjUllQSBj2vJzYh8Hl4GnlF2Dfk8HK/U=;
        b=ksWCzDGfh22tEt/r4tQ3ib23BVTIYjw31Y2E6U/SaVfmSVfnjzhR/a5abU+xvXYzHk
         FOKvfd34RjTH3CEboZ9dbbq6SBlssL5u/Ch+b3Aqy4b5SK1dS1O8960vOZvkLRDztJ7V
         Rmp4byQJPwXtvTuj6+9OBPrMkYKBaRDpsmcoGPUl6c08Dt21IHJjV8mdP2kN6VV/cRAW
         mA/1lg8C829X5eeuCxNAvTF28CODzG7zgtRHL3y+/ILA+QKDzHhktF6AYl4izsU4zD96
         EdTmyEJxYlPQX5JSeT9Nvz0exbuv4313qXo4o4Mm8v+SuZR0BcY00xvMS84oo+aMg5eY
         Da5g==
X-Gm-Message-State: ABy/qLaZiDqBKFc/qeQFyp9F4gNLBY95XbIsQOrEwY0RjEcj2WTJVVE6
	2bMrbYiBRLU8O0lWoG6kT9BpTilH9rNhLc+FD+aiHONq
X-Google-Smtp-Source: APBJJlGe2Ry/o+c9Xceop+vuZh6SpEwUVqMe8s21tH25nf5mcyWp8MOhnMR3NfB0hXtxQxaNjiE8HV6HxWekjc4rYPw=
X-Received: by 2002:a6b:f207:0:b0:780:bb63:1869 with SMTP id
 q7-20020a6bf207000000b00780bb631869mr3995780ioh.13.1689707102867; Tue, 18 Jul
 2023 12:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230714132205.8261-1-alex.kiernan@gmail.com> <202307181402337a61b976@mail.local>
In-Reply-To: <202307181402337a61b976@mail.local>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 18 Jul 2023 20:04:48 +0100
Message-ID: <CAO5Uq5T-gJq1hadkx=a_TR897tLCyXuaiqjiYa-85gDrL-fLMg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.70.0 -> 1.71.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 19:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184557

Thanks... serves me right for not checking musl builds. Though at
least it wasn't the failure I suspected might be coming (the
oe-selftest changes I expected would have broken it completely).

On Tue, Jul 18, 2023 at 3:02=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> This fails to build with musl:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7462/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7483/st=
eps/12/logs/stdio
>
> On 14/07/2023 14:22:05+0100, Alex Kiernan wrote:
> > Switch libstd-rs to use the dummy `sysroot` crate which represents the
> > standard library crates. Drop getrandom-open64.patch (merged upstream).
> >
> > https://blog.rust-lang.org/2023/07/13/Rust-1.71.0.html
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  meta/conf/distro/include/tcmode-default.inc   |  2 +-
> >  .../rust/{cargo_1.70.0.bb =3D> cargo_1.71.0.bb} |  0
> >  ...-Do-not-use-LFS64-on-linux-with-musl.patch | 26 ++++----
> >  ...efine-SOCK_SEQPACKET-in-common-place.patch | 56 ++++++++--------
> >  .../rust/files/getrandom-open64.patch         | 46 -------------
> >  .../rust/files/zlib-off64_t.patch             | 16 +++--
> >  ...ibstd-rs_1.70.0.bb =3D> libstd-rs_1.71.0.bb} |  9 +--
> >  ....70.0.bb =3D> rust-cross-canadian_1.71.0.bb} |  0
> >  ...ust-llvm_1.70.0.bb =3D> rust-llvm_1.71.0.bb} |  0
> >  meta/recipes-devtools/rust/rust-snapshot.inc  | 66 +++++++++----------
> >  meta/recipes-devtools/rust/rust-source.inc    |  3 +-
> >  .../rust/{rust_1.70.0.bb =3D> rust_1.71.0.bb}   |  0
> >  12 files changed, 91 insertions(+), 133 deletions(-)
> >  rename meta/recipes-devtools/rust/{cargo_1.70.0.bb =3D> cargo_1.71.0.b=
b} (100%)
> >  delete mode 100644 meta/recipes-devtools/rust/files/getrandom-open64.p=
atch
> >  rename meta/recipes-devtools/rust/{libstd-rs_1.70.0.bb =3D> libstd-rs_=
1.71.0.bb} (87%)
> >  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.70.0.bb =3D> =
rust-cross-canadian_1.71.0.bb} (100%)
> >  rename meta/recipes-devtools/rust/{rust-llvm_1.70.0.bb =3D> rust-llvm_=
1.71.0.bb} (100%)
> >  rename meta/recipes-devtools/rust/{rust_1.70.0.bb =3D> rust_1.71.0.bb}=
 (100%)
> >
> > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/di=
stro/include/tcmode-default.inc
> > index 18daf446e51a..25b3e0ee63ff 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -25,7 +25,7 @@ LINUXLIBCVERSION ?=3D "6.4%"
> >  QEMUVERSION ?=3D "8.0%"
> >  GOVERSION ?=3D "1.20%"
> >  LLVMVERSION ?=3D "16.%"
> > -RUSTVERSION ?=3D "1.70%"
> > +RUSTVERSION ?=3D "1.71%"
> >
> >  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
> >  PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
> > diff --git a/meta/recipes-devtools/rust/cargo_1.70.0.bb b/meta/recipes-=
devtools/rust/cargo_1.71.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/cargo_1.70.0.bb
> > rename to meta/recipes-devtools/rust/cargo_1.71.0.bb
> > diff --git a/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-=
linux-with-musl.patch b/meta/recipes-devtools/rust/files/0001-Do-not-use-LF=
S64-on-linux-with-musl.patch
> > index 7f8d62a25651..37cfe42df6f1 100644
> > --- a/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-w=
ith-musl.patch
> > +++ b/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-w=
ith-musl.patch
> > @@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   library/std/src/sys/unix/fs.rs | 27 ++++++++++++++++++++-------
> >   3 files changed, 38 insertions(+), 12 deletions(-)
> >
> > -Index: rustc-1.70.0-src/library/std/src/os/linux/fs.rs
> > +Index: rustc-1.71.0-src/library/std/src/os/linux/fs.rs
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- rustc-1.70.0-src.orig/library/std/src/os/linux/fs.rs
> > -+++ rustc-1.70.0-src/library/std/src/os/linux/fs.rs
> > +--- rustc-1.71.0-src.orig/library/std/src/os/linux/fs.rs
> > ++++ rustc-1.71.0-src/library/std/src/os/linux/fs.rs
> >  @@ -329,7 +329,14 @@ pub trait MetadataExt {
> >   impl MetadataExt for Metadata {
> >       #[allow(deprecated)]
> > @@ -39,11 +39,11 @@ Index: rustc-1.70.0-src/library/std/src/os/linux/fs=
.rs
> >       }
> >       fn st_dev(&self) -> u64 {
> >           self.as_inner().as_inner().st_dev as u64
> > -Index: rustc-1.70.0-src/library/std/src/sys/unix/fd.rs
> > +Index: rustc-1.71.0-src/library/std/src/sys/unix/fd.rs
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- rustc-1.70.0-src.orig/library/std/src/sys/unix/fd.rs
> > -+++ rustc-1.70.0-src/library/std/src/sys/unix/fd.rs
> > -@@ -121,9 +121,12 @@ impl FileDesc {
> > +--- rustc-1.71.0-src.orig/library/std/src/sys/unix/fd.rs
> > ++++ rustc-1.71.0-src/library/std/src/sys/unix/fd.rs
> > +@@ -122,9 +122,12 @@ impl FileDesc {
> >       }
> >
> >       pub fn read_at(&self, buf: &mut [u8], offset: u64) -> io::Result<=
usize> {
> > @@ -58,7 +58,7 @@ Index: rustc-1.70.0-src/library/std/src/sys/unix/fd.r=
s
> >           use libc::pread64;
> >
> >           unsafe {
> > -@@ -276,9 +279,12 @@ impl FileDesc {
> > +@@ -277,9 +280,12 @@ impl FileDesc {
> >       }
> >
> >       pub fn write_at(&self, buf: &[u8], offset: u64) -> io::Result<usi=
ze> {
> > @@ -73,10 +73,10 @@ Index: rustc-1.70.0-src/library/std/src/sys/unix/fd=
.rs
> >           use libc::pwrite64;
> >
> >           unsafe {
> > -Index: rustc-1.70.0-src/library/std/src/sys/unix/fs.rs
> > +Index: rustc-1.71.0-src/library/std/src/sys/unix/fs.rs
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- rustc-1.70.0-src.orig/library/std/src/sys/unix/fs.rs
> > -+++ rustc-1.70.0-src/library/std/src/sys/unix/fs.rs
> > +--- rustc-1.71.0-src.orig/library/std/src/sys/unix/fs.rs
> > ++++ rustc-1.71.0-src/library/std/src/sys/unix/fs.rs
> >  @@ -47,9 +47,13 @@ use libc::{c_int, mode_t};
> >       all(target_os =3D "linux", target_env =3D "gnu")
> >   ))]
> > @@ -144,7 +144,7 @@ Index: rustc-1.70.0-src/library/std/src/sys/unix/fs=
.rs
> >       target_os =3D "android",
> >       target_os =3D "linux",
> >       target_os =3D "solaris",
> > -@@ -787,7 +800,7 @@ impl DirEntry {
> > +@@ -805,7 +818,7 @@ impl DirEntry {
> >       }
> >
> >       #[cfg(all(
> > @@ -153,7 +153,7 @@ Index: rustc-1.70.0-src/library/std/src/sys/unix/fs=
.rs
> >           not(miri)
> >       ))]
> >       pub fn metadata(&self) -> io::Result<FileAttr> {
> > -@@ -811,7 +824,7 @@ impl DirEntry {
> > +@@ -829,7 +842,7 @@ impl DirEntry {
> >       }
> >
> >       #[cfg(any(
> > diff --git a/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQ=
PACKET-in-common-place.patch b/meta/recipes-devtools/rust/files/0001-musl-D=
efine-SOCK_SEQPACKET-in-common-place.patch
> > index 8723f552b631..c3aba98db45d 100644
> > --- a/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACKET-=
in-common-place.patch
> > +++ b/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACKET-=
in-common-place.patch
> > @@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   vendor/libc/src/unix/linux_like/linux/musl/mod.rs          | 1 +
> >   7 files changed, 2 insertions(+), 7 deletions(-)
> >
> > -Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32=
/arm/mod.rs
> > +Index: rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32=
/arm/mod.rs
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b=
32/arm/mod.rs
> > -+++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/ar=
m/mod.rs
> > +--- rustc-1.71.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b=
32/arm/mod.rs
> > ++++ rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/ar=
m/mod.rs
> >  @@ -326,7 +326,6 @@ pub const MAP_SYNC: ::c_int =3D 0x080000;
> >
> >   pub const SOCK_STREAM: ::c_int =3D 1;
> > @@ -31,10 +31,10 @@ Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_=
like/linux/musl/b32/arm/mod.r
> >
> >   pub const EDEADLK: ::c_int =3D 35;
> >   pub const ENAMETOOLONG: ::c_int =3D 36;
> > -Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32=
/hexagon.rs
> > +Index: rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32=
/hexagon.rs
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b=
32/hexagon.rs
> > -+++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/he=
xagon.rs
> > +--- rustc-1.71.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b=
32/hexagon.rs
> > ++++ rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/he=
xagon.rs
> >  @@ -296,7 +296,6 @@ pub const SIG_BLOCK: ::c_int =3D 0x000000;
> >   pub const SIG_UNBLOCK: ::c_int =3D 0x01;
> >   pub const SOCK_DGRAM: ::c_int =3D 2;
> > @@ -43,11 +43,11 @@ Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_=
like/linux/musl/b32/hexagon.r
> >   pub const SOCK_STREAM: ::c_int =3D 1;
> >   pub const SOL_CAIF: ::c_int =3D 278;
> >   pub const SOL_IUCV: ::c_int =3D 277;
> > -Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32=
/mips/mod.rs
> > +Index: rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32=
/mips/mod.rs
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b=
32/mips/mod.rs
> > -+++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mi=
ps/mod.rs
> > -@@ -350,7 +350,6 @@ pub const ERFKILL: ::c_int =3D 167;
> > +--- rustc-1.71.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b=
32/mips/mod.rs
> > ++++ rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mi=
ps/mod.rs
> > +@@ -351,7 +351,6 @@ pub const ERFKILL: ::c_int =3D 167;
> >
> >   pub const SOCK_STREAM: ::c_int =3D 2;
> >   pub const SOCK_DGRAM: ::c_int =3D 1;
> > @@ -55,11 +55,11 @@ Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_=
like/linux/musl/b32/mips/mod.
> >
> >   pub const SA_ONSTACK: ::c_int =3D 0x08000000;
> >   pub const SA_SIGINFO: ::c_int =3D 8;
> > -Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32=
/powerpc.rs
> > +Index: rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32=
/powerpc.rs
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b=
32/powerpc.rs
> > -+++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/po=
werpc.rs
> > -@@ -257,7 +257,6 @@ pub const MAP_STACK: ::c_int =3D 0x020000;
> > +--- rustc-1.71.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b=
32/powerpc.rs
> > ++++ rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/po=
werpc.rs
> > +@@ -259,7 +259,6 @@ pub const MAP_SYNC: ::c_int =3D 0x080000;
> >
> >   pub const SOCK_STREAM: ::c_int =3D 1;
> >   pub const SOCK_DGRAM: ::c_int =3D 2;
> > @@ -67,10 +67,10 @@ Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_=
like/linux/musl/b32/powerpc.r
> >
> >   pub const EDEADLK: ::c_int =3D 35;
> >   pub const ENAMETOOLONG: ::c_int =3D 36;
> > -Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32=
/x86/mod.rs
> > +Index: rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32=
/x86/mod.rs
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b=
32/x86/mod.rs
> > -+++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x8=
6/mod.rs
> > +--- rustc-1.71.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b=
32/x86/mod.rs
> > ++++ rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x8=
6/mod.rs
> >  @@ -315,7 +315,6 @@ pub const MAP_SYNC: ::c_int =3D 0x080000;
> >
> >   pub const SOCK_STREAM: ::c_int =3D 1;
> > @@ -79,10 +79,10 @@ Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_=
like/linux/musl/b32/x86/mod.r
> >
> >   pub const EDEADLK: ::c_int =3D 35;
> >   pub const ENAMETOOLONG: ::c_int =3D 36;
> > -Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64=
/mod.rs
> > +Index: rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64=
/mod.rs
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b=
64/mod.rs
> > -+++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mo=
d.rs
> > +--- rustc-1.71.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b=
64/mod.rs
> > ++++ rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mo=
d.rs
> >  @@ -136,8 +136,6 @@ pub const __SIZEOF_PTHREAD_BARRIER_T: us
> >
> >   pub const SOCK_NONBLOCK: ::c_int =3D 2048;
> > @@ -92,10 +92,10 @@ Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_=
like/linux/musl/b64/mod.rs
> >   extern "C" {
> >       pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c=
_uint) -> ::ssize_t;
> >   }
> > -Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod=
.rs
> > +Index: rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod=
.rs
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/m=
od.rs
> > -+++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
> > +--- rustc-1.71.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/m=
od.rs
> > ++++ rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
> >  @@ -535,6 +535,7 @@ pub const POSIX_MADV_DONTNEED: ::c_int =3D
> >
> >   pub const MAP_ANONYMOUS: ::c_int =3D MAP_ANON;
> > @@ -104,11 +104,11 @@ Index: rustc-1.70.0-src/vendor/libc/src/unix/linu=
x_like/linux/musl/mod.rs
> >   pub const SOCK_DCCP: ::c_int =3D 6;
> >   pub const SOCK_PACKET: ::c_int =3D 10;
> >
> > -Index: rustc-1.70.0-src/vendor/libc/.cargo-checksum.json
> > +Index: rustc-1.71.0-src/vendor/libc/.cargo-checksum.json
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- rustc-1.70.0-src.orig/vendor/libc/.cargo-checksum.json
> > -+++ rustc-1.70.0-src/vendor/libc/.cargo-checksum.json
> > +--- rustc-1.71.0-src.orig/vendor/libc/.cargo-checksum.json
> > ++++ rustc-1.71.0-src/vendor/libc/.cargo-checksum.json
> >  @@ -1 +1 @@
> > --{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5b=
a7fb3e6cadfc08dac4c7b0ce","Cargo.toml":"96bf2f6d97a370699fa12dba540978a01b5=
cd84dd72fe6cff8a7700744e8122e","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca5=
2d0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a89=
32dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a=
2b4f1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"104ceb079ec13=
f06d440a348a07974ff5a18dca1f74b9c2fde7be9e3074c25e7","rustfmt.toml":"eaa2ea=
84fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_widt=
h_ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0c=
a","src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42=
da99e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e=
60f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"68d860865d8ccc6c49=
3948c781105e0901fc3312cfa1337f0092c0668706200a","src/fuchsia/no_align.rs":"=
303f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuch=
sia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec585225=
5ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefe=
ed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bf=
a8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15=
c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"24111461547=
739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/macros.rs":"b45=
7eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088","src/psp.rs"=
:"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sg=
x.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","s=
rc/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37=
a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb4=
8d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e4c23ab9737e12=
856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3de45a79287899=
26e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.rs":"55a5280c0=
e5498c1632b2772a7846bce0a130dde61a7fd59220d7971f9084b56","src/unix/aix/powe=
rpc64.rs":"8c471cf7e4604da9f640db1be68d918303b326744e36e6ee159114040401d2cf=
","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4cee=
ec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c=
9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"25=
46ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72","src/unix/b=
sd/apple/b64/aarch64/align.rs":"e8eb38d064b5fefec6f37d42873820a0483e7c758ed=
336cc59a7155455ca89c9","src/unix/bsd/apple/b64/aarch64/mod.rs":"44c217a4f26=
3afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/unix/bsd/apple/=
b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0=
e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aac=
a0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec8=
33a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bs=
d/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a175879a0245342=
b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19b812e6d093c81=
9dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/apple/mod.rs":"=
52b90d584e771447c3608079681adbb32367267021d12f5eb5940b7646f16f4a","src/unix=
/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c=
3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"8=
986a8c79bcadfbdb58ec1a72e1aff8ce9b341c9392d7b0b7449bddf6db59058","src/unix/=
bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749b57602fc34a4e=
4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6=
a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd=
/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c93=
0da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/freebsd11/=
mod.rs":"fa83dcd4597c6621b95228d80ea6250c37136463300f80a9961a09bdab5e25c3",=
"src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106=
b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freeb=
sd/freebsd12/mod.rs":"c7c574d65a8408f6eee32bd5d0cc40e33e41c7e61d98d338609ae=
5beec72f390","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.rs":"2df36a=
7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/f=
reebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f=
25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd13/mo=
d.rs":"834ec71df759e8d38489986b7720f1b296ca774c23c8034e2d9b02b9f55ab781","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122f6d6e5753c=
fb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/free=
bsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2=
afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs":"58b77661=
36a22ace828c974f34240eb38feec2c8aa2ee8b6ca38e3b44a6fa348","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f=
6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/mod.rs":"cb=
fb50eeca94674f3e51992ab41cb020127d9405002eacf4b8bf7b2a0418f2ea","src/unix/b=
sd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a3=
1747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powerpc64.rs":=
"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src/uni=
x/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba3395941c7fa6b11e089=
551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebsd/x86.rs":"c5=
005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","src/unix/b=
sd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3d446fe=
fbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86_64/mo=
d.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e47d7803eb","s=
rc/unix/bsd/freebsdlike/mod.rs":"f5ebb2f36dffd9c897b18b168cf28fbff9cc68983a=
e2d4910cb1ba9764693381","src/unix/bsd/mod.rs":"0c672b075b5616fca2cc56c00ee3=
1c3f554dcbd2e88a7c2ba1437aa6e5604319","src/unix/bsd/netbsdlike/mod.rs":"0a6=
6f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537","src/unix/bs=
d/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4cb4f053e042=
49cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"58cdbb70b0=
d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix/bsd/netbs=
dlike/netbsd/mod.rs":"4493317993af390d8aafc2cb7ace4c349dfc9d2451fd666844f04=
a4fa1f47442","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0ed22f5=
31237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/netbsdlike/n=
etbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152=
b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d1a34d1=
6fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlike/netbsd/x=
86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d51ebca9f30=
","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7ecaf6e2de25ada=
dee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlike/openbsd/arm=
.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729ad307","sr=
c/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9d4065da8b05d1=
24e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/openbsd/mod.rs":"=
c0f06c4af4dd3169b8bcd13a2fb7be6ac9dfa901e11bfd22058fff2aa6caed2e","src/unix=
/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d982181b7bdabfa0=
66cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/powerpc64.rs":=
"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/uni=
x/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05=
c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"=
d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix=
/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef853=
47d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"d31db3=
1630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/unix/haiku=
/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95dced11f54d87b"=
,"src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353f57056197b563=
bf4681f91ff7985","src/unix/haiku/mod.rs":"0b5a77da05582896e680e236ddd3d813a=
7b8a2ecfde21c1b72ec17883e2de6a7","src/unix/haiku/native.rs":"dbfcbf4954a79d=
1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/haiku/x86_64.=
rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src=
/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9deb=
b3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0d9b8529a84b58=
82fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":"ab832b7524e5=
fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/linux_like/=
android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35f06ad8653ee90=
72c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e0375119bf06a308=
1652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_like/android/b=
32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c58153=
20c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107efbcd37b5b85df=
a18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_like/android/=
b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e5=
05cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.rs":"1735f6f5=
c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_l=
ike/android/b64/aarch64/mod.rs":"171f8c37a2d2e45065bd3547dfcec70b02aa3da34c=
d99d259d150c753f620846","src/unix/linux_like/android/b64/mod.rs":"71e4fcbe9=
52bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/unix/linux_li=
ke/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf071a6832b516445=
e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/riscv64/mod.rs":"=
19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e49d","src/unix=
/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8=
bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64/x86_64/mo=
d.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d921e9b314d1","s=
rc/unix/linux_like/android/mod.rs":"21b1b70c1d398bd342794376b41975bfe3daf75=
127c7a11d825cc4b839811153","src/unix/linux_like/emscripten/align.rs":"86c95=
cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/linu=
x_like/emscripten/mod.rs":"712c52856ee323b8057b9452e4ab484a0e652581a530b67c=
3db25e819919d718","src/unix/linux_like/emscripten/no_align.rs":"0128e4aa721=
a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/linux_like=
/linux/align.rs":"28b2cd7c3eddc53c247aa11340da205d1d2e478f199493d330c61e75e=
c16ee96","src/unix/linux_like/linux/arch/generic/mod.rs":"249387e62ce11dfe5=
a93652699df6e5d8d29311d70d7a0e58fc1298a2ac8d750","src/unix/linux_like/linux=
/arch/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8f1a43adc42=
77e142460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c6c7f150068=
2b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/linux/arch/=
powerpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef02206a912c=
41b815","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec0440f1dd8f8e6=
12028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_like/linux/gn=
u/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f9=
36","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93f7ae99fd71=
4b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like/linux/gnu=
/b32/arm/mod.rs":"45be81a806c55fed92c20a33c5e4cfb23b3933f7b4feff47db33d37dd=
a34e6d3","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa92f77a9232c=
035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linux_like/lin=
ux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717c4077b8eed72a7f11e3b=
8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"429fb5e0=
05cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_l=
ike/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3c43502c87143332df=
9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/mod.rs":"caade9dc=
8b7179711102da342819bdf330c42c796b4587d0ed419550dab2e9ad","src/unix/linux_l=
ike/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe7a3fb02f053b2dc78=
2241a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/riscv32/align.rs":=
"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119","src/uni=
x/linux_like/linux/gnu/b32/riscv32/mod.rs":"ca8bc84fff8c65ecda6c03421f4fe76=
89f199dce39f1ca382a45bf0b13a1cb00","src/unix/linux_like/linux/gnu/b32/sparc=
/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d4=
1","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894eece66e9348f45d1b=
07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linux_like/linux/gnu/=
b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc4716=
2e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"c703cc5e9de2dc31d=
9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix/linux_like/linux=
/gnu/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542bca34ac566eac9a956=
62076d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf=
4611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/l=
inux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724=
d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch=
64/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e531750=
72","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"d7be998105fc2f6248b=
7fdfcedb5a0519122d28625fcfd5dccf72617fb30c45e","src/unix/linux_like/linux/g=
nu/b64/loongarch64/align.rs":"6616c38bf8cab53034dce9f968adae8fb7771334445a9=
3876d000cfd08f117a8","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs"=
:"9c39dfc3843e72bd8dba21aa5ef2795411cd8a0004a0cfe79c9b9f89ab92eb55","src/un=
ix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fd=
a5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mip=
s64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96=
eb","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a8852757b31a542e=
a73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux/gnu/b64/p=
owerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f=
1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f0=
6c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_lik=
e/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e588=
03f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs=
":"88bde5520c86793f2cf97062d66c1b3f4dd66206c453a601ebf9110d90abc6f8","src/u=
nix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a993=
2c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/a=
lign.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9"=
,"src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e015=
1a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/=
b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b057=
8bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d337=
14b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like=
/linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f=
190f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs"=
:"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/un=
ix/linux_like/linux/gnu/mod.rs":"daf0eff7fddf6d7a2c15a5bc89e3a0dfe463a40f38=
880fe3fb444105d0ae0f07","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223=
135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux=
_like/linux/mod.rs":"f305c518fc8ef7e151b22a93d23ad304d1302e71ae7082b0c3676d=
5409ad6646","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c104=
3764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/=
linux/musl/b32/arm/mod.rs":"f5b217a93f99c2852f7fd1459f529798372fa7df84ee0cf=
d3d8cdd5b2021b8cf","src/unix/linux_like/linux/musl/b32/hexagon.rs":"226a8b6=
4ce9c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e","src/unix/linux_=
like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d36068=
5b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs"=
:"16a7a03d998a5db11be9ee81525c7faec4623383260e8bc125b1c53a050fde75","src/un=
ix/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fa=
bbc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs=
":"dc52adc264c34bce80753d6bd064e8fc4b8237fa1e5c5315ccb6c72df74c2813","src/u=
nix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c754790335=
9a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32=
/riscv32/mod.rs":"b857ccbc8f0fbc8a6a5959f3496a4fd5a9a1dd986c15c8e716f3e2902=
c25181c","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7d=
ec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/lin=
ux/musl/b32/x86/mod.rs":"7a1586f77bb693f0b319ec720c35963da056287fc42f8e2ccf=
1d5b2bcccf4fd6","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba3=
2725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/lin=
ux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d=
9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch=
64/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc=
2","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e295=
1e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b=
64/mod.rs":"884243eb5af7df963d858d5baf47e622b45f04e0ae701728b134e986191b614=
b","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"455dc0ffa55afc1db6ffa=
f461f6f2a7b49d31658bfebe0bb4efac5967a6f956c","src/unix/linux_like/linux/mus=
l/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd375=
43efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"42d4b6=
d36807f37759094a732a321080cccdf498b174d632cebba147051de294","src/unix/linux=
_like/linux/musl/b64/s390x.rs":"d8a4fdfea0960ec284cae4facb8b0fb342e8aa41544=
cffacdcaf08c5a92a43f8","src/unix/linux_like/linux/musl/b64/x86_64/align.rs"=
:"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/un=
ix/linux_like/linux/musl/b64/x86_64/mod.rs":"7a877cd23b64be66d28e6b8dddae32=
d59a88d69115637539daf19381f4e39330","src/unix/linux_like/linux/musl/mod.rs"=
:"8965596cc33a032f7495c74d0d25ff9169e425491b36c4563b291e9f12e2a1b6","src/un=
ix/linux_like/linux/no_align.rs":"1a754a4af299894a79835aa092d8322d301179e2b=
20609defd6bb4bc880e6b4a","src/unix/linux_like/linux/non_exhaustive.rs":"181=
a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/unix/li=
nux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6=
bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4=
a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/l=
inux_like/linux/uclibc/arm/mod.rs":"50288ff9e411ab0966da24838f2c2a5618021bc=
19c422a04f577b2979ef4081e","src/unix/linux_like/linux/uclibc/arm/no_align.r=
s":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/=
unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34=
cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclib=
c/mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f516c706cdccc9f7be2f0921b2207=
b0afdb66fe81","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9=
cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/=
linux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea=
3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mip=
s/mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467a34d955f7653c2c8ce1e6147dae=
b53f1e0","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e3=
875698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux=
_like/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1ad57305642e8ad05ca0f0c7e4753=
267a2e2d6b4fee5db3b072","src/unix/linux_like/linux/uclibc/mod.rs":"1c3d25cd=
dcfefa2bd17bdc81550826be31a08eef235e13f825f169a5029c8bca","src/unix/linux_l=
ike/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b5=
18cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"02=
4eba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/l=
inux_like/linux/uclibc/x86_64/mod.rs":"196d03affbefb85716937c15904831e731eb=
222ee906e05e42102d639a8152ea","src/unix/linux_like/linux/uclibc/x86_64/othe=
r.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","s=
rc/unix/linux_like/mod.rs":"adfa87d7f8790795f22576ab9b7064f7d0085b539d24d82=
23275e66edbab320d","src/unix/mod.rs":"362da723eaad726ae72664d801315f4cf70a0=
42250de1231761bfd12390e27b8","src/unix/newlib/aarch64/mod.rs":"bac93836a9a5=
7b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/newlib/alig=
n.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","s=
rc/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3fa0015983b4=
b4fa27b233732b526","src/unix/newlib/espidf/mod.rs":"816f235f4aa4baabba7f260=
6b31d0fdb03988c52194c966728de8690bf17299d","src/unix/newlib/generic.rs":"ea=
b066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","src/unix/n=
ewlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd0f5be96d40=
fe4c996f3ca1","src/unix/newlib/mod.rs":"fcf8b307933cba5e9c485537499386326d6=
65fe83b6fcfb9e9e1837f73332668","src/unix/newlib/no_align.rs":"e0743b2179495=
a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/power=
pc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f831be393b6=
7","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d9518=
55e382d22de78e53","src/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c2384=
99ee3e8da5bd2baa614d9c7dd414851555","src/unix/nto/mod.rs":"44b74cd89794aecd=
7db67aad1c4114273f70be8d2e4633e3965f144fe53a7b88","src/unix/nto/neutrino.rs=
":"62198d95ccc0fe7ece6f9d5c0b29fc22303ef458886efb5e09aad524eca2ab7b","src/u=
nix/nto/x86_64.rs":"a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84c=
fb040bc8e","src/unix/redox/mod.rs":"c8afea39f81e73ad4e9bf8a8f25138a200e6160=
48e189debad80a6b7e08f710f","src/unix/solarish/compat.rs":"00f1ee3faec9da692=
04e42f025f6735dd13d894071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos=
.rs":"cd93c2d84722bbf9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","sr=
c/unix/solarish/mod.rs":"6442ed05eb390d44a03daa9800af1030f2ee3e61db98675262=
c227b28de51937","src/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640=
f92be53be0b0d976021cdc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806d=
f0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/unix/solaris=
h/x86_64.rs":"ec2b01f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef=
5fc","src/unix/solarish/x86_common.rs":"ac869d9c3c95645c22460468391eb198202=
3c3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557=
e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb79=
68ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/m=
od.rs":"ff063860fc4fe3bca6332742764e29c1506884added21aa7722144c1fb3f4018","=
src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef70847=
77cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed673=
7585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b2=
3889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"01=
8d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.r=
s":"09ee3b3348b212b050f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/=
windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b450=
2afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585=
c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"5421b92f47cb69845f4323=
b1a14e533d8a17acc6412c58e67f4d41def749de2f","src/windows/msvc/mod.rs":"c068=
271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs"=
:"eb0675f25ba01f73072d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/=
const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f=
1f4"},"package":"99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed60=
95f80c"}
> > +-{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5b=
a7fb3e6cadfc08dac4c7b0ce","Cargo.toml":"bcbcb2d5d0952786b470930f12a959168ba=
4b5e5a0c5185beb032c8ea20a719b","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca5=
2d0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a89=
32dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a=
2b4f1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"5bd78d7e4e79b=
183fb1dab92cd640a611330131d54c479c69adbe87cbdc95ae3","rustfmt.toml":"eaa2ea=
84fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_widt=
h_ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0c=
a","src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada=
97075f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e=
60f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d6=
1896696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"=
303f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuch=
sia/riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811=
293b11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e=
0f38d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083=
d0f368ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d=
4be8020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":=
"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib=
.rs":"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","sr=
c/macros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c=
088","src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8f=
a9264c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144=
723f2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0ca=
d105ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758=
ad741123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e=
4b4e4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd=
39b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/m=
od.rs":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","=
src/unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652=
c8296f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d=
86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747=
866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/appl=
e/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a=
5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"e8eb38d064b5fefec6f37d4287=
3820a0483e7c758ed336cc59a7155455ca89c9","src/unix/bsd/apple/b64/aarch64/mod=
.rs":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","sr=
c/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4b=
d0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891=
d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_=
64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e=
26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29=
b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf=
1f19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bs=
d/apple/mod.rs":"7ffbd4a92cdee46bc7fcd2a102d33d5acc5ba2df9a65030b5cfb787688=
5d1def","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4=
d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dra=
gonfly/mod.rs":"8b98b2e544b1303eb3efff36aa1f00d7bb608d507f07db035fd3ead8562=
bdef0","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f17=
1749b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/free=
bsd/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f=
47","src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647=
f1b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/f=
reebsd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773d=
bec722ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe=
45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/=
freebsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b1700=
40e60665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x=
86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052=
","src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb1681=
06b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/fre=
ebsd/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca73=
593e860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df3=
6a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd=
/freebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f823947=
2f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/=
mod.rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f",=
"src/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b=
6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/fr=
eebsd/mod.rs":"6cd5a49c877ec4180ec200c9dcd0426c1054775ee557e4899c1c633158c7=
c825","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f=
2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freeb=
sd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a5=
4628a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba33=
95941c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/fr=
eebsd/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99c7=
0ab0","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c328=
74b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/=
freebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e=
0b0e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"e9bd293d0bcb317dcebd7d86e=
fc8e9bed5d9f7c63b9edfd477f76bd2e32e6457","src/unix/bsd/mod.rs":"dad51a24a52=
4e92bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netbsd=
like/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5=
537","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07=
ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/ar=
m.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","s=
rc/unix/bsd/netbsdlike/netbsd/mod.rs":"247154ad4f5e5114a2bb572bff0d157ed3b9=
37a373759146b7d0f2900203293b","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"=
ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix=
/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f=
6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"2069232=
0e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/ne=
tbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf4=
11c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d37=
3b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbs=
dlike/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d=
3ced729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d6=
68d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/=
openbsd/mod.rs":"a1632c0ea40681a22c3fa5834e566b900704f619192b0d46dd8ac75682=
30d751","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a=
0d982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openb=
sd/powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461c=
fa2c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30f=
fdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/open=
bsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c731=
2f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890c=
bd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x=
86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1=
","src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239e=
d95dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa2=
6353f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"1a0cda453016c0e1=
192d735b83471b0042a9c7b5a3b76ecf4a623536923a727c","src/unix/haiku/native.rs=
":"dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/u=
nix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a527=
89f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368=
ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301c=
ceb0d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.=
rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src=
/unix/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016c=
ee35f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c17=
3e0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/lin=
ux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bd=
d4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d=
107efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/li=
nux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee=
2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int=
128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de",=
"src/unix/linux_like/android/b64/aarch64/mod.rs":"171f8c37a2d2e45065bd3547d=
fcec70b02aa3da34cd99d259d150c753f620846","src/unix/linux_like/android/b64/m=
od.rs":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","=
src/unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4a=
df071a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/=
riscv64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7=
b0e49d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f=
7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/andr=
oid/b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca=
5d921e9b314d1","src/unix/linux_like/android/mod.rs":"e6536383a652e1a9a755d3=
50c5a60c2abcadea03e9cdc92e3cf7f7229fe8e2a5","src/unix/linux_like/emscripten=
/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c3621=
6","src/unix/linux_like/emscripten/mod.rs":"712c52856ee323b8057b9452e4ab484=
a0e652581a530b67c3db25e819919d718","src/unix/linux_like/emscripten/no_align=
.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","sr=
c/unix/linux_like/linux/align.rs":"28b2cd7c3eddc53c247aa11340da205d1d2e478f=
199493d330c61e75ec16ee96","src/unix/linux_like/linux/arch/generic/mod.rs":"=
778742250aa456cb94efe67a4f8d0213827d90ab74eb5074f9afb9a30e6ea71c","src/unix=
/linux_like/linux/arch/mips/mod.rs":"60ace1dd76aa88d6b3b5e52fef4bec7881d452=
780dfff635474067b512e03df1","src/unix/linux_like/linux/arch/mod.rs":"466a29=
622e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux=
_like/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a0e=
d95853e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"915=
93ec0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/li=
nux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251=
957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0=
eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/lin=
ux_like/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e1452886286034=
6b700aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/m68k/align.rs"=
:"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/un=
ix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717c40=
77b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips/al=
ign.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee",=
"src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3=
c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/=
mod.rs":"caade9dc8b7179711102da342819bdf330c42c796b4587d0ed419550dab2e9ad",=
"src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe=
7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/r=
iscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86=
621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf7129=
85b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like/li=
nux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c=
48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894=
eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linu=
x_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f62=
0890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"=
c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix=
/linux_like/linux/gnu/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542b=
ca34ac566eac9a95662076d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarc=
h64/ilp32.rs":"bf4611b737813deef6787babf6c01698605f3b75482269b8546318667bc6=
8e29","src/unix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770=
d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/li=
nux/gnu/b64/aarch64/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105e=
d4faa79358e53175072","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"d7=
be998105fc2f6248b7fdfcedb5a0519122d28625fcfd5dccf72617fb30c45e","src/unix/l=
inux_like/linux/gnu/b64/loongarch64/align.rs":"6616c38bf8cab53034dce9f968ad=
ae8fb7771334445a93876d000cfd08f117a8","src/unix/linux_like/linux/gnu/b64/lo=
ongarch64/mod.rs":"9c39dfc3843e72bd8dba21aa5ef2795411cd8a0004a0cfe79c9b9f89=
ab92eb55","src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4=
716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/=
linux/gnu/b64/mips64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799=
b09bb884d80281f96eb","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a=
7a8852757b31a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_lik=
e/linux/gnu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a4=
68cc1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mo=
d.rs":"c778a136f06c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","s=
rc/unix/linux_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2=
dc0111beb3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b=
64/riscv64/mod.rs":"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be=
3fb388551","src/unix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a=
16a3bcca745d5a9932c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/=
gnu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df=
83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047=
e9966a2b90063e0151a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linu=
x_like/linux/gnu/b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b8939=
39ab4b308ec11b0578bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod=
.rs":"891e595d33714b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","sr=
c/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815=
a2b87be1618d5e45f190f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b=
64/x86_64/x32.rs":"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9da=
fedaaebb","src/unix/linux_like/linux/gnu/mod.rs":"882859b4b1bcb8b7c2a6fb8da=
7a2d9a429341fe2baacd77ec1a234ba3addd444","src/unix/linux_like/linux/gnu/no_=
align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25=
","src/unix/linux_like/linux/mod.rs":"443d3384ed7f4c490c82871f288f8c8a95a7a=
b43a41449e8f4d400b62093af92","src/unix/linux_like/linux/musl/b32/arm/align.=
rs":"3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src=
/unix/linux_like/linux/musl/b32/arm/mod.rs":"f5b217a93f99c2852f7fd1459f5297=
98372fa7df84ee0cfd3d8cdd5b2021b8cf","src/unix/linux_like/linux/musl/b32/hex=
agon.rs":"226a8b64ce9c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e"=
,"src/unix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d43=
0098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl=
/b32/mips/mod.rs":"16f614dd59695497a01b542deacd1669335678bdd0b14d16dde482fb=
5c4e02f4","src/unix/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec=
1477628288f6273fabbc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/mu=
sl/b32/powerpc.rs":"80479a91d817ac2bce7cbd62d0c5d20a949fb28b0c41cb765604313=
dba36829e","src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf3=
3b87de7c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_li=
ke/linux/musl/b32/riscv32/mod.rs":"b857ccbc8f0fbc8a6a5959f3496a4fd5a9a1dd98=
6c15c8e716f3e2902c25181c","src/unix/linux_like/linux/musl/b32/x86/align.rs"=
:"08e77fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/un=
ix/linux_like/linux/musl/b32/x86/mod.rs":"7a1586f77bb693f0b319ec720c35963da=
056287fc42f8e2ccf1d5b2bcccf4fd6","src/unix/linux_like/linux/musl/b64/aarch6=
4/align.rs":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe965613291518298211=
33","src/unix/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d=
20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/lin=
ux/musl/b64/aarch64/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da6628846=
55e60801d852e55dc2","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f=
666332bb056d0e2951e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_=
like/linux/musl/b64/mod.rs":"884243eb5af7df963d858d5baf47e622b45f04e0ae7017=
28b134e986191b614b","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"455d=
c0ffa55afc1db6ffaf461f6f2a7b49d31658bfebe0bb4efac5967a6f956c","src/unix/lin=
ux_like/linux/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3=
a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/riscv6=
4/mod.rs":"42d4b6d36807f37759094a732a321080cccdf498b174d632cebba147051de294=
","src/unix/linux_like/linux/musl/b64/s390x.rs":"508d083cca50ca91042f01a961=
8909e890b755287ea4c7885cdab0fc0d75e1b3","src/unix/linux_like/linux/musl/b64=
/x86_64/align.rs":"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b8=
08cbca6e","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"7a877cd23b64b=
e66d28e6b8dddae32d59a88d69115637539daf19381f4e39330","src/unix/linux_like/l=
inux/musl/mod.rs":"8965596cc33a032f7495c74d0d25ff9169e425491b36c4563b291e9f=
12e2a1b6","src/unix/linux_like/linux/no_align.rs":"1a754a4af299894a79835aa0=
92d8322d301179e2b20609defd6bb4bc880e6b4a","src/unix/linux_like/linux/non_ex=
haustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea=
3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a=
65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/=
arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9=
f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288ff9e411ab0966da24=
838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux_like/linux/ucli=
bc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316=
c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c2=
7fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux=
_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f516c706cdcc=
c9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/uclibc/mips/mips3=
2/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c8665=
3db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37=
a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like=
/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467a34d955f76=
53c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc/mips/mips64/no_=
align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30=
","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1ad57305642e=
8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_like/linux/uclibc/=
mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825f169a5029c8bca",=
"src/unix/linux_like/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26=
cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x8=
6_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f=
192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196d03affbefb857169=
37c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/linux_like/linux/u=
clibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b=
082b3b2d6a0a8","src/unix/linux_like/mod.rs":"08fa4c19c184adc12c775f1bd494d1=
c33131b0f48455498ce550a3c44ab4db24","src/unix/mod.rs":"13d0eb3b15294623bb3c=
08b45aea89b06f14860675f5e777670aae42a0cc43a9","src/unix/newlib/aarch64/mod.=
rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src=
/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f7=
3e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725=
a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.rs":"816f23=
5f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/unix/newli=
b/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870c=
d599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd=
3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"83aea4ee8783761323=
ca91eeba25afee9b9e91d9b5d37ca03fe179c88dc9cde1","src/unix/newlib/no_align.r=
s":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/=
unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae=
9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"d7642da66c2e76cf37d367d6=
22acb6e27e46a6dbd721e088e8028608b3488b6f","src/unix/no_align.rs":"c06e95373=
b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/unix/nto/aarc=
h64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd414851555",=
"src/unix/nto/mod.rs":"8b8f5d0e5251f5385849c554629e9320c0f7ddf37078a458cc87=
67a9214392e9","src/unix/nto/neutrino.rs":"62198d95ccc0fe7ece6f9d5c0b29fc223=
03ef458886efb5e09aad524eca2ab7b","src/unix/nto/x86_64.rs":"a3e18e93c2999da1=
cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix/redox/mod.rs":"=
280397beced934ba8e83d10b15b81dfb2d344fce420649bc529a26e4001c00b9","src/unix=
/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d894071a154425dcc4=
3ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bbf9933a92842a8998=
eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.rs":"55ce4624745=
e31ad226b47fde177a46176a89da3fa5030663673a115102471f9","src/unix/solarish/s=
olaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da17bf3e72ed=
f","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3c883198d1aa91508=
540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01f194eb8a6a27133c=
57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solarish/x86_common.r=
s":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src/=
vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08=
c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435=
b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a325e738c946550759=
4d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.rs":"acb7968ce99=
fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc=
64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","=
src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122f52f4=
34fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8=
e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b050f6ca8ae008a286=
79ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs":"b2c13ec1b9f3b=
39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows/gnu/mod.r=
s":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","src/=
windows/mod.rs":"a9a95e9ebc0102c334650607351d4d4dbaff0eaf7730eed1c8020d20e9=
bbebfd","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caede=
d9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f73072d2b70907fb8abb1=
148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1f0864f926aebe791=
18fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"2b00cc1c228a6782d0f=
076e7b232802e0c5689d41bb5df366f2a6b6621cfdfe1"}
> >  \ No newline at end of file
> > -+{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5b=
a7fb3e6cadfc08dac4c7b0ce","Cargo.toml":"96bf2f6d97a370699fa12dba540978a01b5=
cd84dd72fe6cff8a7700744e8122e","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca5=
2d0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a89=
32dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a=
2b4f1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"104ceb079ec13=
f06d440a348a07974ff5a18dca1f74b9c2fde7be9e3074c25e7","rustfmt.toml":"eaa2ea=
84fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_widt=
h_ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0c=
a","src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42=
da99e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e=
60f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"68d860865d8ccc6c49=
3948c781105e0901fc3312cfa1337f0092c0668706200a","src/fuchsia/no_align.rs":"=
303f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuch=
sia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec585225=
5ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefe=
ed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bf=
a8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15=
c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"24111461547=
739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/macros.rs":"b45=
7eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088","src/psp.rs"=
:"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sg=
x.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","s=
rc/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37=
a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb4=
8d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e4c23ab9737e12=
856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3de45a79287899=
26e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.rs":"55a5280c0=
e5498c1632b2772a7846bce0a130dde61a7fd59220d7971f9084b56","src/unix/aix/powe=
rpc64.rs":"8c471cf7e4604da9f640db1be68d918303b326744e36e6ee159114040401d2cf=
","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4cee=
ec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c=
9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"25=
46ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72","src/unix/b=
sd/apple/b64/aarch64/align.rs":"e8eb38d064b5fefec6f37d42873820a0483e7c758ed=
336cc59a7155455ca89c9","src/unix/bsd/apple/b64/aarch64/mod.rs":"44c217a4f26=
3afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/unix/bsd/apple/=
b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0=
e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aac=
a0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec8=
33a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bs=
d/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a175879a0245342=
b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19b812e6d093c81=
9dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/apple/mod.rs":"=
52b90d584e771447c3608079681adbb32367267021d12f5eb5940b7646f16f4a","src/unix=
/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c=
3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"8=
986a8c79bcadfbdb58ec1a72e1aff8ce9b341c9392d7b0b7449bddf6db59058","src/unix/=
bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749b57602fc34a4e=
4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6=
a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd=
/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c93=
0da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/freebsd11/=
mod.rs":"fa83dcd4597c6621b95228d80ea6250c37136463300f80a9961a09bdab5e25c3",=
"src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106=
b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freeb=
sd/freebsd12/mod.rs":"c7c574d65a8408f6eee32bd5d0cc40e33e41c7e61d98d338609ae=
5beec72f390","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.rs":"2df36a=
7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/f=
reebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f=
25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd13/mo=
d.rs":"834ec71df759e8d38489986b7720f1b296ca774c23c8034e2d9b02b9f55ab781","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122f6d6e5753c=
fb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/free=
bsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2=
afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs":"58b77661=
36a22ace828c974f34240eb38feec2c8aa2ee8b6ca38e3b44a6fa348","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f=
6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/mod.rs":"cb=
fb50eeca94674f3e51992ab41cb020127d9405002eacf4b8bf7b2a0418f2ea","src/unix/b=
sd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a3=
1747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powerpc64.rs":=
"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src/uni=
x/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba3395941c7fa6b11e089=
551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebsd/x86.rs":"c5=
005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","src/unix/b=
sd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3d446fe=
fbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86_64/mo=
d.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e47d7803eb","s=
rc/unix/bsd/freebsdlike/mod.rs":"f5ebb2f36dffd9c897b18b168cf28fbff9cc68983a=
e2d4910cb1ba9764693381","src/unix/bsd/mod.rs":"0c672b075b5616fca2cc56c00ee3=
1c3f554dcbd2e88a7c2ba1437aa6e5604319","src/unix/bsd/netbsdlike/mod.rs":"0a6=
6f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537","src/unix/bs=
d/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4cb4f053e042=
49cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"58cdbb70b0=
d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix/bsd/netbs=
dlike/netbsd/mod.rs":"4493317993af390d8aafc2cb7ace4c349dfc9d2451fd666844f04=
a4fa1f47442","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0ed22f5=
31237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/netbsdlike/n=
etbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152=
b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d1a34d1=
6fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlike/netbsd/x=
86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d51ebca9f30=
","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7ecaf6e2de25ada=
dee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlike/openbsd/arm=
.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729ad307","sr=
c/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9d4065da8b05d1=
24e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/openbsd/mod.rs":"=
c0f06c4af4dd3169b8bcd13a2fb7be6ac9dfa901e11bfd22058fff2aa6caed2e","src/unix=
/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d982181b7bdabfa0=
66cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/powerpc64.rs":=
"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/uni=
x/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05=
c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"=
d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix=
/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef853=
47d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"d31db3=
1630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/unix/haiku=
/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95dced11f54d87b"=
,"src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353f57056197b563=
bf4681f91ff7985","src/unix/haiku/mod.rs":"0b5a77da05582896e680e236ddd3d813a=
7b8a2ecfde21c1b72ec17883e2de6a7","src/unix/haiku/native.rs":"dbfcbf4954a79d=
1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/haiku/x86_64.=
rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src=
/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9deb=
b3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0d9b8529a84b58=
82fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":"ab832b7524e5=
fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/linux_like/=
android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35f06ad8653ee90=
72c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e0375119bf06a308=
1652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_like/android/b=
32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c58153=
20c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107efbcd37b5b85df=
a18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_like/android/=
b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e5=
05cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.rs":"1735f6f5=
c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_l=
ike/android/b64/aarch64/mod.rs":"171f8c37a2d2e45065bd3547dfcec70b02aa3da34c=
d99d259d150c753f620846","src/unix/linux_like/android/b64/mod.rs":"71e4fcbe9=
52bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/unix/linux_li=
ke/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf071a6832b516445=
e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/riscv64/mod.rs":"=
19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e49d","src/unix=
/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8=
bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64/x86_64/mo=
d.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d921e9b314d1","s=
rc/unix/linux_like/android/mod.rs":"21b1b70c1d398bd342794376b41975bfe3daf75=
127c7a11d825cc4b839811153","src/unix/linux_like/emscripten/align.rs":"86c95=
cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/linu=
x_like/emscripten/mod.rs":"712c52856ee323b8057b9452e4ab484a0e652581a530b67c=
3db25e819919d718","src/unix/linux_like/emscripten/no_align.rs":"0128e4aa721=
a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/linux_like=
/linux/align.rs":"28b2cd7c3eddc53c247aa11340da205d1d2e478f199493d330c61e75e=
c16ee96","src/unix/linux_like/linux/arch/generic/mod.rs":"249387e62ce11dfe5=
a93652699df6e5d8d29311d70d7a0e58fc1298a2ac8d750","src/unix/linux_like/linux=
/arch/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8f1a43adc42=
77e142460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c6c7f150068=
2b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/linux/arch/=
powerpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef02206a912c=
41b815","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec0440f1dd8f8e6=
12028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_like/linux/gn=
u/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f9=
36","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93f7ae99fd71=
4b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like/linux/gnu=
/b32/arm/mod.rs":"45be81a806c55fed92c20a33c5e4cfb23b3933f7b4feff47db33d37dd=
a34e6d3","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa92f77a9232c=
035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linux_like/lin=
ux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717c4077b8eed72a7f11e3b=
8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"429fb5e0=
05cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_l=
ike/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3c43502c87143332df=
9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/mod.rs":"caade9dc=
8b7179711102da342819bdf330c42c796b4587d0ed419550dab2e9ad","src/unix/linux_l=
ike/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe7a3fb02f053b2dc78=
2241a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/riscv32/align.rs":=
"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119","src/uni=
x/linux_like/linux/gnu/b32/riscv32/mod.rs":"ca8bc84fff8c65ecda6c03421f4fe76=
89f199dce39f1ca382a45bf0b13a1cb00","src/unix/linux_like/linux/gnu/b32/sparc=
/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d4=
1","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894eece66e9348f45d1b=
07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linux_like/linux/gnu/=
b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc4716=
2e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"c703cc5e9de2dc31d=
9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix/linux_like/linux=
/gnu/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542bca34ac566eac9a956=
62076d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf=
4611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/l=
inux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724=
d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch=
64/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e531750=
72","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"d7be998105fc2f6248b=
7fdfcedb5a0519122d28625fcfd5dccf72617fb30c45e","src/unix/linux_like/linux/g=
nu/b64/loongarch64/align.rs":"6616c38bf8cab53034dce9f968adae8fb7771334445a9=
3876d000cfd08f117a8","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs"=
:"9c39dfc3843e72bd8dba21aa5ef2795411cd8a0004a0cfe79c9b9f89ab92eb55","src/un=
ix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fd=
a5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mip=
s64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96=
eb","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a8852757b31a542e=
a73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux/gnu/b64/p=
owerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f=
1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f0=
6c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_lik=
e/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e588=
03f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs=
":"88bde5520c86793f2cf97062d66c1b3f4dd66206c453a601ebf9110d90abc6f8","src/u=
nix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a993=
2c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/a=
lign.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9"=
,"src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e015=
1a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/=
b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b057=
8bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d337=
14b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like=
/linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f=
190f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs"=
:"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/un=
ix/linux_like/linux/gnu/mod.rs":"daf0eff7fddf6d7a2c15a5bc89e3a0dfe463a40f38=
880fe3fb444105d0ae0f07","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223=
135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux=
_like/linux/mod.rs":"f305c518fc8ef7e151b22a93d23ad304d1302e71ae7082b0c3676d=
5409ad6646","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c104=
3764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/=
linux/musl/b32/arm/mod.rs":"923159f09820a7e3ca2340ef6adb4f3779ebfa9320a1f6a=
41027529d81d5f699","src/unix/linux_like/linux/musl/b32/hexagon.rs":"5625a3d=
fcd8fae8c43e6306172dd0c2f7ace8ce9a43a2c03909aef35d96cdaa8","src/unix/linux_=
like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d36068=
5b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs"=
:"bb5f45dd376e928a22282e1696989399b0e8d0a5fbc8309bb4238926d81e61e7","src/un=
ix/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fa=
bbc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs=
":"f23491f21f3eeac3e05a76b466567ea633b92a4830ab8b401cbb31c74ad1acab","src/u=
nix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c754790335=
9a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32=
/riscv32/mod.rs":"b857ccbc8f0fbc8a6a5959f3496a4fd5a9a1dd986c15c8e716f3e2902=
c25181c","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7d=
ec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/lin=
ux/musl/b32/x86/mod.rs":"5e58f759df421b4473f229da417cd5da080226afc0006d71d5=
dd578c62e27a50","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba3=
2725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/lin=
ux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d=
9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch=
64/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc=
2","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e295=
1e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b=
64/mod.rs":"c349ade36cca16273918124d206493a2f8d0d3ecf359b80ae7ec0317c7ee5c9=
8","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"455dc0ffa55afc1db6ffa=
f461f6f2a7b49d31658bfebe0bb4efac5967a6f956c","src/unix/linux_like/linux/mus=
l/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd375=
43efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"42d4b6=
d36807f37759094a732a321080cccdf498b174d632cebba147051de294","src/unix/linux=
_like/linux/musl/b64/s390x.rs":"d8a4fdfea0960ec284cae4facb8b0fb342e8aa41544=
cffacdcaf08c5a92a43f8","src/unix/linux_like/linux/musl/b64/x86_64/align.rs"=
:"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/un=
ix/linux_like/linux/musl/b64/x86_64/mod.rs":"7a877cd23b64be66d28e6b8dddae32=
d59a88d69115637539daf19381f4e39330","src/unix/linux_like/linux/musl/mod.rs"=
:"46b47255dd8ce2ae32443267f5f334e2e72341d58615edf50611218506a08082","src/un=
ix/linux_like/linux/no_align.rs":"1a754a4af299894a79835aa092d8322d301179e2b=
20609defd6bb4bc880e6b4a","src/unix/linux_like/linux/non_exhaustive.rs":"181=
a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/unix/li=
nux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6=
bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4=
a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/l=
inux_like/linux/uclibc/arm/mod.rs":"50288ff9e411ab0966da24838f2c2a5618021bc=
19c422a04f577b2979ef4081e","src/unix/linux_like/linux/uclibc/arm/no_align.r=
s":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/=
unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34=
cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclib=
c/mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f516c706cdccc9f7be2f0921b2207=
b0afdb66fe81","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9=
cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/=
linux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea=
3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mip=
s/mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467a34d955f7653c2c8ce1e6147dae=
b53f1e0","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e3=
875698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux=
_like/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1ad57305642e8ad05ca0f0c7e4753=
267a2e2d6b4fee5db3b072","src/unix/linux_like/linux/uclibc/mod.rs":"1c3d25cd=
dcfefa2bd17bdc81550826be31a08eef235e13f825f169a5029c8bca","src/unix/linux_l=
ike/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b5=
18cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"02=
4eba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/l=
inux_like/linux/uclibc/x86_64/mod.rs":"196d03affbefb85716937c15904831e731eb=
222ee906e05e42102d639a8152ea","src/unix/linux_like/linux/uclibc/x86_64/othe=
r.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","s=
rc/unix/linux_like/mod.rs":"adfa87d7f8790795f22576ab9b7064f7d0085b539d24d82=
23275e66edbab320d","src/unix/mod.rs":"362da723eaad726ae72664d801315f4cf70a0=
42250de1231761bfd12390e27b8","src/unix/newlib/aarch64/mod.rs":"bac93836a9a5=
7b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/newlib/alig=
n.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","s=
rc/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3fa0015983b4=
b4fa27b233732b526","src/unix/newlib/espidf/mod.rs":"816f235f4aa4baabba7f260=
6b31d0fdb03988c52194c966728de8690bf17299d","src/unix/newlib/generic.rs":"ea=
b066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","src/unix/n=
ewlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd0f5be96d40=
fe4c996f3ca1","src/unix/newlib/mod.rs":"fcf8b307933cba5e9c485537499386326d6=
65fe83b6fcfb9e9e1837f73332668","src/unix/newlib/no_align.rs":"e0743b2179495=
a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/power=
pc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f831be393b6=
7","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d9518=
55e382d22de78e53","src/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c2384=
99ee3e8da5bd2baa614d9c7dd414851555","src/unix/nto/mod.rs":"44b74cd89794aecd=
7db67aad1c4114273f70be8d2e4633e3965f144fe53a7b88","src/unix/nto/neutrino.rs=
":"62198d95ccc0fe7ece6f9d5c0b29fc22303ef458886efb5e09aad524eca2ab7b","src/u=
nix/nto/x86_64.rs":"a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84c=
fb040bc8e","src/unix/redox/mod.rs":"c8afea39f81e73ad4e9bf8a8f25138a200e6160=
48e189debad80a6b7e08f710f","src/unix/solarish/compat.rs":"00f1ee3faec9da692=
04e42f025f6735dd13d894071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos=
.rs":"cd93c2d84722bbf9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","sr=
c/unix/solarish/mod.rs":"6442ed05eb390d44a03daa9800af1030f2ee3e61db98675262=
c227b28de51937","src/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640=
f92be53be0b0d976021cdc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806d=
f0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/unix/solaris=
h/x86_64.rs":"ec2b01f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef=
5fc","src/unix/solarish/x86_common.rs":"ac869d9c3c95645c22460468391eb198202=
3c3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557=
e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb79=
68ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/m=
od.rs":"ff063860fc4fe3bca6332742764e29c1506884added21aa7722144c1fb3f4018","=
src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef70847=
77cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed673=
7585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b2=
3889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"01=
8d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.r=
s":"09ee3b3348b212b050f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/=
windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b450=
2afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585=
c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"5421b92f47cb69845f4323=
b1a14e533d8a17acc6412c58e67f4d41def749de2f","src/windows/msvc/mod.rs":"c068=
271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs"=
:"eb0675f25ba01f73072d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/=
const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f=
1f4"},"package":"99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed60=
95f80c"}
> > ++{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5b=
a7fb3e6cadfc08dac4c7b0ce","Cargo.toml":"bcbcb2d5d0952786b470930f12a959168ba=
4b5e5a0c5185beb032c8ea20a719b","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca5=
2d0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a89=
32dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a=
2b4f1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"5bd78d7e4e79b=
183fb1dab92cd640a611330131d54c479c69adbe87cbdc95ae3","rustfmt.toml":"eaa2ea=
84fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_widt=
h_ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0c=
a","src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada=
97075f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e=
60f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d6=
1896696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"=
303f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuch=
sia/riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811=
293b11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e=
0f38d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083=
d0f368ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d=
4be8020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":=
"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib=
.rs":"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","sr=
c/macros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c=
088","src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8f=
a9264c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144=
723f2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0ca=
d105ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758=
ad741123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e=
4b4e4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd=
39b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/m=
od.rs":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","=
src/unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652=
c8296f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d=
86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747=
866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/appl=
e/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a=
5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"e8eb38d064b5fefec6f37d4287=
3820a0483e7c758ed336cc59a7155455ca89c9","src/unix/bsd/apple/b64/aarch64/mod=
.rs":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","sr=
c/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4b=
d0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891=
d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_=
64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e=
26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29=
b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf=
1f19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bs=
d/apple/mod.rs":"7ffbd4a92cdee46bc7fcd2a102d33d5acc5ba2df9a65030b5cfb787688=
5d1def","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4=
d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dra=
gonfly/mod.rs":"8b98b2e544b1303eb3efff36aa1f00d7bb608d507f07db035fd3ead8562=
bdef0","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f17=
1749b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/free=
bsd/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f=
47","src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647=
f1b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/f=
reebsd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773d=
bec722ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe=
45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/=
freebsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b1700=
40e60665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x=
86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052=
","src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb1681=
06b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/fre=
ebsd/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca73=
593e860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df3=
6a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd=
/freebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f823947=
2f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/=
mod.rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f",=
"src/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b=
6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/fr=
eebsd/mod.rs":"6cd5a49c877ec4180ec200c9dcd0426c1054775ee557e4899c1c633158c7=
c825","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f=
2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freeb=
sd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a5=
4628a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba33=
95941c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/fr=
eebsd/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99c7=
0ab0","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c328=
74b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/=
freebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e=
0b0e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"e9bd293d0bcb317dcebd7d86e=
fc8e9bed5d9f7c63b9edfd477f76bd2e32e6457","src/unix/bsd/mod.rs":"dad51a24a52=
4e92bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netbsd=
like/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5=
537","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07=
ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/ar=
m.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","s=
rc/unix/bsd/netbsdlike/netbsd/mod.rs":"247154ad4f5e5114a2bb572bff0d157ed3b9=
37a373759146b7d0f2900203293b","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"=
ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix=
/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f=
6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"2069232=
0e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/ne=
tbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf4=
11c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d37=
3b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbs=
dlike/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d=
3ced729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d6=
68d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/=
openbsd/mod.rs":"a1632c0ea40681a22c3fa5834e566b900704f619192b0d46dd8ac75682=
30d751","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a=
0d982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openb=
sd/powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461c=
fa2c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30f=
fdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/open=
bsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c731=
2f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890c=
bd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x=
86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1=
","src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239e=
d95dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa2=
6353f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"1a0cda453016c0e1=
192d735b83471b0042a9c7b5a3b76ecf4a623536923a727c","src/unix/haiku/native.rs=
":"dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/u=
nix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a527=
89f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368=
ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301c=
ceb0d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.=
rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src=
/unix/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016c=
ee35f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c17=
3e0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/lin=
ux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bd=
d4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d=
107efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/li=
nux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee=
2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int=
128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de",=
"src/unix/linux_like/android/b64/aarch64/mod.rs":"171f8c37a2d2e45065bd3547d=
fcec70b02aa3da34cd99d259d150c753f620846","src/unix/linux_like/android/b64/m=
od.rs":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","=
src/unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4a=
df071a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/=
riscv64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7=
b0e49d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f=
7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/andr=
oid/b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca=
5d921e9b314d1","src/unix/linux_like/android/mod.rs":"e6536383a652e1a9a755d3=
50c5a60c2abcadea03e9cdc92e3cf7f7229fe8e2a5","src/unix/linux_like/emscripten=
/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c3621=
6","src/unix/linux_like/emscripten/mod.rs":"712c52856ee323b8057b9452e4ab484=
a0e652581a530b67c3db25e819919d718","src/unix/linux_like/emscripten/no_align=
.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","sr=
c/unix/linux_like/linux/align.rs":"28b2cd7c3eddc53c247aa11340da205d1d2e478f=
199493d330c61e75ec16ee96","src/unix/linux_like/linux/arch/generic/mod.rs":"=
778742250aa456cb94efe67a4f8d0213827d90ab74eb5074f9afb9a30e6ea71c","src/unix=
/linux_like/linux/arch/mips/mod.rs":"60ace1dd76aa88d6b3b5e52fef4bec7881d452=
780dfff635474067b512e03df1","src/unix/linux_like/linux/arch/mod.rs":"466a29=
622e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux=
_like/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a0e=
d95853e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"915=
93ec0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/li=
nux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251=
957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0=
eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/lin=
ux_like/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e1452886286034=
6b700aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/m68k/align.rs"=
:"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/un=
ix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717c40=
77b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips/al=
ign.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee",=
"src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3=
c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/=
mod.rs":"caade9dc8b7179711102da342819bdf330c42c796b4587d0ed419550dab2e9ad",=
"src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe=
7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/r=
iscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86=
621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf7129=
85b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like/li=
nux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c=
48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894=
eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linu=
x_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f62=
0890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"=
c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix=
/linux_like/linux/gnu/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542b=
ca34ac566eac9a95662076d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarc=
h64/ilp32.rs":"bf4611b737813deef6787babf6c01698605f3b75482269b8546318667bc6=
8e29","src/unix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770=
d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/li=
nux/gnu/b64/aarch64/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105e=
d4faa79358e53175072","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"d7=
be998105fc2f6248b7fdfcedb5a0519122d28625fcfd5dccf72617fb30c45e","src/unix/l=
inux_like/linux/gnu/b64/loongarch64/align.rs":"6616c38bf8cab53034dce9f968ad=
ae8fb7771334445a93876d000cfd08f117a8","src/unix/linux_like/linux/gnu/b64/lo=
ongarch64/mod.rs":"9c39dfc3843e72bd8dba21aa5ef2795411cd8a0004a0cfe79c9b9f89=
ab92eb55","src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4=
716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/=
linux/gnu/b64/mips64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799=
b09bb884d80281f96eb","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a=
7a8852757b31a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_lik=
e/linux/gnu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a4=
68cc1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mo=
d.rs":"c778a136f06c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","s=
rc/unix/linux_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2=
dc0111beb3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b=
64/riscv64/mod.rs":"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be=
3fb388551","src/unix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a=
16a3bcca745d5a9932c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/=
gnu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df=
83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047=
e9966a2b90063e0151a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linu=
x_like/linux/gnu/b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b8939=
39ab4b308ec11b0578bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod=
.rs":"891e595d33714b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","sr=
c/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815=
a2b87be1618d5e45f190f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b=
64/x86_64/x32.rs":"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9da=
fedaaebb","src/unix/linux_like/linux/gnu/mod.rs":"882859b4b1bcb8b7c2a6fb8da=
7a2d9a429341fe2baacd77ec1a234ba3addd444","src/unix/linux_like/linux/gnu/no_=
align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25=
","src/unix/linux_like/linux/mod.rs":"443d3384ed7f4c490c82871f288f8c8a95a7a=
b43a41449e8f4d400b62093af92","src/unix/linux_like/linux/musl/b32/arm/align.=
rs":"3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src=
/unix/linux_like/linux/musl/b32/arm/mod.rs":"923159f09820a7e3ca2340ef6adb4f=
3779ebfa9320a1f6a41027529d81d5f699","src/unix/linux_like/linux/musl/b32/hex=
agon.rs":"5625a3dfcd8fae8c43e6306172dd0c2f7ace8ce9a43a2c03909aef35d96cdaa8"=
,"src/unix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d43=
0098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl=
/b32/mips/mod.rs":"7956dae471300c810f596cb6d6cc122640527c139219cc9f2a86117a=
4167a941","src/unix/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec=
1477628288f6273fabbc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/mu=
sl/b32/powerpc.rs":"c3678a942c166aa205dae207a767a358c1f5d7b16939d175eda8dc9=
9f8fcfa96","src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf3=
3b87de7c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_li=
ke/linux/musl/b32/riscv32/mod.rs":"b857ccbc8f0fbc8a6a5959f3496a4fd5a9a1dd98=
6c15c8e716f3e2902c25181c","src/unix/linux_like/linux/musl/b32/x86/align.rs"=
:"08e77fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/un=
ix/linux_like/linux/musl/b32/x86/mod.rs":"5e58f759df421b4473f229da417cd5da0=
80226afc0006d71d5dd578c62e27a50","src/unix/linux_like/linux/musl/b64/aarch6=
4/align.rs":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe965613291518298211=
33","src/unix/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d=
20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/lin=
ux/musl/b64/aarch64/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da6628846=
55e60801d852e55dc2","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f=
666332bb056d0e2951e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_=
like/linux/musl/b64/mod.rs":"c349ade36cca16273918124d206493a2f8d0d3ecf359b8=
0ae7ec0317c7ee5c98","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"455d=
c0ffa55afc1db6ffaf461f6f2a7b49d31658bfebe0bb4efac5967a6f956c","src/unix/lin=
ux_like/linux/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3=
a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/riscv6=
4/mod.rs":"42d4b6d36807f37759094a732a321080cccdf498b174d632cebba147051de294=
","src/unix/linux_like/linux/musl/b64/s390x.rs":"508d083cca50ca91042f01a961=
8909e890b755287ea4c7885cdab0fc0d75e1b3","src/unix/linux_like/linux/musl/b64=
/x86_64/align.rs":"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b8=
08cbca6e","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"7a877cd23b64b=
e66d28e6b8dddae32d59a88d69115637539daf19381f4e39330","src/unix/linux_like/l=
inux/musl/mod.rs":"46b47255dd8ce2ae32443267f5f334e2e72341d58615edf506112185=
06a08082","src/unix/linux_like/linux/no_align.rs":"1a754a4af299894a79835aa0=
92d8322d301179e2b20609defd6bb4bc880e6b4a","src/unix/linux_like/linux/non_ex=
haustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea=
3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a=
65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/=
arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9=
f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288ff9e411ab0966da24=
838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux_like/linux/ucli=
bc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316=
c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c2=
7fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux=
_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f516c706cdcc=
c9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/uclibc/mips/mips3=
2/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c8665=
3db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37=
a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like=
/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467a34d955f76=
53c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc/mips/mips64/no_=
align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30=
","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1ad57305642e=
8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_like/linux/uclibc/=
mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825f169a5029c8bca",=
"src/unix/linux_like/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26=
cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x8=
6_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f=
192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196d03affbefb857169=
37c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/linux_like/linux/u=
clibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b=
082b3b2d6a0a8","src/unix/linux_like/mod.rs":"08fa4c19c184adc12c775f1bd494d1=
c33131b0f48455498ce550a3c44ab4db24","src/unix/mod.rs":"13d0eb3b15294623bb3c=
08b45aea89b06f14860675f5e777670aae42a0cc43a9","src/unix/newlib/aarch64/mod.=
rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src=
/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f7=
3e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725=
a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.rs":"816f23=
5f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/unix/newli=
b/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870c=
d599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd=
3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"83aea4ee8783761323=
ca91eeba25afee9b9e91d9b5d37ca03fe179c88dc9cde1","src/unix/newlib/no_align.r=
s":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/=
unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae=
9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"d7642da66c2e76cf37d367d6=
22acb6e27e46a6dbd721e088e8028608b3488b6f","src/unix/no_align.rs":"c06e95373=
b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/unix/nto/aarc=
h64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd414851555",=
"src/unix/nto/mod.rs":"8b8f5d0e5251f5385849c554629e9320c0f7ddf37078a458cc87=
67a9214392e9","src/unix/nto/neutrino.rs":"62198d95ccc0fe7ece6f9d5c0b29fc223=
03ef458886efb5e09aad524eca2ab7b","src/unix/nto/x86_64.rs":"a3e18e93c2999da1=
cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix/redox/mod.rs":"=
280397beced934ba8e83d10b15b81dfb2d344fce420649bc529a26e4001c00b9","src/unix=
/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d894071a154425dcc4=
3ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bbf9933a92842a8998=
eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.rs":"55ce4624745=
e31ad226b47fde177a46176a89da3fa5030663673a115102471f9","src/unix/solarish/s=
olaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da17bf3e72ed=
f","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3c883198d1aa91508=
540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01f194eb8a6a27133c=
57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solarish/x86_common.r=
s":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src/=
vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08=
c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435=
b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a325e738c946550759=
4d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.rs":"acb7968ce99=
fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc=
64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","=
src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122f52f4=
34fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8=
e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b050f6ca8ae008a286=
79ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs":"b2c13ec1b9f3b=
39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows/gnu/mod.r=
s":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","src/=
windows/mod.rs":"a9a95e9ebc0102c334650607351d4d4dbaff0eaf7730eed1c8020d20e9=
bbebfd","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caede=
d9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f73072d2b70907fb8abb1=
148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1f0864f926aebe791=
18fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"2b00cc1c228a6782d0f=
076e7b232802e0c5689d41bb5df366f2a6b6621cfdfe1"}
> > diff --git a/meta/recipes-devtools/rust/files/getrandom-open64.patch b/=
meta/recipes-devtools/rust/files/getrandom-open64.patch
> > deleted file mode 100644
> > index b35195e837e4..000000000000
> > --- a/meta/recipes-devtools/rust/files/getrandom-open64.patch
> > +++ /dev/null
> > @@ -1,46 +0,0 @@
> > -Do not use open64 on linux with musl
> > -
> > -glibc is providing open64 and other lfs64 functions but musl aliases
> > -them to normal equivalents since off_t is always 64-bit on musl,
> > -therefore check for target env along when target OS is linux before
> > -using open64, this is more available. Latest Musl has made these
> > -namespace changes [1]
> > -
> > -There is no need for using LFS64 open explicitly as we are only using =
it
> > -for opening device files and not real files
> > -
> > -[1] https://git.musl-libc.org/cgit/musl/commit/?id=3D246f1c811448f37a4=
4b41cd8df8d0ef9736d95f4
> > -
> > -Upstream-Status: Backport [https://github.com/rust-random/getrandom/co=
mmit/7f73e3ccc1f53bfc419e4ddcfd343766aa5837b6]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---- a/vendor/getrandom/.cargo-checksum.json
> > -+++ b/vendor/getrandom/.cargo-checksum.json
> > -@@ -1 +1 @@
> > --{"files":{"CHANGELOG.md":"cb054908f44d0e7f229dcc4580bcc4f2c3e2da198c8=
4292710f730b33cc3d5f6","Cargo.toml":"708a5d9c89443b937aa50260e26a01f9ebfdd5=
0a7ae312956795834e3187baf3","LICENSE-APACHE":"aaff376532ea30a0cd5330b9502ad=
4a4c8bf769c539c87ffe78819d188a18ebf","LICENSE-MIT":"209fbbe0ad52d9235e37bad=
f9cadfe4dbdc87203179c0899e738b39ade42177b","README.md":"7ae74633326a22fd629=
8d7f209fb14884277bd98049795f444945acbb2b0dfbd","benches/mod.rs":"c01b05c6d6=
90a4b8937d25252f1385a6bff378517318ce832ea520036aabd571","src/3ds.rs":"0f48f=
c15f89b518fb92e06aaa4838b62dc073598e8f288df56ad1e5a9251af1e","src/bsd_arand=
om.rs":"d90c419d4def20f83e7535cd3f5ec07035045011a50c3652951d196a120c5d3e","=
src/custom.rs":"ce4640776d36872dbbd5e194bf29f6bcda3ef4549ca04fe59f5aeab1dea=
1d821","src/dragonfly.rs":"47f933eac189f6ea48ecf021efd0747ebce1b43d1bece6bb=
f72a951bab705987","src/error.rs":"ff09a7e02d7aff3e45eca6bbef6c686cc46f3c237=
1a0897a856e4dec4b942e46","src/error_impls.rs":"9c34832ebb99cd5e31bc5c8ffc5b=
eb5b3fa6f7ff0226aaa1cdf8e10e6d64b324","src/espidf.rs":"19f101486584fde6dad9=
62f4d9792de168658047312106641a5caf6866a5bbcf","src/fuchsia.rs":"470d8509deb=
5b06fa6417f294c0a49e0e35a580249a5d8944c3be5aa746f64ea","src/ios.rs":"4bad4f=
5c096a50338b86aeac91a937c18bc55b9555e6f34806ad13732e64523d","src/js.rs":"37=
0610a19045012c87c986279aad6b150cd728a44015dcc5779256e4a2e6629b","src/lib.rs=
":"8e5c2c8edcbdbf2cee46b86d96d951cc6d5c00f7c11cfc9c27de27e756b5c4cc","src/l=
inux_android.rs":"ec24575aa4ae71b6991290dadfdea931b05397c3faababf24bd794f1a=
9624835","src/macos.rs":"6c09827ad5292cd022e063efa79523bfdb50ed08b9867ebaa0=
07cd321b8d218e","src/openbsd.rs":"450a23ead462d4a840fee4aa0bfdab1e3d88c8f48=
e4bb608d457429ddeca69c0","src/rdrand.rs":"79d23183b1905d61bd9df9729dc798505=
a2ed750d3339e342ab144e1709827e4","src/solaris_illumos.rs":"d52fee9dd7d661f9=
60c01894edd563c1ff8a512c111f7803092d9aa2ff98718e","src/solid.rs":"997035d54=
c9762d22a5a14f54e7fbed4dd266cdeacbdf6aab7d8aee05537e8ba","src/use_file.rs":=
"16e42eb0a56e375c330c1ca8eb58c444e82ef3ad35230b961fdba96a02a68804","src/uti=
l.rs":"da6964dc1523f1cb8d26365fa6a8ece46360587e6974931624b271f0c72cda8b","s=
rc/util_libc.rs":"2a63ac0e6dab16b85c4728b79a16e0640301e8b876f151b0a1db0b439=
4fa219f","src/vxworks.rs":"a5aa0e40f890e0f35626458bb656a3340b8af3111e4bacd2=
e12505a8d50a3505","src/wasi.rs":"dfdd0a870581948bd03abe64d49ca4295d9cfa26e0=
9b97a526fd5e17148ad9ca","src/windows.rs":"d0b4f2afd1959660aa9abcd9477764bd7=
dc0b7d7048aee748804b37963c77c6f","tests/common/mod.rs":"b6beee8f535d2d094a6=
5711fe0af91a6fc220aa09729ed7269fe33cafdc9177f","tests/custom.rs":"9f2c01931=
93f6bcf641116ca0b3653b33d2015e0e98ce107ee1d1f60c5eeae3a","tests/normal.rs":=
"9e1c4b1e468a09ed0225370dfb6608f8b8135e0fabb09bbc1a718105164aade6","tests/r=
drand.rs":"4474ccebf9d33c89288862a7e367018405968dddc55c7c6f97e21b5fe2264601=
"},"package":"c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396=
b31"}
> > -\ No newline at end of file
> > -+{"files":{"CHANGELOG.md":"cb054908f44d0e7f229dcc4580bcc4f2c3e2da198c8=
4292710f730b33cc3d5f6","Cargo.toml":"708a5d9c89443b937aa50260e26a01f9ebfdd5=
0a7ae312956795834e3187baf3","LICENSE-APACHE":"aaff376532ea30a0cd5330b9502ad=
4a4c8bf769c539c87ffe78819d188a18ebf","LICENSE-MIT":"209fbbe0ad52d9235e37bad=
f9cadfe4dbdc87203179c0899e738b39ade42177b","README.md":"7ae74633326a22fd629=
8d7f209fb14884277bd98049795f444945acbb2b0dfbd","benches/mod.rs":"c01b05c6d6=
90a4b8937d25252f1385a6bff378517318ce832ea520036aabd571","src/3ds.rs":"0f48f=
c15f89b518fb92e06aaa4838b62dc073598e8f288df56ad1e5a9251af1e","src/bsd_arand=
om.rs":"d90c419d4def20f83e7535cd3f5ec07035045011a50c3652951d196a120c5d3e","=
src/custom.rs":"ce4640776d36872dbbd5e194bf29f6bcda3ef4549ca04fe59f5aeab1dea=
1d821","src/dragonfly.rs":"47f933eac189f6ea48ecf021efd0747ebce1b43d1bece6bb=
f72a951bab705987","src/error.rs":"ff09a7e02d7aff3e45eca6bbef6c686cc46f3c237=
1a0897a856e4dec4b942e46","src/error_impls.rs":"9c34832ebb99cd5e31bc5c8ffc5b=
eb5b3fa6f7ff0226aaa1cdf8e10e6d64b324","src/espidf.rs":"19f101486584fde6dad9=
62f4d9792de168658047312106641a5caf6866a5bbcf","src/fuchsia.rs":"470d8509deb=
5b06fa6417f294c0a49e0e35a580249a5d8944c3be5aa746f64ea","src/ios.rs":"4bad4f=
5c096a50338b86aeac91a937c18bc55b9555e6f34806ad13732e64523d","src/js.rs":"37=
0610a19045012c87c986279aad6b150cd728a44015dcc5779256e4a2e6629b","src/lib.rs=
":"8e5c2c8edcbdbf2cee46b86d96d951cc6d5c00f7c11cfc9c27de27e756b5c4cc","src/l=
inux_android.rs":"ec24575aa4ae71b6991290dadfdea931b05397c3faababf24bd794f1a=
9624835","src/macos.rs":"6c09827ad5292cd022e063efa79523bfdb50ed08b9867ebaa0=
07cd321b8d218e","src/openbsd.rs":"450a23ead462d4a840fee4aa0bfdab1e3d88c8f48=
e4bb608d457429ddeca69c0","src/rdrand.rs":"79d23183b1905d61bd9df9729dc798505=
a2ed750d3339e342ab144e1709827e4","src/solaris_illumos.rs":"d52fee9dd7d661f9=
60c01894edd563c1ff8a512c111f7803092d9aa2ff98718e","src/solid.rs":"997035d54=
c9762d22a5a14f54e7fbed4dd266cdeacbdf6aab7d8aee05537e8ba","src/use_file.rs":=
"16e42eb0a56e375c330c1ca8eb58c444e82ef3ad35230b961fdba96a02a68804","src/uti=
l.rs":"da6964dc1523f1cb8d26365fa6a8ece46360587e6974931624b271f0c72cda8b","s=
rc/util_libc.rs":"a47b20e73637fed248405650f56358f3339e511b217b7ba80e32011d8=
ee2ca22","src/vxworks.rs":"a5aa0e40f890e0f35626458bb656a3340b8af3111e4bacd2=
e12505a8d50a3505","src/wasi.rs":"dfdd0a870581948bd03abe64d49ca4295d9cfa26e0=
9b97a526fd5e17148ad9ca","src/windows.rs":"d0b4f2afd1959660aa9abcd9477764bd7=
dc0b7d7048aee748804b37963c77c6f","tests/common/mod.rs":"b6beee8f535d2d094a6=
5711fe0af91a6fc220aa09729ed7269fe33cafdc9177f","tests/custom.rs":"9f2c01931=
93f6bcf641116ca0b3653b33d2015e0e98ce107ee1d1f60c5eeae3a","tests/normal.rs":=
"9e1c4b1e468a09ed0225370dfb6608f8b8135e0fabb09bbc1a718105164aade6","tests/r=
drand.rs":"4474ccebf9d33c89288862a7e367018405968dddc55c7c6f97e21b5fe2264601=
"},"package":"c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396=
b31"}
> > -\ No newline at end of file
> > ---- a/vendor/getrandom/src/util_libc.rs
> > -+++ b/vendor/getrandom/src/util_libc.rs
> > -@@ -135,19 +135,11 @@ impl Weak {
> > -     }
> > - }
> > -
> > --cfg_if! {
> > --    if #[cfg(any(target_os =3D "linux", target_os =3D "emscripten"))]=
 {
> > --        use libc::open64 as open;
> > --    } else {
> > --        use libc::open;
> > --    }
> > --}
> > --
> > - // SAFETY: path must be null terminated, FD must be manually closed.
> > - pub unsafe fn open_readonly(path: &str) -> Result<libc::c_int, Error>=
 {
> > -     debug_assert_eq!(path.as_bytes().last(), Some(&0));
> > -     loop {
> > --        let fd =3D open(path.as_ptr() as *const _, libc::O_RDONLY | l=
ibc::O_CLOEXEC);
> > -+        let fd =3D libc::open(path.as_ptr() as *const _, libc::O_RDON=
LY | libc::O_CLOEXEC);
> > -         if fd >=3D 0 {
> > -             return Ok(fd);
> > -         }
> > diff --git a/meta/recipes-devtools/rust/files/zlib-off64_t.patch b/meta=
/recipes-devtools/rust/files/zlib-off64_t.patch
> > index 78c8a2a1fb4c..baa9daa7afee 100644
> > --- a/meta/recipes-devtools/rust/files/zlib-off64_t.patch
> > +++ b/meta/recipes-devtools/rust/files/zlib-off64_t.patch
> > @@ -5,8 +5,10 @@ it needs 64 bit off_t
> >
> >  Upstream-Status: Submitted [https://github.com/madler/zlib/pull/764]
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---- a/vendor/libz-sys/src/zlib/gzguts.h
> > -+++ b/vendor/libz-sys/src/zlib/gzguts.h
> > +Index: rustc-1.71.0-src/vendor/libz-sys/src/zlib/gzguts.h
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- rustc-1.71.0-src.orig/vendor/libz-sys/src/zlib/gzguts.h
> > ++++ rustc-1.71.0-src/vendor/libz-sys/src/zlib/gzguts.h
> >  @@ -3,15 +3,6 @@
> >    * For conditions of distribution and use, see copyright notice in zl=
ib.h
> >    */
> > @@ -23,9 +25,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   #ifdef HAVE_HIDDEN
> >   #  define ZLIB_INTERNAL __attribute__((visibility ("hidden")))
> >   #else
> > ---- a/vendor/libz-sys/.cargo-checksum.json
> > -+++ b/vendor/libz-sys/.cargo-checksum.json
> > +Index: rustc-1.71.0-src/vendor/libz-sys/.cargo-checksum.json
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- rustc-1.71.0-src.orig/vendor/libz-sys/.cargo-checksum.json
> > ++++ rustc-1.71.0-src/vendor/libz-sys/.cargo-checksum.json
> >  @@ -1 +1 @@
> > --{"files":{"Cargo.toml":"ce67ce7c1f3c4ad7832d58ed198b8dd745abacc620738=
d575c4b1a9ac9e79449","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14=
d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"34c467b6945a22696d060b8fdd2379=
d464acb3408d4c599d3dc5fe4fa1b4c84f","README.md":"b23e18bdce29fabc3d34e88576=
219f50d1d735a355e427e6d6ebc09254138070","build.rs":"e034f7828ff43a0bb0f7b69=
0e8e99b09b8f4e1ae0560b6fb4008006e9cd4d9dd","ci/Dockerfile":"4d479ea63b9e384=
b3864fa1204894bfae4890017d6bf03486274457fe2c26cf8","ci/run-docker.sh":"0ea7=
a4fdc9f6026110e20fa2e25dbadfc1e6dafed9ded5981ae36772ad207e26","ci/set_rust_=
version.bash":"4284f86ac3923a73dd79e89bef2d0b136c6d104d6dae92e24b4a96eaffa2=
8890","ci/test.bash":"73a936768549eedf96a7cddb350ada128e058d5d9004244ebf3d9=
93363b69599","src/lib.rs":"40476f4e896c936c21f908396255c7a4951ef8bf93788858=
ade6cace2539927b","src/smoke.c":"10607c81b73811bfcb9718767312bf97ba2ccf7048=
ea2f18a2085aa06ad7f91b","src/zlib-ng/CMakeLists.txt":"60b836817b51e5893b1e3=
203adaf57a98678af17957eccaef679bd96bcf5d90b","src/zlib-ng/FAQ.zlib":"d1777a=
a057caeef50fc291aac7a414363b2186bb3d65bb0f8bfa2bfd61cf0ad5","src/zlib-ng/IN=
DEX.md":"989545e90d8e9ac149034f762ce78ed8976ebf9324326228dea37ca190154609",=
"src/zlib-ng/LICENSE.md":"d3c80be055d94d798eaa786116e84fa0b010bc11420b5d206=
0d978ea77845436","src/zlib-ng/Makefile.in":"15027511a77e76b423eccf10ebfe663=
98ea96862cbce2415e5ebac7c7cbb6ab6","src/zlib-ng/PORTING.md":"5cff8c878c7958=
f6a4bada5a403dcc88961c9607826faece1aef202b5d95c550","src/zlib-ng/README.md"=
:"9cac4a98ecf45f50adf5030d4dc58b3cf9f3ae8e3ec78d30fdae4a99a2b4b8d9","src/zl=
ib-ng/adler32.c":"82ffa1b4fc4b198ba8004135f79b8819d9f2b28e851c30c0ab41e6d32=
dfbf70d","src/zlib-ng/adler32_p.h":"f56915c59a345baf4558374447385a317e29365=
a4db2fbb38af4de3e1a1a0201","src/zlib-ng/arch/arm/Makefile.in":"95464884ba75=
a7b12c9ceda5845d8d68d5a7d7dac8a8dc24b27beb2192e5b97b","src/zlib-ng/arch/arm=
/adler32_neon.c":"3990b8d5570b12c2162218fe0e9bc723a03f1c89b5ed3ba70a74a9897=
6260ee7","src/zlib-ng/arch/arm/arm.h":"855adbb02d7b9a5714a17d9dcff493610e7c=
d2b9a1f4e58e1c99626ab536e868","src/zlib-ng/arch/arm/armfeature.c":"dd09ad27=
12b037e8d52173402f39cc2be1bc89d47fc10259ef81b4c64aef7110","src/zlib-ng/arch=
/arm/chunkset_neon.c":"65b70014888e9fbdb89bfbfa52f23b8953dc015466577da292d4=
780b55c5d95a","src/zlib-ng/arch/arm/crc32_acle.c":"5a96afc594697d1399870d1b=
fb0623a03869eff42caae74013f147cec4aa982e","src/zlib-ng/arch/arm/ctzl.h":"fe=
b70d55e66025fff806e30e48002b35cfff79533d352585cfa5f118edbc90b1","src/zlib-n=
g/arch/arm/insert_string_acle.c":"d1b1dae5aeada70f2b03c2cbf3112ce55a92401c2=
d87709081b04dcf5992e1ad","src/zlib-ng/arch/arm/slide_neon.c":"19d8cf5c742ac=
6b82164c7a183538ad1129f9f17e9b8bce8b40daac3820fb6c4","src/zlib-ng/arch/gene=
ric/Makefile.in":"f41a34839986eac8dd52cf91fada0efff4171c059ab5d7db6347c91bd=
6d9db09","src/zlib-ng/arch/power/Makefile.in":"69644d1a0ff8e7f38005c0a55cdb=
af3f0d87f42abf8fc4f4136271c4fedfb846","src/zlib-ng/arch/power/adler32_power=
8.c":"79b75e98ad3a62facbbdd8c0b178d3f993b57f6e34d320bf47eca33aa8c330a1","sr=
c/zlib-ng/arch/power/power.c":"0647afb3b3b7ce2a19b4815ec8fdeee0b37c759413e5=
ef0a668a2dba22d94803","src/zlib-ng/arch/power/power.h":"f3f15f94fed98a2f7dd=
5d4568c5172e597228be4141d6895062703c3f70024da","src/zlib-ng/arch/power/slid=
e_hash_power8.c":"932ea533d25e2f5478afe0c47830e7ef24276cad0d75fd91f2d8c799b=
d4b5d36","src/zlib-ng/arch/s390/Makefile.in":"eef6c3169723f089b0b5f852423ec=
55bf0364caeddd7cda991f2e76bc1682107","src/zlib-ng/arch/s390/README.md":"4f5=
018cb7c8ee217710a90193088889a15f1675d205a104140f6a1ac07ce412c","src/zlib-ng=
/arch/s390/dfltcc_common.c":"6771ec4457da9f4b00c74bcc0828735e21c74b9162cb37=
383c297c3b5028cddf","src/zlib-ng/arch/s390/dfltcc_common.h":"ed339007feae58=
d1879e096addb30ed86cd5cf11222db22c45f48b47328cf6db","src/zlib-ng/arch/s390/=
dfltcc_deflate.c":"7b3dec7be4055c7748defc626dc91db99787c9f3b70b7d7b40282558=
bbb478e9","src/zlib-ng/arch/s390/dfltcc_deflate.h":"c4c411f221cc0f6b218326e=
973fef05c65840ba49878aff052dac0bb38121cbd","src/zlib-ng/arch/s390/dfltcc_de=
tail.h":"01dbdfaf5e8ccf522663b4daa76e9138dde514292c35a623be4bcbbf4b82dea2",=
"src/zlib-ng/arch/s390/dfltcc_inflate.c":"a96226eba3538d3904893cfe1b0839566=
8e6a722b56f28d5b5debb3176161b4b","src/zlib-ng/arch/s390/dfltcc_inflate.h":"=
d7a4a5ae79abd1a5456521926b918becfe86c253a4fc23723fbc09f7c3303128","src/zlib=
-ng/arch/x86/INDEX.md":"c12f9bf0d66743a6472fb756bf46def8eea1dd235be7fca994d=
cb22f693a3524","src/zlib-ng/arch/x86/Makefile.in":"9f6fe7567a99e81aaa3bef8c=
cfa1ad40f524efc285cf8dfe0f497a1530f8016c","src/zlib-ng/arch/x86/adler32_avx=
.c":"99056732c7bd5d53dc108f282811a40bf21570926781af5dc7b17cb9218963de","src=
/zlib-ng/arch/x86/adler32_ssse3.c":"883a5520b4481225d097c90c5359106a3c8eb7b=
921499c94276e999b7c39adc5","src/zlib-ng/arch/x86/chunkset_avx.c":"15060e7ee=
487fb1daef9be25343ae387392276933921e4b4db0c67831dc0854f","src/zlib-ng/arch/=
x86/chunkset_sse.c":"f7ccb55b67101ddb9def951a6d6f9dd4cb108fdd9e65f0f21d8272=
3d1b093a22","src/zlib-ng/arch/x86/compare258_avx.c":"8b2838d168de4608327f25=
fe52d53763a82413ee911d87947d3fcd72c7f9bf26","src/zlib-ng/arch/x86/compare25=
8_sse.c":"b5049722ffd4a43a96868eeba5e000271cfc5fcbf3c2657026ead15b1df28a10"=
,"src/zlib-ng/arch/x86/crc_folding.c":"75199cdd06ec2f8f43bf38583b2c4d98bbbb=
d924e659267fdc1fa5134f1472eb","src/zlib-ng/arch/x86/crc_folding.h":"9392125=
46611917e9e066e8ed30cdda95680ec1f5fe0890cc4865b4e6d7fc215","src/zlib-ng/arc=
h/x86/insert_string_sse.c":"9e84a75b6a565422eb105261b6729d2a02b89133bd14372=
c949d5381b5deed3e","src/zlib-ng/arch/x86/slide_avx.c":"5e448e439ac24e7cb10e=
ee176ca37f2c63f73c135c0a2af040e232bad490997d","src/zlib-ng/arch/x86/slide_s=
se.c":"1946cabb634c905fddef0a22b2fad19dfd99110169567c3beceef71145b2e316","s=
rc/zlib-ng/arch/x86/x86.c":"1af56e27b2e951e1ad1344e62c2f7a8c49a776fcdd1cb0f=
4ea9d6152118a479e","src/zlib-ng/arch/x86/x86.h":"4d2d20ea0087089141e250e77b=
b3d419954b9092810028b151581b9115a5fe8c","src/zlib-ng/chunkset.c":"c0dbc7abb=
dad5137a9efb2b0a76a212e77d4bf44beebe721c68359fa83002ff2","src/zlib-ng/chunk=
set_tpl.h":"35d15e97bd72d4e03dcec3ee804a08ea6a74faac2ef835caecc0e38bc9daf0c=
0","src/zlib-ng/cmake/detect-arch.c":"a9509327c2f4395955466b0acce453c29592d=
4686022714cb9e8b411d7e60c29","src/zlib-ng/cmake/detect-arch.cmake":"9cbb09b=
297f79e94b55fffb9acbafbee8d6761e854d818f1a0c686e3fcddf574","src/zlib-ng/cma=
ke/detect-coverage.cmake":"e4e372991ba80a16ad47df2716708a56013cc628aa7ed015=
73a2360c60610125","src/zlib-ng/cmake/detect-install-dirs.cmake":"87031a4042=
8a104f5cf38ecdb8a5028d8c679cfa772a58adde8380c809b34eff","src/zlib-ng/cmake/=
detect-sanitizer.cmake":"5e6fe6d2d877540811313f0c8e9884adb21a9ace2e24f23190=
f0fac1d52dd2b8","src/zlib-ng/cmake/run-and-compare.cmake":"dc45eeb6d3e48540=
49834ec1ec2891342646c7fb803a0b6c2644d6316f89b668","src/zlib-ng/cmake/run-an=
d-redirect.cmake":"2de9c784da3e04331465a3c56125b9c7d8e74b898b4cf85353aca196=
f90ea9bb","src/zlib-ng/cmake/test-compress.cmake":"3f37319963a80a31f752fca1=
c82571d552fd4701326bc40fdb02b54ec3f7a3f0","src/zlib-ng/cmake/test-tools.cma=
ke":"4dcf099245085ee2b6d8ec41620bca3f7b718365dbb9bb0ad23931e83bf36aeb","src=
/zlib-ng/cmake/toolchain-aarch64.cmake":"8d7ba07ee1cb9fbc7817da1c5e74ce6c85=
ff81c10962a33941f0e24471956e59","src/zlib-ng/cmake/toolchain-arm.cmake":"0b=
0ab2b1093ef851c3dbd6fe53f855628df0778841a488aaef85d2c70f04a257","src/zlib-n=
g/cmake/toolchain-mingw-i686.cmake":"6551576324fed6ccedffcfe8da762402dc863c=
20a2789a9b0030b9d32e15a15f","src/zlib-ng/cmake/toolchain-mingw-x86_64.cmake=
":"ec7bf5c8640fb61d2e30f8db7b588ca9b66da92d4a59e88ce16c5fc7f9ce02b6","src/z=
lib-ng/cmake/toolchain-powerpc.cmake":"6373abe883a99616aa51422a9b714894dc52=
1211be49502463576f58d3d26b2a","src/zlib-ng/cmake/toolchain-powerpc64.cmake"=
:"328d1ea039a30e03ee9a552858b9f180b3da2614b712f618da1a0fa98f30a53b","src/zl=
ib-ng/cmake/toolchain-powerpc64le.cmake":"ec90270bd1f4aa649abddddd2618168d3=
99d58a1c1c35b3d8d909e570eb9be1c","src/zlib-ng/cmake/toolchain-s390x.cmake":=
"cb634252c21c4f55d06cdc49ce522a5546aae592daa0f12aa4282c0aef323828","src/zli=
b-ng/cmake/toolchain-sparc64.cmake":"d70d39760a23886ebd1c5a1a87651bfb47a9b2=
4def9e7955ee1cbec60b40925b","src/zlib-ng/compare258.c":"56bfd48d5ff9ca422fb=
b728df7a373436c73796561dff118c7d4039fe70d29e2","src/zlib-ng/compress.c":"1a=
bf5b13e3e805becc14f4f16dad9bf816f4fe41754b1abf75f670dcc84567cc","src/zlib-n=
g/configure":"681d5b1303aab0523334c90ff049757e7ee6b2683f2411204b7245ba4adca=
4b2","src/zlib-ng/crc32.c":"98440be8a99381151a2d740f2e2228e8c1b23b9193c3642=
c52a4e34799506336","src/zlib-ng/crc32_comb.c":"78cd1a3d31963bfa5bd9d476250b=
2bb7777b12b6ebe0475acf021ca794757165","src/zlib-ng/crc32_comb_tbl.h":"d6615=
d209d6c7d5248c6f7fe4e5dbded13c0eb87997b37693032c2902927407d","src/zlib-ng/c=
rc32_p.h":"1fa91375a18e090c0a0dfda39de3df36346a0b1be36c808be6b6c29c32eba922=
","src/zlib-ng/crc32_tbl.h":"d629378ba38ff5775095b64e277bcd41c4b89fab9b5647=
a9fb29e15da0db0161","src/zlib-ng/deflate.c":"1a5ff34bf68b88e30f578ce7b15dd9=
96c05fed7bf42f58f4616af470ee18f103","src/zlib-ng/deflate.h":"a074e9a5dd5d68=
9db63655251d6a0948e7a7c0c4a4f6d0ca60bfe18291f3c34f","src/zlib-ng/deflate_fa=
st.c":"b3b261b3a02b089599fcd9448965ef5d8e8b0e8e9556857357c9632930c7c748","s=
rc/zlib-ng/deflate_medium.c":"1c3d95cbac76052d39595ea750c5536541c18302b9abb=
398c27b58955318bba8","src/zlib-ng/deflate_p.h":"95026b1b48aa78204381b32617d=
d44e8c820c9bb21b415ebfcb33e6b5255233e","src/zlib-ng/deflate_quick.c":"28090=
5a191d2b2a7274f2453ac537e01a0fb6e7540a0b212c1514bfb8c9415ea","src/zlib-ng/d=
eflate_slow.c":"a2c66723e1e71ffd6ff856407459ab311a4c6546ecf50285081fc7afcd0=
ccd2e","src/zlib-ng/doc/algorithm.txt":"992590931e982c0765286c2d83f6e9ff0a9=
5aabb08e28c30c52bae3e8c4bd5ad","src/zlib-ng/doc/rfc1950.txt":"8f0475a5c9846=
57bf26277f73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","src/zlib-ng/doc/rfc19=
51.txt":"5ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009",=
"src/zlib-ng/doc/rfc1952.txt":"164ef0897b4cbec63abf1b57f069f3599bd0fb7c72c2=
a4dee21bd7e03ec9af67","src/zlib-ng/doc/txtvsbin.txt":"47c273bb22c9773248d38=
0549a330e5c262266b1292154b0d3014f731cc73f47","src/zlib-ng/fallback_builtins=
.h":"f07e83c5c444554577c4240ff7722057ea2a689f6baa0f9e8bda32b9a46888ca","src=
/zlib-ng/functable.c":"d3747a4674ddbc903ab1d06efe63a1c4b52bf42f7dd38cde3701=
fa82b1d953f0","src/zlib-ng/functable.h":"e5a2d0c10411d23f04295bcb9ddb988938=
8974b723caef65aa5c4ea4739f4aa7","src/zlib-ng/gzguts.h":"cbf2afc8a6183002254=
a73cabe8376e54b1aea2ba042e36138f292c9cdb95d5c","src/zlib-ng/gzlib.c":"5b5be=
a4f319e5d0a96b92aa431fb33926686cd20686c90d75e42e1481872bbcf","src/zlib-ng/g=
zread.c":"fc4a187ba45ceb7b4b50f4f8dedc7685fe8687e6f034638a6437bebf71d51a13"=
,"src/zlib-ng/gzwrite.c":"7c86058ae23f856c099e2663a5676c97cfa4fb5df9b92893c=
94076ba4aa9a56b","src/zlib-ng/infback.c":"97a35de1a3d3bec50e112853e03bf1628=
cbed3b0fb84459cc423e3f9f61fbea7","src/zlib-ng/inffast.c":"701519ee11d39cdf4=
e808395722415c42ff2be9445f66408fd879370f3242b57","src/zlib-ng/inffast.h":"4=
2e74a92b496ab0726be317e8497a12bf3c3cf3d0d533440ce65befd3929c71c","src/zlib-=
ng/inffixed_tbl.h":"a94225335396245e9f0ccb2e9b4b334fe7ee0111ed8e32a26bcd521=
87f364314","src/zlib-ng/inflate.c":"a665bf717ee257a16a8ab993241f2cf9e71d498=
82addddb9518b88186f82a5cf","src/zlib-ng/inflate.h":"eb25527d1bdedaa45167926=
dce4c39d9aaa3147b0f4a95f38f5916528c30a09b","src/zlib-ng/inflate_p.h":"4a94c=
51194da119770cf662ef289994f0c78d95184d54d6ae5d50a393e8f5a62","src/zlib-ng/i=
nftrees.c":"d1d88f98f9129c87f3ce1d6de5bea3ec867de23b1b2bdd585257d231aac82a4=
f","src/zlib-ng/inftrees.h":"624c6653a454447c6274adf922430a19c96ef73c7687e4=
559d247ff48970bab5","src/zlib-ng/insert_string.c":"aa22ba53a1e7582149980927=
7f9ca0e5ef92b07a618136dd11ae1734e233b7c9","src/zlib-ng/insert_string_tpl.h"=
:"1ceba9903324d10aad6e1d83653c4d534a5b06fd09076414a06215482be00bac","src/zl=
ib-ng/match_tpl.h":"eeab4c6eea8511a7579738e622af062ad16f4016312e93ad34bc590=
3d8b3c4a1","src/zlib-ng/test/CVE-2002-0059/test.gz":"60bf96b8f433bd7e057ce3=
496aceaccd70ec80f596a4aa8bcc7786056705ce66","src/zlib-ng/test/CVE-2003-0107=
.c":"1bfbc88dc501cd92b8b26bd8944af6b150b376ebfe7241d90e2b93109be3d68c","src=
/zlib-ng/test/CVE-2004-0797/test.gz":"38caae524705f676bde13a8df9fc8c7d2fe10=
5ba6bdbab62a405b0276fd3aa2e","src/zlib-ng/test/CVE-2005-1849/test.gz":"e4d5=
a60617df4b5dd44eda94751ce1eacdb325792bba6e3cc4676719a3adf742","src/zlib-ng/=
test/CVE-2005-2096/test.gz":"8f702d4861aa3ec98ac03a59ff26b430939630cb5cd426=
6d2658d3b836d576f9","src/zlib-ng/test/GH-361/test.txt":"358497d0a7251ea4210=
1dc77b02337f46fd89af09643a8288e2a3082e5d24128","src/zlib-ng/test/GH-364/tes=
t.bin":"af5570f5a1810b7af78caf4bc70a660f0df51e42baf91d4de5b2328de0e83dfc","=
src/zlib-ng/test/GH-382/defneg3.dat":"b22bef6b7392401c9e7b079402c4a4074053d=
7a914d050400e37fd7af6fe26d5","src/zlib-ng/test/GH-751/test.txt":"b83d833803=
b7bc3124fb2a0034081f0b999ad10c33a8dfa3bfd181dc078ae3ee","src/zlib-ng/test/M=
akefile.in":"c3b6a1ec62838c140a78bc361448d5739756bbfa3bbbf1ffa64c3425999497=
01","src/zlib-ng/test/README.md":"fc485cfaaede6b3d3dc61fdd17cc7eee715c35d6f=
62e6e502f9251fd1b5edac9","src/zlib-ng/test/abi/ignore":"02aa87f77656dbc1fbd=
dd23f436cd15465a92df0722da4055cae1bc8bf013097","src/zlib-ng/test/abi/zlib-v=
1.2.11-arm-linux-gnueabihf.abi":"f5e91f25b558a891fecbeb6e2e9575698630ab700d=
055a38f3bc4fe66257f513","src/zlib-ng/test/abi/zlib-v1.2.11-x86_64-linux-gnu=
.abi":"038337383cf780587d810cf5400d632f3a1f8517e63ac4a71b6e5224db8b1413","s=
rc/zlib-ng/test/abicheck.md":"fa5d6d33ff0fd95eefb7c6c0c7f67351282e6eda20c4e=
38842235a610cc10382","src/zlib-ng/test/abicheck.sh":"b23ee3678acb24caf36fc8=
402a07452de73c50640ebe641f185c7f9d5ea257e7","src/zlib-ng/test/adler32_test.=
c":"db3e8ad9a4e2ecce0c052b0bfe19834d3ff2fb2e9239cc3438a2c95db00b1d21","src/=
zlib-ng/test/data/fireworks.jpg":"93b986ce7d7e361f0d3840f9d531b5f40fb6ca8c1=
4d6d74364150e255f126512","src/zlib-ng/test/data/lcet10.txt":"938e69e61b3411=
d8a9e2e630f4265000d810f3dbf66bac58cac19493753526ec","src/zlib-ng/test/data/=
paper-100k.pdf":"60f73a051b7ca35bfec44734b2eed7736cb5c0b7f728beb7b97ade6c5e=
44849b","src/zlib-ng/test/deflate_quick_bi_valid.c":"0e00da0e048c46204c39af=
f4b8fb79890274d3c6183a9409aefd5c93e4e92a48","src/zlib-ng/test/deflate_quick=
_block_open.c":"455bd347bb88debdfacb409846170274991ec9ba71c52b8fd0e526daf57=
265eb","src/zlib-ng/test/example.c":"8bfad1221a8df5b6202e11f6be4bae5dbccd8a=
24fb7bbd8dd88e7ecd318907e7","src/zlib-ng/test/fuzz/checksum_fuzzer.c":"3a15=
479f2cb40b6c5760dadb246328fab7315f3e3b8e28c1bc246c9b9a867c69","src/zlib-ng/=
test/fuzz/compress_fuzzer.c":"1ab70608075c4bc60f89aa2f327cff88362ee7b1d31da=
88ed54ca51e5f99e5c9","src/zlib-ng/test/fuzz/example_dict_fuzzer.c":"0426210=
53050f0fde90a0428cd1afabda8cc7c3fa59e3e0a55c43ab1e03d3988","src/zlib-ng/tes=
t/fuzz/example_flush_fuzzer.c":"f12246a184dcfe0a19a98cdc742a1fe8da388ad20b4=
06635d63f1fa10d45b9ca","src/zlib-ng/test/fuzz/example_large_fuzzer.c":"f490=
abcd332fb4e7921292adf6876d38d7f71c8d2443212c781ba88957ff9303","src/zlib-ng/=
test/fuzz/example_small_fuzzer.c":"a9b3436b291ace821b6013311a1100e19a9e1c67=
fefd3f97dbd60688f9bf22b1","src/zlib-ng/test/fuzz/minigzip_fuzzer.c":"7b0e7d=
a9b6c60f3b3a13f140cc445050d9e8958d4f59cbb9a498c08f3a53adab","src/zlib-ng/te=
st/fuzz/standalone_fuzz_target_runner.c":"306e8ac4e08ea72d18ffae8c908abfef8=
c6feedf83b068a7ec675ade6a5791a8","src/zlib-ng/test/hash_head_0.c":"d88105a8=
0e756b7206a20c7b2490a2e7e743a2ceb1f20d3e433ce9848f054e1b","src/zlib-ng/test=
/infcover.c":"b9acffc102fdd140941073ca47e30c938aa937b4929061500c36ffba12c86=
449","src/zlib-ng/test/minideflate.c":"93de8ffcbe7c414abf3ea36acdf729bcedb4=
0393ec7bd10b356ebe225406e173","src/zlib-ng/test/minigzip.c":"291e2ea30778a3=
e829b96cb47211e89494ece036cd74591178710b4276c9b48f","src/zlib-ng/test/pkgch=
eck.sh":"75b3155125f235e27ee434d76b6f72bd825899b55f6d59ef2d032fe67a2896ed",=
"src/zlib-ng/test/switchlevels.c":"c30ae3d27ce6041934532553719622e7ed473541=
aa7bdad8d11d0c55e5220f14","src/zlib-ng/test/testCVEinputs.sh":"5de6198444c1=
6726f8e0a8f2beb5b89c5ae7e7e3736ce760b9fbc719493e7e4f","src/zlib-ng/tools/co=
decov-upload.sh":"ec7a8f1405820810e486e3d7e2fda7eb958c17877b0000b93abdf09d8=
7732a2f","src/zlib-ng/tools/config.sub":"32186cfeb5db62c99e1dfbfb07f24c1a50=
977447b4c26d2907021c74422a70d2","src/zlib-ng/tools/makecrct.c":"55c8f7b8e29=
393e95988a29de8cb1a1bdf2738a69d53627bd0f9d7bf169bf0a8","src/zlib-ng/tools/m=
akefixed.c":"bffd02540231304f9bcc755b8cb9ae5cfbc48975857bbb4547f1d6acce21ef=
57","src/zlib-ng/tools/maketrees.c":"2dbfe34691dde327618be496b380fc91daaa30=
474352815773a8b70114b0541a","src/zlib-ng/trees.c":"956ce5b3f3330320cb5baadb=
f7721572259ec41edc4d8c132a20888b7f6f60c3","src/zlib-ng/trees.h":"24174f3543=
b01ee1ef370bbf6d15551a21871cded18b2aadf09a71e7904b6f99","src/zlib-ng/trees_=
emit.h":"f68904e04caee0482c72ea92cc775cabe35a0bf7cffce85566c15ace27666af4",=
"src/zlib-ng/trees_tbl.h":"35f4fd0ec080c1ade342e2dd1b0f5cdc7e9f18990faa48d7=
a8a69bc318ebe607","src/zlib-ng/uncompr.c":"4ebb486b27930f8a6ec4a3cc90a207d0=
bcf8a4779d1dbf3b2184a2b2a5735cd1","src/zlib-ng/win32/DLL_FAQ.txt":"d2ec63cb=
4a51886e0813f75bca49a051bede364d855f938e1a7992ab97a79800","src/zlib-ng/win3=
2/Makefile.a64":"775d6902373d1583430b5d7467f001746be323610c89be27e02bbfe020=
5994f3","src/zlib-ng/win32/Makefile.arm":"7535e022f482920c3fa7a267e84e39ad7=
90d150f72e5c30414baa156c2fdd9b6","src/zlib-ng/win32/Makefile.msc":"deee44d5=
624890e692d87db311216075e967c3ac8aeea6ffcdcac3d03eea260b","src/zlib-ng/win3=
2/README-WIN32.txt":"a8c2d052960b963a49cee5a2ad891f2ff7b34db038f00985eba4ee=
fc99966261","src/zlib-ng/win32/zlib-ng.def":"f240276caf805a10d024fc6a66efe9=
15c435734c69732818d92fb04d08ab350c","src/zlib-ng/win32/zlib-ng1.rc":"b567a2=
76407998bae40aacd48a50beba87c0bfbae470d28e66331ac99eb575c8","src/zlib-ng/wi=
n32/zlib.def":"d9c371ff2677567350386441a2e3d0258010d6502290bbac5ac42ea168bd=
5212","src/zlib-ng/win32/zlib1.rc":"d7f269379144d65bcd1b67c1065e5d4120579f1=
4ce54ecf246eaba394fa989a5","src/zlib-ng/win32/zlibcompat.def":"73728b9df437=
9dc70ebd9b2a9f20d6e4ed7c031fa1f351cdeae1de7d1db05bd1","src/zlib-ng/zbuild.h=
":"f73424f5f10370ffe8f45f6e3dc52dd095ea778153832461d712a838e3a01098","src/z=
lib-ng/zconf-ng.h.in":"708106f26c4a0d877e2ea644320a2b48b144524b61429c7490e2=
e742a0c0c1e4","src/zlib-ng/zconf.h.in":"dacec2360fd9607f85bdf651409fa3831dd=
26f74414d242e812b06c3b9c9926d","src/zlib-ng/zendian.h":"f5cfa865281d2c5d0b0=
97d318500f27daeec346e7882de68e279486d79c52e77","src/zlib-ng/zlib-ng.h":"7a1=
5bda0297b2611da695f895cc57ce44c284b030fe98817281e868a1a86ae35","src/zlib-ng=
/zlib-ng.map":"e8202981574d814cb2a9f06bca7900d0959c24766bd86681bd3843ab0e71=
f8ef","src/zlib-ng/zlib.h":"703bead0c02381c8df8d14d805fde913973b2960811f35e=
2de4f4aaf29ad905c","src/zlib-ng/zlib.map":"e3549810f821d433d57f921ca2fceb86=
74574f778485255a7dc691bf26b5281b","src/zlib-ng/zlib.pc.cmakein":"17668e07ed=
be5971043bea26a2f2b92c4c7cf4724620f1156f3ea1436d2aac93","src/zlib-ng/zlib.p=
c.in":"cf94c9aa44878a62e27c2f75354c08326b3bb5250a9b11496855cf59691177bb","s=
rc/zlib-ng/zutil.c":"7544aa2d2cfce4693d4e2a639f0631c3e8b3e7d0d846313be0e250=
c477e6812c","src/zlib-ng/zutil.h":"c0e9152d078ca1774c93910fd84531b2f593b3a6=
b1035e4d97a0d28b720ec98b","src/zlib-ng/zutil_p.h":"1e5a2fb8d15212ad094e9a5d=
5f607f11f8191498b54e0af48d722f92d9c71ffd","src/zlib/CMakeLists.txt":"b87275=
731cc3ebdfea144187875cea204f555c343279c0f35f2d46d661bfe34a","src/zlib/Chang=
eLog":"4c9f1a65b9b4be8bf164a97775ef50e4db4e02ea8c9933fdbe629a640691375e","s=
rc/zlib/FAQ":"1e8a0078be0ff1b60d57561a9e4a8cad72892318a8831946cba1abd30d655=
21c","src/zlib/INDEX":"3b4e325d47ae66456d43fcf143ba21ab67a02a4f81be7ef2da48=
0ba30d774266","src/zlib/Makefile":"ef23b08ce01239843f1ded3f373bfc432627a477=
d62f945cbf63b2ac03db118a","src/zlib/Makefile.in":"5021b2bac4164f48b17c91c8a=
2e3c225be7ad31d8bfab1bbaadd90370afe9991","src/zlib/README":"7960b6b1cc63e61=
9abb77acaea5427159605afee8c8b362664f4effc7d7f7d15","src/zlib/adler32.c":"d7=
f1b6e44fee20ab41cef1d650776a039a2348935eb96bcbd294a4096139be3a","src/zlib/a=
miga/Makefile.pup":"a65cb3cd40b1b8ec77e288974dd9dc53d91ed78bbe495e94ccc84dd=
d423edf1f","src/zlib/amiga/Makefile.sas":"0e63cf88b505a1a04327bb666af3a985c=
5e11835c0c00aed4058c0dcc315d60e","src/zlib/compress.c":"5c11e1fc22e219cb986=
f6fa9e4ba939315227e84aef042737d38ec668b89b6d2","src/zlib/configure":"86b38f=
27f31d2fec76d9355872550dc63cb3949774473fd6313c5a3fd1def0e2","src/zlib/contr=
ib/README.contrib":"ca39b78bd7ad84f1df7b0da90770c5b3fa4c8e2c75d132e9222812f=
ac8839630","src/zlib/contrib/ada/buffer_demo.adb":"469cf566a6965767fee6b987=
a239ed8cedcc66614940d45a9b434331fbb435ce","src/zlib/contrib/ada/mtest.adb":=
"41b6f31684770334afdc4375871eb1408542f37a823a073556fdbfdb63753160","src/zli=
b/contrib/ada/read.adb":"fa5b989aef0c5715a3fcb15de93985f7f10aeb0a7f5716745c=
95ed820eb9af9c","src/zlib/contrib/ada/readme.txt":"8fe9e5303f2e8e8b746c7825=
0e74b7c4aeb7ce6212fdce751fc3a0ce56a47fe2","src/zlib/contrib/ada/test.adb":"=
5e3abe79b387e09a9a42bd0543105e228f39a335240cffc33d71f0ba66ff2511","src/zlib=
/contrib/ada/zlib-streams.adb":"f45988e2bac76eb25a0dc981f46576e7432c35dde17=
90bbc2b650f0090b7fa72","src/zlib/contrib/ada/zlib-streams.ads":"969e8edb061=
1810fb52159dcb7c40228f4e5da810a7a3576b778116a93038c6b","src/zlib/contrib/ad=
a/zlib-thin.adb":"03d89244ee5ec9771d9b5050e586c609f851af551b2e64eb151f1d5be=
0b63ae9","src/zlib/contrib/ada/zlib-thin.ads":"631ef170bde16c3ca8d412b54a0e=
519815b80197d208f8f393e6fe017bb0968e","src/zlib/contrib/ada/zlib.adb":"c9ca=
5dc34fbcdf06e2dc777b7e9dcd0ba31085b772b440eb0e12421323ab672c","src/zlib/con=
trib/ada/zlib.ads":"02634bec0d5e4c69d8d2859124380074a57de8d8bd928398379bfac=
c514236d2","src/zlib/contrib/ada/zlib.gpr":"859bb69dce38dbe9dca06753cf7ae7b=
d16d48f4fece8b87582dab8e30681d3de","src/zlib/contrib/amd64/amd64-match.S":"=
166007f7e9adb58fe8b83d85bbfe823f5e05858ba1d06edf637b78886caa2c69","src/zlib=
/contrib/asm686/README.686":"c21cc7147c956ecae17dd084cb41a206b086216fa52101=
2871fb07fafd203c6d","src/zlib/contrib/asm686/match.S":"873799062495629f21cd=
3f779ea4b927add7aae0144e32d3594d9ce70185e99d","src/zlib/contrib/blast/Makef=
ile":"17d5d26c24bf51cad51045a38ffb73cc3539d29e89885aa249fcfd45a8659d5c","sr=
c/zlib/contrib/blast/README":"baa763ae03d88ef7ece6eb80d9a099b43d0b57639d6d2=
81e1c7c6ca79d81daba","src/zlib/contrib/blast/blast.c":"1ab3e479d342bfc14416=
7b808fb00142264bc50f24a110ca88cc774e351c218e","src/zlib/contrib/blast/blast=
.h":"4d4e3e6f893316f0be77bfd642c857a77f1fa2925acb5df9753e543d35aa3a6a","src=
/zlib/contrib/blast/test.pk":"5f5c262c545574a5c221132d5ef832478d222d70b0153=
41795b3860204140d7c","src/zlib/contrib/blast/test.txt":"9679b2c98e1283222d0=
782b25a1c198dc64ba9ebd1addd6dc6f643a45947cda3","src/zlib/contrib/delphi/ZLi=
b.pas":"1b20e173443a68c189cdaa4795620fb1ac165d9e61a27a1ed2cf690f13530d6f","=
src/zlib/contrib/delphi/ZLibConst.pas":"84bcc580bdf397e570f86f3f5a5b8c7bf53=
7828f30b4b72648b81911f6bf5095","src/zlib/contrib/delphi/readme.txt":"f7420e=
d2de77d4b498eefbbe6402a1d17dc2d411735289c78a265c7f10fdaee5","src/zlib/contr=
ib/delphi/zlibd32.mak":"850e91b6c9ea05de61a411cbda16fa0f10118cd88bb32c4b722=
6988776f8d511","src/zlib/contrib/dotzlib/DotZLib.build":"b96137097669644ecb=
9f42cdd3399d1fce9c512788374609303f7e50abf597f0","src/zlib/contrib/dotzlib/D=
otZLib.chm":"20d0e3edd57f849143255a7f0df1cd59d41db464a72c0d5ab42846438a7295=
79","src/zlib/contrib/dotzlib/DotZLib.sln":"a979198c5b8d144c1ac8f993bfb6f40=
85d135aa58ca9dcf63ebabf52b5c695f7","src/zlib/contrib/dotzlib/DotZLib/Assemb=
lyInfo.cs":"314afcfb339ea95f5431047b7ab24631b11c3532c7ce5dc2094ed0cf80a7c16=
d","src/zlib/contrib/dotzlib/DotZLib/ChecksumImpl.cs":"e7c047a2c3bcf88d3d00=
2ee3d2d05af414acf53cb4451efacc0f2e95a474ea0f","src/zlib/contrib/dotzlib/Dot=
ZLib/CircularBuffer.cs":"be84c9736fe7bdc2bfae70466d8fff582504e928d5b5e110fd=
758090090c8cb7","src/zlib/contrib/dotzlib/DotZLib/CodecBase.cs":"259bdda1b7=
d6052134e631fa24bfd9dca6e2362563496c8b85257b56c848908c","src/zlib/contrib/d=
otzlib/DotZLib/Deflater.cs":"06ba6696a3c15c53ba5fd5a1c2bf50b51f217010228fc1=
e4c8495ee578f480de","src/zlib/contrib/dotzlib/DotZLib/DotZLib.cs":"9837fe99=
3fd631233cc5e53ff084d86754b97f05ec77c54b0764c2706f186134","src/zlib/contrib=
/dotzlib/DotZLib/DotZLib.csproj":"21606db31dfef6410dd438b73f1db68856eacabcc=
e6c0f0411fc4f17e17001f3","src/zlib/contrib/dotzlib/DotZLib/GZipStream.cs":"=
8d1de9755c77046b4ac71340a0a54434ebf4fd11b085c44454d7663a9b4df1c5","src/zlib=
/contrib/dotzlib/DotZLib/Inflater.cs":"9016ca73818f5b6a28791abc3af6da7c4d27=
73b6a3804f593f6d5737a62b99ad","src/zlib/contrib/dotzlib/DotZLib/UnitTests.c=
s":"ad66ac08de34d253e9615b96a745f3dfeda93f4a978d65d5d3ddb9d0d9b3e099","src/=
zlib/contrib/dotzlib/LICENSE_1_0.txt":"36266a8fd073568394cb81cdb2b124f7fdae=
2c64c1a7ed09db34b4d22efa2951","src/zlib/contrib/dotzlib/readme.txt":"d04972=
a91b1563fb4b7acab4b9ff2b84e57368953cc0596d5f5ea17d97315fd0","src/zlib/contr=
ib/gcc_gvmat64/gvmat64.S":"22ff411b8b1d1b04aeaa8418b68245400267dc43c6f44104=
f6ccd37f0daee89f","src/zlib/contrib/infback9/README":"890288f02bb3b1f9cc654=
b87a07fcea695f90f6b9bd672d25bf6be1da2ec1688","src/zlib/contrib/infback9/inf=
back9.c":"0a715c85a1ce3bb8b5a18d60941ffabc0186a886bcc66ba2ee0c4115a8e274e9"=
,"src/zlib/contrib/infback9/infback9.h":"dda2302f28157fe43a6143f84802af1740=
393572c2766559593996fd7a5a3245","src/zlib/contrib/infback9/inffix9.h":"84a2=
ba4727767c18af6505f0e81d9c814489c8b9ed330a25dad433db72997e43","src/zlib/con=
trib/infback9/inflate9.h":"32a907676cc36e27d0fdc0d99adb83a0b23f20ab61896269=
216d40fecf08d349","src/zlib/contrib/infback9/inftree9.c":"0c7f10396703b230c=
504207fe1595a2f2f8ba9c43158c4bd79d5b22ca36e04e0","src/zlib/contrib/infback9=
/inftree9.h":"8ae61d52e50d2dbdb0378548ecc54fcd88f108c8b6fc30562a3ebec1ca6a5=
99e","src/zlib/contrib/inflate86/inffas86.c":"6f266f3c7e0faca653256d0189c0f=
00d7dc0b062d02e25df4e1202e49369595c","src/zlib/contrib/inflate86/inffast.S"=
:"70777bd21526680005fc34f086d108af49e2668ad86d1749e8e8100a81bfb288","src/zl=
ib/contrib/iostream/test.cpp":"0f3c77e013949eb9c91e6b690ea894e19d97944d6b08=
85b82806fc3ad99680cf","src/zlib/contrib/iostream/zfstream.cpp":"8ebb9b3d521=
cc3392953f27658cf1f6dcb763216079f69a1518ec5ca0e42a63b","src/zlib/contrib/io=
stream/zfstream.h":"4369c35e66f63f52ca4a5e1759bf720507ccabb8f3f132e2f18e686=
86c812401","src/zlib/contrib/iostream2/zstream.h":"d0343e0c57ff58008b6f2964=
3d289c72713aa2d653fe3dcd2e939fc77e7e20b6","src/zlib/contrib/iostream2/zstre=
am_test.cpp":"f789df183cc58b78751985466380c656308490a9036eb48a7ef79704c3d3f=
229","src/zlib/contrib/iostream3/README":"43ec48ecbd95a8c45db20b107fac73b74=
0bb11595a4737329188f06b713972cc","src/zlib/contrib/iostream3/TODO":"af5ebc8=
3fb88f69706c8af896733784753dead147687e1c046f410c0997fd88b","src/zlib/contri=
b/iostream3/test.cc":"8e17fc48dfdbc6e268838b8b427491b5843b6d18bc97caa6924de=
9fad7abe3da","src/zlib/contrib/iostream3/zfstream.cc":"8cdd67ed0b13c192c11e=
5ea90e9d5782d6627eb303fbc4aa5ebda2531ec00ff8","src/zlib/contrib/iostream3/z=
fstream.h":"1bd74778fac45ee090dfc0f182a23e8a849152deb630606884b2635987b357b=
1","src/zlib/contrib/masmx64/bld_ml64.bat":"1c0561908a07ebdff271b12ed757241=
e1813d3db0f3551501b2595c23f0833aa","src/zlib/contrib/masmx64/gvmat64.asm":"=
390c1e6d63cb615b5ba042842738953f9cdc688b2fe35aaca981fd3fae213f3f","src/zlib=
/contrib/masmx64/inffas8664.c":"f6c585e43e6e524107566b1f10104949d0ef902159a=
c8203e1d98e50d4bedd62","src/zlib/contrib/masmx64/inffasx64.asm":"8448d0041f=
e6e8f4188fe5916181a1b274c6d35d75cfb28da60cf4f1edde44ec","src/zlib/contrib/m=
asmx64/readme.txt":"9bb66b5028100855683853f12da0be479c7bccf74365fdbf37da254=
2edff9927","src/zlib/contrib/masmx86/bld_ml32.bat":"b0b05b62715d4a81a7db5b7=
ca4a372d109ec95634c9d3bef9e0041ff52de22fc","src/zlib/contrib/masmx86/inffas=
32.asm":"78d2cc88f8ed0e32ef960efc987c257bc1688afe7d031a8ba18761e95a6a7c3f",=
"src/zlib/contrib/masmx86/match686.asm":"9e9bea3b5517b089da7d39caded0798274=
6a33f94f0907ca7e8afefed7be36b6","src/zlib/contrib/masmx86/readme.txt":"1f29=
a04e0227b74e20ba1b7c764b3ca5bf596dd2c06e89bc19a05fb8f9689778","src/zlib/con=
trib/minizip/Makefile":"087034de3dc0223b29e64bb3a4fc3eda7b948e93d2a9ff154ae=
cf9fed2a1eb5b","src/zlib/contrib/minizip/Makefile.am":"2313a3480a2c3745fa7c=
e216829cd0367058907d3a0902e5832c66c84a2fdfc6","src/zlib/contrib/minizip/Min=
iZip64_Changes.txt":"302c62b328647f5472fb7755249a83459be7f8ffb1fae07e8ba318=
fce8f4126c","src/zlib/contrib/minizip/MiniZip64_info.txt":"122719c32ef1763a=
5f6ba9c8cdefc1d78a76f7156b09e7b6f69b73f968e0dac3","src/zlib/contrib/minizip=
/configure.ac":"35330dc0c6188127afd339829d91b19739d23bf3b7301bfb04f775a6fcb=
bdad7","src/zlib/contrib/minizip/crypt.h":"8e872b60255b8447da99885c7159c2e1=
f1bb8143523bdbe71784e60f98bfd67b","src/zlib/contrib/minizip/ioapi.c":"66b39=
c27042f6ad12cc12efb0c82cdf100c6640b5fa959b8b866e252966113a9","src/zlib/cont=
rib/minizip/ioapi.h":"8655408534b78dc0889a45f9359fc6d2d5c8e8d8443b81ede596f=
954c720ef48","src/zlib/contrib/minizip/iowin32.c":"2c05bc374d3d847c6a9f29ea=
c9d674abba7659d1e91e34e172248fcb5c274d51","src/zlib/contrib/minizip/iowin32=
.h":"586f22b9c3c64da253ce2b518e0fad61f19a7b47b289fc704cc9708242294c49","src=
/zlib/contrib/minizip/make_vms.com":"65736d9c4888f2373d3db0a13864d150c50404=
53f5bc2a5c8784379a7ea67590","src/zlib/contrib/minizip/miniunz.c":"ced49f20c=
62536a8ffb270b35cfa4994a1dcdce45f8cf059b941c94ca0022666","src/zlib/contrib/=
minizip/miniunzip.1":"66d8684392167091ef0fe01598d6a0daa26e7e448e2df6c3cb257=
487735b83f7","src/zlib/contrib/minizip/minizip.1":"5404596e8e5587a52f563906=
119f32ceee30a6d97a966afa5c7afbe4d373e210","src/zlib/contrib/minizip/minizip=
.c":"fdfcf83979ef2324c1455d369e8add8678c804939d412ce53f8b024578ceabad","src=
/zlib/contrib/minizip/minizip.pc.in":"8b6670b42d8e5e519e1cc89db093efc07ba23=
cb1ddfedd3c93ff2df08c3ce8ac","src/zlib/contrib/minizip/mztools.c":"cd887c4a=
f6d20823bd15f24008b10acf01969b4165d7848656bde843a92428d7","src/zlib/contrib=
/minizip/mztools.h":"6f82c52279e8f79165f4446be652e5741a49992ac58632470335aa=
34c564072a","src/zlib/contrib/minizip/unzip.c":"497adf676b1cae2a7afa834e4ab=
a86383f7b697f5fdd03a8179ea9024a431cf9","src/zlib/contrib/minizip/unzip.h":"=
d8dc58fc0121b6a4b98f3028205bb253f956b1ddf791e9ced3cf44892502a01f","src/zlib=
/contrib/minizip/zip.c":"00f403cb7810578b4b2687dd55fb132c850c3630fba2f3704a=
8ab896fcc8209a","src/zlib/contrib/minizip/zip.h":"96163fc140e4bf08752e014d2=
0a1eac3f5adcdc408366f6d79c1895f2599cf08","src/zlib/contrib/pascal/example.p=
as":"d842d456ecb6ff80e34cee2da31deb2072cc69ca837497bea8b8bee203403474","src=
/zlib/contrib/pascal/readme.txt":"02f997c37991ddae0cb986039f7b4f6fc816b3fd0=
ffd332cad371d04c12cf1b9","src/zlib/contrib/pascal/zlibd32.mak":"850e91b6c9e=
a05de61a411cbda16fa0f10118cd88bb32c4b7226988776f8d511","src/zlib/contrib/pa=
scal/zlibpas.pas":"28b90aeeb3da8d1f6a98ab9f5f1603d08aba5bfabc50827d3f15e661=
268a51cf","src/zlib/contrib/puff/Makefile":"d9d738030464aaae354196c14fd928a=
df591832fce7d71ac1977c1d8d4923a4b","src/zlib/contrib/puff/README":"aceca4bc=
1bce7d9445b8bc9b6640c672d95708185f6070d3a3baae7a9d102caf","src/zlib/contrib=
/puff/puff.c":"6d0eef92e115a42e570b79d8b07a04af5ccbd6b3f3fbca9cbc61c49db9c9=
df43","src/zlib/contrib/puff/puff.h":"969b7be2a930db0cdcb19b0e5b29ae6741f5a=
8f663b6dba6d647e12ec60cfa8e","src/zlib/contrib/puff/pufftest.c":"8ee0da78a1=
221a3c2036e22eed06c2faa27a671a46565a60e10111d4ee9c30ee","src/zlib/contrib/p=
uff/zeros.raw":"b7b0887089f7af1f6d1e0b4c0a1e8eddd10223b23554299455c6c9be71b=
653a3","src/zlib/contrib/testzlib/testzlib.c":"c6c37b35c6ecc9986a9041f86d87=
9cc37a9e4d8315af9d725071eb3b2cade0c5","src/zlib/contrib/testzlib/testzlib.t=
xt":"2359bbdc84eb8a04e0f1cd16cd81a2896e957f2ad58dab3ca78ef55b7d0dc577","src=
/zlib/contrib/untgz/Makefile":"8f5ab1564813e091cea8f1bb63da32fd80ac763d0292=
77b0cabf50f60aceefe1","src/zlib/contrib/untgz/Makefile.msc":"d0f537de11d9e0=
e36e2a98b3971c537265f4b533b4c48797094365ad9ae8388b","src/zlib/contrib/untgz=
/untgz.c":"9a12d774301d252dcd38bba07ac369319da4c04c4fef8a50fcbf40aebf29c2a1=
","src/zlib/contrib/vstudio/readme.txt":"2a9ca40b68274f4d37649dfab9e5e867a0=
00883592b4ab8fdaec8425a63052c3","src/zlib/contrib/vstudio/vc10/miniunz.vcxp=
roj":"dd607d43c64581172c20c22112821924dfe862f56b2e5eb8780bdd0714d9527b","sr=
c/zlib/contrib/vstudio/vc10/miniunz.vcxproj.filters":"c3db9f97952683e688ad8=
3c13bb94c816ac3e6b5f277fdea545b0650c125aa6d","src/zlib/contrib/vstudio/vc10=
/minizip.vcxproj":"af73f2cf8ae51e65e85342faeb40849a2310c97bc77def42b38d7070=
460a6cf0","src/zlib/contrib/vstudio/vc10/minizip.vcxproj.filters":"83db58d8=
7f5d7ca84b6087aa1f62b15cbc296194c8cf76e47a271f9077b4f3bd","src/zlib/contrib=
/vstudio/vc10/testzlib.vcxproj":"1525ed0893db56db44ec68675c8da3c229dc786716=
6dfc0428816783d16ad43b","src/zlib/contrib/vstudio/vc10/testzlib.vcxproj.fil=
ters":"d7e04ffa467d417dfa3c0f1c64234cadc84882101bbae483f0a0f5d3d6b566a7","s=
rc/zlib/contrib/vstudio/vc10/testzlibdll.vcxproj":"3f317d8964f17901c3e68bff=
5deaec10b6ccc50a572235999e8097292692984c","src/zlib/contrib/vstudio/vc10/te=
stzlibdll.vcxproj.filters":"682a485f0184aabba94e12e1b284499195f37c176d43ece=
e0484f31e4d636f6f","src/zlib/contrib/vstudio/vc10/zlib.rc":"e8b581eb16930e0=
213d37143a5f17868839b22c758b23981a29484e17093c494","src/zlib/contrib/vstudi=
o/vc10/zlibstat.vcxproj":"2a38222d6c034d7e0b843c3f0540dc6c53dd48f942ae29f31=
620ca0327248c8e","src/zlib/contrib/vstudio/vc10/zlibstat.vcxproj.filters":"=
d9a2c381e51e4d6f027f3517db7db81656e43cec02ed9abf267a0fde6f360180","src/zlib=
/contrib/vstudio/vc10/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018=
b4affda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc10/zlibvc.sln":"e6598=
60f705f31b87ea9139a3cb4ebe1561e120bce495383a54614fc82b49990","src/zlib/cont=
rib/vstudio/vc10/zlibvc.vcxproj":"3108badf710e2f4a64eab4e7deae6642fb68cc0d9=
4018e537149f1761e215133","src/zlib/contrib/vstudio/vc10/zlibvc.vcxproj.filt=
ers":"58404ba7703c68025bec64b8a17ff1fc7f3a35d15d17ae3bcc4fa753f1348425","sr=
c/zlib/contrib/vstudio/vc11/miniunz.vcxproj":"746e4c11fb8af4bcd6a9d68ba81ed=
1dc366a5de3bed56b291ee969ad733a7bb0","src/zlib/contrib/vstudio/vc11/minizip=
.vcxproj":"340617cae9cf4fcb003308021d3782ec3639e60d62d79a3aafc0a50bb55b061e=
","src/zlib/contrib/vstudio/vc11/testzlib.vcxproj":"589eec6ef6d818564ead938=
a629fda50abb6cbf8054b9f66ea780765c1a1b3db","src/zlib/contrib/vstudio/vc11/t=
estzlibdll.vcxproj":"583bdef522b0176829f0d8139ea2a88b9cbc14379d1334f3a86398=
9ed3df9b67","src/zlib/contrib/vstudio/vc11/zlib.rc":"e8b581eb16930e0213d371=
43a5f17868839b22c758b23981a29484e17093c494","src/zlib/contrib/vstudio/vc11/=
zlibstat.vcxproj":"51aa752698d96df065a9ece02e293492f681b59a8077f036a5a60367=
dc621e87","src/zlib/contrib/vstudio/vc11/zlibvc.def":"0124fea28bfee49c8a19d=
ad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc11=
/zlibvc.sln":"27389b515997defd080519f95aff87e89fcbe8b26d73c5ebb73c544cfef4d=
60e","src/zlib/contrib/vstudio/vc11/zlibvc.vcxproj":"c3dd05e56159aba411475b=
83656275872524cb3c2fd24d690397d8b634e7e0ed","src/zlib/contrib/vstudio/vc12/=
miniunz.vcxproj":"1494af54570f6e93852932956d49a8c25e57b5abc1ac979945605ca91=
43df9f8","src/zlib/contrib/vstudio/vc12/minizip.vcxproj":"9bf128ed6760ca5f0=
19006f178b1c65f4c7ff122dba8d297b64b0eb72feeb120","src/zlib/contrib/vstudio/=
vc12/testzlib.vcxproj":"367a06caa399bd09f6b9cb60706820943dd6a6cf05794275baa=
f421da9c2a0b7","src/zlib/contrib/vstudio/vc12/testzlibdll.vcxproj":"9341651=
0256935d79625dc9fd349cfce6968c062d42a138bec404a26b2f92f5e","src/zlib/contri=
b/vstudio/vc12/zlib.rc":"92d5d3a4938a6350395934153416a7eb74353cdfb2321f45b9=
ee0b9b16257f39","src/zlib/contrib/vstudio/vc12/zlibstat.vcxproj":"744ff6ac0=
d4e2dcdf74c7d33b979fbfd2b18550947eb99bfd46dc6a73eb1c68d","src/zlib/contrib/=
vstudio/vc12/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4affda5a=
389e64ad15f44d7","src/zlib/contrib/vstudio/vc12/zlibvc.sln":"162e0faa80a56d=
89eea71a0b89377708eec2faa0dc72091cc0abb07fbdea49a0","src/zlib/contrib/vstud=
io/vc12/zlibvc.vcxproj":"754671c59d8996a846241af76082cc8be1aa5fc079eff530d9=
1a9ab15a0bee5b","src/zlib/contrib/vstudio/vc14/miniunz.vcxproj":"0312511d4a=
30cea979c4e36edf994a537ed8a9d924f6b5c536cbcd094773c11f","src/zlib/contrib/v=
studio/vc14/minizip.vcxproj":"9e7bb7a6ac723e4b2db900627c366f9bb93a351381995=
d9c69a50c0126f64233","src/zlib/contrib/vstudio/vc14/testzlib.vcxproj":"c3a9=
369670af4ebea13d036b452be7418591fbb4c03a675699facac5d8dff5d0","src/zlib/con=
trib/vstudio/vc14/testzlibdll.vcxproj":"69f544898b4275cd3d8e19b8f1f8cb39c1c=
b98a30cdb033242e4b94c57bfa150","src/zlib/contrib/vstudio/vc14/zlib.rc":"92d=
5d3a4938a6350395934153416a7eb74353cdfb2321f45b9ee0b9b16257f39","src/zlib/co=
ntrib/vstudio/vc14/zlibstat.vcxproj":"9c7c096b47e7875412c98525efcd16db62e09=
4215f0011b9cd739a33ab35d48c","src/zlib/contrib/vstudio/vc14/zlibvc.def":"01=
24fea28bfee49c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/c=
ontrib/vstudio/vc14/zlibvc.sln":"47a50bbde8ca6336cecd8c0e4b65e515fc46ae84c7=
b61008ac9864162f777286","src/zlib/contrib/vstudio/vc14/zlibvc.vcxproj":"71f=
b6ef3b079bfdf4182af17e74c3361ead757467edfc591d9cbe303ccc47b52","src/zlib/co=
ntrib/vstudio/vc9/miniunz.vcproj":"b2b53bd9e704bfbe769b863acdc2a3368692ca14=
9c4b4ed2a0761b0cd16c6726","src/zlib/contrib/vstudio/vc9/minizip.vcproj":"80=
a701fb41a61871ce1d25f6b03e571edb6c3abf0aa45375554b6fac52115eb6","src/zlib/c=
ontrib/vstudio/vc9/testzlib.vcproj":"05fc5a87682b17690d199f424f57f6ad7767b8=
dabb29a1039bfcb88bca1b302f","src/zlib/contrib/vstudio/vc9/testzlibdll.vcpro=
j":"25c1cc5319f1c4b7dbdb595c3cfd6ec3ba217818b03b7055ef5ef440b575a43d","src/=
zlib/contrib/vstudio/vc9/zlib.rc":"e8b581eb16930e0213d37143a5f17868839b22c7=
58b23981a29484e17093c494","src/zlib/contrib/vstudio/vc9/zlibstat.vcproj":"e=
8653eea37f3bef097eec2caa55e1f698c3c74c959689bc4e97568e88d2bbc60","src/zlib/=
contrib/vstudio/vc9/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4=
affda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc9/zlibvc.sln":"26e58d4b=
2cfcd941c367fb2a18537b3b9f002f2ac1278b700ea1129c50501452","src/zlib/contrib=
/vstudio/vc9/zlibvc.vcproj":"86aa6e33db104c0a0ed4a9f21f0db8572cc7755170217a=
ef18219fdd74b75e9d","src/zlib/crc32.c":"a04af273e83ecc351bf3794974ab2098d8d=
960df4044b7b44734c41443ee26d0","src/zlib/crc32.h":"407af59d0abfea84a6507c60=
3eb29809411797f98249614fe76a661def783ce1","src/zlib/deflate.c":"11fd6b0328b=
65c4ad4b5c204d892a97a9083628a7e77dc47836c8e0c799f8da0","src/zlib/deflate.h"=
:"0ca7fb0cf1dd63001c6e9e4ff93c8dbff2fe521199be51a4dda38a11b44919f6","src/zl=
ib/doc/algorithm.txt":"992590931e982c0765286c2d83f6e9ff0a95aabb08e28c30c52b=
ae3e8c4bd5ad","src/zlib/doc/rfc1950.txt":"8f0475a5c984657bf26277f73df9456c9=
b97f175084f0c1748f1eb1f0b9b10b9","src/zlib/doc/rfc1951.txt":"5ebf4b5b7fe1c3=
a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009","src/zlib/doc/rfc1952.t=
xt":"164ef0897b4cbec63abf1b57f069f3599bd0fb7c72c2a4dee21bd7e03ec9af67","src=
/zlib/doc/txtvsbin.txt":"47c273bb22c9773248d380549a330e5c262266b1292154b0d3=
014f731cc73f47","src/zlib/examples/README.examples":"402d72eb69c2e03a25034f=
4b3c02b110f0f67149ecfa4fa0e4b2bf0ceb49a8b3","src/zlib/examples/enough.c":"7=
04e273f65b62c5d2eb06d5bb10c4ccffba56544aa477f0e3957e2296c501b78","src/zlib/=
examples/fitblk.c":"950769163c41aff897ee41746a8685d9aa41073b1307f42da19dabe=
9d3fc8b85","src/zlib/examples/gun.c":"d60ca6eb0a3e62ee7fb4a1ab69e8d1525ff06=
b06ce46889cbdfc13fb8f7534c2","src/zlib/examples/gzappend.c":"4182d38bf97ffb=
df1110df7f65c0e8fab0b28b1ea36ebba8621c14e8e76f1caa","src/zlib/examples/gzjo=
in.c":"90b9d6c39a5fc91cf1cc9b96b025a508a8015dc502cd9374c754b44078593f57","s=
rc/zlib/examples/gzlog.c":"433d34b71b4e769ece1cceb8bd7d902d2c0a24ccd7550ab1=
856a5ba87f84f835","src/zlib/examples/gzlog.h":"309556e2d7d39250924946b78e2c=
ce0ac927857d6e1a02cab64e438f533c20c3","src/zlib/examples/zlib_how.html":"80=
fb647be8450bd7a07d8495244e1f061dfbdbdb53172ca24e7ffff8ace9c72f","src/zlib/e=
xamples/zpipe.c":"68140a82582ede938159630bca0fb13a93b4bf1cb2e85b08943c26242=
cf8f3a6","src/zlib/examples/zran.c":"840ebeb058cd0ca9e92dcb1db665932462a469=
5fc649b34e865b8d1ad7c5bf77","src/zlib/gzclose.c":"94446cf8cde67c30e64d0a335=
b0c941fd3fbad2e77f30180d12e61f9c2a5a6b8","src/zlib/gzguts.h":"1ef4741cf1044=
1feeca5c8dde2b6c754f0cbd96fcae697d54a604757289a5e9b","src/zlib/gzlib.c":"5d=
af11e44149e0aba2956d35f73f04f35dca99c3dfa43f5ad43ec20b336e4a1b","src/zlib/g=
zread.c":"6f928512cb1792cfeab31a51ff0b211814d2e455bc75290eb31079dc1e5ad2ec"=
,"src/zlib/gzwrite.c":"ba3b7b7ad2ff7ef0c19319b8408c333491a4cd495da55d0b156b=
c73d9ddb4df4","src/zlib/infback.c":"abe44873b5af2ea68ea1d281d915b2800f1832f=
846d2c05442a4711adbe6f269","src/zlib/inffast.c":"4d496ab2a3d29df5fadc3dbff6=
067e039806aaceae6cfcd09ea77d46c2b848fd","src/zlib/inffast.h":"7d8c1c873ce9b=
c346ad6005bb9d75cce5c6352aaf7395385be216a9452a34908","src/zlib/inffixed.h":=
"237ba710f090e432b62ebf963bee8b302867e9691406b2d3f8ee89ee7bfef9b0","src/zli=
b/inflate.c":"8b6c599c3563c14c447c47db0d7dc9a16e8c246a078ec95a169ddcebaaebd=
811","src/zlib/inflate.h":"8ec9ac297790276f7e46a961d4c6f9f944fb1dec92401339=
ec2666973cc5983c","src/zlib/inftrees.c":"1960ca67384376f65b6ce8c08fdb501f8e=
b33923e11ef5f61a855708c6cb0a8a","src/zlib/inftrees.h":"c510b36402784b1f898b=
e3b049b923469aa92701de2d9195aed19f6b65c0dce2","src/zlib/make_vms.com":"3064=
eb153a7684115f1494364f80759bc5a2c227799fdf08df7b9e6e50884720","src/zlib/msd=
os/Makefile.bor":"292ab363f7ffbc4ae84d37cd9bdffd2dac1003bee52d223a848984487=
0f20702","src/zlib/msdos/Makefile.dj2":"9208450c2ae6dcbfcc25560b5b9ca763f46=
1e7246e37b0552474edf8fa898906","src/zlib/msdos/Makefile.emx":"c749d6ec7f88e=
8e639d4f03bdbdcbbe9d1c304210be4c4be621ceb22961d3d64","src/zlib/msdos/Makefi=
le.msc":"0e021a6f42212415b060e4ad468eb415d0a8c1f343137fb9dff2cb8f9ead3027",=
"src/zlib/msdos/Makefile.tc":"2ae12ee2a3e62f7c5a0520d0fbe4adee772bc07fe8160=
02b07ccb43db3daa76a","src/zlib/nintendods/Makefile":"ea5823efe6830132294edd=
f2f56dbd7db8712244c210bb4968c431b1a91bd066","src/zlib/nintendods/README":"e=
362426c47b39ff6a7d6c75c6660b20abf076cdfa5e1e421716dc629a71aef95","src/zlib/=
old/Makefile.emx":"d811f032272aae50123a889297af3a02fbd60d1e42bbef11466462f6=
27ff7b5b","src/zlib/old/Makefile.riscos":"d1a488b160fbfd53272b68a913283a4be=
08ba9d490796b196dddb2ba535b41e0","src/zlib/old/README":"551a0f4d91fe0f827a3=
1cbdfbb4a71d1f3dc4d06564d80a3f526b749dd104d11","src/zlib/old/descrip.mms":"=
8ff08c35c056df9c986f23c09cf8936db63ccf12c3c42f7d18a48b36f060cff7","src/zlib=
/old/os2/Makefile.os2":"6ad247c00f00ff42fd2d62555e86251cef06e4079378241b5f3=
20c227507d51d","src/zlib/old/os2/zlib.def":"ea9c61876d2e20b67ef2d9495991a32=
798eb40d13ede95859a2f4f03b65b9b61","src/zlib/old/visual-basic.txt":"1727650=
acbde9a9e6aec9438896377e46a12699cca5d46c5399cef524dedc614","src/zlib/os400/=
README400":"6f95a1beb0fbf943a3312eaa3dd2c279f1cef93062bebbff63dd37ac9e2aa8d=
6","src/zlib/os400/bndsrc":"cfe00b1528d5c27813cd6b1ad7aa34b493fd63d615623fb=
21fd1a7bf99d2255e","src/zlib/os400/make.sh":"143394d1e3876c61c29078c0e47310=
e726e1f5bd42739fe92df9ece65711655f","src/zlib/os400/zlib.inc":"c501c522185b=
a1f0506caf90d72f1088b34b2addc169471e949e443ab65e8a75","src/zlib/qnx/package=
.qpg":"90b5c8364d9dc5ef67405b352c19710ebad2905f3f20b9e56ded74661f96743b","s=
rc/zlib/test/example.c":"520799662a8286725540d6d5a356efe6f595618e5fe2e59197=
2491d719bd99aa","src/zlib/test/infcover.c":"f654f3fcc74b33bd95cda63d13fe0ce=
589bcfe965544e0c17ee597d75efbd090","src/zlib/test/minigzip.c":"91089b21e692=
797bb6208b2b45eeb90f5f1f1e4f6b67b99dea5676f51b811193","src/zlib/treebuild.x=
ml":"d816c764c8ec2d5b2ebfa7f053f747097926c13fce7fa8628c5d14c991411421","src=
/zlib/trees.c":"f2a5f949ea70dde7c23a54c793aeed630a03df4bb72417cd3aa008000c4=
4699b","src/zlib/trees.h":"bb0a9d3ca88ee00c81adb7c636e73b97085f6ef1b52d6d58=
edbe2b6dc3adeb4d","src/zlib/uncompr.c":"31922aa982ee12fd28d1ce5fe6a94a3f07c=
2a941c821b566a881ca21845cdfaf","src/zlib/watcom/watcom_f.mak":"7e039b912f9c=
ffaa40835281430bb284fa9042b0a0d12f6b34700a06bca6576e","src/zlib/watcom/watc=
om_l.mak":"d11b4064604a034725860e63e3f6d347056372e4b1675b183e20a93533b20cc9=
","src/zlib/win32/DLL_FAQ.txt":"9e00778319381e6275691dd3a89410c99065b8c0c5d=
b96473abe8c859cbdefd8","src/zlib/win32/Makefile.bor":"e878fed2313417db085fe=
a621c110889f6a32233b5b6db46e3c4e824c1d0ed6b","src/zlib/win32/Makefile.gcc":=
"ea8feddce7b9707253b9bf86623cf7ebe5294d7aea2b3b0b1b1c1b8cfd73009d","src/zli=
b/win32/Makefile.msc":"7c495d63c5afea1d77d162a41b73bab89cee952c12e4647e9684=
a7ac79bfc3f5","src/zlib/win32/README-WIN32.txt":"b71f1f4e4760812c3a11b2bae6=
f40d1066741a90e6646010a32ce50a0e348cde","src/zlib/win32/VisualC.txt":"9ec0b=
abd46eaa012371dee2d3a8a55d9c7130f7895512c3371c737e4a7f6a997","src/zlib/win3=
2/zlib.def":"24fa6dd00f3f4c0d14507a03ddbfa42707a04e3901bb9ff6f90096037a7518=
5a","src/zlib/win32/zlib1.rc":"8fc5f2b5abee40ad66e6d6cfc9f926c2f446e13a7c9e=
e7df8bf58a266d8cade5","src/zlib/zconf.h":"9c0087f31cd45fe4bfa0ca79b51df2c69=
d67c44f2fbb2223d7cf9ab8d971c360","src/zlib/zconf.h.cmakein":"d740b750e9c98e=
6a4b4529cc2a857a3fa8001514b1ce91e0e1d9d293652bf388","src/zlib/zconf.h.in":"=
9c0087f31cd45fe4bfa0ca79b51df2c69d67c44f2fbb2223d7cf9ab8d971c360","src/zlib=
/zlib.3":"5abef003e545566e5599e5ab2e7528e978be59d54546b19d763d062f7a69bac7"=
,"src/zlib/zlib.3.pdf":"7f0f633641d782e360eff9fe831716c5767faf1000e38382a8a=
8c65b0b67f374","src/zlib/zlib.h":"4ddc82b4af931ab55f44d977bde81bfbc4151b5dc=
dccc03142831a301b5ec3c8","src/zlib/zlib.map":"7eb1070ba6bf12e6895e5da06b84a=
92af683827587afaa72bdd45e80b9d8e4e9","src/zlib/zlib.pc.cmakein":"2f1d0b18ce=
37c2af415a469857f02aee2c41a58877aff21d29e9c6db32b55cb7","src/zlib/zlib.pc.i=
n":"04c01cc2e1a0ed123518b5855f585c93a24526dd88982c414111ea1fc9f07997","src/=
zlib/zlib2ansi":"d316e3e79054f5f9fe921d35f4bbf4bf0a37b859d29d2b34ae4d7d92af=
c3e55c","src/zlib/zutil.c":"f7fdc9ef326a2683eb33c794face54e83c751ec17f3d1ba=
581847a62af36ddcd","src/zlib/zutil.h":"9a63f6690fac1620aa3cecee5752af618806=
da438a256b4a047fbcd289cac159"},"package":"de5435b8549c16d423ed0c03dbaafe57c=
f6c3344744f1242520d59c9d8ecec66"}
> > +-{"files":{"Cargo.toml":"2f23b1493e2aa56abce67ae714f4ba088ac6b30b55c19=
c156477e1788f515701","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14=
d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"34c467b6945a22696d060b8fdd2379=
d464acb3408d4c599d3dc5fe4fa1b4c84f","README-zng.md":"237e65a2b90c6533e346d8=
38e857572a82fe498753500fe04b7054dc261ca5a9","README.md":"97923429b45c95f222=
92b41d116452a4ce3df98d6960c89af30b3ec64c68b7bf","build.rs":"0b57c3a2c98c2cc=
122ae00d7b45610e4f568f6960c823f23b69ef0682cc7fb33","build_zng.rs":"b7768e19=
f0bf876f29eabb6ad6511f530e61d8aa92bfbe89a7cf3818e4824ce7","src/lib.rs":"7c4=
a3394e17e6250c1f4f2067efecc56b1850827596432ad0ce75e5eea800446","src/smoke.c=
":"10607c81b73811bfcb9718767312bf97ba2ccf7048ea2f18a2085aa06ad7f91b","src/z=
lib-ng/CMakeLists.txt":"c3ccdac791fd8d34c720b336b60370545dfd66c642e78b2033e=
ecc2273c160d9","src/zlib-ng/FAQ.zlib":"c524f4f86d336b3de71dd6977afddffa9c02=
fda5c26db4dfefae44959e7614a2","src/zlib-ng/INDEX.md":"989545e90d8e9ac149034=
f762ce78ed8976ebf9324326228dea37ca190154609","src/zlib-ng/LICENSE.md":"d3c8=
0be055d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436","src/zlib-ng/=
Makefile.in":"774c8462cccbe6b30fc34d68490bba8e352e460c8ee2c3775d4d0767e2282=
192","src/zlib-ng/PORTING.md":"10d59c3195ee8c631bb29fbe75e7e11a84d3daf7ab9e=
2be12287661ffd8fe1b6","src/zlib-ng/README.md":"c9f247270ce0fa8c823ce047e823=
6559127933fc83b16dc9a6863bbc983b6dbe","src/zlib-ng/adler32.c":"52fbdc52a7bf=
5c64baf5a7fe76f7255348c280c5b1bbb9bb674ced04a01d8fb2","src/zlib-ng/adler32_=
fold.c":"9ba56a7bbcf64ede61d8fa84de9f81d751ece311dc9a3e12470f794a6103316b",=
"src/zlib-ng/adler32_fold.h":"c40114c2c742b6410e54b58ea02533fe6e9ae0ca62d34=
53e5d2a1725d33e2be4","src/zlib-ng/adler32_p.h":"3d44f3d9296dfcdf203b5c4e4a8=
b0da0551365970ceb882715c7140ad061a90a","src/zlib-ng/arch/arm/Makefile.in":"=
e523b6c87b928e2dddcd04793bc79b5829304cf51ead713d743af740ca131b37","src/zlib=
-ng/arch/arm/adler32_neon.c":"60608f4cc48bcebced93947ba7a75f128876352fbfc2b=
1521d25ae00b692c244","src/zlib-ng/arch/arm/arm_features.c":"bc8a5f0b1f80a05=
bba51b851a4be941c75c38e4800840b96097eae57cb7a5bdd","src/zlib-ng/arch/arm/ar=
m_features.h":"7534eb55b3551123c9a51ca8dcf771da0c1bb21be07e0c00292d156d96d5=
5238","src/zlib-ng/arch/arm/chunkset_neon.c":"bad43fd303a538ae5b7d41f8f2b0c=
84915492ebb32abd7528d074501a637cf83","src/zlib-ng/arch/arm/compare256_neon.=
c":"d87660d69cfc4bdace50cc9f08ffd42fec71e3281566b9b58c1d83008e6fe6f3","src/=
zlib-ng/arch/arm/crc32_acle.c":"921f1278e2130bf69b7572ed5bda13df3ba472948e3=
90b1dbf330a1daad1736e","src/zlib-ng/arch/arm/ctzl.h":"feb70d55e66025fff806e=
30e48002b35cfff79533d352585cfa5f118edbc90b1","src/zlib-ng/arch/arm/insert_s=
tring_acle.c":"337e420632ac14620dba851923c35a882e532bc445a9b10330f3a8dc6ee3=
2ec8","src/zlib-ng/arch/arm/slide_hash_neon.c":"b455b2ee60899d97844317f4c80=
f522a9f611258b9500e6de810e94433e933bc","src/zlib-ng/arch/generic/Makefile.i=
n":"f41a34839986eac8dd52cf91fada0efff4171c059ab5d7db6347c91bd6d9db09","src/=
zlib-ng/arch/power/Makefile.in":"292f34d0dabe1658a9cac8c7f303b3d311b0d18a0c=
b38b7fc69abd9d95075df0","src/zlib-ng/arch/power/adler32_power8.c":"f39c4c5f=
0aded59e2b4986c151b70edc32f976c2c82185540164af52e2158bb2","src/zlib-ng/arch=
/power/adler32_vmx.c":"f6f9fa89366b742b27bad122a6a96948efd6fb95a4de3238fbab=
e3613e6f9251","src/zlib-ng/arch/power/chunkset_power8.c":"4f3df226e8969f472=
e517274c0b940ea0a6cf3980326d2d85cd09b325f37502f","src/zlib-ng/arch/power/co=
mpare256_power9.c":"d136d4eb79d9b67cab11048c56439531755da9c292fa13373a8dc0a=
40239368d","src/zlib-ng/arch/power/crc32_constants.h":"d73e3b9025de9fade7fa=
3ba2bbf5f56a1499a84c53d8ca7f5e744a0714d8599b","src/zlib-ng/arch/power/crc32=
_power8.c":"88919c3c14bd8124c112bfb6bafb2d526870740cb2828f14ccde3a9b866308a=
a","src/zlib-ng/arch/power/fallback_builtins.h":"78a8da60bad8ba01278e495482=
108adabf9e96bdb214e869b61ab1f63f518c9b","src/zlib-ng/arch/power/power_featu=
res.c":"369683c1e792f783f91d72f4046d24623f9bc015edc13146476ff04fb030ca44","=
src/zlib-ng/arch/power/power_features.h":"d755ee6ca0e804ddff2639d098e355a52=
01d01c8bee8e1bd9e98bf6be7774cf1","src/zlib-ng/arch/power/slide_hash_power8.=
c":"05a858c9a35d58c933becb3e1848310a0bf50899d6d8829127789747fb0931fb","src/=
zlib-ng/arch/power/slide_hash_vmx.c":"e8bde875deff4d61e777d7e56853ef7b3a718=
9797ade5c6dfef9fb202930294e","src/zlib-ng/arch/power/slide_ppc_tpl.h":"c890=
0c594591e1aba3188f97c374e5561fe1e96f653c668352b25647e449f4c0","src/zlib-ng/=
arch/s390/Makefile.in":"e20982f40349d7b0725c5b908acb9a7f3a4c45dc4f329fab80b=
56b1538a2b7bd","src/zlib-ng/arch/s390/README.md":"892908181f6bafde706e70a64=
c312ccf18a300a56045ea1010d6b6bd04ea1d1b","src/zlib-ng/arch/s390/crc32-vx.c"=
:"353355c8a1819064ff8db1e53ac0906c5ea7e0bdc303e200382a85a299ef209c","src/zl=
ib-ng/arch/s390/dfltcc_common.c":"cc90250cd04e74c432496e0658e94708fe267b1a7=
99df8c2cbc1f6b5d6d23a9e","src/zlib-ng/arch/s390/dfltcc_common.h":"c17edda79=
dc82aaab399cc14c3a7c2dfc021e152286d3841272a337d6c404df9","src/zlib-ng/arch/=
s390/dfltcc_deflate.c":"9cb59560fcfc7828139372d3ff27386f85acb12595274e6ce99=
f8c4d9a4abbd4","src/zlib-ng/arch/s390/dfltcc_deflate.h":"e8077ba0f7097438ee=
43d7d514bfb323069bd979aa15c1f708ce1cee69ed6980","src/zlib-ng/arch/s390/dflt=
cc_detail.h":"859e72e270c1f6da668aa199f331b328df65d5d86410ba5c1e6ef8442263d=
6ec","src/zlib-ng/arch/s390/dfltcc_inflate.c":"7b0a443f7aef6044c3180166cb22=
8e4c4d1a1026ce085b3ec7e8f1d2128ca777","src/zlib-ng/arch/s390/dfltcc_inflate=
.h":"478dd9d731441a91fbb287dfb31e37ba8f7d358a18f9a46a5c3a2d7a65022157","src=
/zlib-ng/arch/s390/s390_features.c":"92e420580f060d570e0b0362a7d6e80dfcaddd=
fbe4ebbade263cc9a561434785","src/zlib-ng/arch/s390/s390_features.h":"4147b5=
061f4376d85256673c8ff0492b8efd69add35c345cdbb47d9194b13b91","src/zlib-ng/ar=
ch/s390/self-hosted-builder/actions-runner.Dockerfile":"ae43b34a5d4d75acb39=
2a974de1af1561e55424bed0dfa19a2cca7bd38dafa8e","src/zlib-ng/arch/s390/self-=
hosted-builder/actions-runner.service":"62a19075adeddb3bee57bbac81c7acadacb=
f9c288e2b497e36ff7f2b3daa7558","src/zlib-ng/arch/s390/self-hosted-builder/f=
s/usr/bin/actions-runner":"f647e18728ea15fe927ac9f8cba83a5b343654a0e91b5ebe=
653bae7af7375110","src/zlib-ng/arch/s390/self-hosted-builder/fs/usr/bin/ent=
rypoint":"add4ebdc4f06ed15bb1de12a8c9ceb370a60baebb0932a1026a75433940ad3df"=
,"src/zlib-ng/arch/s390/self-hosted-builder/qemu-user-static.service":"5455=
1049f6181da88700a2a944a72b0af3b8abde876fa28e1348deb5eb96c91b","src/zlib-ng/=
arch/x86/Makefile.in":"0a681b0a6d396cea593bd8c4a854c5d1bb742217958e2a6a663a=
4cca051cc9e5","src/zlib-ng/arch/x86/adler32_avx2.c":"7d653cfa7d363c37c93b06=
5f9155939ffcaf58ef34a1a3b1d26a7f6c7de3829e","src/zlib-ng/arch/x86/adler32_a=
vx2_p.h":"21790ad0c770a93f8bccec160310b55a322418bed79f51d054d509925f316cc3"=
,"src/zlib-ng/arch/x86/adler32_avx2_tpl.h":"28f7889e7f77ac7a43376a5a93bf84d=
a7596762b8dc5eaa941fb3b0a7273ba27","src/zlib-ng/arch/x86/adler32_avx512.c":=
"27f3a767de2529b03173d5e8ffe9cae61c3e0807aabcfc9c5c92047a576b6a1c","src/zli=
b-ng/arch/x86/adler32_avx512_p.h":"1b4beda11693ac03e4b20e054a765df427f845a2=
79bce547b8208d20f5a302bb","src/zlib-ng/arch/x86/adler32_avx512_tpl.h":"e7cc=
c259237a1f59bae475db8c00fc82f2c8fbb581273265a7dec5b394d97124","src/zlib-ng/=
arch/x86/adler32_avx512_vnni.c":"1dbc4d42f2af3912f2c42d0c8fe454fd953a07dd70=
ae105e07a09442b506fd0d","src/zlib-ng/arch/x86/adler32_sse42.c":"d5ed7a9f910=
0cbf0c7dd7b893e8b2425a890bd991fcc1cf63cd3a0e24093fcae","src/zlib-ng/arch/x8=
6/adler32_ssse3.c":"0eb8c72796a96dcec4080423ce9b467e9047eaabc7a0eeffe1155e9=
3b2e73d1b","src/zlib-ng/arch/x86/adler32_ssse3_p.h":"c6e22c4998c80bf2b3c489=
abd60e819a17a8c5ec2411a6d2d5c5396484f1dce2","src/zlib-ng/arch/x86/chunk_per=
mute_table.h":"566181353c16e929fcd25621ee629dcac23477fdd2862eea3a7239b76370=
653d","src/zlib-ng/arch/x86/chunkset_avx.c":"dad1bdae1c7d004ee750391f25489c=
7fb78276dac25f2e2990cbb40c3cc6052b","src/zlib-ng/arch/x86/chunkset_sse2.c":=
"2695d3f92eccafb4401afaabfc84717aca693cc04fd6d85988f3b8592a831b70","src/zli=
b-ng/arch/x86/chunkset_sse41.c":"25398da25f5b8f7dfadf80e2a9af58674942720b6f=
46f46854548e3d68e68000","src/zlib-ng/arch/x86/compare256_avx2.c":"2516d00fa=
a6939e61dbb0978a9c4c81f9e3a42fd053b2a2241673da7cf4fc781","src/zlib-ng/arch/=
x86/compare256_sse2.c":"3b983708034f33b5da49f6f5041351a2e66358c76645c552f6e=
4dc37fb890a80","src/zlib-ng/arch/x86/crc32_fold_pclmulqdq.c":"9cc8473039213=
9b0cb50f4b51a6391cb1da3cc2b200a7b5dbef638706d1e0866","src/zlib-ng/arch/x86/=
crc32_fold_vpclmulqdq.c":"439559e134b7a7366d05f8850f1974a9caffea70363565629=
73acd72050d1d58","src/zlib-ng/arch/x86/insert_string_sse42.c":"1f093e32f3b7=
1704f2bad3468adf790741870398634647b7aa0bc1b3430ef970","src/zlib-ng/arch/x86=
/slide_hash_avx2.c":"9740a36bb4dd90f40394344026be9a13f3acb6e85e6b7681c30fd7=
f7cbf8e28e","src/zlib-ng/arch/x86/slide_hash_sse2.c":"fa009305a1c82708638df=
f25e037067656350303b25f5774489417e096c30ecb","src/zlib-ng/arch/x86/x86_feat=
ures.c":"05d9cd4164771147bf5a75754cf60ba05083c3b9842c590ea527c8ae44f1ca85",=
"src/zlib-ng/arch/x86/x86_features.h":"76df96d3b077fb9697f2d0a8598fe6576880=
25faa849e4c12d717c4966efb4ca","src/zlib-ng/chunkset.c":"534acd20990af9ed52f=
e9effcf1a6aeb1d5c5a3226c38dee9c007bf5aa7e7266","src/zlib-ng/chunkset_tpl.h"=
:"563f55a12daf6b921df8ebdda8d0e5818e1ce532efbd81faaf37a7a275c2a4c4","src/zl=
ib-ng/cmake/detect-arch.c":"4fff00beb2b207c87dbff81619583858dbb4120b86c114b=
7da8f48979f687bb1","src/zlib-ng/cmake/detect-arch.cmake":"27fa8da497b39ac70=
d881e2d345749611dae4c30f7b7a9c9e32f2c042672189a","src/zlib-ng/cmake/detect-=
coverage.cmake":"4664d51152d51282ae50621f4d510ab72cf8978b266c614b7c5361750d=
b6d1a9","src/zlib-ng/cmake/detect-install-dirs.cmake":"87031a40428a104f5cf3=
8ecdb8a5028d8c679cfa772a58adde8380c809b34eff","src/zlib-ng/cmake/detect-int=
rinsics.cmake":"4c7101c25c2cc8c724682caa6525a9ddfd74b71ad96ea0e6bfae09ded86=
afa57","src/zlib-ng/cmake/detect-sanitizer.cmake":"a40650743dfd0b56c2afbfad=
b53e5d1470ef48852f2fcdf51084b6485534f87a","src/zlib-ng/cmake/fallback-macro=
s.cmake":"a8c8f70e5483177280cbebf99f929a7cf5ffe2b79fedb79eed570ecafc78effc"=
,"src/zlib-ng/cmake/run-and-compare.cmake":"13d85c12c9d6c7b1b148bd0c5a5b4fa=
a6a4b56f3823bf03c4f8d914c9c5949d8","src/zlib-ng/cmake/run-and-redirect.cmak=
e":"7f08d18c09aa58113882ec760735a62a1723a5bfcae9f73bd3713a4dbaeab898","src/=
zlib-ng/cmake/test-compress.cmake":"612f70af2d51b33f70f8c9e0655915a5648803a=
6fc36f138f9daafdec248a77a","src/zlib-ng/cmake/test-tools.cmake":"63aabfffd5=
3970b8e145870b2a1c03bffa3595f7df04bd86f94e97b6f2a387e7","src/zlib-ng/cmake/=
toolchain-aarch64.cmake":"46be0bf580a49a528c72005484655afad1de3705b39a66a7b=
0c213b0fa81cee6","src/zlib-ng/cmake/toolchain-arm.cmake":"05e38076fd6ffb978=
5ff9844ccecd26436c9dc4c25b7777b62e5f52e788c3882","src/zlib-ng/cmake/toolcha=
in-armhf.cmake":"1a2029163a57415eec9a5dd5f45d3254d349e97b1beb5d16876b741717=
673341","src/zlib-ng/cmake/toolchain-mingw-i686.cmake":"b6c48f9d4e4c2848033=
6d65ad43a2bef6625df342ed09dad043ee7dc50292851","src/zlib-ng/cmake/toolchain=
-mingw-x86_64.cmake":"e9d16d3730e48cb27f4d9845f0de6f864231908cbe7c851011a34=
418e34dc646","src/zlib-ng/cmake/toolchain-powerpc.cmake":"9bd6fc58ce5b70603=
657f2c195c4a5cf52fae96ad63ac787978831c5858f762c","src/zlib-ng/cmake/toolcha=
in-powerpc64.cmake":"917fc5eef84921d8b38f43c2b4f60870965b4eecc8f018c7b3499e=
1142c715af","src/zlib-ng/cmake/toolchain-powerpc64le.cmake":"5b2edd36d62de5=
13db2d32bfbf779979d81ac527b981cc3379a4e933fc5a94d1","src/zlib-ng/cmake/tool=
chain-s390x.cmake":"cf52cecea7bd2a9d1ff5fd8edcb03c531e3b404bbcd15a15dec2e0e=
19936f2ac","src/zlib-ng/cmake/toolchain-sparc64.cmake":"e543062485d06a7e0fe=
c8135887c5e73363517fa4babc23ef7b780916d75afda","src/zlib-ng/compare256.c":"=
a4a56d315a5756463d2cd9d76b1abf01fa3e323b6627a08bdfde97387d98e0b7","src/zlib=
-ng/compress.c":"a4f9aaeee845630db7adc7655850e904338a4426286884eb16ffd50956=
b083ac","src/zlib-ng/configure":"a2e86f4361d97bf15faaeab23bc3e58f1ee91305c7=
bf2ea411c07d91350f1bab","src/zlib-ng/cpu_features.c":"067cae566bfcc42129b89=
b3110a6783f206afbc6b085efa9e012f0d18ea749e0","src/zlib-ng/cpu_features.h":"=
baba2e5301d4a0da588195eeae4f6f92bcca5af61f2ac9340a091c2723de71be","src/zlib=
-ng/crc32_braid.c":"4fee7f46585a9f5d664418d7f62de919716c19748cf14177da84444=
8c76dae89","src/zlib-ng/crc32_braid_comb.c":"ebcf0b2ea5080afe155020c2541f3f=
dc15173484211851c8acc903ba83ecf0c4","src/zlib-ng/crc32_braid_comb_p.h":"6c8=
035e05d30a6241be55467fc59e4d7deda6b618b955a11339ffee08a39c75a","src/zlib-ng=
/crc32_braid_p.h":"4953f9c0100d0a435f3237e3a46b826fecbd8b0a50acdd6fab2270d0=
ebbcbbaf","src/zlib-ng/crc32_braid_tbl.h":"e22af112e3c1c8bb4065d39fe678eba7=
1dd08893eb06f9414b02f4cf5a6f46de","src/zlib-ng/crc32_fold.c":"04aab2780ff42=
ce133613a3d92b151561e2a5d4d447cebc57c4fdde3cd11949a","src/zlib-ng/crc32_fol=
d.h":"4799db97dbdbbbdf9757d1b0263998d88676678211b22fec59e8416980090e9b","sr=
c/zlib-ng/deflate.c":"d442202e7f63a9eab0f33223697c8091196c56e1a392ce20dd48d=
71b73928987","src/zlib-ng/deflate.h":"79f6002f4765507a82f77576a0b2ced6dde77=
6fe2882f402a29b060a8798b956","src/zlib-ng/deflate_fast.c":"9d87443601e57ef1=
80fa1e11a788f1f8cf85af363f6db38c2ce2cc27e0d113fe","src/zlib-ng/deflate_huff=
.c":"9bb6b2e3d84831bb00f53f1a0a588f8c066bbed59a07f7d96f186627cb22092e","src=
/zlib-ng/deflate_medium.c":"1f53407841a4a3f489ff6a447703965df1dc18f28a67919=
537702d2f269c7e8d","src/zlib-ng/deflate_p.h":"f53d2a6c3c5e0fa5be89dc054d4b7=
e9b49a3e95646fac6500c1e824d79dcfd62","src/zlib-ng/deflate_quick.c":"a7a80b9=
c1d0214974407b15df42d2863c21dedbd79254ee834fd85fe0b952fa1","src/zlib-ng/def=
late_rle.c":"657e5988b88209169768fe6a7ae5e1ad768cbea550b37b360d9cacdc2ae313=
85","src/zlib-ng/deflate_slow.c":"e4c78f7a57e3ccd91cd45b7af44bd45d564872796=
de89f6f2538ff7493448c2a","src/zlib-ng/deflate_stored.c":"7ec2694ca9f6b40f7c=
2f876f80e5f0d7d911bf59f9a8e5d401dfbe204a258ff6","src/zlib-ng/doc/algorithm.=
txt":"0d21a0a4c47e512743389628d1385a831a5e5ff716491095a382b923287f4223","sr=
c/zlib-ng/doc/crc-doc.1.0.pdf":"064f9252d6e2e15ea56c2bd18e160e5c9c84bcd137c=
11a7af497aaa511ace998","src/zlib-ng/doc/rfc1950.txt":"8f0475a5c984657bf2627=
7f73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","src/zlib-ng/doc/rfc1951.txt":=
"5ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009","src/zli=
b-ng/doc/rfc1952.txt":"f7c810fd9d719d002d605207a9b880600f71d039b9626c5b4b03=
f2122438dd2d","src/zlib-ng/doc/txtvsbin.txt":"47c273bb22c9773248d380549a330=
e5c262266b1292154b0d3014f731cc73f47","src/zlib-ng/fallback_builtins.h":"686=
4b7d0d11bad111895c812ef499c63ad4aa8b7fe86b16d0252d945534ee988","src/zlib-ng=
/functable.c":"2be51a15f7424225a6164ec3e736a4c56191645eebcea95b19e16f070e45=
a87d","src/zlib-ng/functable.h":"d82fc549205db848e74f5d23c91ae4d00114edae65=
590475ca15ec845a49059a","src/zlib-ng/gzguts.h":"8f7a66046f75e3c5f36fd8ccf2b=
2d95eafd0d2cdecba145612ca776b8eeac460","src/zlib-ng/gzlib.c":"7e6ad5d9d32e6=
429d56a5303e2c6e6870d69c023d6647a52fb95902828de4011","src/zlib-ng/gzread.c.=
in":"9c20e0435055175ccebfa5dec217b22210637ed8cc06b53e21d02025f3a0ffd1","src=
/zlib-ng/gzwrite.c":"f8650a2d2a9daa2f523c53ee8ccc420f0f3521b8d44c6829a5805d=
a1f59afaf0","src/zlib-ng/infback.c":"5f6446584e95d961de0d75b4e04b9452ec03e9=
5747fa7d79a53db71c900dd90c","src/zlib-ng/inffast.c":"dd20040aae76a1e857f27c=
fe55460e9a7c16df0719b2e0ca241af8ff4967a2f7","src/zlib-ng/inffast.h":"42e74a=
92b496ab0726be317e8497a12bf3c3cf3d0d533440ce65befd3929c71c","src/zlib-ng/in=
ffixed_tbl.h":"a94225335396245e9f0ccb2e9b4b334fe7ee0111ed8e32a26bcd52187f36=
4314","src/zlib-ng/inflate.c":"861d7a20ef1da8b8d9835585a29ddaac1e99ff31a1a3=
6f3079c240772ef953a3","src/zlib-ng/inflate.h":"c82dff42121e0f0e6e0fab1f9bc9=
e8c43b60bb38ec10a3aa15f0417e54c791b2","src/zlib-ng/inflate_p.h":"3dbb8bf4f6=
c95a51718533851730b1d0d79bfec301102f8a9fd9f903426b297a","src/zlib-ng/inftre=
es.c":"4afec770066911de89f90c1525f87883ea0a9eda672ae9758144ee1839d93f50","s=
rc/zlib-ng/inftrees.h":"fa80eb11c2290b345470a03cb861843e2cb1365135233ea8243=
e9fd79d3618a1","src/zlib-ng/insert_string.c":"7a9455cbb3ca8fe6e7111471b9f4c=
0a32fb49a6d0ec589b027dc2cb2b65c8dce","src/zlib-ng/insert_string_roll.c":"4d=
05f19591a5c29d2da398e10e9d0b050d738cc8838d8dda4beb1cc7281ede07","src/zlib-n=
g/insert_string_tpl.h":"45889b69063592591a55d246cb418a50f8891cc7bdb86b21b46=
b203bc175d60e","src/zlib-ng/match_tpl.h":"03783f06ae132ea36d23420c3348e4a51=
52d8014159da6849ef77a1de96a99c4","src/zlib-ng/slide_hash.c":"97ec270b4c744a=
9dee638081e47807bc7340f859f9aa22e4acf4599fdb45f39f","src/zlib-ng/test/CMake=
Lists.txt":"8c36c775277a6e8dabc7e256ac4631308d5c0af2f585212f904d686d0d0c6bd=
e","src/zlib-ng/test/CVE-2002-0059/test.gz":"60bf96b8f433bd7e057ce3496aceac=
cd70ec80f596a4aa8bcc7786056705ce66","src/zlib-ng/test/CVE-2004-0797/test.gz=
":"38caae524705f676bde13a8df9fc8c7d2fe105ba6bdbab62a405b0276fd3aa2e","src/z=
lib-ng/test/CVE-2005-1849/test.gz":"e4d5a60617df4b5dd44eda94751ce1eacdb3257=
92bba6e3cc4676719a3adf742","src/zlib-ng/test/CVE-2005-2096/test.gz":"8f702d=
4861aa3ec98ac03a59ff26b430939630cb5cd4266d2658d3b836d576f9","src/zlib-ng/te=
st/CVE-2018-25032/default.txt":"d7f8278db331c47bd1208bf41e7903cbddee4f7b47c=
666c40afdd3c96237752e","src/zlib-ng/test/CVE-2018-25032/fixed.txt":"3b27a98=
edd2f3f580033f9add11d3469d7808c969a1128ee00c18ac7a12cef57","src/zlib-ng/tes=
t/GH-361/test.txt":"358497d0a7251ea42101dc77b02337f46fd89af09643a8288e2a308=
2e5d24128","src/zlib-ng/test/GH-364/test.bin":"af5570f5a1810b7af78caf4bc70a=
660f0df51e42baf91d4de5b2328de0e83dfc","src/zlib-ng/test/GH-382/defneg3.dat"=
:"b22bef6b7392401c9e7b079402c4a4074053d7a914d050400e37fd7af6fe26d5","src/zl=
ib-ng/test/GH-751/test.txt":"b83d833803b7bc3124fb2a0034081f0b999ad10c33a8df=
a3bfd181dc078ae3ee","src/zlib-ng/test/GH-979/pigz-2.6.tar.gz":"2eed7b0d7449=
d1d70903f2a62cd6005d262eb3a8c9e98687bc8cbb5809db2a7d","src/zlib-ng/test/Mak=
efile.in":"a6b0a02967a93d78f88d705cdebeaec7e3ce85ff2bc65e30e80324ccff29f7c7=
","src/zlib-ng/test/README.md":"6a34f8fc7a0144958cc9a0cded46fc38a7e15aba3df=
a5bf56d8d86c3fb72d82c","src/zlib-ng/test/abi/ignore":"02aa87f77656dbc1fbddd=
23f436cd15465a92df0722da4055cae1bc8bf013097","src/zlib-ng/test/abi/zlib-v1.=
2.11-arm-linux-gnueabihf.abi":"f5e91f25b558a891fecbeb6e2e9575698630ab700d05=
5a38f3bc4fe66257f513","src/zlib-ng/test/abi/zlib-v1.2.11-x86_64-linux-gnu.a=
bi":"038337383cf780587d810cf5400d632f3a1f8517e63ac4a71b6e5224db8b1413","src=
/zlib-ng/test/abicheck.md":"d960023cd80e04b2d4dcec8cdd3315c7292229d45a3301a=
5dc5213058ba22185","src/zlib-ng/test/abicheck.sh":"7be2e4774543a1c018c6024f=
a685de2ee3cdcf06ee6419e04b23249e0fcd6645","src/zlib-ng/test/benchmarks/CMak=
eLists.txt":"0eeacc3b19579d75fbd6a50cc1ad980a6daafd99e92474b156ae2e57b23503=
9a","src/zlib-ng/test/benchmarks/README.md":"2976b327e44b0066ae197b15bc0201=
f4e43375019718714f05acf50f9245f9da","src/zlib-ng/test/benchmarks/benchmark_=
adler32.cc":"65d98c8fa2b24bc9fe2335159d030c2f8cbd0a4af38bbb9e823b3fafaaa93c=
65","src/zlib-ng/test/benchmarks/benchmark_adler32_copy.cc":"6a5cd0ab97ff46=
c5b67e85abed05b28a4a8d7d5be50e8b8aa66bf47ab49acc06","src/zlib-ng/test/bench=
marks/benchmark_compare256.cc":"faf9dd6246d453005c7a14638abb9833db40f060110=
254eb5ff1739fba170e3c","src/zlib-ng/test/benchmarks/benchmark_crc32.cc":"33=
e14b97607f17069c64351564baff8d8d86c969baae98073491d986f0731a99","src/zlib-n=
g/test/benchmarks/benchmark_main.cc":"b23f1419d7c6f6dadd63fe69afcd54d4821aa=
f95782145f3feb65d5d8564233a","src/zlib-ng/test/benchmarks/benchmark_png_dec=
ode.cc":"e9485de5e722ef1b62131a27a98d2cfe668ee8becbd5fc9938972022e07c8d60",=
"src/zlib-ng/test/benchmarks/benchmark_png_encode.cc":"4b2203af2ef58f95773c=
a6d82569f747f2cfb3c4116334871cfb255a0d7741e1","src/zlib-ng/test/benchmarks/=
benchmark_png_shared.h":"23427ba4e9865ee362990c22a1aa88e868a1ac1f4024892c6b=
6c2a3102566a93","src/zlib-ng/test/benchmarks/benchmark_slidehash.cc":"061d8=
0301e2c016f0e29b04e545b7785eadc5106c6ec431ab1a721628d8c8cd9","src/zlib-ng/t=
est/data/fireworks.jpg":"93b986ce7d7e361f0d3840f9d531b5f40fb6ca8c14d6d74364=
150e255f126512","src/zlib-ng/test/data/lcet10.txt":"1eb5d7bddb1c3cb68064d5b=
5f7f27814949674b6702564ff7025ced60795a6d9","src/zlib-ng/test/data/paper-100=
k.pdf":"60f73a051b7ca35bfec44734b2eed7736cb5c0b7f728beb7b97ade6c5e44849b","=
src/zlib-ng/test/example.c":"f84aed9043e995123728c6fccab2d9b2da0439962b5902=
775c9e29a9b06806a3","src/zlib-ng/test/fuzz/CMakeLists.txt":"e9d833705121d8f=
6c79efb5dc3b8a8acf909837c70f3b3fe610228575ea72b0e","src/zlib-ng/test/fuzz/f=
uzzer_checksum.c":"68ed79ec1d7fefa548f4d32ab7885479442520cdf53ad59eadfae13e=
4b15efe0","src/zlib-ng/test/fuzz/fuzzer_compress.c":"3f507a18710fb2a1d87fde=
5cf3affc74b53a689e9d2ce6f887ee64eb778e568b","src/zlib-ng/test/fuzz/fuzzer_e=
xample_dict.c":"46541ed3ef9bb7378120d47133f18b4194e955e7a84a439647205de68e7=
45c08","src/zlib-ng/test/fuzz/fuzzer_example_flush.c":"393e7872825bb1ca366d=
0d8552b94442511ed4a557db6ece16540b79b7e9cbdf","src/zlib-ng/test/fuzz/fuzzer=
_example_large.c":"e3b91b1ced83dfe538e8ae5262f1756181a7785e8c2ab38ac2881456=
bd562277","src/zlib-ng/test/fuzz/fuzzer_example_small.c":"de9f5dc3182405750=
341a0f44c37bd8ba4f21d993284456ba8e6ce3e36d6b9b3","src/zlib-ng/test/fuzz/fuz=
zer_minigzip.c":"a02628aa452d9eb0ea42bf3c01b005a6569da50c832b78f90a1dec425b=
f3c677","src/zlib-ng/test/fuzz/standalone_fuzz_target_runner.c":"e6170b744f=
aa68bf2a414e99fc87accf4db2a5e0eb58b17aded5c692ea493604","src/zlib-ng/test/g=
h1235.c":"8310ef780dc483a1708750cd7c120b8e9cc0e1614767d24c01869e529074e981"=
,"src/zlib-ng/test/infcover.c":"b4a4b659b2180fbfe0178940235eb9773508a7794f9=
d27c758e0ee8f7971d85a","src/zlib-ng/test/minideflate.c":"56d3f2a8b72cbce8f5=
8e4d26591cceafed58c5441a1efffc619c3baf27be8e13","src/zlib-ng/test/minigzip.=
c":"3c2a2bfd67c1bffe9cf55ef2e15648aab7a209a6546beeb4df0c27f6cc7cae53","src/=
zlib-ng/test/pigz/CMakeLists.txt":"aa70f1025adc004985bfe0accee9b7a80e04786d=
82705e27c377a5e8d4ecbaaa","src/zlib-ng/test/pkgcheck.sh":"75b3155125f235e27=
ee434d76b6f72bd825899b55f6d59ef2d032fe67a2896ed","src/zlib-ng/test/switchle=
vels.c":"f4c482766b2e85ebdfe74ab488b16a4e807d5894dce2cfc5a0501c347db211fe",=
"src/zlib-ng/test/test_adler32.cc":"1b53271b0317c4ac435fb7f1c430fbcce004136=
4596b8658b2d4ef4ced04a28c","src/zlib-ng/test/test_aligned_alloc.cc":"2728bb=
53528f280830b63ad5abf2674227cce8ae7840b5a4c4841c73d95ec09d","src/zlib-ng/te=
st/test_compare256.cc":"1068f9f8d20660429a224392112dcbfc45fca5eb5116d31e61f=
b98a9d3f28389","src/zlib-ng/test/test_compress.cc":"2e0b0c8435ca89dbf827f4c=
1e00874ad52743703644143dc8823ac5699507a36","src/zlib-ng/test/test_compress_=
bound.cc":"6cf532aba78cfad2b453a6be96de3afa1e1ff49f062d376615e6f7028cfed14e=
","src/zlib-ng/test/test_crc32.cc":"c111ceb33473a2514e6df5fb0abc4f495e13f7a=
8e37255476ae0ef3d7e75decf","src/zlib-ng/test/test_cve-2003-0107.cc":"629f1f=
e659558c9deb767b3fbbb615539b0458f8b67a405ece924cac6bebb531","src/zlib-ng/te=
st/test_deflate_bound.cc":"5bd722e6749612b714bef7dc8dc183759b629e8afa8f0684=
15378e7ff7ac12d9","src/zlib-ng/test/test_deflate_copy.cc":"1a286ba7772bb1a6=
d06233b075a83f3f1814bab2fd7d3757c090f5db25db90f1","src/zlib-ng/test/test_de=
flate_dict.cc":"344613040cb70d9f6ba6a3c40c0ef452644f9656c43f1e0969b84f487e4=
e3db1","src/zlib-ng/test/test_deflate_hash_head_0.cc":"3144479b7d5b9f3d4ad2=
ff2d43dbce5b3e7043acd1ae5b06d6ce8db6e98c8573","src/zlib-ng/test/test_deflat=
e_header.cc":"93bf9a4099540d47fe01c07afeb8dbc37a5551076c98df1dca2b9b5e96aa8=
131","src/zlib-ng/test/test_deflate_params.cc":"3701da15960c0984373cde19d14=
596c26911679e0b95e5261cb8515f65150b65","src/zlib-ng/test/test_deflate_pendi=
ng.cc":"faeeaf37a8aa2512e8551084a20c41181910335021961728be26f568c7f68cf2","=
src/zlib-ng/test/test_deflate_prime.cc":"6c83e5563d00d05bf62ce0e7bc1ccb78cd=
080c1627b2a3bc878fa2c2b11986aa","src/zlib-ng/test/test_deflate_quick_bi_val=
id.cc":"9706d0bf9d844b21f1655498bf0f9901c7dfc272cdef37f2d1af238c71df611c","=
src/zlib-ng/test/test_deflate_quick_block_open.cc":"30e81885917d8414faea99f=
74ed178790ed7c2884ef231d7f144f9fa32f993c1","src/zlib-ng/test/test_deflate_t=
une.cc":"dad52ad7941aca761ff177877a0d60f1b68b3a6d28a8f4bd382005f3c04bad64",=
"src/zlib-ng/test/test_dict.cc":"2bb6c32ec0ea76561172e0b5e8c6a7bf4f64efc2b4=
1534b42ec1d6c3d0990897","src/zlib-ng/test/test_gzio.cc":"2b811ed1927015decb=
4470073b59f85f6e405559eae044b5eeab545b8a492bbf","src/zlib-ng/test/test_infl=
ate_adler32.cc":"f4c1e9f88cdbbd672cff8bef2eab8c01ddb598494d1ade07d3f3630d19=
169f6a","src/zlib-ng/test/test_inflate_sync.cc":"fbb1121ea5b5448723c6d6d869=
2110c7362e6833fae22afcd46909d4ecb1289b","src/zlib-ng/test/test_large_buffer=
s.cc":"168eff24816cb28e2b49188012cfec9ac474b01e83c5bf8ae602f010f100fb61","s=
rc/zlib-ng/test/test_main.cc":"62e058cb2a411010796c5e69e55759fccadd8ce49fce=
f6884a9cd9b035d054e8","src/zlib-ng/test/test_shared.h":"c11e53b07ade7065e83=
bc92e812a0af56d6202b40bcadf1f4473cabc152e2579","src/zlib-ng/test/test_small=
_buffers.cc":"680ba24dc58c7dd05e8dab2e430a8e0c99b946cbc341a5fb39c4b4b921b6f=
b33","src/zlib-ng/test/test_version.cc":"8599eca8dd63a96962a5c8ac01a3172d20=
3f9065e228867928ed4bce61cf6009","src/zlib-ng/tools/config.sub":"32186cfeb5d=
b62c99e1dfbfb07f24c1a50977447b4c26d2907021c74422a70d2","src/zlib-ng/tools/m=
akecrct.c":"6194908f8f810a626f3183c379b067e9b1897b88276ecf9011590a21a43a1a7=
8","src/zlib-ng/tools/makefixed.c":"bffd02540231304f9bcc755b8cb9ae5cfbc4897=
5857bbb4547f1d6acce21ef57","src/zlib-ng/tools/maketrees.c":"3ea81e69ac0767e=
479e7065662e4f6a4e6f528acb78c86968945017357f802fb","src/zlib-ng/trees.c":"e=
4eac691fe9e535e2d0582f326d5f0cd8c216265716e848b6b9d5f94e881781a","src/zlib-=
ng/trees.h":"24174f3543b01ee1ef370bbf6d15551a21871cded18b2aadf09a71e7904b6f=
99","src/zlib-ng/trees_emit.h":"6c541dcf01eecf393d4eab7800bc558ad524114bb5a=
8deb86f13376fbef88754","src/zlib-ng/trees_tbl.h":"022736ff3362ef3591d1f8fc3=
b7fede5927c0d25ab0813d7ef8cd95efd6ea242","src/zlib-ng/uncompr.c":"1656c770b=
8f7455bd5ed3cee78d226b010a56ce9c6a4ce66b4f65df1c19cfef4","src/zlib-ng/win32=
/Makefile.a64":"115fe42cf85877e66137893c02fde21e9010848b34965544a57b5540b46=
01a48","src/zlib-ng/win32/Makefile.arm":"1ced9c213d47e451f5dc21c4eb4cd05e6c=
021cb2d2e36d60d6f8dd69fbfc519f","src/zlib-ng/win32/Makefile.msc":"fbbf3fe93=
bdbe11ac1e79d471d862fd6dfa6874501bc682d2b084cdb3f3c2425","src/zlib-ng/win32=
/replace.vbs":"0ecd6d2f42f4f49d835acbf7b89a79cbdf17fed29d5931eeb3b40da6d313=
3946","src/zlib-ng/win32/zlib-ng.def.in":"3d1167b8b9db56bf3ae5e4b569af743b5=
d008d012f4ac2ce5e4b6f951b9a71bd","src/zlib-ng/win32/zlib-ng1.rc":"98b6d62f4=
27509c4fd22c2288541f99455e1f1f7a9a349e859cc2f7e1d438ea1","src/zlib-ng/win32=
/zlib.def.in":"ec69c79c2a5612a5c4dc9de08c930c9b251f2455e4bca8781f70c05f7170=
fb3a","src/zlib-ng/win32/zlib1.rc":"66fa46294e779c0c7182d2d01abee6b112ae5e0=
5d91726e3684925df7d8433df","src/zlib-ng/win32/zlibcompat.def.in":"c4dff5ac2=
cfe629155c7de5b0f139fb1c962fb01addbc032c3cf35110921eb27","src/zlib-ng/zbuil=
d.h":"2f336c4af4c1445029b31d55db1ddad65ef78b3db0026d910aa3c3b20cf58e66","sr=
c/zlib-ng/zconf-ng.h.in":"91893ca925182a08fe11bd728b77dd818bb0af15ab5abe9a3=
9d8d01e2e114d08","src/zlib-ng/zconf.h.in":"2816eef7bb70d874d8be00cdf984ecc8=
04a8213a0d47454e7feabde2bdadf9a4","src/zlib-ng/zendian.h":"f5cfa865281d2c5d=
0b097d318500f27daeec346e7882de68e279486d79c52e77","src/zlib-ng/zlib-ng.h.in=
":"cd139e1dea10683be03cb6be6847980c0595d026474076866b952fae3709ecb6","src/z=
lib-ng/zlib-ng.map":"03ef4439594619e215dbb1717f8c13e16159308ef3817761ba1a3c=
ca7f7834df","src/zlib-ng/zlib.h.in":"3261ec4605c45a065d5270bd1ab225639ff5a9=
53053e830347f82eb0f919860b","src/zlib-ng/zlib.map":"9997aa913dec6da106ab208=
9d2a72ca5e1b7fafe0807ac0bc1318ce8c8defab9","src/zlib-ng/zlib.pc.cmakein":"4=
e25f45fe7522c3f444a27dbc68ca595447ee4f73be6d0fdcf7abccac67cda09","src/zlib-=
ng/zlib.pc.in":"e7964018e5293e5221573c129e73b379499dd5aa8b9739db1782fdfa24b=
bdff7","src/zlib-ng/zlib_name_mangling-ng.h.in":"474b5cadd2deba6c78084aed9b=
872e95c3888ffcdba153b934fca4f88dd1c36e","src/zlib-ng/zlib_name_mangling.h.e=
mpty":"38e51a846d6c2bd6100298c55328dba4437c08fa1dceda4eb2e06ecb1d142058","s=
rc/zlib-ng/zlib_name_mangling.h.in":"00c1b07fdbcb52c43f3b11ae5a4c98f6691804=
9f53918607e698b992a46024fa","src/zlib-ng/zutil.c":"64ecee4e622d6fe4d00ca94b=
d302b27beb03178129d4be4b2d12c1823a73a27f","src/zlib-ng/zutil.h":"59cc0ffe4c=
13662d9729e28ed098803e6f1c6d36fd8b0654da9bca53eebc3b4f","src/zlib-ng/zutil_=
p.h":"ddf2e95f2e7462a1ae4d330b26d454a394684cbfddf74af3d3e4ceff5db85275","sr=
c/zlib/CMakeLists.txt":"b87275731cc3ebdfea144187875cea204f555c343279c0f35f2=
d46d661bfe34a","src/zlib/ChangeLog":"4c9f1a65b9b4be8bf164a97775ef50e4db4e02=
ea8c9933fdbe629a640691375e","src/zlib/FAQ":"1e8a0078be0ff1b60d57561a9e4a8ca=
d72892318a8831946cba1abd30d65521c","src/zlib/INDEX":"3b4e325d47ae66456d43fc=
f143ba21ab67a02a4f81be7ef2da480ba30d774266","src/zlib/Makefile":"ef23b08ce0=
1239843f1ded3f373bfc432627a477d62f945cbf63b2ac03db118a","src/zlib/Makefile.=
in":"5021b2bac4164f48b17c91c8a2e3c225be7ad31d8bfab1bbaadd90370afe9991","src=
/zlib/README":"7960b6b1cc63e619abb77acaea5427159605afee8c8b362664f4effc7d7f=
7d15","src/zlib/adler32.c":"d7f1b6e44fee20ab41cef1d650776a039a2348935eb96bc=
bd294a4096139be3a","src/zlib/amiga/Makefile.pup":"a65cb3cd40b1b8ec77e288974=
dd9dc53d91ed78bbe495e94ccc84ddd423edf1f","src/zlib/amiga/Makefile.sas":"0e6=
3cf88b505a1a04327bb666af3a985c5e11835c0c00aed4058c0dcc315d60e","src/zlib/co=
mpress.c":"5c11e1fc22e219cb986f6fa9e4ba939315227e84aef042737d38ec668b89b6d2=
","src/zlib/configure":"86b38f27f31d2fec76d9355872550dc63cb3949774473fd6313=
c5a3fd1def0e2","src/zlib/contrib/README.contrib":"ca39b78bd7ad84f1df7b0da90=
770c5b3fa4c8e2c75d132e9222812fac8839630","src/zlib/contrib/ada/buffer_demo.=
adb":"469cf566a6965767fee6b987a239ed8cedcc66614940d45a9b434331fbb435ce","sr=
c/zlib/contrib/ada/mtest.adb":"41b6f31684770334afdc4375871eb1408542f37a823a=
073556fdbfdb63753160","src/zlib/contrib/ada/read.adb":"fa5b989aef0c5715a3fc=
b15de93985f7f10aeb0a7f5716745c95ed820eb9af9c","src/zlib/contrib/ada/readme.=
txt":"8fe9e5303f2e8e8b746c78250e74b7c4aeb7ce6212fdce751fc3a0ce56a47fe2","sr=
c/zlib/contrib/ada/test.adb":"5e3abe79b387e09a9a42bd0543105e228f39a335240cf=
fc33d71f0ba66ff2511","src/zlib/contrib/ada/zlib-streams.adb":"f45988e2bac76=
eb25a0dc981f46576e7432c35dde1790bbc2b650f0090b7fa72","src/zlib/contrib/ada/=
zlib-streams.ads":"969e8edb0611810fb52159dcb7c40228f4e5da810a7a3576b778116a=
93038c6b","src/zlib/contrib/ada/zlib-thin.adb":"03d89244ee5ec9771d9b5050e58=
6c609f851af551b2e64eb151f1d5be0b63ae9","src/zlib/contrib/ada/zlib-thin.ads"=
:"631ef170bde16c3ca8d412b54a0e519815b80197d208f8f393e6fe017bb0968e","src/zl=
ib/contrib/ada/zlib.adb":"c9ca5dc34fbcdf06e2dc777b7e9dcd0ba31085b772b440eb0=
e12421323ab672c","src/zlib/contrib/ada/zlib.ads":"02634bec0d5e4c69d8d285912=
4380074a57de8d8bd928398379bfacc514236d2","src/zlib/contrib/ada/zlib.gpr":"8=
59bb69dce38dbe9dca06753cf7ae7bd16d48f4fece8b87582dab8e30681d3de","src/zlib/=
contrib/amd64/amd64-match.S":"166007f7e9adb58fe8b83d85bbfe823f5e05858ba1d06=
edf637b78886caa2c69","src/zlib/contrib/asm686/README.686":"c21cc7147c956eca=
e17dd084cb41a206b086216fa521012871fb07fafd203c6d","src/zlib/contrib/asm686/=
match.S":"873799062495629f21cd3f779ea4b927add7aae0144e32d3594d9ce70185e99d"=
,"src/zlib/contrib/blast/Makefile":"17d5d26c24bf51cad51045a38ffb73cc3539d29=
e89885aa249fcfd45a8659d5c","src/zlib/contrib/blast/README":"baa763ae03d88ef=
7ece6eb80d9a099b43d0b57639d6d281e1c7c6ca79d81daba","src/zlib/contrib/blast/=
blast.c":"1ab3e479d342bfc144167b808fb00142264bc50f24a110ca88cc774e351c218e"=
,"src/zlib/contrib/blast/blast.h":"4d4e3e6f893316f0be77bfd642c857a77f1fa292=
5acb5df9753e543d35aa3a6a","src/zlib/contrib/blast/test.pk":"5f5c262c545574a=
5c221132d5ef832478d222d70b015341795b3860204140d7c","src/zlib/contrib/blast/=
test.txt":"9679b2c98e1283222d0782b25a1c198dc64ba9ebd1addd6dc6f643a45947cda3=
","src/zlib/contrib/delphi/ZLib.pas":"1b20e173443a68c189cdaa4795620fb1ac165=
d9e61a27a1ed2cf690f13530d6f","src/zlib/contrib/delphi/ZLibConst.pas":"84bcc=
580bdf397e570f86f3f5a5b8c7bf537828f30b4b72648b81911f6bf5095","src/zlib/cont=
rib/delphi/readme.txt":"f7420ed2de77d4b498eefbbe6402a1d17dc2d411735289c78a2=
65c7f10fdaee5","src/zlib/contrib/delphi/zlibd32.mak":"850e91b6c9ea05de61a41=
1cbda16fa0f10118cd88bb32c4b7226988776f8d511","src/zlib/contrib/dotzlib/DotZ=
Lib.build":"b96137097669644ecb9f42cdd3399d1fce9c512788374609303f7e50abf597f=
0","src/zlib/contrib/dotzlib/DotZLib.chm":"20d0e3edd57f849143255a7f0df1cd59=
d41db464a72c0d5ab42846438a729579","src/zlib/contrib/dotzlib/DotZLib.sln":"a=
979198c5b8d144c1ac8f993bfb6f4085d135aa58ca9dcf63ebabf52b5c695f7","src/zlib/=
contrib/dotzlib/DotZLib/AssemblyInfo.cs":"314afcfb339ea95f5431047b7ab24631b=
11c3532c7ce5dc2094ed0cf80a7c16d","src/zlib/contrib/dotzlib/DotZLib/Checksum=
Impl.cs":"e7c047a2c3bcf88d3d002ee3d2d05af414acf53cb4451efacc0f2e95a474ea0f"=
,"src/zlib/contrib/dotzlib/DotZLib/CircularBuffer.cs":"be84c9736fe7bdc2bfae=
70466d8fff582504e928d5b5e110fd758090090c8cb7","src/zlib/contrib/dotzlib/Dot=
ZLib/CodecBase.cs":"259bdda1b7d6052134e631fa24bfd9dca6e2362563496c8b85257b5=
6c848908c","src/zlib/contrib/dotzlib/DotZLib/Deflater.cs":"06ba6696a3c15c53=
ba5fd5a1c2bf50b51f217010228fc1e4c8495ee578f480de","src/zlib/contrib/dotzlib=
/DotZLib/DotZLib.cs":"9837fe993fd631233cc5e53ff084d86754b97f05ec77c54b0764c=
2706f186134","src/zlib/contrib/dotzlib/DotZLib/DotZLib.csproj":"21606db31df=
ef6410dd438b73f1db68856eacabcce6c0f0411fc4f17e17001f3","src/zlib/contrib/do=
tzlib/DotZLib/GZipStream.cs":"8d1de9755c77046b4ac71340a0a54434ebf4fd11b085c=
44454d7663a9b4df1c5","src/zlib/contrib/dotzlib/DotZLib/Inflater.cs":"9016ca=
73818f5b6a28791abc3af6da7c4d2773b6a3804f593f6d5737a62b99ad","src/zlib/contr=
ib/dotzlib/DotZLib/UnitTests.cs":"ad66ac08de34d253e9615b96a745f3dfeda93f4a9=
78d65d5d3ddb9d0d9b3e099","src/zlib/contrib/dotzlib/LICENSE_1_0.txt":"36266a=
8fd073568394cb81cdb2b124f7fdae2c64c1a7ed09db34b4d22efa2951","src/zlib/contr=
ib/dotzlib/readme.txt":"d04972a91b1563fb4b7acab4b9ff2b84e57368953cc0596d5f5=
ea17d97315fd0","src/zlib/contrib/gcc_gvmat64/gvmat64.S":"22ff411b8b1d1b04ae=
aa8418b68245400267dc43c6f44104f6ccd37f0daee89f","src/zlib/contrib/infback9/=
README":"890288f02bb3b1f9cc654b87a07fcea695f90f6b9bd672d25bf6be1da2ec1688",=
"src/zlib/contrib/infback9/infback9.c":"0a715c85a1ce3bb8b5a18d60941ffabc018=
6a886bcc66ba2ee0c4115a8e274e9","src/zlib/contrib/infback9/infback9.h":"dda2=
302f28157fe43a6143f84802af1740393572c2766559593996fd7a5a3245","src/zlib/con=
trib/infback9/inffix9.h":"84a2ba4727767c18af6505f0e81d9c814489c8b9ed330a25d=
ad433db72997e43","src/zlib/contrib/infback9/inflate9.h":"32a907676cc36e27d0=
fdc0d99adb83a0b23f20ab61896269216d40fecf08d349","src/zlib/contrib/infback9/=
inftree9.c":"0c7f10396703b230c504207fe1595a2f2f8ba9c43158c4bd79d5b22ca36e04=
e0","src/zlib/contrib/infback9/inftree9.h":"8ae61d52e50d2dbdb0378548ecc54fc=
d88f108c8b6fc30562a3ebec1ca6a599e","src/zlib/contrib/inflate86/inffas86.c":=
"6f266f3c7e0faca653256d0189c0f00d7dc0b062d02e25df4e1202e49369595c","src/zli=
b/contrib/inflate86/inffast.S":"70777bd21526680005fc34f086d108af49e2668ad86=
d1749e8e8100a81bfb288","src/zlib/contrib/iostream/test.cpp":"0f3c77e013949e=
b9c91e6b690ea894e19d97944d6b0885b82806fc3ad99680cf","src/zlib/contrib/iostr=
eam/zfstream.cpp":"8ebb9b3d521cc3392953f27658cf1f6dcb763216079f69a1518ec5ca=
0e42a63b","src/zlib/contrib/iostream/zfstream.h":"4369c35e66f63f52ca4a5e175=
9bf720507ccabb8f3f132e2f18e68686c812401","src/zlib/contrib/iostream2/zstrea=
m.h":"d0343e0c57ff58008b6f29643d289c72713aa2d653fe3dcd2e939fc77e7e20b6","sr=
c/zlib/contrib/iostream2/zstream_test.cpp":"f789df183cc58b78751985466380c65=
6308490a9036eb48a7ef79704c3d3f229","src/zlib/contrib/iostream3/README":"43e=
c48ecbd95a8c45db20b107fac73b740bb11595a4737329188f06b713972cc","src/zlib/co=
ntrib/iostream3/TODO":"af5ebc83fb88f69706c8af896733784753dead147687e1c046f4=
10c0997fd88b","src/zlib/contrib/iostream3/test.cc":"8e17fc48dfdbc6e268838b8=
b427491b5843b6d18bc97caa6924de9fad7abe3da","src/zlib/contrib/iostream3/zfst=
ream.cc":"8cdd67ed0b13c192c11e5ea90e9d5782d6627eb303fbc4aa5ebda2531ec00ff8"=
,"src/zlib/contrib/iostream3/zfstream.h":"1bd74778fac45ee090dfc0f182a23e8a8=
49152deb630606884b2635987b357b1","src/zlib/contrib/masmx64/bld_ml64.bat":"1=
c0561908a07ebdff271b12ed757241e1813d3db0f3551501b2595c23f0833aa","src/zlib/=
contrib/masmx64/gvmat64.asm":"390c1e6d63cb615b5ba042842738953f9cdc688b2fe35=
aaca981fd3fae213f3f","src/zlib/contrib/masmx64/inffas8664.c":"f6c585e43e6e5=
24107566b1f10104949d0ef902159ac8203e1d98e50d4bedd62","src/zlib/contrib/masm=
x64/inffasx64.asm":"8448d0041fe6e8f4188fe5916181a1b274c6d35d75cfb28da60cf4f=
1edde44ec","src/zlib/contrib/masmx64/readme.txt":"9bb66b5028100855683853f12=
da0be479c7bccf74365fdbf37da2542edff9927","src/zlib/contrib/masmx86/bld_ml32=
.bat":"b0b05b62715d4a81a7db5b7ca4a372d109ec95634c9d3bef9e0041ff52de22fc","s=
rc/zlib/contrib/masmx86/inffas32.asm":"78d2cc88f8ed0e32ef960efc987c257bc168=
8afe7d031a8ba18761e95a6a7c3f","src/zlib/contrib/masmx86/match686.asm":"9e9b=
ea3b5517b089da7d39caded07982746a33f94f0907ca7e8afefed7be36b6","src/zlib/con=
trib/masmx86/readme.txt":"1f29a04e0227b74e20ba1b7c764b3ca5bf596dd2c06e89bc1=
9a05fb8f9689778","src/zlib/contrib/minizip/Makefile":"087034de3dc0223b29e64=
bb3a4fc3eda7b948e93d2a9ff154aecf9fed2a1eb5b","src/zlib/contrib/minizip/Make=
file.am":"2313a3480a2c3745fa7ce216829cd0367058907d3a0902e5832c66c84a2fdfc6"=
,"src/zlib/contrib/minizip/MiniZip64_Changes.txt":"302c62b328647f5472fb7755=
249a83459be7f8ffb1fae07e8ba318fce8f4126c","src/zlib/contrib/minizip/MiniZip=
64_info.txt":"122719c32ef1763a5f6ba9c8cdefc1d78a76f7156b09e7b6f69b73f968e0d=
ac3","src/zlib/contrib/minizip/configure.ac":"35330dc0c6188127afd339829d91b=
19739d23bf3b7301bfb04f775a6fcbbdad7","src/zlib/contrib/minizip/crypt.h":"8e=
872b60255b8447da99885c7159c2e1f1bb8143523bdbe71784e60f98bfd67b","src/zlib/c=
ontrib/minizip/ioapi.c":"66b39c27042f6ad12cc12efb0c82cdf100c6640b5fa959b8b8=
66e252966113a9","src/zlib/contrib/minizip/ioapi.h":"8655408534b78dc0889a45f=
9359fc6d2d5c8e8d8443b81ede596f954c720ef48","src/zlib/contrib/minizip/iowin3=
2.c":"2c05bc374d3d847c6a9f29eac9d674abba7659d1e91e34e172248fcb5c274d51","sr=
c/zlib/contrib/minizip/iowin32.h":"586f22b9c3c64da253ce2b518e0fad61f19a7b47=
b289fc704cc9708242294c49","src/zlib/contrib/minizip/make_vms.com":"65736d9c=
4888f2373d3db0a13864d150c5040453f5bc2a5c8784379a7ea67590","src/zlib/contrib=
/minizip/miniunz.c":"ced49f20c62536a8ffb270b35cfa4994a1dcdce45f8cf059b941c9=
4ca0022666","src/zlib/contrib/minizip/miniunzip.1":"66d8684392167091ef0fe01=
598d6a0daa26e7e448e2df6c3cb257487735b83f7","src/zlib/contrib/minizip/minizi=
p.1":"5404596e8e5587a52f563906119f32ceee30a6d97a966afa5c7afbe4d373e210","sr=
c/zlib/contrib/minizip/minizip.c":"fdfcf83979ef2324c1455d369e8add8678c80493=
9d412ce53f8b024578ceabad","src/zlib/contrib/minizip/minizip.pc.in":"8b6670b=
42d8e5e519e1cc89db093efc07ba23cb1ddfedd3c93ff2df08c3ce8ac","src/zlib/contri=
b/minizip/mztools.c":"cd887c4af6d20823bd15f24008b10acf01969b4165d7848656bde=
843a92428d7","src/zlib/contrib/minizip/mztools.h":"6f82c52279e8f79165f4446b=
e652e5741a49992ac58632470335aa34c564072a","src/zlib/contrib/minizip/unzip.c=
":"497adf676b1cae2a7afa834e4aba86383f7b697f5fdd03a8179ea9024a431cf9","src/z=
lib/contrib/minizip/unzip.h":"d8dc58fc0121b6a4b98f3028205bb253f956b1ddf791e=
9ced3cf44892502a01f","src/zlib/contrib/minizip/zip.c":"00f403cb7810578b4b26=
87dd55fb132c850c3630fba2f3704a8ab896fcc8209a","src/zlib/contrib/minizip/zip=
.h":"96163fc140e4bf08752e014d20a1eac3f5adcdc408366f6d79c1895f2599cf08","src=
/zlib/contrib/pascal/example.pas":"d842d456ecb6ff80e34cee2da31deb2072cc69ca=
837497bea8b8bee203403474","src/zlib/contrib/pascal/readme.txt":"02f997c3799=
1ddae0cb986039f7b4f6fc816b3fd0ffd332cad371d04c12cf1b9","src/zlib/contrib/pa=
scal/zlibd32.mak":"850e91b6c9ea05de61a411cbda16fa0f10118cd88bb32c4b72269887=
76f8d511","src/zlib/contrib/pascal/zlibpas.pas":"28b90aeeb3da8d1f6a98ab9f5f=
1603d08aba5bfabc50827d3f15e661268a51cf","src/zlib/contrib/puff/Makefile":"d=
9d738030464aaae354196c14fd928adf591832fce7d71ac1977c1d8d4923a4b","src/zlib/=
contrib/puff/README":"aceca4bc1bce7d9445b8bc9b6640c672d95708185f6070d3a3baa=
e7a9d102caf","src/zlib/contrib/puff/puff.c":"6d0eef92e115a42e570b79d8b07a04=
af5ccbd6b3f3fbca9cbc61c49db9c9df43","src/zlib/contrib/puff/puff.h":"969b7be=
2a930db0cdcb19b0e5b29ae6741f5a8f663b6dba6d647e12ec60cfa8e","src/zlib/contri=
b/puff/pufftest.c":"8ee0da78a1221a3c2036e22eed06c2faa27a671a46565a60e10111d=
4ee9c30ee","src/zlib/contrib/puff/zeros.raw":"b7b0887089f7af1f6d1e0b4c0a1e8=
eddd10223b23554299455c6c9be71b653a3","src/zlib/contrib/testzlib/testzlib.c"=
:"c6c37b35c6ecc9986a9041f86d879cc37a9e4d8315af9d725071eb3b2cade0c5","src/zl=
ib/contrib/testzlib/testzlib.txt":"2359bbdc84eb8a04e0f1cd16cd81a2896e957f2a=
d58dab3ca78ef55b7d0dc577","src/zlib/contrib/untgz/Makefile":"8f5ab1564813e0=
91cea8f1bb63da32fd80ac763d029277b0cabf50f60aceefe1","src/zlib/contrib/untgz=
/Makefile.msc":"d0f537de11d9e0e36e2a98b3971c537265f4b533b4c48797094365ad9ae=
8388b","src/zlib/contrib/untgz/untgz.c":"9a12d774301d252dcd38bba07ac369319d=
a4c04c4fef8a50fcbf40aebf29c2a1","src/zlib/contrib/vstudio/readme.txt":"2a9c=
a40b68274f4d37649dfab9e5e867a000883592b4ab8fdaec8425a63052c3","src/zlib/con=
trib/vstudio/vc10/miniunz.vcxproj":"dd607d43c64581172c20c22112821924dfe862f=
56b2e5eb8780bdd0714d9527b","src/zlib/contrib/vstudio/vc10/miniunz.vcxproj.f=
ilters":"c3db9f97952683e688ad83c13bb94c816ac3e6b5f277fdea545b0650c125aa6d",=
"src/zlib/contrib/vstudio/vc10/minizip.vcxproj":"af73f2cf8ae51e65e85342faeb=
40849a2310c97bc77def42b38d7070460a6cf0","src/zlib/contrib/vstudio/vc10/mini=
zip.vcxproj.filters":"83db58d87f5d7ca84b6087aa1f62b15cbc296194c8cf76e47a271=
f9077b4f3bd","src/zlib/contrib/vstudio/vc10/testzlib.vcxproj":"1525ed0893db=
56db44ec68675c8da3c229dc7867166dfc0428816783d16ad43b","src/zlib/contrib/vst=
udio/vc10/testzlib.vcxproj.filters":"d7e04ffa467d417dfa3c0f1c64234cadc84882=
101bbae483f0a0f5d3d6b566a7","src/zlib/contrib/vstudio/vc10/testzlibdll.vcxp=
roj":"3f317d8964f17901c3e68bff5deaec10b6ccc50a572235999e8097292692984c","sr=
c/zlib/contrib/vstudio/vc10/testzlibdll.vcxproj.filters":"682a485f0184aabba=
94e12e1b284499195f37c176d43ecee0484f31e4d636f6f","src/zlib/contrib/vstudio/=
vc10/zlib.rc":"e8b581eb16930e0213d37143a5f17868839b22c758b23981a29484e17093=
c494","src/zlib/contrib/vstudio/vc10/zlibstat.vcxproj":"2a38222d6c034d7e0b8=
43c3f0540dc6c53dd48f942ae29f31620ca0327248c8e","src/zlib/contrib/vstudio/vc=
10/zlibstat.vcxproj.filters":"d9a2c381e51e4d6f027f3517db7db81656e43cec02ed9=
abf267a0fde6f360180","src/zlib/contrib/vstudio/vc10/zlibvc.def":"0124fea28b=
fee49c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/v=
studio/vc10/zlibvc.sln":"e659860f705f31b87ea9139a3cb4ebe1561e120bce495383a5=
4614fc82b49990","src/zlib/contrib/vstudio/vc10/zlibvc.vcxproj":"3108badf710=
e2f4a64eab4e7deae6642fb68cc0d94018e537149f1761e215133","src/zlib/contrib/vs=
tudio/vc10/zlibvc.vcxproj.filters":"58404ba7703c68025bec64b8a17ff1fc7f3a35d=
15d17ae3bcc4fa753f1348425","src/zlib/contrib/vstudio/vc11/miniunz.vcxproj":=
"746e4c11fb8af4bcd6a9d68ba81ed1dc366a5de3bed56b291ee969ad733a7bb0","src/zli=
b/contrib/vstudio/vc11/minizip.vcxproj":"340617cae9cf4fcb003308021d3782ec36=
39e60d62d79a3aafc0a50bb55b061e","src/zlib/contrib/vstudio/vc11/testzlib.vcx=
proj":"589eec6ef6d818564ead938a629fda50abb6cbf8054b9f66ea780765c1a1b3db","s=
rc/zlib/contrib/vstudio/vc11/testzlibdll.vcxproj":"583bdef522b0176829f0d813=
9ea2a88b9cbc14379d1334f3a863989ed3df9b67","src/zlib/contrib/vstudio/vc11/zl=
ib.rc":"e8b581eb16930e0213d37143a5f17868839b22c758b23981a29484e17093c494","=
src/zlib/contrib/vstudio/vc11/zlibstat.vcxproj":"51aa752698d96df065a9ece02e=
293492f681b59a8077f036a5a60367dc621e87","src/zlib/contrib/vstudio/vc11/zlib=
vc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7",=
"src/zlib/contrib/vstudio/vc11/zlibvc.sln":"27389b515997defd080519f95aff87e=
89fcbe8b26d73c5ebb73c544cfef4d60e","src/zlib/contrib/vstudio/vc11/zlibvc.vc=
xproj":"c3dd05e56159aba411475b83656275872524cb3c2fd24d690397d8b634e7e0ed","=
src/zlib/contrib/vstudio/vc12/miniunz.vcxproj":"1494af54570f6e93852932956d4=
9a8c25e57b5abc1ac979945605ca9143df9f8","src/zlib/contrib/vstudio/vc12/miniz=
ip.vcxproj":"9bf128ed6760ca5f019006f178b1c65f4c7ff122dba8d297b64b0eb72feeb1=
20","src/zlib/contrib/vstudio/vc12/testzlib.vcxproj":"367a06caa399bd09f6b9c=
b60706820943dd6a6cf05794275baaf421da9c2a0b7","src/zlib/contrib/vstudio/vc12=
/testzlibdll.vcxproj":"93416510256935d79625dc9fd349cfce6968c062d42a138bec40=
4a26b2f92f5e","src/zlib/contrib/vstudio/vc12/zlib.rc":"92d5d3a4938a63503959=
34153416a7eb74353cdfb2321f45b9ee0b9b16257f39","src/zlib/contrib/vstudio/vc1=
2/zlibstat.vcxproj":"744ff6ac0d4e2dcdf74c7d33b979fbfd2b18550947eb99bfd46dc6=
a73eb1c68d","src/zlib/contrib/vstudio/vc12/zlibvc.def":"0124fea28bfee49c8a1=
9dad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc=
12/zlibvc.sln":"162e0faa80a56d89eea71a0b89377708eec2faa0dc72091cc0abb07fbde=
a49a0","src/zlib/contrib/vstudio/vc12/zlibvc.vcxproj":"754671c59d8996a84624=
1af76082cc8be1aa5fc079eff530d91a9ab15a0bee5b","src/zlib/contrib/vstudio/vc1=
4/miniunz.vcxproj":"0312511d4a30cea979c4e36edf994a537ed8a9d924f6b5c536cbcd0=
94773c11f","src/zlib/contrib/vstudio/vc14/minizip.vcxproj":"9e7bb7a6ac723e4=
b2db900627c366f9bb93a351381995d9c69a50c0126f64233","src/zlib/contrib/vstudi=
o/vc14/testzlib.vcxproj":"c3a9369670af4ebea13d036b452be7418591fbb4c03a67569=
9facac5d8dff5d0","src/zlib/contrib/vstudio/vc14/testzlibdll.vcxproj":"69f54=
4898b4275cd3d8e19b8f1f8cb39c1cb98a30cdb033242e4b94c57bfa150","src/zlib/cont=
rib/vstudio/vc14/zlib.rc":"92d5d3a4938a6350395934153416a7eb74353cdfb2321f45=
b9ee0b9b16257f39","src/zlib/contrib/vstudio/vc14/zlibstat.vcxproj":"9c7c096=
b47e7875412c98525efcd16db62e094215f0011b9cd739a33ab35d48c","src/zlib/contri=
b/vstudio/vc14/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4affda=
5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc14/zlibvc.sln":"47a50bbde8ca=
6336cecd8c0e4b65e515fc46ae84c7b61008ac9864162f777286","src/zlib/contrib/vst=
udio/vc14/zlibvc.vcxproj":"71fb6ef3b079bfdf4182af17e74c3361ead757467edfc591=
d9cbe303ccc47b52","src/zlib/contrib/vstudio/vc9/miniunz.vcproj":"b2b53bd9e7=
04bfbe769b863acdc2a3368692ca149c4b4ed2a0761b0cd16c6726","src/zlib/contrib/v=
studio/vc9/minizip.vcproj":"80a701fb41a61871ce1d25f6b03e571edb6c3abf0aa4537=
5554b6fac52115eb6","src/zlib/contrib/vstudio/vc9/testzlib.vcproj":"05fc5a87=
682b17690d199f424f57f6ad7767b8dabb29a1039bfcb88bca1b302f","src/zlib/contrib=
/vstudio/vc9/testzlibdll.vcproj":"25c1cc5319f1c4b7dbdb595c3cfd6ec3ba217818b=
03b7055ef5ef440b575a43d","src/zlib/contrib/vstudio/vc9/zlib.rc":"e8b581eb16=
930e0213d37143a5f17868839b22c758b23981a29484e17093c494","src/zlib/contrib/v=
studio/vc9/zlibstat.vcproj":"e8653eea37f3bef097eec2caa55e1f698c3c74c959689b=
c4e97568e88d2bbc60","src/zlib/contrib/vstudio/vc9/zlibvc.def":"0124fea28bfe=
e49c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/vst=
udio/vc9/zlibvc.sln":"26e58d4b2cfcd941c367fb2a18537b3b9f002f2ac1278b700ea11=
29c50501452","src/zlib/contrib/vstudio/vc9/zlibvc.vcproj":"86aa6e33db104c0a=
0ed4a9f21f0db8572cc7755170217aef18219fdd74b75e9d","src/zlib/crc32.c":"a04af=
273e83ecc351bf3794974ab2098d8d960df4044b7b44734c41443ee26d0","src/zlib/crc3=
2.h":"407af59d0abfea84a6507c603eb29809411797f98249614fe76a661def783ce1","sr=
c/zlib/deflate.c":"11fd6b0328b65c4ad4b5c204d892a97a9083628a7e77dc47836c8e0c=
799f8da0","src/zlib/deflate.h":"0ca7fb0cf1dd63001c6e9e4ff93c8dbff2fe521199b=
e51a4dda38a11b44919f6","src/zlib/doc/algorithm.txt":"992590931e982c0765286c=
2d83f6e9ff0a95aabb08e28c30c52bae3e8c4bd5ad","src/zlib/doc/rfc1950.txt":"8f0=
475a5c984657bf26277f73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","src/zlib/do=
c/rfc1951.txt":"5ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f3013=
50009","src/zlib/doc/rfc1952.txt":"164ef0897b4cbec63abf1b57f069f3599bd0fb7c=
72c2a4dee21bd7e03ec9af67","src/zlib/doc/txtvsbin.txt":"47c273bb22c9773248d3=
80549a330e5c262266b1292154b0d3014f731cc73f47","src/zlib/examples/README.exa=
mples":"402d72eb69c2e03a25034f4b3c02b110f0f67149ecfa4fa0e4b2bf0ceb49a8b3","=
src/zlib/examples/enough.c":"704e273f65b62c5d2eb06d5bb10c4ccffba56544aa477f=
0e3957e2296c501b78","src/zlib/examples/fitblk.c":"950769163c41aff897ee41746=
a8685d9aa41073b1307f42da19dabe9d3fc8b85","src/zlib/examples/gun.c":"d60ca6e=
b0a3e62ee7fb4a1ab69e8d1525ff06b06ce46889cbdfc13fb8f7534c2","src/zlib/exampl=
es/gzappend.c":"4182d38bf97ffbdf1110df7f65c0e8fab0b28b1ea36ebba8621c14e8e76=
f1caa","src/zlib/examples/gzjoin.c":"90b9d6c39a5fc91cf1cc9b96b025a508a8015d=
c502cd9374c754b44078593f57","src/zlib/examples/gzlog.c":"433d34b71b4e769ece=
1cceb8bd7d902d2c0a24ccd7550ab1856a5ba87f84f835","src/zlib/examples/gzlog.h"=
:"309556e2d7d39250924946b78e2cce0ac927857d6e1a02cab64e438f533c20c3","src/zl=
ib/examples/zlib_how.html":"80fb647be8450bd7a07d8495244e1f061dfbdbdb53172ca=
24e7ffff8ace9c72f","src/zlib/examples/zpipe.c":"68140a82582ede938159630bca0=
fb13a93b4bf1cb2e85b08943c26242cf8f3a6","src/zlib/examples/zran.c":"840ebeb0=
58cd0ca9e92dcb1db665932462a4695fc649b34e865b8d1ad7c5bf77","src/zlib/gzclose=
.c":"94446cf8cde67c30e64d0a335b0c941fd3fbad2e77f30180d12e61f9c2a5a6b8","src=
/zlib/gzguts.h":"1ef4741cf10441feeca5c8dde2b6c754f0cbd96fcae697d54a60475728=
9a5e9b","src/zlib/gzlib.c":"5daf11e44149e0aba2956d35f73f04f35dca99c3dfa43f5=
ad43ec20b336e4a1b","src/zlib/gzread.c":"6f928512cb1792cfeab31a51ff0b211814d=
2e455bc75290eb31079dc1e5ad2ec","src/zlib/gzwrite.c":"ba3b7b7ad2ff7ef0c19319=
b8408c333491a4cd495da55d0b156bc73d9ddb4df4","src/zlib/infback.c":"abe44873b=
5af2ea68ea1d281d915b2800f1832f846d2c05442a4711adbe6f269","src/zlib/inffast.=
c":"4d496ab2a3d29df5fadc3dbff6067e039806aaceae6cfcd09ea77d46c2b848fd","src/=
zlib/inffast.h":"7d8c1c873ce9bc346ad6005bb9d75cce5c6352aaf7395385be216a9452=
a34908","src/zlib/inffixed.h":"237ba710f090e432b62ebf963bee8b302867e9691406=
b2d3f8ee89ee7bfef9b0","src/zlib/inflate.c":"8b6c599c3563c14c447c47db0d7dc9a=
16e8c246a078ec95a169ddcebaaebd811","src/zlib/inflate.h":"8ec9ac297790276f7e=
46a961d4c6f9f944fb1dec92401339ec2666973cc5983c","src/zlib/inftrees.c":"1960=
ca67384376f65b6ce8c08fdb501f8eb33923e11ef5f61a855708c6cb0a8a","src/zlib/inf=
trees.h":"c510b36402784b1f898be3b049b923469aa92701de2d9195aed19f6b65c0dce2"=
,"src/zlib/make_vms.com":"3064eb153a7684115f1494364f80759bc5a2c227799fdf08d=
f7b9e6e50884720","src/zlib/msdos/Makefile.bor":"292ab363f7ffbc4ae84d37cd9bd=
ffd2dac1003bee52d223a8489844870f20702","src/zlib/msdos/Makefile.dj2":"92084=
50c2ae6dcbfcc25560b5b9ca763f461e7246e37b0552474edf8fa898906","src/zlib/msdo=
s/Makefile.emx":"c749d6ec7f88e8e639d4f03bdbdcbbe9d1c304210be4c4be621ceb2296=
1d3d64","src/zlib/msdos/Makefile.msc":"0e021a6f42212415b060e4ad468eb415d0a8=
c1f343137fb9dff2cb8f9ead3027","src/zlib/msdos/Makefile.tc":"2ae12ee2a3e62f7=
c5a0520d0fbe4adee772bc07fe816002b07ccb43db3daa76a","src/zlib/nintendods/Mak=
efile":"ea5823efe6830132294eddf2f56dbd7db8712244c210bb4968c431b1a91bd066","=
src/zlib/nintendods/README":"e362426c47b39ff6a7d6c75c6660b20abf076cdfa5e1e4=
21716dc629a71aef95","src/zlib/old/Makefile.emx":"d811f032272aae50123a889297=
af3a02fbd60d1e42bbef11466462f627ff7b5b","src/zlib/old/Makefile.riscos":"d1a=
488b160fbfd53272b68a913283a4be08ba9d490796b196dddb2ba535b41e0","src/zlib/ol=
d/README":"551a0f4d91fe0f827a31cbdfbb4a71d1f3dc4d06564d80a3f526b749dd104d11=
","src/zlib/old/descrip.mms":"8ff08c35c056df9c986f23c09cf8936db63ccf12c3c42=
f7d18a48b36f060cff7","src/zlib/old/os2/Makefile.os2":"6ad247c00f00ff42fd2d6=
2555e86251cef06e4079378241b5f320c227507d51d","src/zlib/old/os2/zlib.def":"e=
a9c61876d2e20b67ef2d9495991a32798eb40d13ede95859a2f4f03b65b9b61","src/zlib/=
old/visual-basic.txt":"1727650acbde9a9e6aec9438896377e46a12699cca5d46c5399c=
ef524dedc614","src/zlib/os400/README400":"6f95a1beb0fbf943a3312eaa3dd2c279f=
1cef93062bebbff63dd37ac9e2aa8d6","src/zlib/os400/bndsrc":"cfe00b1528d5c2781=
3cd6b1ad7aa34b493fd63d615623fb21fd1a7bf99d2255e","src/zlib/os400/make.sh":"=
143394d1e3876c61c29078c0e47310e726e1f5bd42739fe92df9ece65711655f","src/zlib=
/os400/zlib.inc":"c501c522185ba1f0506caf90d72f1088b34b2addc169471e949e443ab=
65e8a75","src/zlib/qnx/package.qpg":"90b5c8364d9dc5ef67405b352c19710ebad290=
5f3f20b9e56ded74661f96743b","src/zlib/test/example.c":"520799662a8286725540=
d6d5a356efe6f595618e5fe2e591972491d719bd99aa","src/zlib/test/infcover.c":"f=
654f3fcc74b33bd95cda63d13fe0ce589bcfe965544e0c17ee597d75efbd090","src/zlib/=
test/minigzip.c":"91089b21e692797bb6208b2b45eeb90f5f1f1e4f6b67b99dea5676f51=
b811193","src/zlib/treebuild.xml":"d816c764c8ec2d5b2ebfa7f053f747097926c13f=
ce7fa8628c5d14c991411421","src/zlib/trees.c":"f2a5f949ea70dde7c23a54c793aee=
d630a03df4bb72417cd3aa008000c44699b","src/zlib/trees.h":"bb0a9d3ca88ee00c81=
adb7c636e73b97085f6ef1b52d6d58edbe2b6dc3adeb4d","src/zlib/uncompr.c":"31922=
aa982ee12fd28d1ce5fe6a94a3f07c2a941c821b566a881ca21845cdfaf","src/zlib/watc=
om/watcom_f.mak":"7e039b912f9cffaa40835281430bb284fa9042b0a0d12f6b34700a06b=
ca6576e","src/zlib/watcom/watcom_l.mak":"d11b4064604a034725860e63e3f6d34705=
6372e4b1675b183e20a93533b20cc9","src/zlib/win32/DLL_FAQ.txt":"9e00778319381=
e6275691dd3a89410c99065b8c0c5db96473abe8c859cbdefd8","src/zlib/win32/Makefi=
le.bor":"e878fed2313417db085fea621c110889f6a32233b5b6db46e3c4e824c1d0ed6b",=
"src/zlib/win32/Makefile.gcc":"ea8feddce7b9707253b9bf86623cf7ebe5294d7aea2b=
3b0b1b1c1b8cfd73009d","src/zlib/win32/Makefile.msc":"7c495d63c5afea1d77d162=
a41b73bab89cee952c12e4647e9684a7ac79bfc3f5","src/zlib/win32/README-WIN32.tx=
t":"b71f1f4e4760812c3a11b2bae6f40d1066741a90e6646010a32ce50a0e348cde","src/=
zlib/win32/VisualC.txt":"9ec0babd46eaa012371dee2d3a8a55d9c7130f7895512c3371=
c737e4a7f6a997","src/zlib/win32/zlib.def":"24fa6dd00f3f4c0d14507a03ddbfa427=
07a04e3901bb9ff6f90096037a75185a","src/zlib/win32/zlib1.rc":"8fc5f2b5abee40=
ad66e6d6cfc9f926c2f446e13a7c9ee7df8bf58a266d8cade5","src/zlib/zconf.h":"9c0=
087f31cd45fe4bfa0ca79b51df2c69d67c44f2fbb2223d7cf9ab8d971c360","src/zlib/zc=
onf.h.cmakein":"d740b750e9c98e6a4b4529cc2a857a3fa8001514b1ce91e0e1d9d293652=
bf388","src/zlib/zconf.h.in":"9c0087f31cd45fe4bfa0ca79b51df2c69d67c44f2fbb2=
223d7cf9ab8d971c360","src/zlib/zlib.3":"5abef003e545566e5599e5ab2e7528e978b=
e59d54546b19d763d062f7a69bac7","src/zlib/zlib.3.pdf":"7f0f633641d782e360eff=
9fe831716c5767faf1000e38382a8a8c65b0b67f374","src/zlib/zlib.h":"4ddc82b4af9=
31ab55f44d977bde81bfbc4151b5dcdccc03142831a301b5ec3c8","src/zlib/zlib.map":=
"7eb1070ba6bf12e6895e5da06b84a92af683827587afaa72bdd45e80b9d8e4e9","src/zli=
b/zlib.pc.cmakein":"2f1d0b18ce37c2af415a469857f02aee2c41a58877aff21d29e9c6d=
b32b55cb7","src/zlib/zlib.pc.in":"04c01cc2e1a0ed123518b5855f585c93a24526dd8=
8982c414111ea1fc9f07997","src/zlib/zlib2ansi":"d316e3e79054f5f9fe921d35f4bb=
f4bf0a37b859d29d2b34ae4d7d92afc3e55c","src/zlib/zutil.c":"f7fdc9ef326a2683e=
b33c794face54e83c751ec17f3d1ba581847a62af36ddcd","src/zlib/zutil.h":"9a63f6=
690fac1620aa3cecee5752af618806da438a256b4a047fbcd289cac159"},"package":"970=
2761c3935f8cc2f101793272e202c72b99da8f4224a19ddcf1279a6450bbf"}
> >  \ No newline at end of file
> > -+{"files":{"Cargo.toml":"ce67ce7c1f3c4ad7832d58ed198b8dd745abacc620738=
d575c4b1a9ac9e79449","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14=
d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"34c467b6945a22696d060b8fdd2379=
d464acb3408d4c599d3dc5fe4fa1b4c84f","README.md":"b23e18bdce29fabc3d34e88576=
219f50d1d735a355e427e6d6ebc09254138070","build.rs":"e034f7828ff43a0bb0f7b69=
0e8e99b09b8f4e1ae0560b6fb4008006e9cd4d9dd","ci/Dockerfile":"4d479ea63b9e384=
b3864fa1204894bfae4890017d6bf03486274457fe2c26cf8","ci/run-docker.sh":"0ea7=
a4fdc9f6026110e20fa2e25dbadfc1e6dafed9ded5981ae36772ad207e26","ci/set_rust_=
version.bash":"4284f86ac3923a73dd79e89bef2d0b136c6d104d6dae92e24b4a96eaffa2=
8890","ci/test.bash":"73a936768549eedf96a7cddb350ada128e058d5d9004244ebf3d9=
93363b69599","src/lib.rs":"40476f4e896c936c21f908396255c7a4951ef8bf93788858=
ade6cace2539927b","src/smoke.c":"10607c81b73811bfcb9718767312bf97ba2ccf7048=
ea2f18a2085aa06ad7f91b","src/zlib-ng/CMakeLists.txt":"60b836817b51e5893b1e3=
203adaf57a98678af17957eccaef679bd96bcf5d90b","src/zlib-ng/FAQ.zlib":"d1777a=
a057caeef50fc291aac7a414363b2186bb3d65bb0f8bfa2bfd61cf0ad5","src/zlib-ng/IN=
DEX.md":"989545e90d8e9ac149034f762ce78ed8976ebf9324326228dea37ca190154609",=
"src/zlib-ng/LICENSE.md":"d3c80be055d94d798eaa786116e84fa0b010bc11420b5d206=
0d978ea77845436","src/zlib-ng/Makefile.in":"15027511a77e76b423eccf10ebfe663=
98ea96862cbce2415e5ebac7c7cbb6ab6","src/zlib-ng/PORTING.md":"5cff8c878c7958=
f6a4bada5a403dcc88961c9607826faece1aef202b5d95c550","src/zlib-ng/README.md"=
:"9cac4a98ecf45f50adf5030d4dc58b3cf9f3ae8e3ec78d30fdae4a99a2b4b8d9","src/zl=
ib-ng/adler32.c":"82ffa1b4fc4b198ba8004135f79b8819d9f2b28e851c30c0ab41e6d32=
dfbf70d","src/zlib-ng/adler32_p.h":"f56915c59a345baf4558374447385a317e29365=
a4db2fbb38af4de3e1a1a0201","src/zlib-ng/arch/arm/Makefile.in":"95464884ba75=
a7b12c9ceda5845d8d68d5a7d7dac8a8dc24b27beb2192e5b97b","src/zlib-ng/arch/arm=
/adler32_neon.c":"3990b8d5570b12c2162218fe0e9bc723a03f1c89b5ed3ba70a74a9897=
6260ee7","src/zlib-ng/arch/arm/arm.h":"855adbb02d7b9a5714a17d9dcff493610e7c=
d2b9a1f4e58e1c99626ab536e868","src/zlib-ng/arch/arm/armfeature.c":"dd09ad27=
12b037e8d52173402f39cc2be1bc89d47fc10259ef81b4c64aef7110","src/zlib-ng/arch=
/arm/chunkset_neon.c":"65b70014888e9fbdb89bfbfa52f23b8953dc015466577da292d4=
780b55c5d95a","src/zlib-ng/arch/arm/crc32_acle.c":"5a96afc594697d1399870d1b=
fb0623a03869eff42caae74013f147cec4aa982e","src/zlib-ng/arch/arm/ctzl.h":"fe=
b70d55e66025fff806e30e48002b35cfff79533d352585cfa5f118edbc90b1","src/zlib-n=
g/arch/arm/insert_string_acle.c":"d1b1dae5aeada70f2b03c2cbf3112ce55a92401c2=
d87709081b04dcf5992e1ad","src/zlib-ng/arch/arm/slide_neon.c":"19d8cf5c742ac=
6b82164c7a183538ad1129f9f17e9b8bce8b40daac3820fb6c4","src/zlib-ng/arch/gene=
ric/Makefile.in":"f41a34839986eac8dd52cf91fada0efff4171c059ab5d7db6347c91bd=
6d9db09","src/zlib-ng/arch/power/Makefile.in":"69644d1a0ff8e7f38005c0a55cdb=
af3f0d87f42abf8fc4f4136271c4fedfb846","src/zlib-ng/arch/power/adler32_power=
8.c":"79b75e98ad3a62facbbdd8c0b178d3f993b57f6e34d320bf47eca33aa8c330a1","sr=
c/zlib-ng/arch/power/power.c":"0647afb3b3b7ce2a19b4815ec8fdeee0b37c759413e5=
ef0a668a2dba22d94803","src/zlib-ng/arch/power/power.h":"f3f15f94fed98a2f7dd=
5d4568c5172e597228be4141d6895062703c3f70024da","src/zlib-ng/arch/power/slid=
e_hash_power8.c":"932ea533d25e2f5478afe0c47830e7ef24276cad0d75fd91f2d8c799b=
d4b5d36","src/zlib-ng/arch/s390/Makefile.in":"eef6c3169723f089b0b5f852423ec=
55bf0364caeddd7cda991f2e76bc1682107","src/zlib-ng/arch/s390/README.md":"4f5=
018cb7c8ee217710a90193088889a15f1675d205a104140f6a1ac07ce412c","src/zlib-ng=
/arch/s390/dfltcc_common.c":"6771ec4457da9f4b00c74bcc0828735e21c74b9162cb37=
383c297c3b5028cddf","src/zlib-ng/arch/s390/dfltcc_common.h":"ed339007feae58=
d1879e096addb30ed86cd5cf11222db22c45f48b47328cf6db","src/zlib-ng/arch/s390/=
dfltcc_deflate.c":"7b3dec7be4055c7748defc626dc91db99787c9f3b70b7d7b40282558=
bbb478e9","src/zlib-ng/arch/s390/dfltcc_deflate.h":"c4c411f221cc0f6b218326e=
973fef05c65840ba49878aff052dac0bb38121cbd","src/zlib-ng/arch/s390/dfltcc_de=
tail.h":"01dbdfaf5e8ccf522663b4daa76e9138dde514292c35a623be4bcbbf4b82dea2",=
"src/zlib-ng/arch/s390/dfltcc_inflate.c":"a96226eba3538d3904893cfe1b0839566=
8e6a722b56f28d5b5debb3176161b4b","src/zlib-ng/arch/s390/dfltcc_inflate.h":"=
d7a4a5ae79abd1a5456521926b918becfe86c253a4fc23723fbc09f7c3303128","src/zlib=
-ng/arch/x86/INDEX.md":"c12f9bf0d66743a6472fb756bf46def8eea1dd235be7fca994d=
cb22f693a3524","src/zlib-ng/arch/x86/Makefile.in":"9f6fe7567a99e81aaa3bef8c=
cfa1ad40f524efc285cf8dfe0f497a1530f8016c","src/zlib-ng/arch/x86/adler32_avx=
.c":"99056732c7bd5d53dc108f282811a40bf21570926781af5dc7b17cb9218963de","src=
/zlib-ng/arch/x86/adler32_ssse3.c":"883a5520b4481225d097c90c5359106a3c8eb7b=
921499c94276e999b7c39adc5","src/zlib-ng/arch/x86/chunkset_avx.c":"15060e7ee=
487fb1daef9be25343ae387392276933921e4b4db0c67831dc0854f","src/zlib-ng/arch/=
x86/chunkset_sse.c":"f7ccb55b67101ddb9def951a6d6f9dd4cb108fdd9e65f0f21d8272=
3d1b093a22","src/zlib-ng/arch/x86/compare258_avx.c":"8b2838d168de4608327f25=
fe52d53763a82413ee911d87947d3fcd72c7f9bf26","src/zlib-ng/arch/x86/compare25=
8_sse.c":"b5049722ffd4a43a96868eeba5e000271cfc5fcbf3c2657026ead15b1df28a10"=
,"src/zlib-ng/arch/x86/crc_folding.c":"75199cdd06ec2f8f43bf38583b2c4d98bbbb=
d924e659267fdc1fa5134f1472eb","src/zlib-ng/arch/x86/crc_folding.h":"9392125=
46611917e9e066e8ed30cdda95680ec1f5fe0890cc4865b4e6d7fc215","src/zlib-ng/arc=
h/x86/insert_string_sse.c":"9e84a75b6a565422eb105261b6729d2a02b89133bd14372=
c949d5381b5deed3e","src/zlib-ng/arch/x86/slide_avx.c":"5e448e439ac24e7cb10e=
ee176ca37f2c63f73c135c0a2af040e232bad490997d","src/zlib-ng/arch/x86/slide_s=
se.c":"1946cabb634c905fddef0a22b2fad19dfd99110169567c3beceef71145b2e316","s=
rc/zlib-ng/arch/x86/x86.c":"1af56e27b2e951e1ad1344e62c2f7a8c49a776fcdd1cb0f=
4ea9d6152118a479e","src/zlib-ng/arch/x86/x86.h":"4d2d20ea0087089141e250e77b=
b3d419954b9092810028b151581b9115a5fe8c","src/zlib-ng/chunkset.c":"c0dbc7abb=
dad5137a9efb2b0a76a212e77d4bf44beebe721c68359fa83002ff2","src/zlib-ng/chunk=
set_tpl.h":"35d15e97bd72d4e03dcec3ee804a08ea6a74faac2ef835caecc0e38bc9daf0c=
0","src/zlib-ng/cmake/detect-arch.c":"a9509327c2f4395955466b0acce453c29592d=
4686022714cb9e8b411d7e60c29","src/zlib-ng/cmake/detect-arch.cmake":"9cbb09b=
297f79e94b55fffb9acbafbee8d6761e854d818f1a0c686e3fcddf574","src/zlib-ng/cma=
ke/detect-coverage.cmake":"e4e372991ba80a16ad47df2716708a56013cc628aa7ed015=
73a2360c60610125","src/zlib-ng/cmake/detect-install-dirs.cmake":"87031a4042=
8a104f5cf38ecdb8a5028d8c679cfa772a58adde8380c809b34eff","src/zlib-ng/cmake/=
detect-sanitizer.cmake":"5e6fe6d2d877540811313f0c8e9884adb21a9ace2e24f23190=
f0fac1d52dd2b8","src/zlib-ng/cmake/run-and-compare.cmake":"dc45eeb6d3e48540=
49834ec1ec2891342646c7fb803a0b6c2644d6316f89b668","src/zlib-ng/cmake/run-an=
d-redirect.cmake":"2de9c784da3e04331465a3c56125b9c7d8e74b898b4cf85353aca196=
f90ea9bb","src/zlib-ng/cmake/test-compress.cmake":"3f37319963a80a31f752fca1=
c82571d552fd4701326bc40fdb02b54ec3f7a3f0","src/zlib-ng/cmake/test-tools.cma=
ke":"4dcf099245085ee2b6d8ec41620bca3f7b718365dbb9bb0ad23931e83bf36aeb","src=
/zlib-ng/cmake/toolchain-aarch64.cmake":"8d7ba07ee1cb9fbc7817da1c5e74ce6c85=
ff81c10962a33941f0e24471956e59","src/zlib-ng/cmake/toolchain-arm.cmake":"0b=
0ab2b1093ef851c3dbd6fe53f855628df0778841a488aaef85d2c70f04a257","src/zlib-n=
g/cmake/toolchain-mingw-i686.cmake":"6551576324fed6ccedffcfe8da762402dc863c=
20a2789a9b0030b9d32e15a15f","src/zlib-ng/cmake/toolchain-mingw-x86_64.cmake=
":"ec7bf5c8640fb61d2e30f8db7b588ca9b66da92d4a59e88ce16c5fc7f9ce02b6","src/z=
lib-ng/cmake/toolchain-powerpc.cmake":"6373abe883a99616aa51422a9b714894dc52=
1211be49502463576f58d3d26b2a","src/zlib-ng/cmake/toolchain-powerpc64.cmake"=
:"328d1ea039a30e03ee9a552858b9f180b3da2614b712f618da1a0fa98f30a53b","src/zl=
ib-ng/cmake/toolchain-powerpc64le.cmake":"ec90270bd1f4aa649abddddd2618168d3=
99d58a1c1c35b3d8d909e570eb9be1c","src/zlib-ng/cmake/toolchain-s390x.cmake":=
"cb634252c21c4f55d06cdc49ce522a5546aae592daa0f12aa4282c0aef323828","src/zli=
b-ng/cmake/toolchain-sparc64.cmake":"d70d39760a23886ebd1c5a1a87651bfb47a9b2=
4def9e7955ee1cbec60b40925b","src/zlib-ng/compare258.c":"56bfd48d5ff9ca422fb=
b728df7a373436c73796561dff118c7d4039fe70d29e2","src/zlib-ng/compress.c":"1a=
bf5b13e3e805becc14f4f16dad9bf816f4fe41754b1abf75f670dcc84567cc","src/zlib-n=
g/configure":"681d5b1303aab0523334c90ff049757e7ee6b2683f2411204b7245ba4adca=
4b2","src/zlib-ng/crc32.c":"98440be8a99381151a2d740f2e2228e8c1b23b9193c3642=
c52a4e34799506336","src/zlib-ng/crc32_comb.c":"78cd1a3d31963bfa5bd9d476250b=
2bb7777b12b6ebe0475acf021ca794757165","src/zlib-ng/crc32_comb_tbl.h":"d6615=
d209d6c7d5248c6f7fe4e5dbded13c0eb87997b37693032c2902927407d","src/zlib-ng/c=
rc32_p.h":"1fa91375a18e090c0a0dfda39de3df36346a0b1be36c808be6b6c29c32eba922=
","src/zlib-ng/crc32_tbl.h":"d629378ba38ff5775095b64e277bcd41c4b89fab9b5647=
a9fb29e15da0db0161","src/zlib-ng/deflate.c":"1a5ff34bf68b88e30f578ce7b15dd9=
96c05fed7bf42f58f4616af470ee18f103","src/zlib-ng/deflate.h":"a074e9a5dd5d68=
9db63655251d6a0948e7a7c0c4a4f6d0ca60bfe18291f3c34f","src/zlib-ng/deflate_fa=
st.c":"b3b261b3a02b089599fcd9448965ef5d8e8b0e8e9556857357c9632930c7c748","s=
rc/zlib-ng/deflate_medium.c":"1c3d95cbac76052d39595ea750c5536541c18302b9abb=
398c27b58955318bba8","src/zlib-ng/deflate_p.h":"95026b1b48aa78204381b32617d=
d44e8c820c9bb21b415ebfcb33e6b5255233e","src/zlib-ng/deflate_quick.c":"28090=
5a191d2b2a7274f2453ac537e01a0fb6e7540a0b212c1514bfb8c9415ea","src/zlib-ng/d=
eflate_slow.c":"a2c66723e1e71ffd6ff856407459ab311a4c6546ecf50285081fc7afcd0=
ccd2e","src/zlib-ng/doc/algorithm.txt":"992590931e982c0765286c2d83f6e9ff0a9=
5aabb08e28c30c52bae3e8c4bd5ad","src/zlib-ng/doc/rfc1950.txt":"8f0475a5c9846=
57bf26277f73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","src/zlib-ng/doc/rfc19=
51.txt":"5ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009",=
"src/zlib-ng/doc/rfc1952.txt":"164ef0897b4cbec63abf1b57f069f3599bd0fb7c72c2=
a4dee21bd7e03ec9af67","src/zlib-ng/doc/txtvsbin.txt":"47c273bb22c9773248d38=
0549a330e5c262266b1292154b0d3014f731cc73f47","src/zlib-ng/fallback_builtins=
.h":"f07e83c5c444554577c4240ff7722057ea2a689f6baa0f9e8bda32b9a46888ca","src=
/zlib-ng/functable.c":"d3747a4674ddbc903ab1d06efe63a1c4b52bf42f7dd38cde3701=
fa82b1d953f0","src/zlib-ng/functable.h":"e5a2d0c10411d23f04295bcb9ddb988938=
8974b723caef65aa5c4ea4739f4aa7","src/zlib-ng/gzguts.h":"cbf2afc8a6183002254=
a73cabe8376e54b1aea2ba042e36138f292c9cdb95d5c","src/zlib-ng/gzlib.c":"5b5be=
a4f319e5d0a96b92aa431fb33926686cd20686c90d75e42e1481872bbcf","src/zlib-ng/g=
zread.c":"fc4a187ba45ceb7b4b50f4f8dedc7685fe8687e6f034638a6437bebf71d51a13"=
,"src/zlib-ng/gzwrite.c":"7c86058ae23f856c099e2663a5676c97cfa4fb5df9b92893c=
94076ba4aa9a56b","src/zlib-ng/infback.c":"97a35de1a3d3bec50e112853e03bf1628=
cbed3b0fb84459cc423e3f9f61fbea7","src/zlib-ng/inffast.c":"701519ee11d39cdf4=
e808395722415c42ff2be9445f66408fd879370f3242b57","src/zlib-ng/inffast.h":"4=
2e74a92b496ab0726be317e8497a12bf3c3cf3d0d533440ce65befd3929c71c","src/zlib-=
ng/inffixed_tbl.h":"a94225335396245e9f0ccb2e9b4b334fe7ee0111ed8e32a26bcd521=
87f364314","src/zlib-ng/inflate.c":"a665bf717ee257a16a8ab993241f2cf9e71d498=
82addddb9518b88186f82a5cf","src/zlib-ng/inflate.h":"eb25527d1bdedaa45167926=
dce4c39d9aaa3147b0f4a95f38f5916528c30a09b","src/zlib-ng/inflate_p.h":"4a94c=
51194da119770cf662ef289994f0c78d95184d54d6ae5d50a393e8f5a62","src/zlib-ng/i=
nftrees.c":"d1d88f98f9129c87f3ce1d6de5bea3ec867de23b1b2bdd585257d231aac82a4=
f","src/zlib-ng/inftrees.h":"624c6653a454447c6274adf922430a19c96ef73c7687e4=
559d247ff48970bab5","src/zlib-ng/insert_string.c":"aa22ba53a1e7582149980927=
7f9ca0e5ef92b07a618136dd11ae1734e233b7c9","src/zlib-ng/insert_string_tpl.h"=
:"1ceba9903324d10aad6e1d83653c4d534a5b06fd09076414a06215482be00bac","src/zl=
ib-ng/match_tpl.h":"eeab4c6eea8511a7579738e622af062ad16f4016312e93ad34bc590=
3d8b3c4a1","src/zlib-ng/test/CVE-2002-0059/test.gz":"60bf96b8f433bd7e057ce3=
496aceaccd70ec80f596a4aa8bcc7786056705ce66","src/zlib-ng/test/CVE-2003-0107=
.c":"1bfbc88dc501cd92b8b26bd8944af6b150b376ebfe7241d90e2b93109be3d68c","src=
/zlib-ng/test/CVE-2004-0797/test.gz":"38caae524705f676bde13a8df9fc8c7d2fe10=
5ba6bdbab62a405b0276fd3aa2e","src/zlib-ng/test/CVE-2005-1849/test.gz":"e4d5=
a60617df4b5dd44eda94751ce1eacdb325792bba6e3cc4676719a3adf742","src/zlib-ng/=
test/CVE-2005-2096/test.gz":"8f702d4861aa3ec98ac03a59ff26b430939630cb5cd426=
6d2658d3b836d576f9","src/zlib-ng/test/GH-361/test.txt":"358497d0a7251ea4210=
1dc77b02337f46fd89af09643a8288e2a3082e5d24128","src/zlib-ng/test/GH-364/tes=
t.bin":"af5570f5a1810b7af78caf4bc70a660f0df51e42baf91d4de5b2328de0e83dfc","=
src/zlib-ng/test/GH-382/defneg3.dat":"b22bef6b7392401c9e7b079402c4a4074053d=
7a914d050400e37fd7af6fe26d5","src/zlib-ng/test/GH-751/test.txt":"b83d833803=
b7bc3124fb2a0034081f0b999ad10c33a8dfa3bfd181dc078ae3ee","src/zlib-ng/test/M=
akefile.in":"c3b6a1ec62838c140a78bc361448d5739756bbfa3bbbf1ffa64c3425999497=
01","src/zlib-ng/test/README.md":"fc485cfaaede6b3d3dc61fdd17cc7eee715c35d6f=
62e6e502f9251fd1b5edac9","src/zlib-ng/test/abi/ignore":"02aa87f77656dbc1fbd=
dd23f436cd15465a92df0722da4055cae1bc8bf013097","src/zlib-ng/test/abi/zlib-v=
1.2.11-arm-linux-gnueabihf.abi":"f5e91f25b558a891fecbeb6e2e9575698630ab700d=
055a38f3bc4fe66257f513","src/zlib-ng/test/abi/zlib-v1.2.11-x86_64-linux-gnu=
.abi":"038337383cf780587d810cf5400d632f3a1f8517e63ac4a71b6e5224db8b1413","s=
rc/zlib-ng/test/abicheck.md":"fa5d6d33ff0fd95eefb7c6c0c7f67351282e6eda20c4e=
38842235a610cc10382","src/zlib-ng/test/abicheck.sh":"b23ee3678acb24caf36fc8=
402a07452de73c50640ebe641f185c7f9d5ea257e7","src/zlib-ng/test/adler32_test.=
c":"db3e8ad9a4e2ecce0c052b0bfe19834d3ff2fb2e9239cc3438a2c95db00b1d21","src/=
zlib-ng/test/data/fireworks.jpg":"93b986ce7d7e361f0d3840f9d531b5f40fb6ca8c1=
4d6d74364150e255f126512","src/zlib-ng/test/data/lcet10.txt":"938e69e61b3411=
d8a9e2e630f4265000d810f3dbf66bac58cac19493753526ec","src/zlib-ng/test/data/=
paper-100k.pdf":"60f73a051b7ca35bfec44734b2eed7736cb5c0b7f728beb7b97ade6c5e=
44849b","src/zlib-ng/test/deflate_quick_bi_valid.c":"0e00da0e048c46204c39af=
f4b8fb79890274d3c6183a9409aefd5c93e4e92a48","src/zlib-ng/test/deflate_quick=
_block_open.c":"455bd347bb88debdfacb409846170274991ec9ba71c52b8fd0e526daf57=
265eb","src/zlib-ng/test/example.c":"8bfad1221a8df5b6202e11f6be4bae5dbccd8a=
24fb7bbd8dd88e7ecd318907e7","src/zlib-ng/test/fuzz/checksum_fuzzer.c":"3a15=
479f2cb40b6c5760dadb246328fab7315f3e3b8e28c1bc246c9b9a867c69","src/zlib-ng/=
test/fuzz/compress_fuzzer.c":"1ab70608075c4bc60f89aa2f327cff88362ee7b1d31da=
88ed54ca51e5f99e5c9","src/zlib-ng/test/fuzz/example_dict_fuzzer.c":"0426210=
53050f0fde90a0428cd1afabda8cc7c3fa59e3e0a55c43ab1e03d3988","src/zlib-ng/tes=
t/fuzz/example_flush_fuzzer.c":"f12246a184dcfe0a19a98cdc742a1fe8da388ad20b4=
06635d63f1fa10d45b9ca","src/zlib-ng/test/fuzz/example_large_fuzzer.c":"f490=
abcd332fb4e7921292adf6876d38d7f71c8d2443212c781ba88957ff9303","src/zlib-ng/=
test/fuzz/example_small_fuzzer.c":"a9b3436b291ace821b6013311a1100e19a9e1c67=
fefd3f97dbd60688f9bf22b1","src/zlib-ng/test/fuzz/minigzip_fuzzer.c":"7b0e7d=
a9b6c60f3b3a13f140cc445050d9e8958d4f59cbb9a498c08f3a53adab","src/zlib-ng/te=
st/fuzz/standalone_fuzz_target_runner.c":"306e8ac4e08ea72d18ffae8c908abfef8=
c6feedf83b068a7ec675ade6a5791a8","src/zlib-ng/test/hash_head_0.c":"d88105a8=
0e756b7206a20c7b2490a2e7e743a2ceb1f20d3e433ce9848f054e1b","src/zlib-ng/test=
/infcover.c":"b9acffc102fdd140941073ca47e30c938aa937b4929061500c36ffba12c86=
449","src/zlib-ng/test/minideflate.c":"93de8ffcbe7c414abf3ea36acdf729bcedb4=
0393ec7bd10b356ebe225406e173","src/zlib-ng/test/minigzip.c":"291e2ea30778a3=
e829b96cb47211e89494ece036cd74591178710b4276c9b48f","src/zlib-ng/test/pkgch=
eck.sh":"75b3155125f235e27ee434d76b6f72bd825899b55f6d59ef2d032fe67a2896ed",=
"src/zlib-ng/test/switchlevels.c":"c30ae3d27ce6041934532553719622e7ed473541=
aa7bdad8d11d0c55e5220f14","src/zlib-ng/test/testCVEinputs.sh":"5de6198444c1=
6726f8e0a8f2beb5b89c5ae7e7e3736ce760b9fbc719493e7e4f","src/zlib-ng/tools/co=
decov-upload.sh":"ec7a8f1405820810e486e3d7e2fda7eb958c17877b0000b93abdf09d8=
7732a2f","src/zlib-ng/tools/config.sub":"32186cfeb5db62c99e1dfbfb07f24c1a50=
977447b4c26d2907021c74422a70d2","src/zlib-ng/tools/makecrct.c":"55c8f7b8e29=
393e95988a29de8cb1a1bdf2738a69d53627bd0f9d7bf169bf0a8","src/zlib-ng/tools/m=
akefixed.c":"bffd02540231304f9bcc755b8cb9ae5cfbc48975857bbb4547f1d6acce21ef=
57","src/zlib-ng/tools/maketrees.c":"2dbfe34691dde327618be496b380fc91daaa30=
474352815773a8b70114b0541a","src/zlib-ng/trees.c":"956ce5b3f3330320cb5baadb=
f7721572259ec41edc4d8c132a20888b7f6f60c3","src/zlib-ng/trees.h":"24174f3543=
b01ee1ef370bbf6d15551a21871cded18b2aadf09a71e7904b6f99","src/zlib-ng/trees_=
emit.h":"f68904e04caee0482c72ea92cc775cabe35a0bf7cffce85566c15ace27666af4",=
"src/zlib-ng/trees_tbl.h":"35f4fd0ec080c1ade342e2dd1b0f5cdc7e9f18990faa48d7=
a8a69bc318ebe607","src/zlib-ng/uncompr.c":"4ebb486b27930f8a6ec4a3cc90a207d0=
bcf8a4779d1dbf3b2184a2b2a5735cd1","src/zlib-ng/win32/DLL_FAQ.txt":"d2ec63cb=
4a51886e0813f75bca49a051bede364d855f938e1a7992ab97a79800","src/zlib-ng/win3=
2/Makefile.a64":"775d6902373d1583430b5d7467f001746be323610c89be27e02bbfe020=
5994f3","src/zlib-ng/win32/Makefile.arm":"7535e022f482920c3fa7a267e84e39ad7=
90d150f72e5c30414baa156c2fdd9b6","src/zlib-ng/win32/Makefile.msc":"deee44d5=
624890e692d87db311216075e967c3ac8aeea6ffcdcac3d03eea260b","src/zlib-ng/win3=
2/README-WIN32.txt":"a8c2d052960b963a49cee5a2ad891f2ff7b34db038f00985eba4ee=
fc99966261","src/zlib-ng/win32/zlib-ng.def":"f240276caf805a10d024fc6a66efe9=
15c435734c69732818d92fb04d08ab350c","src/zlib-ng/win32/zlib-ng1.rc":"b567a2=
76407998bae40aacd48a50beba87c0bfbae470d28e66331ac99eb575c8","src/zlib-ng/wi=
n32/zlib.def":"d9c371ff2677567350386441a2e3d0258010d6502290bbac5ac42ea168bd=
5212","src/zlib-ng/win32/zlib1.rc":"d7f269379144d65bcd1b67c1065e5d4120579f1=
4ce54ecf246eaba394fa989a5","src/zlib-ng/win32/zlibcompat.def":"73728b9df437=
9dc70ebd9b2a9f20d6e4ed7c031fa1f351cdeae1de7d1db05bd1","src/zlib-ng/zbuild.h=
":"f73424f5f10370ffe8f45f6e3dc52dd095ea778153832461d712a838e3a01098","src/z=
lib-ng/zconf-ng.h.in":"708106f26c4a0d877e2ea644320a2b48b144524b61429c7490e2=
e742a0c0c1e4","src/zlib-ng/zconf.h.in":"dacec2360fd9607f85bdf651409fa3831dd=
26f74414d242e812b06c3b9c9926d","src/zlib-ng/zendian.h":"f5cfa865281d2c5d0b0=
97d318500f27daeec346e7882de68e279486d79c52e77","src/zlib-ng/zlib-ng.h":"7a1=
5bda0297b2611da695f895cc57ce44c284b030fe98817281e868a1a86ae35","src/zlib-ng=
/zlib-ng.map":"e8202981574d814cb2a9f06bca7900d0959c24766bd86681bd3843ab0e71=
f8ef","src/zlib-ng/zlib.h":"703bead0c02381c8df8d14d805fde913973b2960811f35e=
2de4f4aaf29ad905c","src/zlib-ng/zlib.map":"e3549810f821d433d57f921ca2fceb86=
74574f778485255a7dc691bf26b5281b","src/zlib-ng/zlib.pc.cmakein":"17668e07ed=
be5971043bea26a2f2b92c4c7cf4724620f1156f3ea1436d2aac93","src/zlib-ng/zlib.p=
c.in":"cf94c9aa44878a62e27c2f75354c08326b3bb5250a9b11496855cf59691177bb","s=
rc/zlib-ng/zutil.c":"7544aa2d2cfce4693d4e2a639f0631c3e8b3e7d0d846313be0e250=
c477e6812c","src/zlib-ng/zutil.h":"c0e9152d078ca1774c93910fd84531b2f593b3a6=
b1035e4d97a0d28b720ec98b","src/zlib-ng/zutil_p.h":"1e5a2fb8d15212ad094e9a5d=
5f607f11f8191498b54e0af48d722f92d9c71ffd","src/zlib/CMakeLists.txt":"b87275=
731cc3ebdfea144187875cea204f555c343279c0f35f2d46d661bfe34a","src/zlib/Chang=
eLog":"4c9f1a65b9b4be8bf164a97775ef50e4db4e02ea8c9933fdbe629a640691375e","s=
rc/zlib/FAQ":"1e8a0078be0ff1b60d57561a9e4a8cad72892318a8831946cba1abd30d655=
21c","src/zlib/INDEX":"3b4e325d47ae66456d43fcf143ba21ab67a02a4f81be7ef2da48=
0ba30d774266","src/zlib/Makefile":"ef23b08ce01239843f1ded3f373bfc432627a477=
d62f945cbf63b2ac03db118a","src/zlib/Makefile.in":"5021b2bac4164f48b17c91c8a=
2e3c225be7ad31d8bfab1bbaadd90370afe9991","src/zlib/README":"7960b6b1cc63e61=
9abb77acaea5427159605afee8c8b362664f4effc7d7f7d15","src/zlib/adler32.c":"d7=
f1b6e44fee20ab41cef1d650776a039a2348935eb96bcbd294a4096139be3a","src/zlib/a=
miga/Makefile.pup":"a65cb3cd40b1b8ec77e288974dd9dc53d91ed78bbe495e94ccc84dd=
d423edf1f","src/zlib/amiga/Makefile.sas":"0e63cf88b505a1a04327bb666af3a985c=
5e11835c0c00aed4058c0dcc315d60e","src/zlib/compress.c":"5c11e1fc22e219cb986=
f6fa9e4ba939315227e84aef042737d38ec668b89b6d2","src/zlib/configure":"86b38f=
27f31d2fec76d9355872550dc63cb3949774473fd6313c5a3fd1def0e2","src/zlib/contr=
ib/README.contrib":"ca39b78bd7ad84f1df7b0da90770c5b3fa4c8e2c75d132e9222812f=
ac8839630","src/zlib/contrib/ada/buffer_demo.adb":"469cf566a6965767fee6b987=
a239ed8cedcc66614940d45a9b434331fbb435ce","src/zlib/contrib/ada/mtest.adb":=
"41b6f31684770334afdc4375871eb1408542f37a823a073556fdbfdb63753160","src/zli=
b/contrib/ada/read.adb":"fa5b989aef0c5715a3fcb15de93985f7f10aeb0a7f5716745c=
95ed820eb9af9c","src/zlib/contrib/ada/readme.txt":"8fe9e5303f2e8e8b746c7825=
0e74b7c4aeb7ce6212fdce751fc3a0ce56a47fe2","src/zlib/contrib/ada/test.adb":"=
5e3abe79b387e09a9a42bd0543105e228f39a335240cffc33d71f0ba66ff2511","src/zlib=
/contrib/ada/zlib-streams.adb":"f45988e2bac76eb25a0dc981f46576e7432c35dde17=
90bbc2b650f0090b7fa72","src/zlib/contrib/ada/zlib-streams.ads":"969e8edb061=
1810fb52159dcb7c40228f4e5da810a7a3576b778116a93038c6b","src/zlib/contrib/ad=
a/zlib-thin.adb":"03d89244ee5ec9771d9b5050e586c609f851af551b2e64eb151f1d5be=
0b63ae9","src/zlib/contrib/ada/zlib-thin.ads":"631ef170bde16c3ca8d412b54a0e=
519815b80197d208f8f393e6fe017bb0968e","src/zlib/contrib/ada/zlib.adb":"c9ca=
5dc34fbcdf06e2dc777b7e9dcd0ba31085b772b440eb0e12421323ab672c","src/zlib/con=
trib/ada/zlib.ads":"02634bec0d5e4c69d8d2859124380074a57de8d8bd928398379bfac=
c514236d2","src/zlib/contrib/ada/zlib.gpr":"859bb69dce38dbe9dca06753cf7ae7b=
d16d48f4fece8b87582dab8e30681d3de","src/zlib/contrib/amd64/amd64-match.S":"=
166007f7e9adb58fe8b83d85bbfe823f5e05858ba1d06edf637b78886caa2c69","src/zlib=
/contrib/asm686/README.686":"c21cc7147c956ecae17dd084cb41a206b086216fa52101=
2871fb07fafd203c6d","src/zlib/contrib/asm686/match.S":"873799062495629f21cd=
3f779ea4b927add7aae0144e32d3594d9ce70185e99d","src/zlib/contrib/blast/Makef=
ile":"17d5d26c24bf51cad51045a38ffb73cc3539d29e89885aa249fcfd45a8659d5c","sr=
c/zlib/contrib/blast/README":"baa763ae03d88ef7ece6eb80d9a099b43d0b57639d6d2=
81e1c7c6ca79d81daba","src/zlib/contrib/blast/blast.c":"1ab3e479d342bfc14416=
7b808fb00142264bc50f24a110ca88cc774e351c218e","src/zlib/contrib/blast/blast=
.h":"4d4e3e6f893316f0be77bfd642c857a77f1fa2925acb5df9753e543d35aa3a6a","src=
/zlib/contrib/blast/test.pk":"5f5c262c545574a5c221132d5ef832478d222d70b0153=
41795b3860204140d7c","src/zlib/contrib/blast/test.txt":"9679b2c98e1283222d0=
782b25a1c198dc64ba9ebd1addd6dc6f643a45947cda3","src/zlib/contrib/delphi/ZLi=
b.pas":"1b20e173443a68c189cdaa4795620fb1ac165d9e61a27a1ed2cf690f13530d6f","=
src/zlib/contrib/delphi/ZLibConst.pas":"84bcc580bdf397e570f86f3f5a5b8c7bf53=
7828f30b4b72648b81911f6bf5095","src/zlib/contrib/delphi/readme.txt":"f7420e=
d2de77d4b498eefbbe6402a1d17dc2d411735289c78a265c7f10fdaee5","src/zlib/contr=
ib/delphi/zlibd32.mak":"850e91b6c9ea05de61a411cbda16fa0f10118cd88bb32c4b722=
6988776f8d511","src/zlib/contrib/dotzlib/DotZLib.build":"b96137097669644ecb=
9f42cdd3399d1fce9c512788374609303f7e50abf597f0","src/zlib/contrib/dotzlib/D=
otZLib.chm":"20d0e3edd57f849143255a7f0df1cd59d41db464a72c0d5ab42846438a7295=
79","src/zlib/contrib/dotzlib/DotZLib.sln":"a979198c5b8d144c1ac8f993bfb6f40=
85d135aa58ca9dcf63ebabf52b5c695f7","src/zlib/contrib/dotzlib/DotZLib/Assemb=
lyInfo.cs":"314afcfb339ea95f5431047b7ab24631b11c3532c7ce5dc2094ed0cf80a7c16=
d","src/zlib/contrib/dotzlib/DotZLib/ChecksumImpl.cs":"e7c047a2c3bcf88d3d00=
2ee3d2d05af414acf53cb4451efacc0f2e95a474ea0f","src/zlib/contrib/dotzlib/Dot=
ZLib/CircularBuffer.cs":"be84c9736fe7bdc2bfae70466d8fff582504e928d5b5e110fd=
758090090c8cb7","src/zlib/contrib/dotzlib/DotZLib/CodecBase.cs":"259bdda1b7=
d6052134e631fa24bfd9dca6e2362563496c8b85257b56c848908c","src/zlib/contrib/d=
otzlib/DotZLib/Deflater.cs":"06ba6696a3c15c53ba5fd5a1c2bf50b51f217010228fc1=
e4c8495ee578f480de","src/zlib/contrib/dotzlib/DotZLib/DotZLib.cs":"9837fe99=
3fd631233cc5e53ff084d86754b97f05ec77c54b0764c2706f186134","src/zlib/contrib=
/dotzlib/DotZLib/DotZLib.csproj":"21606db31dfef6410dd438b73f1db68856eacabcc=
e6c0f0411fc4f17e17001f3","src/zlib/contrib/dotzlib/DotZLib/GZipStream.cs":"=
8d1de9755c77046b4ac71340a0a54434ebf4fd11b085c44454d7663a9b4df1c5","src/zlib=
/contrib/dotzlib/DotZLib/Inflater.cs":"9016ca73818f5b6a28791abc3af6da7c4d27=
73b6a3804f593f6d5737a62b99ad","src/zlib/contrib/dotzlib/DotZLib/UnitTests.c=
s":"ad66ac08de34d253e9615b96a745f3dfeda93f4a978d65d5d3ddb9d0d9b3e099","src/=
zlib/contrib/dotzlib/LICENSE_1_0.txt":"36266a8fd073568394cb81cdb2b124f7fdae=
2c64c1a7ed09db34b4d22efa2951","src/zlib/contrib/dotzlib/readme.txt":"d04972=
a91b1563fb4b7acab4b9ff2b84e57368953cc0596d5f5ea17d97315fd0","src/zlib/contr=
ib/gcc_gvmat64/gvmat64.S":"22ff411b8b1d1b04aeaa8418b68245400267dc43c6f44104=
f6ccd37f0daee89f","src/zlib/contrib/infback9/README":"890288f02bb3b1f9cc654=
b87a07fcea695f90f6b9bd672d25bf6be1da2ec1688","src/zlib/contrib/infback9/inf=
back9.c":"0a715c85a1ce3bb8b5a18d60941ffabc0186a886bcc66ba2ee0c4115a8e274e9"=
,"src/zlib/contrib/infback9/infback9.h":"dda2302f28157fe43a6143f84802af1740=
393572c2766559593996fd7a5a3245","src/zlib/contrib/infback9/inffix9.h":"84a2=
ba4727767c18af6505f0e81d9c814489c8b9ed330a25dad433db72997e43","src/zlib/con=
trib/infback9/inflate9.h":"32a907676cc36e27d0fdc0d99adb83a0b23f20ab61896269=
216d40fecf08d349","src/zlib/contrib/infback9/inftree9.c":"0c7f10396703b230c=
504207fe1595a2f2f8ba9c43158c4bd79d5b22ca36e04e0","src/zlib/contrib/infback9=
/inftree9.h":"8ae61d52e50d2dbdb0378548ecc54fcd88f108c8b6fc30562a3ebec1ca6a5=
99e","src/zlib/contrib/inflate86/inffas86.c":"6f266f3c7e0faca653256d0189c0f=
00d7dc0b062d02e25df4e1202e49369595c","src/zlib/contrib/inflate86/inffast.S"=
:"70777bd21526680005fc34f086d108af49e2668ad86d1749e8e8100a81bfb288","src/zl=
ib/contrib/iostream/test.cpp":"0f3c77e013949eb9c91e6b690ea894e19d97944d6b08=
85b82806fc3ad99680cf","src/zlib/contrib/iostream/zfstream.cpp":"8ebb9b3d521=
cc3392953f27658cf1f6dcb763216079f69a1518ec5ca0e42a63b","src/zlib/contrib/io=
stream/zfstream.h":"4369c35e66f63f52ca4a5e1759bf720507ccabb8f3f132e2f18e686=
86c812401","src/zlib/contrib/iostream2/zstream.h":"d0343e0c57ff58008b6f2964=
3d289c72713aa2d653fe3dcd2e939fc77e7e20b6","src/zlib/contrib/iostream2/zstre=
am_test.cpp":"f789df183cc58b78751985466380c656308490a9036eb48a7ef79704c3d3f=
229","src/zlib/contrib/iostream3/README":"43ec48ecbd95a8c45db20b107fac73b74=
0bb11595a4737329188f06b713972cc","src/zlib/contrib/iostream3/TODO":"af5ebc8=
3fb88f69706c8af896733784753dead147687e1c046f410c0997fd88b","src/zlib/contri=
b/iostream3/test.cc":"8e17fc48dfdbc6e268838b8b427491b5843b6d18bc97caa6924de=
9fad7abe3da","src/zlib/contrib/iostream3/zfstream.cc":"8cdd67ed0b13c192c11e=
5ea90e9d5782d6627eb303fbc4aa5ebda2531ec00ff8","src/zlib/contrib/iostream3/z=
fstream.h":"1bd74778fac45ee090dfc0f182a23e8a849152deb630606884b2635987b357b=
1","src/zlib/contrib/masmx64/bld_ml64.bat":"1c0561908a07ebdff271b12ed757241=
e1813d3db0f3551501b2595c23f0833aa","src/zlib/contrib/masmx64/gvmat64.asm":"=
390c1e6d63cb615b5ba042842738953f9cdc688b2fe35aaca981fd3fae213f3f","src/zlib=
/contrib/masmx64/inffas8664.c":"f6c585e43e6e524107566b1f10104949d0ef902159a=
c8203e1d98e50d4bedd62","src/zlib/contrib/masmx64/inffasx64.asm":"8448d0041f=
e6e8f4188fe5916181a1b274c6d35d75cfb28da60cf4f1edde44ec","src/zlib/contrib/m=
asmx64/readme.txt":"9bb66b5028100855683853f12da0be479c7bccf74365fdbf37da254=
2edff9927","src/zlib/contrib/masmx86/bld_ml32.bat":"b0b05b62715d4a81a7db5b7=
ca4a372d109ec95634c9d3bef9e0041ff52de22fc","src/zlib/contrib/masmx86/inffas=
32.asm":"78d2cc88f8ed0e32ef960efc987c257bc1688afe7d031a8ba18761e95a6a7c3f",=
"src/zlib/contrib/masmx86/match686.asm":"9e9bea3b5517b089da7d39caded0798274=
6a33f94f0907ca7e8afefed7be36b6","src/zlib/contrib/masmx86/readme.txt":"1f29=
a04e0227b74e20ba1b7c764b3ca5bf596dd2c06e89bc19a05fb8f9689778","src/zlib/con=
trib/minizip/Makefile":"087034de3dc0223b29e64bb3a4fc3eda7b948e93d2a9ff154ae=
cf9fed2a1eb5b","src/zlib/contrib/minizip/Makefile.am":"2313a3480a2c3745fa7c=
e216829cd0367058907d3a0902e5832c66c84a2fdfc6","src/zlib/contrib/minizip/Min=
iZip64_Changes.txt":"302c62b328647f5472fb7755249a83459be7f8ffb1fae07e8ba318=
fce8f4126c","src/zlib/contrib/minizip/MiniZip64_info.txt":"122719c32ef1763a=
5f6ba9c8cdefc1d78a76f7156b09e7b6f69b73f968e0dac3","src/zlib/contrib/minizip=
/configure.ac":"35330dc0c6188127afd339829d91b19739d23bf3b7301bfb04f775a6fcb=
bdad7","src/zlib/contrib/minizip/crypt.h":"8e872b60255b8447da99885c7159c2e1=
f1bb8143523bdbe71784e60f98bfd67b","src/zlib/contrib/minizip/ioapi.c":"66b39=
c27042f6ad12cc12efb0c82cdf100c6640b5fa959b8b866e252966113a9","src/zlib/cont=
rib/minizip/ioapi.h":"8655408534b78dc0889a45f9359fc6d2d5c8e8d8443b81ede596f=
954c720ef48","src/zlib/contrib/minizip/iowin32.c":"2c05bc374d3d847c6a9f29ea=
c9d674abba7659d1e91e34e172248fcb5c274d51","src/zlib/contrib/minizip/iowin32=
.h":"586f22b9c3c64da253ce2b518e0fad61f19a7b47b289fc704cc9708242294c49","src=
/zlib/contrib/minizip/make_vms.com":"65736d9c4888f2373d3db0a13864d150c50404=
53f5bc2a5c8784379a7ea67590","src/zlib/contrib/minizip/miniunz.c":"ced49f20c=
62536a8ffb270b35cfa4994a1dcdce45f8cf059b941c94ca0022666","src/zlib/contrib/=
minizip/miniunzip.1":"66d8684392167091ef0fe01598d6a0daa26e7e448e2df6c3cb257=
487735b83f7","src/zlib/contrib/minizip/minizip.1":"5404596e8e5587a52f563906=
119f32ceee30a6d97a966afa5c7afbe4d373e210","src/zlib/contrib/minizip/minizip=
.c":"fdfcf83979ef2324c1455d369e8add8678c804939d412ce53f8b024578ceabad","src=
/zlib/contrib/minizip/minizip.pc.in":"8b6670b42d8e5e519e1cc89db093efc07ba23=
cb1ddfedd3c93ff2df08c3ce8ac","src/zlib/contrib/minizip/mztools.c":"cd887c4a=
f6d20823bd15f24008b10acf01969b4165d7848656bde843a92428d7","src/zlib/contrib=
/minizip/mztools.h":"6f82c52279e8f79165f4446be652e5741a49992ac58632470335aa=
34c564072a","src/zlib/contrib/minizip/unzip.c":"497adf676b1cae2a7afa834e4ab=
a86383f7b697f5fdd03a8179ea9024a431cf9","src/zlib/contrib/minizip/unzip.h":"=
d8dc58fc0121b6a4b98f3028205bb253f956b1ddf791e9ced3cf44892502a01f","src/zlib=
/contrib/minizip/zip.c":"00f403cb7810578b4b2687dd55fb132c850c3630fba2f3704a=
8ab896fcc8209a","src/zlib/contrib/minizip/zip.h":"96163fc140e4bf08752e014d2=
0a1eac3f5adcdc408366f6d79c1895f2599cf08","src/zlib/contrib/pascal/example.p=
as":"d842d456ecb6ff80e34cee2da31deb2072cc69ca837497bea8b8bee203403474","src=
/zlib/contrib/pascal/readme.txt":"02f997c37991ddae0cb986039f7b4f6fc816b3fd0=
ffd332cad371d04c12cf1b9","src/zlib/contrib/pascal/zlibd32.mak":"850e91b6c9e=
a05de61a411cbda16fa0f10118cd88bb32c4b7226988776f8d511","src/zlib/contrib/pa=
scal/zlibpas.pas":"28b90aeeb3da8d1f6a98ab9f5f1603d08aba5bfabc50827d3f15e661=
268a51cf","src/zlib/contrib/puff/Makefile":"d9d738030464aaae354196c14fd928a=
df591832fce7d71ac1977c1d8d4923a4b","src/zlib/contrib/puff/README":"aceca4bc=
1bce7d9445b8bc9b6640c672d95708185f6070d3a3baae7a9d102caf","src/zlib/contrib=
/puff/puff.c":"6d0eef92e115a42e570b79d8b07a04af5ccbd6b3f3fbca9cbc61c49db9c9=
df43","src/zlib/contrib/puff/puff.h":"969b7be2a930db0cdcb19b0e5b29ae6741f5a=
8f663b6dba6d647e12ec60cfa8e","src/zlib/contrib/puff/pufftest.c":"8ee0da78a1=
221a3c2036e22eed06c2faa27a671a46565a60e10111d4ee9c30ee","src/zlib/contrib/p=
uff/zeros.raw":"b7b0887089f7af1f6d1e0b4c0a1e8eddd10223b23554299455c6c9be71b=
653a3","src/zlib/contrib/testzlib/testzlib.c":"c6c37b35c6ecc9986a9041f86d87=
9cc37a9e4d8315af9d725071eb3b2cade0c5","src/zlib/contrib/testzlib/testzlib.t=
xt":"2359bbdc84eb8a04e0f1cd16cd81a2896e957f2ad58dab3ca78ef55b7d0dc577","src=
/zlib/contrib/untgz/Makefile":"8f5ab1564813e091cea8f1bb63da32fd80ac763d0292=
77b0cabf50f60aceefe1","src/zlib/contrib/untgz/Makefile.msc":"d0f537de11d9e0=
e36e2a98b3971c537265f4b533b4c48797094365ad9ae8388b","src/zlib/contrib/untgz=
/untgz.c":"9a12d774301d252dcd38bba07ac369319da4c04c4fef8a50fcbf40aebf29c2a1=
","src/zlib/contrib/vstudio/readme.txt":"2a9ca40b68274f4d37649dfab9e5e867a0=
00883592b4ab8fdaec8425a63052c3","src/zlib/contrib/vstudio/vc10/miniunz.vcxp=
roj":"dd607d43c64581172c20c22112821924dfe862f56b2e5eb8780bdd0714d9527b","sr=
c/zlib/contrib/vstudio/vc10/miniunz.vcxproj.filters":"c3db9f97952683e688ad8=
3c13bb94c816ac3e6b5f277fdea545b0650c125aa6d","src/zlib/contrib/vstudio/vc10=
/minizip.vcxproj":"af73f2cf8ae51e65e85342faeb40849a2310c97bc77def42b38d7070=
460a6cf0","src/zlib/contrib/vstudio/vc10/minizip.vcxproj.filters":"83db58d8=
7f5d7ca84b6087aa1f62b15cbc296194c8cf76e47a271f9077b4f3bd","src/zlib/contrib=
/vstudio/vc10/testzlib.vcxproj":"1525ed0893db56db44ec68675c8da3c229dc786716=
6dfc0428816783d16ad43b","src/zlib/contrib/vstudio/vc10/testzlib.vcxproj.fil=
ters":"d7e04ffa467d417dfa3c0f1c64234cadc84882101bbae483f0a0f5d3d6b566a7","s=
rc/zlib/contrib/vstudio/vc10/testzlibdll.vcxproj":"3f317d8964f17901c3e68bff=
5deaec10b6ccc50a572235999e8097292692984c","src/zlib/contrib/vstudio/vc10/te=
stzlibdll.vcxproj.filters":"682a485f0184aabba94e12e1b284499195f37c176d43ece=
e0484f31e4d636f6f","src/zlib/contrib/vstudio/vc10/zlib.rc":"e8b581eb16930e0=
213d37143a5f17868839b22c758b23981a29484e17093c494","src/zlib/contrib/vstudi=
o/vc10/zlibstat.vcxproj":"2a38222d6c034d7e0b843c3f0540dc6c53dd48f942ae29f31=
620ca0327248c8e","src/zlib/contrib/vstudio/vc10/zlibstat.vcxproj.filters":"=
d9a2c381e51e4d6f027f3517db7db81656e43cec02ed9abf267a0fde6f360180","src/zlib=
/contrib/vstudio/vc10/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018=
b4affda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc10/zlibvc.sln":"e6598=
60f705f31b87ea9139a3cb4ebe1561e120bce495383a54614fc82b49990","src/zlib/cont=
rib/vstudio/vc10/zlibvc.vcxproj":"3108badf710e2f4a64eab4e7deae6642fb68cc0d9=
4018e537149f1761e215133","src/zlib/contrib/vstudio/vc10/zlibvc.vcxproj.filt=
ers":"58404ba7703c68025bec64b8a17ff1fc7f3a35d15d17ae3bcc4fa753f1348425","sr=
c/zlib/contrib/vstudio/vc11/miniunz.vcxproj":"746e4c11fb8af4bcd6a9d68ba81ed=
1dc366a5de3bed56b291ee969ad733a7bb0","src/zlib/contrib/vstudio/vc11/minizip=
.vcxproj":"340617cae9cf4fcb003308021d3782ec3639e60d62d79a3aafc0a50bb55b061e=
","src/zlib/contrib/vstudio/vc11/testzlib.vcxproj":"589eec6ef6d818564ead938=
a629fda50abb6cbf8054b9f66ea780765c1a1b3db","src/zlib/contrib/vstudio/vc11/t=
estzlibdll.vcxproj":"583bdef522b0176829f0d8139ea2a88b9cbc14379d1334f3a86398=
9ed3df9b67","src/zlib/contrib/vstudio/vc11/zlib.rc":"e8b581eb16930e0213d371=
43a5f17868839b22c758b23981a29484e17093c494","src/zlib/contrib/vstudio/vc11/=
zlibstat.vcxproj":"51aa752698d96df065a9ece02e293492f681b59a8077f036a5a60367=
dc621e87","src/zlib/contrib/vstudio/vc11/zlibvc.def":"0124fea28bfee49c8a19d=
ad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc11=
/zlibvc.sln":"27389b515997defd080519f95aff87e89fcbe8b26d73c5ebb73c544cfef4d=
60e","src/zlib/contrib/vstudio/vc11/zlibvc.vcxproj":"c3dd05e56159aba411475b=
83656275872524cb3c2fd24d690397d8b634e7e0ed","src/zlib/contrib/vstudio/vc12/=
miniunz.vcxproj":"1494af54570f6e93852932956d49a8c25e57b5abc1ac979945605ca91=
43df9f8","src/zlib/contrib/vstudio/vc12/minizip.vcxproj":"9bf128ed6760ca5f0=
19006f178b1c65f4c7ff122dba8d297b64b0eb72feeb120","src/zlib/contrib/vstudio/=
vc12/testzlib.vcxproj":"367a06caa399bd09f6b9cb60706820943dd6a6cf05794275baa=
f421da9c2a0b7","src/zlib/contrib/vstudio/vc12/testzlibdll.vcxproj":"9341651=
0256935d79625dc9fd349cfce6968c062d42a138bec404a26b2f92f5e","src/zlib/contri=
b/vstudio/vc12/zlib.rc":"92d5d3a4938a6350395934153416a7eb74353cdfb2321f45b9=
ee0b9b16257f39","src/zlib/contrib/vstudio/vc12/zlibstat.vcxproj":"744ff6ac0=
d4e2dcdf74c7d33b979fbfd2b18550947eb99bfd46dc6a73eb1c68d","src/zlib/contrib/=
vstudio/vc12/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4affda5a=
389e64ad15f44d7","src/zlib/contrib/vstudio/vc12/zlibvc.sln":"162e0faa80a56d=
89eea71a0b89377708eec2faa0dc72091cc0abb07fbdea49a0","src/zlib/contrib/vstud=
io/vc12/zlibvc.vcxproj":"754671c59d8996a846241af76082cc8be1aa5fc079eff530d9=
1a9ab15a0bee5b","src/zlib/contrib/vstudio/vc14/miniunz.vcxproj":"0312511d4a=
30cea979c4e36edf994a537ed8a9d924f6b5c536cbcd094773c11f","src/zlib/contrib/v=
studio/vc14/minizip.vcxproj":"9e7bb7a6ac723e4b2db900627c366f9bb93a351381995=
d9c69a50c0126f64233","src/zlib/contrib/vstudio/vc14/testzlib.vcxproj":"c3a9=
369670af4ebea13d036b452be7418591fbb4c03a675699facac5d8dff5d0","src/zlib/con=
trib/vstudio/vc14/testzlibdll.vcxproj":"69f544898b4275cd3d8e19b8f1f8cb39c1c=
b98a30cdb033242e4b94c57bfa150","src/zlib/contrib/vstudio/vc14/zlib.rc":"92d=
5d3a4938a6350395934153416a7eb74353cdfb2321f45b9ee0b9b16257f39","src/zlib/co=
ntrib/vstudio/vc14/zlibstat.vcxproj":"9c7c096b47e7875412c98525efcd16db62e09=
4215f0011b9cd739a33ab35d48c","src/zlib/contrib/vstudio/vc14/zlibvc.def":"01=
24fea28bfee49c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/c=
ontrib/vstudio/vc14/zlibvc.sln":"47a50bbde8ca6336cecd8c0e4b65e515fc46ae84c7=
b61008ac9864162f777286","src/zlib/contrib/vstudio/vc14/zlibvc.vcxproj":"71f=
b6ef3b079bfdf4182af17e74c3361ead757467edfc591d9cbe303ccc47b52","src/zlib/co=
ntrib/vstudio/vc9/miniunz.vcproj":"b2b53bd9e704bfbe769b863acdc2a3368692ca14=
9c4b4ed2a0761b0cd16c6726","src/zlib/contrib/vstudio/vc9/minizip.vcproj":"80=
a701fb41a61871ce1d25f6b03e571edb6c3abf0aa45375554b6fac52115eb6","src/zlib/c=
ontrib/vstudio/vc9/testzlib.vcproj":"05fc5a87682b17690d199f424f57f6ad7767b8=
dabb29a1039bfcb88bca1b302f","src/zlib/contrib/vstudio/vc9/testzlibdll.vcpro=
j":"25c1cc5319f1c4b7dbdb595c3cfd6ec3ba217818b03b7055ef5ef440b575a43d","src/=
zlib/contrib/vstudio/vc9/zlib.rc":"e8b581eb16930e0213d37143a5f17868839b22c7=
58b23981a29484e17093c494","src/zlib/contrib/vstudio/vc9/zlibstat.vcproj":"e=
8653eea37f3bef097eec2caa55e1f698c3c74c959689bc4e97568e88d2bbc60","src/zlib/=
contrib/vstudio/vc9/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4=
affda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc9/zlibvc.sln":"26e58d4b=
2cfcd941c367fb2a18537b3b9f002f2ac1278b700ea1129c50501452","src/zlib/contrib=
/vstudio/vc9/zlibvc.vcproj":"86aa6e33db104c0a0ed4a9f21f0db8572cc7755170217a=
ef18219fdd74b75e9d","src/zlib/crc32.c":"a04af273e83ecc351bf3794974ab2098d8d=
960df4044b7b44734c41443ee26d0","src/zlib/crc32.h":"407af59d0abfea84a6507c60=
3eb29809411797f98249614fe76a661def783ce1","src/zlib/deflate.c":"11fd6b0328b=
65c4ad4b5c204d892a97a9083628a7e77dc47836c8e0c799f8da0","src/zlib/deflate.h"=
:"0ca7fb0cf1dd63001c6e9e4ff93c8dbff2fe521199be51a4dda38a11b44919f6","src/zl=
ib/doc/algorithm.txt":"992590931e982c0765286c2d83f6e9ff0a95aabb08e28c30c52b=
ae3e8c4bd5ad","src/zlib/doc/rfc1950.txt":"8f0475a5c984657bf26277f73df9456c9=
b97f175084f0c1748f1eb1f0b9b10b9","src/zlib/doc/rfc1951.txt":"5ebf4b5b7fe1c3=
a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009","src/zlib/doc/rfc1952.t=
xt":"164ef0897b4cbec63abf1b57f069f3599bd0fb7c72c2a4dee21bd7e03ec9af67","src=
/zlib/doc/txtvsbin.txt":"47c273bb22c9773248d380549a330e5c262266b1292154b0d3=
014f731cc73f47","src/zlib/examples/README.examples":"402d72eb69c2e03a25034f=
4b3c02b110f0f67149ecfa4fa0e4b2bf0ceb49a8b3","src/zlib/examples/enough.c":"7=
04e273f65b62c5d2eb06d5bb10c4ccffba56544aa477f0e3957e2296c501b78","src/zlib/=
examples/fitblk.c":"950769163c41aff897ee41746a8685d9aa41073b1307f42da19dabe=
9d3fc8b85","src/zlib/examples/gun.c":"d60ca6eb0a3e62ee7fb4a1ab69e8d1525ff06=
b06ce46889cbdfc13fb8f7534c2","src/zlib/examples/gzappend.c":"4182d38bf97ffb=
df1110df7f65c0e8fab0b28b1ea36ebba8621c14e8e76f1caa","src/zlib/examples/gzjo=
in.c":"90b9d6c39a5fc91cf1cc9b96b025a508a8015dc502cd9374c754b44078593f57","s=
rc/zlib/examples/gzlog.c":"433d34b71b4e769ece1cceb8bd7d902d2c0a24ccd7550ab1=
856a5ba87f84f835","src/zlib/examples/gzlog.h":"309556e2d7d39250924946b78e2c=
ce0ac927857d6e1a02cab64e438f533c20c3","src/zlib/examples/zlib_how.html":"80=
fb647be8450bd7a07d8495244e1f061dfbdbdb53172ca24e7ffff8ace9c72f","src/zlib/e=
xamples/zpipe.c":"68140a82582ede938159630bca0fb13a93b4bf1cb2e85b08943c26242=
cf8f3a6","src/zlib/examples/zran.c":"840ebeb058cd0ca9e92dcb1db665932462a469=
5fc649b34e865b8d1ad7c5bf77","src/zlib/gzclose.c":"94446cf8cde67c30e64d0a335=
b0c941fd3fbad2e77f30180d12e61f9c2a5a6b8","src/zlib/gzguts.h":"6a54a06d26924=
5d73201e76280c0f11c282dc6ec51729ccd9051fe6c9907e851","src/zlib/gzlib.c":"5d=
af11e44149e0aba2956d35f73f04f35dca99c3dfa43f5ad43ec20b336e4a1b","src/zlib/g=
zread.c":"6f928512cb1792cfeab31a51ff0b211814d2e455bc75290eb31079dc1e5ad2ec"=
,"src/zlib/gzwrite.c":"ba3b7b7ad2ff7ef0c19319b8408c333491a4cd495da55d0b156b=
c73d9ddb4df4","src/zlib/infback.c":"abe44873b5af2ea68ea1d281d915b2800f1832f=
846d2c05442a4711adbe6f269","src/zlib/inffast.c":"4d496ab2a3d29df5fadc3dbff6=
067e039806aaceae6cfcd09ea77d46c2b848fd","src/zlib/inffast.h":"7d8c1c873ce9b=
c346ad6005bb9d75cce5c6352aaf7395385be216a9452a34908","src/zlib/inffixed.h":=
"237ba710f090e432b62ebf963bee8b302867e9691406b2d3f8ee89ee7bfef9b0","src/zli=
b/inflate.c":"8b6c599c3563c14c447c47db0d7dc9a16e8c246a078ec95a169ddcebaaebd=
811","src/zlib/inflate.h":"8ec9ac297790276f7e46a961d4c6f9f944fb1dec92401339=
ec2666973cc5983c","src/zlib/inftrees.c":"1960ca67384376f65b6ce8c08fdb501f8e=
b33923e11ef5f61a855708c6cb0a8a","src/zlib/inftrees.h":"c510b36402784b1f898b=
e3b049b923469aa92701de2d9195aed19f6b65c0dce2","src/zlib/make_vms.com":"3064=
eb153a7684115f1494364f80759bc5a2c227799fdf08df7b9e6e50884720","src/zlib/msd=
os/Makefile.bor":"292ab363f7ffbc4ae84d37cd9bdffd2dac1003bee52d223a848984487=
0f20702","src/zlib/msdos/Makefile.dj2":"9208450c2ae6dcbfcc25560b5b9ca763f46=
1e7246e37b0552474edf8fa898906","src/zlib/msdos/Makefile.emx":"c749d6ec7f88e=
8e639d4f03bdbdcbbe9d1c304210be4c4be621ceb22961d3d64","src/zlib/msdos/Makefi=
le.msc":"0e021a6f42212415b060e4ad468eb415d0a8c1f343137fb9dff2cb8f9ead3027",=
"src/zlib/msdos/Makefile.tc":"2ae12ee2a3e62f7c5a0520d0fbe4adee772bc07fe8160=
02b07ccb43db3daa76a","src/zlib/nintendods/Makefile":"ea5823efe6830132294edd=
f2f56dbd7db8712244c210bb4968c431b1a91bd066","src/zlib/nintendods/README":"e=
362426c47b39ff6a7d6c75c6660b20abf076cdfa5e1e421716dc629a71aef95","src/zlib/=
old/Makefile.emx":"d811f032272aae50123a889297af3a02fbd60d1e42bbef11466462f6=
27ff7b5b","src/zlib/old/Makefile.riscos":"d1a488b160fbfd53272b68a913283a4be=
08ba9d490796b196dddb2ba535b41e0","src/zlib/old/README":"551a0f4d91fe0f827a3=
1cbdfbb4a71d1f3dc4d06564d80a3f526b749dd104d11","src/zlib/old/descrip.mms":"=
8ff08c35c056df9c986f23c09cf8936db63ccf12c3c42f7d18a48b36f060cff7","src/zlib=
/old/os2/Makefile.os2":"6ad247c00f00ff42fd2d62555e86251cef06e4079378241b5f3=
20c227507d51d","src/zlib/old/os2/zlib.def":"ea9c61876d2e20b67ef2d9495991a32=
798eb40d13ede95859a2f4f03b65b9b61","src/zlib/old/visual-basic.txt":"1727650=
acbde9a9e6aec9438896377e46a12699cca5d46c5399cef524dedc614","src/zlib/os400/=
README400":"6f95a1beb0fbf943a3312eaa3dd2c279f1cef93062bebbff63dd37ac9e2aa8d=
6","src/zlib/os400/bndsrc":"cfe00b1528d5c27813cd6b1ad7aa34b493fd63d615623fb=
21fd1a7bf99d2255e","src/zlib/os400/make.sh":"143394d1e3876c61c29078c0e47310=
e726e1f5bd42739fe92df9ece65711655f","src/zlib/os400/zlib.inc":"c501c522185b=
a1f0506caf90d72f1088b34b2addc169471e949e443ab65e8a75","src/zlib/qnx/package=
.qpg":"90b5c8364d9dc5ef67405b352c19710ebad2905f3f20b9e56ded74661f96743b","s=
rc/zlib/test/example.c":"520799662a8286725540d6d5a356efe6f595618e5fe2e59197=
2491d719bd99aa","src/zlib/test/infcover.c":"f654f3fcc74b33bd95cda63d13fe0ce=
589bcfe965544e0c17ee597d75efbd090","src/zlib/test/minigzip.c":"91089b21e692=
797bb6208b2b45eeb90f5f1f1e4f6b67b99dea5676f51b811193","src/zlib/treebuild.x=
ml":"d816c764c8ec2d5b2ebfa7f053f747097926c13fce7fa8628c5d14c991411421","src=
/zlib/trees.c":"f2a5f949ea70dde7c23a54c793aeed630a03df4bb72417cd3aa008000c4=
4699b","src/zlib/trees.h":"bb0a9d3ca88ee00c81adb7c636e73b97085f6ef1b52d6d58=
edbe2b6dc3adeb4d","src/zlib/uncompr.c":"31922aa982ee12fd28d1ce5fe6a94a3f07c=
2a941c821b566a881ca21845cdfaf","src/zlib/watcom/watcom_f.mak":"7e039b912f9c=
ffaa40835281430bb284fa9042b0a0d12f6b34700a06bca6576e","src/zlib/watcom/watc=
om_l.mak":"d11b4064604a034725860e63e3f6d347056372e4b1675b183e20a93533b20cc9=
","src/zlib/win32/DLL_FAQ.txt":"9e00778319381e6275691dd3a89410c99065b8c0c5d=
b96473abe8c859cbdefd8","src/zlib/win32/Makefile.bor":"e878fed2313417db085fe=
a621c110889f6a32233b5b6db46e3c4e824c1d0ed6b","src/zlib/win32/Makefile.gcc":=
"ea8feddce7b9707253b9bf86623cf7ebe5294d7aea2b3b0b1b1c1b8cfd73009d","src/zli=
b/win32/Makefile.msc":"7c495d63c5afea1d77d162a41b73bab89cee952c12e4647e9684=
a7ac79bfc3f5","src/zlib/win32/README-WIN32.txt":"b71f1f4e4760812c3a11b2bae6=
f40d1066741a90e6646010a32ce50a0e348cde","src/zlib/win32/VisualC.txt":"9ec0b=
abd46eaa012371dee2d3a8a55d9c7130f7895512c3371c737e4a7f6a997","src/zlib/win3=
2/zlib.def":"24fa6dd00f3f4c0d14507a03ddbfa42707a04e3901bb9ff6f90096037a7518=
5a","src/zlib/win32/zlib1.rc":"8fc5f2b5abee40ad66e6d6cfc9f926c2f446e13a7c9e=
e7df8bf58a266d8cade5","src/zlib/zconf.h":"9c0087f31cd45fe4bfa0ca79b51df2c69=
d67c44f2fbb2223d7cf9ab8d971c360","src/zlib/zconf.h.cmakein":"d740b750e9c98e=
6a4b4529cc2a857a3fa8001514b1ce91e0e1d9d293652bf388","src/zlib/zconf.h.in":"=
9c0087f31cd45fe4bfa0ca79b51df2c69d67c44f2fbb2223d7cf9ab8d971c360","src/zlib=
/zlib.3":"5abef003e545566e5599e5ab2e7528e978be59d54546b19d763d062f7a69bac7"=
,"src/zlib/zlib.3.pdf":"7f0f633641d782e360eff9fe831716c5767faf1000e38382a8a=
8c65b0b67f374","src/zlib/zlib.h":"4ddc82b4af931ab55f44d977bde81bfbc4151b5dc=
dccc03142831a301b5ec3c8","src/zlib/zlib.map":"7eb1070ba6bf12e6895e5da06b84a=
92af683827587afaa72bdd45e80b9d8e4e9","src/zlib/zlib.pc.cmakein":"2f1d0b18ce=
37c2af415a469857f02aee2c41a58877aff21d29e9c6db32b55cb7","src/zlib/zlib.pc.i=
n":"04c01cc2e1a0ed123518b5855f585c93a24526dd88982c414111ea1fc9f07997","src/=
zlib/zlib2ansi":"d316e3e79054f5f9fe921d35f4bbf4bf0a37b859d29d2b34ae4d7d92af=
c3e55c","src/zlib/zutil.c":"f7fdc9ef326a2683eb33c794face54e83c751ec17f3d1ba=
581847a62af36ddcd","src/zlib/zutil.h":"9a63f6690fac1620aa3cecee5752af618806=
da438a256b4a047fbcd289cac159"},"package":"de5435b8549c16d423ed0c03dbaafe57c=
f6c3344744f1242520d59c9d8ecec66"}
> > ++{"files":{"Cargo.toml":"2f23b1493e2aa56abce67ae714f4ba088ac6b30b55c19=
c156477e1788f515701","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14=
d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"34c467b6945a22696d060b8fdd2379=
d464acb3408d4c599d3dc5fe4fa1b4c84f","README-zng.md":"237e65a2b90c6533e346d8=
38e857572a82fe498753500fe04b7054dc261ca5a9","README.md":"97923429b45c95f222=
92b41d116452a4ce3df98d6960c89af30b3ec64c68b7bf","build.rs":"0b57c3a2c98c2cc=
122ae00d7b45610e4f568f6960c823f23b69ef0682cc7fb33","build_zng.rs":"b7768e19=
f0bf876f29eabb6ad6511f530e61d8aa92bfbe89a7cf3818e4824ce7","src/lib.rs":"7c4=
a3394e17e6250c1f4f2067efecc56b1850827596432ad0ce75e5eea800446","src/smoke.c=
":"10607c81b73811bfcb9718767312bf97ba2ccf7048ea2f18a2085aa06ad7f91b","src/z=
lib-ng/CMakeLists.txt":"c3ccdac791fd8d34c720b336b60370545dfd66c642e78b2033e=
ecc2273c160d9","src/zlib-ng/FAQ.zlib":"c524f4f86d336b3de71dd6977afddffa9c02=
fda5c26db4dfefae44959e7614a2","src/zlib-ng/INDEX.md":"989545e90d8e9ac149034=
f762ce78ed8976ebf9324326228dea37ca190154609","src/zlib-ng/LICENSE.md":"d3c8=
0be055d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436","src/zlib-ng/=
Makefile.in":"774c8462cccbe6b30fc34d68490bba8e352e460c8ee2c3775d4d0767e2282=
192","src/zlib-ng/PORTING.md":"10d59c3195ee8c631bb29fbe75e7e11a84d3daf7ab9e=
2be12287661ffd8fe1b6","src/zlib-ng/README.md":"c9f247270ce0fa8c823ce047e823=
6559127933fc83b16dc9a6863bbc983b6dbe","src/zlib-ng/adler32.c":"52fbdc52a7bf=
5c64baf5a7fe76f7255348c280c5b1bbb9bb674ced04a01d8fb2","src/zlib-ng/adler32_=
fold.c":"9ba56a7bbcf64ede61d8fa84de9f81d751ece311dc9a3e12470f794a6103316b",=
"src/zlib-ng/adler32_fold.h":"c40114c2c742b6410e54b58ea02533fe6e9ae0ca62d34=
53e5d2a1725d33e2be4","src/zlib-ng/adler32_p.h":"3d44f3d9296dfcdf203b5c4e4a8=
b0da0551365970ceb882715c7140ad061a90a","src/zlib-ng/arch/arm/Makefile.in":"=
e523b6c87b928e2dddcd04793bc79b5829304cf51ead713d743af740ca131b37","src/zlib=
-ng/arch/arm/adler32_neon.c":"60608f4cc48bcebced93947ba7a75f128876352fbfc2b=
1521d25ae00b692c244","src/zlib-ng/arch/arm/arm_features.c":"bc8a5f0b1f80a05=
bba51b851a4be941c75c38e4800840b96097eae57cb7a5bdd","src/zlib-ng/arch/arm/ar=
m_features.h":"7534eb55b3551123c9a51ca8dcf771da0c1bb21be07e0c00292d156d96d5=
5238","src/zlib-ng/arch/arm/chunkset_neon.c":"bad43fd303a538ae5b7d41f8f2b0c=
84915492ebb32abd7528d074501a637cf83","src/zlib-ng/arch/arm/compare256_neon.=
c":"d87660d69cfc4bdace50cc9f08ffd42fec71e3281566b9b58c1d83008e6fe6f3","src/=
zlib-ng/arch/arm/crc32_acle.c":"921f1278e2130bf69b7572ed5bda13df3ba472948e3=
90b1dbf330a1daad1736e","src/zlib-ng/arch/arm/ctzl.h":"feb70d55e66025fff806e=
30e48002b35cfff79533d352585cfa5f118edbc90b1","src/zlib-ng/arch/arm/insert_s=
tring_acle.c":"337e420632ac14620dba851923c35a882e532bc445a9b10330f3a8dc6ee3=
2ec8","src/zlib-ng/arch/arm/slide_hash_neon.c":"b455b2ee60899d97844317f4c80=
f522a9f611258b9500e6de810e94433e933bc","src/zlib-ng/arch/generic/Makefile.i=
n":"f41a34839986eac8dd52cf91fada0efff4171c059ab5d7db6347c91bd6d9db09","src/=
zlib-ng/arch/power/Makefile.in":"292f34d0dabe1658a9cac8c7f303b3d311b0d18a0c=
b38b7fc69abd9d95075df0","src/zlib-ng/arch/power/adler32_power8.c":"f39c4c5f=
0aded59e2b4986c151b70edc32f976c2c82185540164af52e2158bb2","src/zlib-ng/arch=
/power/adler32_vmx.c":"f6f9fa89366b742b27bad122a6a96948efd6fb95a4de3238fbab=
e3613e6f9251","src/zlib-ng/arch/power/chunkset_power8.c":"4f3df226e8969f472=
e517274c0b940ea0a6cf3980326d2d85cd09b325f37502f","src/zlib-ng/arch/power/co=
mpare256_power9.c":"d136d4eb79d9b67cab11048c56439531755da9c292fa13373a8dc0a=
40239368d","src/zlib-ng/arch/power/crc32_constants.h":"d73e3b9025de9fade7fa=
3ba2bbf5f56a1499a84c53d8ca7f5e744a0714d8599b","src/zlib-ng/arch/power/crc32=
_power8.c":"88919c3c14bd8124c112bfb6bafb2d526870740cb2828f14ccde3a9b866308a=
a","src/zlib-ng/arch/power/fallback_builtins.h":"78a8da60bad8ba01278e495482=
108adabf9e96bdb214e869b61ab1f63f518c9b","src/zlib-ng/arch/power/power_featu=
res.c":"369683c1e792f783f91d72f4046d24623f9bc015edc13146476ff04fb030ca44","=
src/zlib-ng/arch/power/power_features.h":"d755ee6ca0e804ddff2639d098e355a52=
01d01c8bee8e1bd9e98bf6be7774cf1","src/zlib-ng/arch/power/slide_hash_power8.=
c":"05a858c9a35d58c933becb3e1848310a0bf50899d6d8829127789747fb0931fb","src/=
zlib-ng/arch/power/slide_hash_vmx.c":"e8bde875deff4d61e777d7e56853ef7b3a718=
9797ade5c6dfef9fb202930294e","src/zlib-ng/arch/power/slide_ppc_tpl.h":"c890=
0c594591e1aba3188f97c374e5561fe1e96f653c668352b25647e449f4c0","src/zlib-ng/=
arch/s390/Makefile.in":"e20982f40349d7b0725c5b908acb9a7f3a4c45dc4f329fab80b=
56b1538a2b7bd","src/zlib-ng/arch/s390/README.md":"892908181f6bafde706e70a64=
c312ccf18a300a56045ea1010d6b6bd04ea1d1b","src/zlib-ng/arch/s390/crc32-vx.c"=
:"353355c8a1819064ff8db1e53ac0906c5ea7e0bdc303e200382a85a299ef209c","src/zl=
ib-ng/arch/s390/dfltcc_common.c":"cc90250cd04e74c432496e0658e94708fe267b1a7=
99df8c2cbc1f6b5d6d23a9e","src/zlib-ng/arch/s390/dfltcc_common.h":"c17edda79=
dc82aaab399cc14c3a7c2dfc021e152286d3841272a337d6c404df9","src/zlib-ng/arch/=
s390/dfltcc_deflate.c":"9cb59560fcfc7828139372d3ff27386f85acb12595274e6ce99=
f8c4d9a4abbd4","src/zlib-ng/arch/s390/dfltcc_deflate.h":"e8077ba0f7097438ee=
43d7d514bfb323069bd979aa15c1f708ce1cee69ed6980","src/zlib-ng/arch/s390/dflt=
cc_detail.h":"859e72e270c1f6da668aa199f331b328df65d5d86410ba5c1e6ef8442263d=
6ec","src/zlib-ng/arch/s390/dfltcc_inflate.c":"7b0a443f7aef6044c3180166cb22=
8e4c4d1a1026ce085b3ec7e8f1d2128ca777","src/zlib-ng/arch/s390/dfltcc_inflate=
.h":"478dd9d731441a91fbb287dfb31e37ba8f7d358a18f9a46a5c3a2d7a65022157","src=
/zlib-ng/arch/s390/s390_features.c":"92e420580f060d570e0b0362a7d6e80dfcaddd=
fbe4ebbade263cc9a561434785","src/zlib-ng/arch/s390/s390_features.h":"4147b5=
061f4376d85256673c8ff0492b8efd69add35c345cdbb47d9194b13b91","src/zlib-ng/ar=
ch/s390/self-hosted-builder/actions-runner.Dockerfile":"ae43b34a5d4d75acb39=
2a974de1af1561e55424bed0dfa19a2cca7bd38dafa8e","src/zlib-ng/arch/s390/self-=
hosted-builder/actions-runner.service":"62a19075adeddb3bee57bbac81c7acadacb=
f9c288e2b497e36ff7f2b3daa7558","src/zlib-ng/arch/s390/self-hosted-builder/f=
s/usr/bin/actions-runner":"f647e18728ea15fe927ac9f8cba83a5b343654a0e91b5ebe=
653bae7af7375110","src/zlib-ng/arch/s390/self-hosted-builder/fs/usr/bin/ent=
rypoint":"add4ebdc4f06ed15bb1de12a8c9ceb370a60baebb0932a1026a75433940ad3df"=
,"src/zlib-ng/arch/s390/self-hosted-builder/qemu-user-static.service":"5455=
1049f6181da88700a2a944a72b0af3b8abde876fa28e1348deb5eb96c91b","src/zlib-ng/=
arch/x86/Makefile.in":"0a681b0a6d396cea593bd8c4a854c5d1bb742217958e2a6a663a=
4cca051cc9e5","src/zlib-ng/arch/x86/adler32_avx2.c":"7d653cfa7d363c37c93b06=
5f9155939ffcaf58ef34a1a3b1d26a7f6c7de3829e","src/zlib-ng/arch/x86/adler32_a=
vx2_p.h":"21790ad0c770a93f8bccec160310b55a322418bed79f51d054d509925f316cc3"=
,"src/zlib-ng/arch/x86/adler32_avx2_tpl.h":"28f7889e7f77ac7a43376a5a93bf84d=
a7596762b8dc5eaa941fb3b0a7273ba27","src/zlib-ng/arch/x86/adler32_avx512.c":=
"27f3a767de2529b03173d5e8ffe9cae61c3e0807aabcfc9c5c92047a576b6a1c","src/zli=
b-ng/arch/x86/adler32_avx512_p.h":"1b4beda11693ac03e4b20e054a765df427f845a2=
79bce547b8208d20f5a302bb","src/zlib-ng/arch/x86/adler32_avx512_tpl.h":"e7cc=
c259237a1f59bae475db8c00fc82f2c8fbb581273265a7dec5b394d97124","src/zlib-ng/=
arch/x86/adler32_avx512_vnni.c":"1dbc4d42f2af3912f2c42d0c8fe454fd953a07dd70=
ae105e07a09442b506fd0d","src/zlib-ng/arch/x86/adler32_sse42.c":"d5ed7a9f910=
0cbf0c7dd7b893e8b2425a890bd991fcc1cf63cd3a0e24093fcae","src/zlib-ng/arch/x8=
6/adler32_ssse3.c":"0eb8c72796a96dcec4080423ce9b467e9047eaabc7a0eeffe1155e9=
3b2e73d1b","src/zlib-ng/arch/x86/adler32_ssse3_p.h":"c6e22c4998c80bf2b3c489=
abd60e819a17a8c5ec2411a6d2d5c5396484f1dce2","src/zlib-ng/arch/x86/chunk_per=
mute_table.h":"566181353c16e929fcd25621ee629dcac23477fdd2862eea3a7239b76370=
653d","src/zlib-ng/arch/x86/chunkset_avx.c":"dad1bdae1c7d004ee750391f25489c=
7fb78276dac25f2e2990cbb40c3cc6052b","src/zlib-ng/arch/x86/chunkset_sse2.c":=
"2695d3f92eccafb4401afaabfc84717aca693cc04fd6d85988f3b8592a831b70","src/zli=
b-ng/arch/x86/chunkset_sse41.c":"25398da25f5b8f7dfadf80e2a9af58674942720b6f=
46f46854548e3d68e68000","src/zlib-ng/arch/x86/compare256_avx2.c":"2516d00fa=
a6939e61dbb0978a9c4c81f9e3a42fd053b2a2241673da7cf4fc781","src/zlib-ng/arch/=
x86/compare256_sse2.c":"3b983708034f33b5da49f6f5041351a2e66358c76645c552f6e=
4dc37fb890a80","src/zlib-ng/arch/x86/crc32_fold_pclmulqdq.c":"9cc8473039213=
9b0cb50f4b51a6391cb1da3cc2b200a7b5dbef638706d1e0866","src/zlib-ng/arch/x86/=
crc32_fold_vpclmulqdq.c":"439559e134b7a7366d05f8850f1974a9caffea70363565629=
73acd72050d1d58","src/zlib-ng/arch/x86/insert_string_sse42.c":"1f093e32f3b7=
1704f2bad3468adf790741870398634647b7aa0bc1b3430ef970","src/zlib-ng/arch/x86=
/slide_hash_avx2.c":"9740a36bb4dd90f40394344026be9a13f3acb6e85e6b7681c30fd7=
f7cbf8e28e","src/zlib-ng/arch/x86/slide_hash_sse2.c":"fa009305a1c82708638df=
f25e037067656350303b25f5774489417e096c30ecb","src/zlib-ng/arch/x86/x86_feat=
ures.c":"05d9cd4164771147bf5a75754cf60ba05083c3b9842c590ea527c8ae44f1ca85",=
"src/zlib-ng/arch/x86/x86_features.h":"76df96d3b077fb9697f2d0a8598fe6576880=
25faa849e4c12d717c4966efb4ca","src/zlib-ng/chunkset.c":"534acd20990af9ed52f=
e9effcf1a6aeb1d5c5a3226c38dee9c007bf5aa7e7266","src/zlib-ng/chunkset_tpl.h"=
:"563f55a12daf6b921df8ebdda8d0e5818e1ce532efbd81faaf37a7a275c2a4c4","src/zl=
ib-ng/cmake/detect-arch.c":"4fff00beb2b207c87dbff81619583858dbb4120b86c114b=
7da8f48979f687bb1","src/zlib-ng/cmake/detect-arch.cmake":"27fa8da497b39ac70=
d881e2d345749611dae4c30f7b7a9c9e32f2c042672189a","src/zlib-ng/cmake/detect-=
coverage.cmake":"4664d51152d51282ae50621f4d510ab72cf8978b266c614b7c5361750d=
b6d1a9","src/zlib-ng/cmake/detect-install-dirs.cmake":"87031a40428a104f5cf3=
8ecdb8a5028d8c679cfa772a58adde8380c809b34eff","src/zlib-ng/cmake/detect-int=
rinsics.cmake":"4c7101c25c2cc8c724682caa6525a9ddfd74b71ad96ea0e6bfae09ded86=
afa57","src/zlib-ng/cmake/detect-sanitizer.cmake":"a40650743dfd0b56c2afbfad=
b53e5d1470ef48852f2fcdf51084b6485534f87a","src/zlib-ng/cmake/fallback-macro=
s.cmake":"a8c8f70e5483177280cbebf99f929a7cf5ffe2b79fedb79eed570ecafc78effc"=
,"src/zlib-ng/cmake/run-and-compare.cmake":"13d85c12c9d6c7b1b148bd0c5a5b4fa=
a6a4b56f3823bf03c4f8d914c9c5949d8","src/zlib-ng/cmake/run-and-redirect.cmak=
e":"7f08d18c09aa58113882ec760735a62a1723a5bfcae9f73bd3713a4dbaeab898","src/=
zlib-ng/cmake/test-compress.cmake":"612f70af2d51b33f70f8c9e0655915a5648803a=
6fc36f138f9daafdec248a77a","src/zlib-ng/cmake/test-tools.cmake":"63aabfffd5=
3970b8e145870b2a1c03bffa3595f7df04bd86f94e97b6f2a387e7","src/zlib-ng/cmake/=
toolchain-aarch64.cmake":"46be0bf580a49a528c72005484655afad1de3705b39a66a7b=
0c213b0fa81cee6","src/zlib-ng/cmake/toolchain-arm.cmake":"05e38076fd6ffb978=
5ff9844ccecd26436c9dc4c25b7777b62e5f52e788c3882","src/zlib-ng/cmake/toolcha=
in-armhf.cmake":"1a2029163a57415eec9a5dd5f45d3254d349e97b1beb5d16876b741717=
673341","src/zlib-ng/cmake/toolchain-mingw-i686.cmake":"b6c48f9d4e4c2848033=
6d65ad43a2bef6625df342ed09dad043ee7dc50292851","src/zlib-ng/cmake/toolchain=
-mingw-x86_64.cmake":"e9d16d3730e48cb27f4d9845f0de6f864231908cbe7c851011a34=
418e34dc646","src/zlib-ng/cmake/toolchain-powerpc.cmake":"9bd6fc58ce5b70603=
657f2c195c4a5cf52fae96ad63ac787978831c5858f762c","src/zlib-ng/cmake/toolcha=
in-powerpc64.cmake":"917fc5eef84921d8b38f43c2b4f60870965b4eecc8f018c7b3499e=
1142c715af","src/zlib-ng/cmake/toolchain-powerpc64le.cmake":"5b2edd36d62de5=
13db2d32bfbf779979d81ac527b981cc3379a4e933fc5a94d1","src/zlib-ng/cmake/tool=
chain-s390x.cmake":"cf52cecea7bd2a9d1ff5fd8edcb03c531e3b404bbcd15a15dec2e0e=
19936f2ac","src/zlib-ng/cmake/toolchain-sparc64.cmake":"e543062485d06a7e0fe=
c8135887c5e73363517fa4babc23ef7b780916d75afda","src/zlib-ng/compare256.c":"=
a4a56d315a5756463d2cd9d76b1abf01fa3e323b6627a08bdfde97387d98e0b7","src/zlib=
-ng/compress.c":"a4f9aaeee845630db7adc7655850e904338a4426286884eb16ffd50956=
b083ac","src/zlib-ng/configure":"a2e86f4361d97bf15faaeab23bc3e58f1ee91305c7=
bf2ea411c07d91350f1bab","src/zlib-ng/cpu_features.c":"067cae566bfcc42129b89=
b3110a6783f206afbc6b085efa9e012f0d18ea749e0","src/zlib-ng/cpu_features.h":"=
baba2e5301d4a0da588195eeae4f6f92bcca5af61f2ac9340a091c2723de71be","src/zlib=
-ng/crc32_braid.c":"4fee7f46585a9f5d664418d7f62de919716c19748cf14177da84444=
8c76dae89","src/zlib-ng/crc32_braid_comb.c":"ebcf0b2ea5080afe155020c2541f3f=
dc15173484211851c8acc903ba83ecf0c4","src/zlib-ng/crc32_braid_comb_p.h":"6c8=
035e05d30a6241be55467fc59e4d7deda6b618b955a11339ffee08a39c75a","src/zlib-ng=
/crc32_braid_p.h":"4953f9c0100d0a435f3237e3a46b826fecbd8b0a50acdd6fab2270d0=
ebbcbbaf","src/zlib-ng/crc32_braid_tbl.h":"e22af112e3c1c8bb4065d39fe678eba7=
1dd08893eb06f9414b02f4cf5a6f46de","src/zlib-ng/crc32_fold.c":"04aab2780ff42=
ce133613a3d92b151561e2a5d4d447cebc57c4fdde3cd11949a","src/zlib-ng/crc32_fol=
d.h":"4799db97dbdbbbdf9757d1b0263998d88676678211b22fec59e8416980090e9b","sr=
c/zlib-ng/deflate.c":"d442202e7f63a9eab0f33223697c8091196c56e1a392ce20dd48d=
71b73928987","src/zlib-ng/deflate.h":"79f6002f4765507a82f77576a0b2ced6dde77=
6fe2882f402a29b060a8798b956","src/zlib-ng/deflate_fast.c":"9d87443601e57ef1=
80fa1e11a788f1f8cf85af363f6db38c2ce2cc27e0d113fe","src/zlib-ng/deflate_huff=
.c":"9bb6b2e3d84831bb00f53f1a0a588f8c066bbed59a07f7d96f186627cb22092e","src=
/zlib-ng/deflate_medium.c":"1f53407841a4a3f489ff6a447703965df1dc18f28a67919=
537702d2f269c7e8d","src/zlib-ng/deflate_p.h":"f53d2a6c3c5e0fa5be89dc054d4b7=
e9b49a3e95646fac6500c1e824d79dcfd62","src/zlib-ng/deflate_quick.c":"a7a80b9=
c1d0214974407b15df42d2863c21dedbd79254ee834fd85fe0b952fa1","src/zlib-ng/def=
late_rle.c":"657e5988b88209169768fe6a7ae5e1ad768cbea550b37b360d9cacdc2ae313=
85","src/zlib-ng/deflate_slow.c":"e4c78f7a57e3ccd91cd45b7af44bd45d564872796=
de89f6f2538ff7493448c2a","src/zlib-ng/deflate_stored.c":"7ec2694ca9f6b40f7c=
2f876f80e5f0d7d911bf59f9a8e5d401dfbe204a258ff6","src/zlib-ng/doc/algorithm.=
txt":"0d21a0a4c47e512743389628d1385a831a5e5ff716491095a382b923287f4223","sr=
c/zlib-ng/doc/crc-doc.1.0.pdf":"064f9252d6e2e15ea56c2bd18e160e5c9c84bcd137c=
11a7af497aaa511ace998","src/zlib-ng/doc/rfc1950.txt":"8f0475a5c984657bf2627=
7f73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","src/zlib-ng/doc/rfc1951.txt":=
"5ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009","src/zli=
b-ng/doc/rfc1952.txt":"f7c810fd9d719d002d605207a9b880600f71d039b9626c5b4b03=
f2122438dd2d","src/zlib-ng/doc/txtvsbin.txt":"47c273bb22c9773248d380549a330=
e5c262266b1292154b0d3014f731cc73f47","src/zlib-ng/fallback_builtins.h":"686=
4b7d0d11bad111895c812ef499c63ad4aa8b7fe86b16d0252d945534ee988","src/zlib-ng=
/functable.c":"2be51a15f7424225a6164ec3e736a4c56191645eebcea95b19e16f070e45=
a87d","src/zlib-ng/functable.h":"d82fc549205db848e74f5d23c91ae4d00114edae65=
590475ca15ec845a49059a","src/zlib-ng/gzguts.h":"8f7a66046f75e3c5f36fd8ccf2b=
2d95eafd0d2cdecba145612ca776b8eeac460","src/zlib-ng/gzlib.c":"7e6ad5d9d32e6=
429d56a5303e2c6e6870d69c023d6647a52fb95902828de4011","src/zlib-ng/gzread.c.=
in":"9c20e0435055175ccebfa5dec217b22210637ed8cc06b53e21d02025f3a0ffd1","src=
/zlib-ng/gzwrite.c":"f8650a2d2a9daa2f523c53ee8ccc420f0f3521b8d44c6829a5805d=
a1f59afaf0","src/zlib-ng/infback.c":"5f6446584e95d961de0d75b4e04b9452ec03e9=
5747fa7d79a53db71c900dd90c","src/zlib-ng/inffast.c":"dd20040aae76a1e857f27c=
fe55460e9a7c16df0719b2e0ca241af8ff4967a2f7","src/zlib-ng/inffast.h":"42e74a=
92b496ab0726be317e8497a12bf3c3cf3d0d533440ce65befd3929c71c","src/zlib-ng/in=
ffixed_tbl.h":"a94225335396245e9f0ccb2e9b4b334fe7ee0111ed8e32a26bcd52187f36=
4314","src/zlib-ng/inflate.c":"861d7a20ef1da8b8d9835585a29ddaac1e99ff31a1a3=
6f3079c240772ef953a3","src/zlib-ng/inflate.h":"c82dff42121e0f0e6e0fab1f9bc9=
e8c43b60bb38ec10a3aa15f0417e54c791b2","src/zlib-ng/inflate_p.h":"3dbb8bf4f6=
c95a51718533851730b1d0d79bfec301102f8a9fd9f903426b297a","src/zlib-ng/inftre=
es.c":"4afec770066911de89f90c1525f87883ea0a9eda672ae9758144ee1839d93f50","s=
rc/zlib-ng/inftrees.h":"fa80eb11c2290b345470a03cb861843e2cb1365135233ea8243=
e9fd79d3618a1","src/zlib-ng/insert_string.c":"7a9455cbb3ca8fe6e7111471b9f4c=
0a32fb49a6d0ec589b027dc2cb2b65c8dce","src/zlib-ng/insert_string_roll.c":"4d=
05f19591a5c29d2da398e10e9d0b050d738cc8838d8dda4beb1cc7281ede07","src/zlib-n=
g/insert_string_tpl.h":"45889b69063592591a55d246cb418a50f8891cc7bdb86b21b46=
b203bc175d60e","src/zlib-ng/match_tpl.h":"03783f06ae132ea36d23420c3348e4a51=
52d8014159da6849ef77a1de96a99c4","src/zlib-ng/slide_hash.c":"97ec270b4c744a=
9dee638081e47807bc7340f859f9aa22e4acf4599fdb45f39f","src/zlib-ng/test/CMake=
Lists.txt":"8c36c775277a6e8dabc7e256ac4631308d5c0af2f585212f904d686d0d0c6bd=
e","src/zlib-ng/test/CVE-2002-0059/test.gz":"60bf96b8f433bd7e057ce3496aceac=
cd70ec80f596a4aa8bcc7786056705ce66","src/zlib-ng/test/CVE-2004-0797/test.gz=
":"38caae524705f676bde13a8df9fc8c7d2fe105ba6bdbab62a405b0276fd3aa2e","src/z=
lib-ng/test/CVE-2005-1849/test.gz":"e4d5a60617df4b5dd44eda94751ce1eacdb3257=
92bba6e3cc4676719a3adf742","src/zlib-ng/test/CVE-2005-2096/test.gz":"8f702d=
4861aa3ec98ac03a59ff26b430939630cb5cd4266d2658d3b836d576f9","src/zlib-ng/te=
st/CVE-2018-25032/default.txt":"d7f8278db331c47bd1208bf41e7903cbddee4f7b47c=
666c40afdd3c96237752e","src/zlib-ng/test/CVE-2018-25032/fixed.txt":"3b27a98=
edd2f3f580033f9add11d3469d7808c969a1128ee00c18ac7a12cef57","src/zlib-ng/tes=
t/GH-361/test.txt":"358497d0a7251ea42101dc77b02337f46fd89af09643a8288e2a308=
2e5d24128","src/zlib-ng/test/GH-364/test.bin":"af5570f5a1810b7af78caf4bc70a=
660f0df51e42baf91d4de5b2328de0e83dfc","src/zlib-ng/test/GH-382/defneg3.dat"=
:"b22bef6b7392401c9e7b079402c4a4074053d7a914d050400e37fd7af6fe26d5","src/zl=
ib-ng/test/GH-751/test.txt":"b83d833803b7bc3124fb2a0034081f0b999ad10c33a8df=
a3bfd181dc078ae3ee","src/zlib-ng/test/GH-979/pigz-2.6.tar.gz":"2eed7b0d7449=
d1d70903f2a62cd6005d262eb3a8c9e98687bc8cbb5809db2a7d","src/zlib-ng/test/Mak=
efile.in":"a6b0a02967a93d78f88d705cdebeaec7e3ce85ff2bc65e30e80324ccff29f7c7=
","src/zlib-ng/test/README.md":"6a34f8fc7a0144958cc9a0cded46fc38a7e15aba3df=
a5bf56d8d86c3fb72d82c","src/zlib-ng/test/abi/ignore":"02aa87f77656dbc1fbddd=
23f436cd15465a92df0722da4055cae1bc8bf013097","src/zlib-ng/test/abi/zlib-v1.=
2.11-arm-linux-gnueabihf.abi":"f5e91f25b558a891fecbeb6e2e9575698630ab700d05=
5a38f3bc4fe66257f513","src/zlib-ng/test/abi/zlib-v1.2.11-x86_64-linux-gnu.a=
bi":"038337383cf780587d810cf5400d632f3a1f8517e63ac4a71b6e5224db8b1413","src=
/zlib-ng/test/abicheck.md":"d960023cd80e04b2d4dcec8cdd3315c7292229d45a3301a=
5dc5213058ba22185","src/zlib-ng/test/abicheck.sh":"7be2e4774543a1c018c6024f=
a685de2ee3cdcf06ee6419e04b23249e0fcd6645","src/zlib-ng/test/benchmarks/CMak=
eLists.txt":"0eeacc3b19579d75fbd6a50cc1ad980a6daafd99e92474b156ae2e57b23503=
9a","src/zlib-ng/test/benchmarks/README.md":"2976b327e44b0066ae197b15bc0201=
f4e43375019718714f05acf50f9245f9da","src/zlib-ng/test/benchmarks/benchmark_=
adler32.cc":"65d98c8fa2b24bc9fe2335159d030c2f8cbd0a4af38bbb9e823b3fafaaa93c=
65","src/zlib-ng/test/benchmarks/benchmark_adler32_copy.cc":"6a5cd0ab97ff46=
c5b67e85abed05b28a4a8d7d5be50e8b8aa66bf47ab49acc06","src/zlib-ng/test/bench=
marks/benchmark_compare256.cc":"faf9dd6246d453005c7a14638abb9833db40f060110=
254eb5ff1739fba170e3c","src/zlib-ng/test/benchmarks/benchmark_crc32.cc":"33=
e14b97607f17069c64351564baff8d8d86c969baae98073491d986f0731a99","src/zlib-n=
g/test/benchmarks/benchmark_main.cc":"b23f1419d7c6f6dadd63fe69afcd54d4821aa=
f95782145f3feb65d5d8564233a","src/zlib-ng/test/benchmarks/benchmark_png_dec=
ode.cc":"e9485de5e722ef1b62131a27a98d2cfe668ee8becbd5fc9938972022e07c8d60",=
"src/zlib-ng/test/benchmarks/benchmark_png_encode.cc":"4b2203af2ef58f95773c=
a6d82569f747f2cfb3c4116334871cfb255a0d7741e1","src/zlib-ng/test/benchmarks/=
benchmark_png_shared.h":"23427ba4e9865ee362990c22a1aa88e868a1ac1f4024892c6b=
6c2a3102566a93","src/zlib-ng/test/benchmarks/benchmark_slidehash.cc":"061d8=
0301e2c016f0e29b04e545b7785eadc5106c6ec431ab1a721628d8c8cd9","src/zlib-ng/t=
est/data/fireworks.jpg":"93b986ce7d7e361f0d3840f9d531b5f40fb6ca8c14d6d74364=
150e255f126512","src/zlib-ng/test/data/lcet10.txt":"1eb5d7bddb1c3cb68064d5b=
5f7f27814949674b6702564ff7025ced60795a6d9","src/zlib-ng/test/data/paper-100=
k.pdf":"60f73a051b7ca35bfec44734b2eed7736cb5c0b7f728beb7b97ade6c5e44849b","=
src/zlib-ng/test/example.c":"f84aed9043e995123728c6fccab2d9b2da0439962b5902=
775c9e29a9b06806a3","src/zlib-ng/test/fuzz/CMakeLists.txt":"e9d833705121d8f=
6c79efb5dc3b8a8acf909837c70f3b3fe610228575ea72b0e","src/zlib-ng/test/fuzz/f=
uzzer_checksum.c":"68ed79ec1d7fefa548f4d32ab7885479442520cdf53ad59eadfae13e=
4b15efe0","src/zlib-ng/test/fuzz/fuzzer_compress.c":"3f507a18710fb2a1d87fde=
5cf3affc74b53a689e9d2ce6f887ee64eb778e568b","src/zlib-ng/test/fuzz/fuzzer_e=
xample_dict.c":"46541ed3ef9bb7378120d47133f18b4194e955e7a84a439647205de68e7=
45c08","src/zlib-ng/test/fuzz/fuzzer_example_flush.c":"393e7872825bb1ca366d=
0d8552b94442511ed4a557db6ece16540b79b7e9cbdf","src/zlib-ng/test/fuzz/fuzzer=
_example_large.c":"e3b91b1ced83dfe538e8ae5262f1756181a7785e8c2ab38ac2881456=
bd562277","src/zlib-ng/test/fuzz/fuzzer_example_small.c":"de9f5dc3182405750=
341a0f44c37bd8ba4f21d993284456ba8e6ce3e36d6b9b3","src/zlib-ng/test/fuzz/fuz=
zer_minigzip.c":"a02628aa452d9eb0ea42bf3c01b005a6569da50c832b78f90a1dec425b=
f3c677","src/zlib-ng/test/fuzz/standalone_fuzz_target_runner.c":"e6170b744f=
aa68bf2a414e99fc87accf4db2a5e0eb58b17aded5c692ea493604","src/zlib-ng/test/g=
h1235.c":"8310ef780dc483a1708750cd7c120b8e9cc0e1614767d24c01869e529074e981"=
,"src/zlib-ng/test/infcover.c":"b4a4b659b2180fbfe0178940235eb9773508a7794f9=
d27c758e0ee8f7971d85a","src/zlib-ng/test/minideflate.c":"56d3f2a8b72cbce8f5=
8e4d26591cceafed58c5441a1efffc619c3baf27be8e13","src/zlib-ng/test/minigzip.=
c":"3c2a2bfd67c1bffe9cf55ef2e15648aab7a209a6546beeb4df0c27f6cc7cae53","src/=
zlib-ng/test/pigz/CMakeLists.txt":"aa70f1025adc004985bfe0accee9b7a80e04786d=
82705e27c377a5e8d4ecbaaa","src/zlib-ng/test/pkgcheck.sh":"75b3155125f235e27=
ee434d76b6f72bd825899b55f6d59ef2d032fe67a2896ed","src/zlib-ng/test/switchle=
vels.c":"f4c482766b2e85ebdfe74ab488b16a4e807d5894dce2cfc5a0501c347db211fe",=
"src/zlib-ng/test/test_adler32.cc":"1b53271b0317c4ac435fb7f1c430fbcce004136=
4596b8658b2d4ef4ced04a28c","src/zlib-ng/test/test_aligned_alloc.cc":"2728bb=
53528f280830b63ad5abf2674227cce8ae7840b5a4c4841c73d95ec09d","src/zlib-ng/te=
st/test_compare256.cc":"1068f9f8d20660429a224392112dcbfc45fca5eb5116d31e61f=
b98a9d3f28389","src/zlib-ng/test/test_compress.cc":"2e0b0c8435ca89dbf827f4c=
1e00874ad52743703644143dc8823ac5699507a36","src/zlib-ng/test/test_compress_=
bound.cc":"6cf532aba78cfad2b453a6be96de3afa1e1ff49f062d376615e6f7028cfed14e=
","src/zlib-ng/test/test_crc32.cc":"c111ceb33473a2514e6df5fb0abc4f495e13f7a=
8e37255476ae0ef3d7e75decf","src/zlib-ng/test/test_cve-2003-0107.cc":"629f1f=
e659558c9deb767b3fbbb615539b0458f8b67a405ece924cac6bebb531","src/zlib-ng/te=
st/test_deflate_bound.cc":"5bd722e6749612b714bef7dc8dc183759b629e8afa8f0684=
15378e7ff7ac12d9","src/zlib-ng/test/test_deflate_copy.cc":"1a286ba7772bb1a6=
d06233b075a83f3f1814bab2fd7d3757c090f5db25db90f1","src/zlib-ng/test/test_de=
flate_dict.cc":"344613040cb70d9f6ba6a3c40c0ef452644f9656c43f1e0969b84f487e4=
e3db1","src/zlib-ng/test/test_deflate_hash_head_0.cc":"3144479b7d5b9f3d4ad2=
ff2d43dbce5b3e7043acd1ae5b06d6ce8db6e98c8573","src/zlib-ng/test/test_deflat=
e_header.cc":"93bf9a4099540d47fe01c07afeb8dbc37a5551076c98df1dca2b9b5e96aa8=
131","src/zlib-ng/test/test_deflate_params.cc":"3701da15960c0984373cde19d14=
596c26911679e0b95e5261cb8515f65150b65","src/zlib-ng/test/test_deflate_pendi=
ng.cc":"faeeaf37a8aa2512e8551084a20c41181910335021961728be26f568c7f68cf2","=
src/zlib-ng/test/test_deflate_prime.cc":"6c83e5563d00d05bf62ce0e7bc1ccb78cd=
080c1627b2a3bc878fa2c2b11986aa","src/zlib-ng/test/test_deflate_quick_bi_val=
id.cc":"9706d0bf9d844b21f1655498bf0f9901c7dfc272cdef37f2d1af238c71df611c","=
src/zlib-ng/test/test_deflate_quick_block_open.cc":"30e81885917d8414faea99f=
74ed178790ed7c2884ef231d7f144f9fa32f993c1","src/zlib-ng/test/test_deflate_t=
une.cc":"dad52ad7941aca761ff177877a0d60f1b68b3a6d28a8f4bd382005f3c04bad64",=
"src/zlib-ng/test/test_dict.cc":"2bb6c32ec0ea76561172e0b5e8c6a7bf4f64efc2b4=
1534b42ec1d6c3d0990897","src/zlib-ng/test/test_gzio.cc":"2b811ed1927015decb=
4470073b59f85f6e405559eae044b5eeab545b8a492bbf","src/zlib-ng/test/test_infl=
ate_adler32.cc":"f4c1e9f88cdbbd672cff8bef2eab8c01ddb598494d1ade07d3f3630d19=
169f6a","src/zlib-ng/test/test_inflate_sync.cc":"fbb1121ea5b5448723c6d6d869=
2110c7362e6833fae22afcd46909d4ecb1289b","src/zlib-ng/test/test_large_buffer=
s.cc":"168eff24816cb28e2b49188012cfec9ac474b01e83c5bf8ae602f010f100fb61","s=
rc/zlib-ng/test/test_main.cc":"62e058cb2a411010796c5e69e55759fccadd8ce49fce=
f6884a9cd9b035d054e8","src/zlib-ng/test/test_shared.h":"c11e53b07ade7065e83=
bc92e812a0af56d6202b40bcadf1f4473cabc152e2579","src/zlib-ng/test/test_small=
_buffers.cc":"680ba24dc58c7dd05e8dab2e430a8e0c99b946cbc341a5fb39c4b4b921b6f=
b33","src/zlib-ng/test/test_version.cc":"8599eca8dd63a96962a5c8ac01a3172d20=
3f9065e228867928ed4bce61cf6009","src/zlib-ng/tools/config.sub":"32186cfeb5d=
b62c99e1dfbfb07f24c1a50977447b4c26d2907021c74422a70d2","src/zlib-ng/tools/m=
akecrct.c":"6194908f8f810a626f3183c379b067e9b1897b88276ecf9011590a21a43a1a7=
8","src/zlib-ng/tools/makefixed.c":"bffd02540231304f9bcc755b8cb9ae5cfbc4897=
5857bbb4547f1d6acce21ef57","src/zlib-ng/tools/maketrees.c":"3ea81e69ac0767e=
479e7065662e4f6a4e6f528acb78c86968945017357f802fb","src/zlib-ng/trees.c":"e=
4eac691fe9e535e2d0582f326d5f0cd8c216265716e848b6b9d5f94e881781a","src/zlib-=
ng/trees.h":"24174f3543b01ee1ef370bbf6d15551a21871cded18b2aadf09a71e7904b6f=
99","src/zlib-ng/trees_emit.h":"6c541dcf01eecf393d4eab7800bc558ad524114bb5a=
8deb86f13376fbef88754","src/zlib-ng/trees_tbl.h":"022736ff3362ef3591d1f8fc3=
b7fede5927c0d25ab0813d7ef8cd95efd6ea242","src/zlib-ng/uncompr.c":"1656c770b=
8f7455bd5ed3cee78d226b010a56ce9c6a4ce66b4f65df1c19cfef4","src/zlib-ng/win32=
/Makefile.a64":"115fe42cf85877e66137893c02fde21e9010848b34965544a57b5540b46=
01a48","src/zlib-ng/win32/Makefile.arm":"1ced9c213d47e451f5dc21c4eb4cd05e6c=
021cb2d2e36d60d6f8dd69fbfc519f","src/zlib-ng/win32/Makefile.msc":"fbbf3fe93=
bdbe11ac1e79d471d862fd6dfa6874501bc682d2b084cdb3f3c2425","src/zlib-ng/win32=
/replace.vbs":"0ecd6d2f42f4f49d835acbf7b89a79cbdf17fed29d5931eeb3b40da6d313=
3946","src/zlib-ng/win32/zlib-ng.def.in":"3d1167b8b9db56bf3ae5e4b569af743b5=
d008d012f4ac2ce5e4b6f951b9a71bd","src/zlib-ng/win32/zlib-ng1.rc":"98b6d62f4=
27509c4fd22c2288541f99455e1f1f7a9a349e859cc2f7e1d438ea1","src/zlib-ng/win32=
/zlib.def.in":"ec69c79c2a5612a5c4dc9de08c930c9b251f2455e4bca8781f70c05f7170=
fb3a","src/zlib-ng/win32/zlib1.rc":"66fa46294e779c0c7182d2d01abee6b112ae5e0=
5d91726e3684925df7d8433df","src/zlib-ng/win32/zlibcompat.def.in":"c4dff5ac2=
cfe629155c7de5b0f139fb1c962fb01addbc032c3cf35110921eb27","src/zlib-ng/zbuil=
d.h":"2f336c4af4c1445029b31d55db1ddad65ef78b3db0026d910aa3c3b20cf58e66","sr=
c/zlib-ng/zconf-ng.h.in":"91893ca925182a08fe11bd728b77dd818bb0af15ab5abe9a3=
9d8d01e2e114d08","src/zlib-ng/zconf.h.in":"2816eef7bb70d874d8be00cdf984ecc8=
04a8213a0d47454e7feabde2bdadf9a4","src/zlib-ng/zendian.h":"f5cfa865281d2c5d=
0b097d318500f27daeec346e7882de68e279486d79c52e77","src/zlib-ng/zlib-ng.h.in=
":"cd139e1dea10683be03cb6be6847980c0595d026474076866b952fae3709ecb6","src/z=
lib-ng/zlib-ng.map":"03ef4439594619e215dbb1717f8c13e16159308ef3817761ba1a3c=
ca7f7834df","src/zlib-ng/zlib.h.in":"3261ec4605c45a065d5270bd1ab225639ff5a9=
53053e830347f82eb0f919860b","src/zlib-ng/zlib.map":"9997aa913dec6da106ab208=
9d2a72ca5e1b7fafe0807ac0bc1318ce8c8defab9","src/zlib-ng/zlib.pc.cmakein":"4=
e25f45fe7522c3f444a27dbc68ca595447ee4f73be6d0fdcf7abccac67cda09","src/zlib-=
ng/zlib.pc.in":"e7964018e5293e5221573c129e73b379499dd5aa8b9739db1782fdfa24b=
bdff7","src/zlib-ng/zlib_name_mangling-ng.h.in":"474b5cadd2deba6c78084aed9b=
872e95c3888ffcdba153b934fca4f88dd1c36e","src/zlib-ng/zlib_name_mangling.h.e=
mpty":"38e51a846d6c2bd6100298c55328dba4437c08fa1dceda4eb2e06ecb1d142058","s=
rc/zlib-ng/zlib_name_mangling.h.in":"00c1b07fdbcb52c43f3b11ae5a4c98f6691804=
9f53918607e698b992a46024fa","src/zlib-ng/zutil.c":"64ecee4e622d6fe4d00ca94b=
d302b27beb03178129d4be4b2d12c1823a73a27f","src/zlib-ng/zutil.h":"59cc0ffe4c=
13662d9729e28ed098803e6f1c6d36fd8b0654da9bca53eebc3b4f","src/zlib-ng/zutil_=
p.h":"ddf2e95f2e7462a1ae4d330b26d454a394684cbfddf74af3d3e4ceff5db85275","sr=
c/zlib/CMakeLists.txt":"b87275731cc3ebdfea144187875cea204f555c343279c0f35f2=
d46d661bfe34a","src/zlib/ChangeLog":"4c9f1a65b9b4be8bf164a97775ef50e4db4e02=
ea8c9933fdbe629a640691375e","src/zlib/FAQ":"1e8a0078be0ff1b60d57561a9e4a8ca=
d72892318a8831946cba1abd30d65521c","src/zlib/INDEX":"3b4e325d47ae66456d43fc=
f143ba21ab67a02a4f81be7ef2da480ba30d774266","src/zlib/Makefile":"ef23b08ce0=
1239843f1ded3f373bfc432627a477d62f945cbf63b2ac03db118a","src/zlib/Makefile.=
in":"5021b2bac4164f48b17c91c8a2e3c225be7ad31d8bfab1bbaadd90370afe9991","src=
/zlib/README":"7960b6b1cc63e619abb77acaea5427159605afee8c8b362664f4effc7d7f=
7d15","src/zlib/adler32.c":"d7f1b6e44fee20ab41cef1d650776a039a2348935eb96bc=
bd294a4096139be3a","src/zlib/amiga/Makefile.pup":"a65cb3cd40b1b8ec77e288974=
dd9dc53d91ed78bbe495e94ccc84ddd423edf1f","src/zlib/amiga/Makefile.sas":"0e6=
3cf88b505a1a04327bb666af3a985c5e11835c0c00aed4058c0dcc315d60e","src/zlib/co=
mpress.c":"5c11e1fc22e219cb986f6fa9e4ba939315227e84aef042737d38ec668b89b6d2=
","src/zlib/configure":"86b38f27f31d2fec76d9355872550dc63cb3949774473fd6313=
c5a3fd1def0e2","src/zlib/contrib/README.contrib":"ca39b78bd7ad84f1df7b0da90=
770c5b3fa4c8e2c75d132e9222812fac8839630","src/zlib/contrib/ada/buffer_demo.=
adb":"469cf566a6965767fee6b987a239ed8cedcc66614940d45a9b434331fbb435ce","sr=
c/zlib/contrib/ada/mtest.adb":"41b6f31684770334afdc4375871eb1408542f37a823a=
073556fdbfdb63753160","src/zlib/contrib/ada/read.adb":"fa5b989aef0c5715a3fc=
b15de93985f7f10aeb0a7f5716745c95ed820eb9af9c","src/zlib/contrib/ada/readme.=
txt":"8fe9e5303f2e8e8b746c78250e74b7c4aeb7ce6212fdce751fc3a0ce56a47fe2","sr=
c/zlib/contrib/ada/test.adb":"5e3abe79b387e09a9a42bd0543105e228f39a335240cf=
fc33d71f0ba66ff2511","src/zlib/contrib/ada/zlib-streams.adb":"f45988e2bac76=
eb25a0dc981f46576e7432c35dde1790bbc2b650f0090b7fa72","src/zlib/contrib/ada/=
zlib-streams.ads":"969e8edb0611810fb52159dcb7c40228f4e5da810a7a3576b778116a=
93038c6b","src/zlib/contrib/ada/zlib-thin.adb":"03d89244ee5ec9771d9b5050e58=
6c609f851af551b2e64eb151f1d5be0b63ae9","src/zlib/contrib/ada/zlib-thin.ads"=
:"631ef170bde16c3ca8d412b54a0e519815b80197d208f8f393e6fe017bb0968e","src/zl=
ib/contrib/ada/zlib.adb":"c9ca5dc34fbcdf06e2dc777b7e9dcd0ba31085b772b440eb0=
e12421323ab672c","src/zlib/contrib/ada/zlib.ads":"02634bec0d5e4c69d8d285912=
4380074a57de8d8bd928398379bfacc514236d2","src/zlib/contrib/ada/zlib.gpr":"8=
59bb69dce38dbe9dca06753cf7ae7bd16d48f4fece8b87582dab8e30681d3de","src/zlib/=
contrib/amd64/amd64-match.S":"166007f7e9adb58fe8b83d85bbfe823f5e05858ba1d06=
edf637b78886caa2c69","src/zlib/contrib/asm686/README.686":"c21cc7147c956eca=
e17dd084cb41a206b086216fa521012871fb07fafd203c6d","src/zlib/contrib/asm686/=
match.S":"873799062495629f21cd3f779ea4b927add7aae0144e32d3594d9ce70185e99d"=
,"src/zlib/contrib/blast/Makefile":"17d5d26c24bf51cad51045a38ffb73cc3539d29=
e89885aa249fcfd45a8659d5c","src/zlib/contrib/blast/README":"baa763ae03d88ef=
7ece6eb80d9a099b43d0b57639d6d281e1c7c6ca79d81daba","src/zlib/contrib/blast/=
blast.c":"1ab3e479d342bfc144167b808fb00142264bc50f24a110ca88cc774e351c218e"=
,"src/zlib/contrib/blast/blast.h":"4d4e3e6f893316f0be77bfd642c857a77f1fa292=
5acb5df9753e543d35aa3a6a","src/zlib/contrib/blast/test.pk":"5f5c262c545574a=
5c221132d5ef832478d222d70b015341795b3860204140d7c","src/zlib/contrib/blast/=
test.txt":"9679b2c98e1283222d0782b25a1c198dc64ba9ebd1addd6dc6f643a45947cda3=
","src/zlib/contrib/delphi/ZLib.pas":"1b20e173443a68c189cdaa4795620fb1ac165=
d9e61a27a1ed2cf690f13530d6f","src/zlib/contrib/delphi/ZLibConst.pas":"84bcc=
580bdf397e570f86f3f5a5b8c7bf537828f30b4b72648b81911f6bf5095","src/zlib/cont=
rib/delphi/readme.txt":"f7420ed2de77d4b498eefbbe6402a1d17dc2d411735289c78a2=
65c7f10fdaee5","src/zlib/contrib/delphi/zlibd32.mak":"850e91b6c9ea05de61a41=
1cbda16fa0f10118cd88bb32c4b7226988776f8d511","src/zlib/contrib/dotzlib/DotZ=
Lib.build":"b96137097669644ecb9f42cdd3399d1fce9c512788374609303f7e50abf597f=
0","src/zlib/contrib/dotzlib/DotZLib.chm":"20d0e3edd57f849143255a7f0df1cd59=
d41db464a72c0d5ab42846438a729579","src/zlib/contrib/dotzlib/DotZLib.sln":"a=
979198c5b8d144c1ac8f993bfb6f4085d135aa58ca9dcf63ebabf52b5c695f7","src/zlib/=
contrib/dotzlib/DotZLib/AssemblyInfo.cs":"314afcfb339ea95f5431047b7ab24631b=
11c3532c7ce5dc2094ed0cf80a7c16d","src/zlib/contrib/dotzlib/DotZLib/Checksum=
Impl.cs":"e7c047a2c3bcf88d3d002ee3d2d05af414acf53cb4451efacc0f2e95a474ea0f"=
,"src/zlib/contrib/dotzlib/DotZLib/CircularBuffer.cs":"be84c9736fe7bdc2bfae=
70466d8fff582504e928d5b5e110fd758090090c8cb7","src/zlib/contrib/dotzlib/Dot=
ZLib/CodecBase.cs":"259bdda1b7d6052134e631fa24bfd9dca6e2362563496c8b85257b5=
6c848908c","src/zlib/contrib/dotzlib/DotZLib/Deflater.cs":"06ba6696a3c15c53=
ba5fd5a1c2bf50b51f217010228fc1e4c8495ee578f480de","src/zlib/contrib/dotzlib=
/DotZLib/DotZLib.cs":"9837fe993fd631233cc5e53ff084d86754b97f05ec77c54b0764c=
2706f186134","src/zlib/contrib/dotzlib/DotZLib/DotZLib.csproj":"21606db31df=
ef6410dd438b73f1db68856eacabcce6c0f0411fc4f17e17001f3","src/zlib/contrib/do=
tzlib/DotZLib/GZipStream.cs":"8d1de9755c77046b4ac71340a0a54434ebf4fd11b085c=
44454d7663a9b4df1c5","src/zlib/contrib/dotzlib/DotZLib/Inflater.cs":"9016ca=
73818f5b6a28791abc3af6da7c4d2773b6a3804f593f6d5737a62b99ad","src/zlib/contr=
ib/dotzlib/DotZLib/UnitTests.cs":"ad66ac08de34d253e9615b96a745f3dfeda93f4a9=
78d65d5d3ddb9d0d9b3e099","src/zlib/contrib/dotzlib/LICENSE_1_0.txt":"36266a=
8fd073568394cb81cdb2b124f7fdae2c64c1a7ed09db34b4d22efa2951","src/zlib/contr=
ib/dotzlib/readme.txt":"d04972a91b1563fb4b7acab4b9ff2b84e57368953cc0596d5f5=
ea17d97315fd0","src/zlib/contrib/gcc_gvmat64/gvmat64.S":"22ff411b8b1d1b04ae=
aa8418b68245400267dc43c6f44104f6ccd37f0daee89f","src/zlib/contrib/infback9/=
README":"890288f02bb3b1f9cc654b87a07fcea695f90f6b9bd672d25bf6be1da2ec1688",=
"src/zlib/contrib/infback9/infback9.c":"0a715c85a1ce3bb8b5a18d60941ffabc018=
6a886bcc66ba2ee0c4115a8e274e9","src/zlib/contrib/infback9/infback9.h":"dda2=
302f28157fe43a6143f84802af1740393572c2766559593996fd7a5a3245","src/zlib/con=
trib/infback9/inffix9.h":"84a2ba4727767c18af6505f0e81d9c814489c8b9ed330a25d=
ad433db72997e43","src/zlib/contrib/infback9/inflate9.h":"32a907676cc36e27d0=
fdc0d99adb83a0b23f20ab61896269216d40fecf08d349","src/zlib/contrib/infback9/=
inftree9.c":"0c7f10396703b230c504207fe1595a2f2f8ba9c43158c4bd79d5b22ca36e04=
e0","src/zlib/contrib/infback9/inftree9.h":"8ae61d52e50d2dbdb0378548ecc54fc=
d88f108c8b6fc30562a3ebec1ca6a599e","src/zlib/contrib/inflate86/inffas86.c":=
"6f266f3c7e0faca653256d0189c0f00d7dc0b062d02e25df4e1202e49369595c","src/zli=
b/contrib/inflate86/inffast.S":"70777bd21526680005fc34f086d108af49e2668ad86=
d1749e8e8100a81bfb288","src/zlib/contrib/iostream/test.cpp":"0f3c77e013949e=
b9c91e6b690ea894e19d97944d6b0885b82806fc3ad99680cf","src/zlib/contrib/iostr=
eam/zfstream.cpp":"8ebb9b3d521cc3392953f27658cf1f6dcb763216079f69a1518ec5ca=
0e42a63b","src/zlib/contrib/iostream/zfstream.h":"4369c35e66f63f52ca4a5e175=
9bf720507ccabb8f3f132e2f18e68686c812401","src/zlib/contrib/iostream2/zstrea=
m.h":"d0343e0c57ff58008b6f29643d289c72713aa2d653fe3dcd2e939fc77e7e20b6","sr=
c/zlib/contrib/iostream2/zstream_test.cpp":"f789df183cc58b78751985466380c65=
6308490a9036eb48a7ef79704c3d3f229","src/zlib/contrib/iostream3/README":"43e=
c48ecbd95a8c45db20b107fac73b740bb11595a4737329188f06b713972cc","src/zlib/co=
ntrib/iostream3/TODO":"af5ebc83fb88f69706c8af896733784753dead147687e1c046f4=
10c0997fd88b","src/zlib/contrib/iostream3/test.cc":"8e17fc48dfdbc6e268838b8=
b427491b5843b6d18bc97caa6924de9fad7abe3da","src/zlib/contrib/iostream3/zfst=
ream.cc":"8cdd67ed0b13c192c11e5ea90e9d5782d6627eb303fbc4aa5ebda2531ec00ff8"=
,"src/zlib/contrib/iostream3/zfstream.h":"1bd74778fac45ee090dfc0f182a23e8a8=
49152deb630606884b2635987b357b1","src/zlib/contrib/masmx64/bld_ml64.bat":"1=
c0561908a07ebdff271b12ed757241e1813d3db0f3551501b2595c23f0833aa","src/zlib/=
contrib/masmx64/gvmat64.asm":"390c1e6d63cb615b5ba042842738953f9cdc688b2fe35=
aaca981fd3fae213f3f","src/zlib/contrib/masmx64/inffas8664.c":"f6c585e43e6e5=
24107566b1f10104949d0ef902159ac8203e1d98e50d4bedd62","src/zlib/contrib/masm=
x64/inffasx64.asm":"8448d0041fe6e8f4188fe5916181a1b274c6d35d75cfb28da60cf4f=
1edde44ec","src/zlib/contrib/masmx64/readme.txt":"9bb66b5028100855683853f12=
da0be479c7bccf74365fdbf37da2542edff9927","src/zlib/contrib/masmx86/bld_ml32=
.bat":"b0b05b62715d4a81a7db5b7ca4a372d109ec95634c9d3bef9e0041ff52de22fc","s=
rc/zlib/contrib/masmx86/inffas32.asm":"78d2cc88f8ed0e32ef960efc987c257bc168=
8afe7d031a8ba18761e95a6a7c3f","src/zlib/contrib/masmx86/match686.asm":"9e9b=
ea3b5517b089da7d39caded07982746a33f94f0907ca7e8afefed7be36b6","src/zlib/con=
trib/masmx86/readme.txt":"1f29a04e0227b74e20ba1b7c764b3ca5bf596dd2c06e89bc1=
9a05fb8f9689778","src/zlib/contrib/minizip/Makefile":"087034de3dc0223b29e64=
bb3a4fc3eda7b948e93d2a9ff154aecf9fed2a1eb5b","src/zlib/contrib/minizip/Make=
file.am":"2313a3480a2c3745fa7ce216829cd0367058907d3a0902e5832c66c84a2fdfc6"=
,"src/zlib/contrib/minizip/MiniZip64_Changes.txt":"302c62b328647f5472fb7755=
249a83459be7f8ffb1fae07e8ba318fce8f4126c","src/zlib/contrib/minizip/MiniZip=
64_info.txt":"122719c32ef1763a5f6ba9c8cdefc1d78a76f7156b09e7b6f69b73f968e0d=
ac3","src/zlib/contrib/minizip/configure.ac":"35330dc0c6188127afd339829d91b=
19739d23bf3b7301bfb04f775a6fcbbdad7","src/zlib/contrib/minizip/crypt.h":"8e=
872b60255b8447da99885c7159c2e1f1bb8143523bdbe71784e60f98bfd67b","src/zlib/c=
ontrib/minizip/ioapi.c":"66b39c27042f6ad12cc12efb0c82cdf100c6640b5fa959b8b8=
66e252966113a9","src/zlib/contrib/minizip/ioapi.h":"8655408534b78dc0889a45f=
9359fc6d2d5c8e8d8443b81ede596f954c720ef48","src/zlib/contrib/minizip/iowin3=
2.c":"2c05bc374d3d847c6a9f29eac9d674abba7659d1e91e34e172248fcb5c274d51","sr=
c/zlib/contrib/minizip/iowin32.h":"586f22b9c3c64da253ce2b518e0fad61f19a7b47=
b289fc704cc9708242294c49","src/zlib/contrib/minizip/make_vms.com":"65736d9c=
4888f2373d3db0a13864d150c5040453f5bc2a5c8784379a7ea67590","src/zlib/contrib=
/minizip/miniunz.c":"ced49f20c62536a8ffb270b35cfa4994a1dcdce45f8cf059b941c9=
4ca0022666","src/zlib/contrib/minizip/miniunzip.1":"66d8684392167091ef0fe01=
598d6a0daa26e7e448e2df6c3cb257487735b83f7","src/zlib/contrib/minizip/minizi=
p.1":"5404596e8e5587a52f563906119f32ceee30a6d97a966afa5c7afbe4d373e210","sr=
c/zlib/contrib/minizip/minizip.c":"fdfcf83979ef2324c1455d369e8add8678c80493=
9d412ce53f8b024578ceabad","src/zlib/contrib/minizip/minizip.pc.in":"8b6670b=
42d8e5e519e1cc89db093efc07ba23cb1ddfedd3c93ff2df08c3ce8ac","src/zlib/contri=
b/minizip/mztools.c":"cd887c4af6d20823bd15f24008b10acf01969b4165d7848656bde=
843a92428d7","src/zlib/contrib/minizip/mztools.h":"6f82c52279e8f79165f4446b=
e652e5741a49992ac58632470335aa34c564072a","src/zlib/contrib/minizip/unzip.c=
":"497adf676b1cae2a7afa834e4aba86383f7b697f5fdd03a8179ea9024a431cf9","src/z=
lib/contrib/minizip/unzip.h":"d8dc58fc0121b6a4b98f3028205bb253f956b1ddf791e=
9ced3cf44892502a01f","src/zlib/contrib/minizip/zip.c":"00f403cb7810578b4b26=
87dd55fb132c850c3630fba2f3704a8ab896fcc8209a","src/zlib/contrib/minizip/zip=
.h":"96163fc140e4bf08752e014d20a1eac3f5adcdc408366f6d79c1895f2599cf08","src=
/zlib/contrib/pascal/example.pas":"d842d456ecb6ff80e34cee2da31deb2072cc69ca=
837497bea8b8bee203403474","src/zlib/contrib/pascal/readme.txt":"02f997c3799=
1ddae0cb986039f7b4f6fc816b3fd0ffd332cad371d04c12cf1b9","src/zlib/contrib/pa=
scal/zlibd32.mak":"850e91b6c9ea05de61a411cbda16fa0f10118cd88bb32c4b72269887=
76f8d511","src/zlib/contrib/pascal/zlibpas.pas":"28b90aeeb3da8d1f6a98ab9f5f=
1603d08aba5bfabc50827d3f15e661268a51cf","src/zlib/contrib/puff/Makefile":"d=
9d738030464aaae354196c14fd928adf591832fce7d71ac1977c1d8d4923a4b","src/zlib/=
contrib/puff/README":"aceca4bc1bce7d9445b8bc9b6640c672d95708185f6070d3a3baa=
e7a9d102caf","src/zlib/contrib/puff/puff.c":"6d0eef92e115a42e570b79d8b07a04=
af5ccbd6b3f3fbca9cbc61c49db9c9df43","src/zlib/contrib/puff/puff.h":"969b7be=
2a930db0cdcb19b0e5b29ae6741f5a8f663b6dba6d647e12ec60cfa8e","src/zlib/contri=
b/puff/pufftest.c":"8ee0da78a1221a3c2036e22eed06c2faa27a671a46565a60e10111d=
4ee9c30ee","src/zlib/contrib/puff/zeros.raw":"b7b0887089f7af1f6d1e0b4c0a1e8=
eddd10223b23554299455c6c9be71b653a3","src/zlib/contrib/testzlib/testzlib.c"=
:"c6c37b35c6ecc9986a9041f86d879cc37a9e4d8315af9d725071eb3b2cade0c5","src/zl=
ib/contrib/testzlib/testzlib.txt":"2359bbdc84eb8a04e0f1cd16cd81a2896e957f2a=
d58dab3ca78ef55b7d0dc577","src/zlib/contrib/untgz/Makefile":"8f5ab1564813e0=
91cea8f1bb63da32fd80ac763d029277b0cabf50f60aceefe1","src/zlib/contrib/untgz=
/Makefile.msc":"d0f537de11d9e0e36e2a98b3971c537265f4b533b4c48797094365ad9ae=
8388b","src/zlib/contrib/untgz/untgz.c":"9a12d774301d252dcd38bba07ac369319d=
a4c04c4fef8a50fcbf40aebf29c2a1","src/zlib/contrib/vstudio/readme.txt":"2a9c=
a40b68274f4d37649dfab9e5e867a000883592b4ab8fdaec8425a63052c3","src/zlib/con=
trib/vstudio/vc10/miniunz.vcxproj":"dd607d43c64581172c20c22112821924dfe862f=
56b2e5eb8780bdd0714d9527b","src/zlib/contrib/vstudio/vc10/miniunz.vcxproj.f=
ilters":"c3db9f97952683e688ad83c13bb94c816ac3e6b5f277fdea545b0650c125aa6d",=
"src/zlib/contrib/vstudio/vc10/minizip.vcxproj":"af73f2cf8ae51e65e85342faeb=
40849a2310c97bc77def42b38d7070460a6cf0","src/zlib/contrib/vstudio/vc10/mini=
zip.vcxproj.filters":"83db58d87f5d7ca84b6087aa1f62b15cbc296194c8cf76e47a271=
f9077b4f3bd","src/zlib/contrib/vstudio/vc10/testzlib.vcxproj":"1525ed0893db=
56db44ec68675c8da3c229dc7867166dfc0428816783d16ad43b","src/zlib/contrib/vst=
udio/vc10/testzlib.vcxproj.filters":"d7e04ffa467d417dfa3c0f1c64234cadc84882=
101bbae483f0a0f5d3d6b566a7","src/zlib/contrib/vstudio/vc10/testzlibdll.vcxp=
roj":"3f317d8964f17901c3e68bff5deaec10b6ccc50a572235999e8097292692984c","sr=
c/zlib/contrib/vstudio/vc10/testzlibdll.vcxproj.filters":"682a485f0184aabba=
94e12e1b284499195f37c176d43ecee0484f31e4d636f6f","src/zlib/contrib/vstudio/=
vc10/zlib.rc":"e8b581eb16930e0213d37143a5f17868839b22c758b23981a29484e17093=
c494","src/zlib/contrib/vstudio/vc10/zlibstat.vcxproj":"2a38222d6c034d7e0b8=
43c3f0540dc6c53dd48f942ae29f31620ca0327248c8e","src/zlib/contrib/vstudio/vc=
10/zlibstat.vcxproj.filters":"d9a2c381e51e4d6f027f3517db7db81656e43cec02ed9=
abf267a0fde6f360180","src/zlib/contrib/vstudio/vc10/zlibvc.def":"0124fea28b=
fee49c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/v=
studio/vc10/zlibvc.sln":"e659860f705f31b87ea9139a3cb4ebe1561e120bce495383a5=
4614fc82b49990","src/zlib/contrib/vstudio/vc10/zlibvc.vcxproj":"3108badf710=
e2f4a64eab4e7deae6642fb68cc0d94018e537149f1761e215133","src/zlib/contrib/vs=
tudio/vc10/zlibvc.vcxproj.filters":"58404ba7703c68025bec64b8a17ff1fc7f3a35d=
15d17ae3bcc4fa753f1348425","src/zlib/contrib/vstudio/vc11/miniunz.vcxproj":=
"746e4c11fb8af4bcd6a9d68ba81ed1dc366a5de3bed56b291ee969ad733a7bb0","src/zli=
b/contrib/vstudio/vc11/minizip.vcxproj":"340617cae9cf4fcb003308021d3782ec36=
39e60d62d79a3aafc0a50bb55b061e","src/zlib/contrib/vstudio/vc11/testzlib.vcx=
proj":"589eec6ef6d818564ead938a629fda50abb6cbf8054b9f66ea780765c1a1b3db","s=
rc/zlib/contrib/vstudio/vc11/testzlibdll.vcxproj":"583bdef522b0176829f0d813=
9ea2a88b9cbc14379d1334f3a863989ed3df9b67","src/zlib/contrib/vstudio/vc11/zl=
ib.rc":"e8b581eb16930e0213d37143a5f17868839b22c758b23981a29484e17093c494","=
src/zlib/contrib/vstudio/vc11/zlibstat.vcxproj":"51aa752698d96df065a9ece02e=
293492f681b59a8077f036a5a60367dc621e87","src/zlib/contrib/vstudio/vc11/zlib=
vc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7",=
"src/zlib/contrib/vstudio/vc11/zlibvc.sln":"27389b515997defd080519f95aff87e=
89fcbe8b26d73c5ebb73c544cfef4d60e","src/zlib/contrib/vstudio/vc11/zlibvc.vc=
xproj":"c3dd05e56159aba411475b83656275872524cb3c2fd24d690397d8b634e7e0ed","=
src/zlib/contrib/vstudio/vc12/miniunz.vcxproj":"1494af54570f6e93852932956d4=
9a8c25e57b5abc1ac979945605ca9143df9f8","src/zlib/contrib/vstudio/vc12/miniz=
ip.vcxproj":"9bf128ed6760ca5f019006f178b1c65f4c7ff122dba8d297b64b0eb72feeb1=
20","src/zlib/contrib/vstudio/vc12/testzlib.vcxproj":"367a06caa399bd09f6b9c=
b60706820943dd6a6cf05794275baaf421da9c2a0b7","src/zlib/contrib/vstudio/vc12=
/testzlibdll.vcxproj":"93416510256935d79625dc9fd349cfce6968c062d42a138bec40=
4a26b2f92f5e","src/zlib/contrib/vstudio/vc12/zlib.rc":"92d5d3a4938a63503959=
34153416a7eb74353cdfb2321f45b9ee0b9b16257f39","src/zlib/contrib/vstudio/vc1=
2/zlibstat.vcxproj":"744ff6ac0d4e2dcdf74c7d33b979fbfd2b18550947eb99bfd46dc6=
a73eb1c68d","src/zlib/contrib/vstudio/vc12/zlibvc.def":"0124fea28bfee49c8a1=
9dad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc=
12/zlibvc.sln":"162e0faa80a56d89eea71a0b89377708eec2faa0dc72091cc0abb07fbde=
a49a0","src/zlib/contrib/vstudio/vc12/zlibvc.vcxproj":"754671c59d8996a84624=
1af76082cc8be1aa5fc079eff530d91a9ab15a0bee5b","src/zlib/contrib/vstudio/vc1=
4/miniunz.vcxproj":"0312511d4a30cea979c4e36edf994a537ed8a9d924f6b5c536cbcd0=
94773c11f","src/zlib/contrib/vstudio/vc14/minizip.vcxproj":"9e7bb7a6ac723e4=
b2db900627c366f9bb93a351381995d9c69a50c0126f64233","src/zlib/contrib/vstudi=
o/vc14/testzlib.vcxproj":"c3a9369670af4ebea13d036b452be7418591fbb4c03a67569=
9facac5d8dff5d0","src/zlib/contrib/vstudio/vc14/testzlibdll.vcxproj":"69f54=
4898b4275cd3d8e19b8f1f8cb39c1cb98a30cdb033242e4b94c57bfa150","src/zlib/cont=
rib/vstudio/vc14/zlib.rc":"92d5d3a4938a6350395934153416a7eb74353cdfb2321f45=
b9ee0b9b16257f39","src/zlib/contrib/vstudio/vc14/zlibstat.vcxproj":"9c7c096=
b47e7875412c98525efcd16db62e094215f0011b9cd739a33ab35d48c","src/zlib/contri=
b/vstudio/vc14/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4affda=
5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc14/zlibvc.sln":"47a50bbde8ca=
6336cecd8c0e4b65e515fc46ae84c7b61008ac9864162f777286","src/zlib/contrib/vst=
udio/vc14/zlibvc.vcxproj":"71fb6ef3b079bfdf4182af17e74c3361ead757467edfc591=
d9cbe303ccc47b52","src/zlib/contrib/vstudio/vc9/miniunz.vcproj":"b2b53bd9e7=
04bfbe769b863acdc2a3368692ca149c4b4ed2a0761b0cd16c6726","src/zlib/contrib/v=
studio/vc9/minizip.vcproj":"80a701fb41a61871ce1d25f6b03e571edb6c3abf0aa4537=
5554b6fac52115eb6","src/zlib/contrib/vstudio/vc9/testzlib.vcproj":"05fc5a87=
682b17690d199f424f57f6ad7767b8dabb29a1039bfcb88bca1b302f","src/zlib/contrib=
/vstudio/vc9/testzlibdll.vcproj":"25c1cc5319f1c4b7dbdb595c3cfd6ec3ba217818b=
03b7055ef5ef440b575a43d","src/zlib/contrib/vstudio/vc9/zlib.rc":"e8b581eb16=
930e0213d37143a5f17868839b22c758b23981a29484e17093c494","src/zlib/contrib/v=
studio/vc9/zlibstat.vcproj":"e8653eea37f3bef097eec2caa55e1f698c3c74c959689b=
c4e97568e88d2bbc60","src/zlib/contrib/vstudio/vc9/zlibvc.def":"0124fea28bfe=
e49c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/vst=
udio/vc9/zlibvc.sln":"26e58d4b2cfcd941c367fb2a18537b3b9f002f2ac1278b700ea11=
29c50501452","src/zlib/contrib/vstudio/vc9/zlibvc.vcproj":"86aa6e33db104c0a=
0ed4a9f21f0db8572cc7755170217aef18219fdd74b75e9d","src/zlib/crc32.c":"a04af=
273e83ecc351bf3794974ab2098d8d960df4044b7b44734c41443ee26d0","src/zlib/crc3=
2.h":"407af59d0abfea84a6507c603eb29809411797f98249614fe76a661def783ce1","sr=
c/zlib/deflate.c":"11fd6b0328b65c4ad4b5c204d892a97a9083628a7e77dc47836c8e0c=
799f8da0","src/zlib/deflate.h":"0ca7fb0cf1dd63001c6e9e4ff93c8dbff2fe521199b=
e51a4dda38a11b44919f6","src/zlib/doc/algorithm.txt":"992590931e982c0765286c=
2d83f6e9ff0a95aabb08e28c30c52bae3e8c4bd5ad","src/zlib/doc/rfc1950.txt":"8f0=
475a5c984657bf26277f73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","src/zlib/do=
c/rfc1951.txt":"5ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f3013=
50009","src/zlib/doc/rfc1952.txt":"164ef0897b4cbec63abf1b57f069f3599bd0fb7c=
72c2a4dee21bd7e03ec9af67","src/zlib/doc/txtvsbin.txt":"47c273bb22c9773248d3=
80549a330e5c262266b1292154b0d3014f731cc73f47","src/zlib/examples/README.exa=
mples":"402d72eb69c2e03a25034f4b3c02b110f0f67149ecfa4fa0e4b2bf0ceb49a8b3","=
src/zlib/examples/enough.c":"704e273f65b62c5d2eb06d5bb10c4ccffba56544aa477f=
0e3957e2296c501b78","src/zlib/examples/fitblk.c":"950769163c41aff897ee41746=
a8685d9aa41073b1307f42da19dabe9d3fc8b85","src/zlib/examples/gun.c":"d60ca6e=
b0a3e62ee7fb4a1ab69e8d1525ff06b06ce46889cbdfc13fb8f7534c2","src/zlib/exampl=
es/gzappend.c":"4182d38bf97ffbdf1110df7f65c0e8fab0b28b1ea36ebba8621c14e8e76=
f1caa","src/zlib/examples/gzjoin.c":"90b9d6c39a5fc91cf1cc9b96b025a508a8015d=
c502cd9374c754b44078593f57","src/zlib/examples/gzlog.c":"433d34b71b4e769ece=
1cceb8bd7d902d2c0a24ccd7550ab1856a5ba87f84f835","src/zlib/examples/gzlog.h"=
:"309556e2d7d39250924946b78e2cce0ac927857d6e1a02cab64e438f533c20c3","src/zl=
ib/examples/zlib_how.html":"80fb647be8450bd7a07d8495244e1f061dfbdbdb53172ca=
24e7ffff8ace9c72f","src/zlib/examples/zpipe.c":"68140a82582ede938159630bca0=
fb13a93b4bf1cb2e85b08943c26242cf8f3a6","src/zlib/examples/zran.c":"840ebeb0=
58cd0ca9e92dcb1db665932462a4695fc649b34e865b8d1ad7c5bf77","src/zlib/gzclose=
.c":"94446cf8cde67c30e64d0a335b0c941fd3fbad2e77f30180d12e61f9c2a5a6b8","src=
/zlib/gzguts.h":"6a54a06d269245d73201e76280c0f11c282dc6ec51729ccd9051fe6c99=
07e851","src/zlib/gzlib.c":"5daf11e44149e0aba2956d35f73f04f35dca99c3dfa43f5=
ad43ec20b336e4a1b","src/zlib/gzread.c":"6f928512cb1792cfeab31a51ff0b211814d=
2e455bc75290eb31079dc1e5ad2ec","src/zlib/gzwrite.c":"ba3b7b7ad2ff7ef0c19319=
b8408c333491a4cd495da55d0b156bc73d9ddb4df4","src/zlib/infback.c":"abe44873b=
5af2ea68ea1d281d915b2800f1832f846d2c05442a4711adbe6f269","src/zlib/inffast.=
c":"4d496ab2a3d29df5fadc3dbff6067e039806aaceae6cfcd09ea77d46c2b848fd","src/=
zlib/inffast.h":"7d8c1c873ce9bc346ad6005bb9d75cce5c6352aaf7395385be216a9452=
a34908","src/zlib/inffixed.h":"237ba710f090e432b62ebf963bee8b302867e9691406=
b2d3f8ee89ee7bfef9b0","src/zlib/inflate.c":"8b6c599c3563c14c447c47db0d7dc9a=
16e8c246a078ec95a169ddcebaaebd811","src/zlib/inflate.h":"8ec9ac297790276f7e=
46a961d4c6f9f944fb1dec92401339ec2666973cc5983c","src/zlib/inftrees.c":"1960=
ca67384376f65b6ce8c08fdb501f8eb33923e11ef5f61a855708c6cb0a8a","src/zlib/inf=
trees.h":"c510b36402784b1f898be3b049b923469aa92701de2d9195aed19f6b65c0dce2"=
,"src/zlib/make_vms.com":"3064eb153a7684115f1494364f80759bc5a2c227799fdf08d=
f7b9e6e50884720","src/zlib/msdos/Makefile.bor":"292ab363f7ffbc4ae84d37cd9bd=
ffd2dac1003bee52d223a8489844870f20702","src/zlib/msdos/Makefile.dj2":"92084=
50c2ae6dcbfcc25560b5b9ca763f461e7246e37b0552474edf8fa898906","src/zlib/msdo=
s/Makefile.emx":"c749d6ec7f88e8e639d4f03bdbdcbbe9d1c304210be4c4be621ceb2296=
1d3d64","src/zlib/msdos/Makefile.msc":"0e021a6f42212415b060e4ad468eb415d0a8=
c1f343137fb9dff2cb8f9ead3027","src/zlib/msdos/Makefile.tc":"2ae12ee2a3e62f7=
c5a0520d0fbe4adee772bc07fe816002b07ccb43db3daa76a","src/zlib/nintendods/Mak=
efile":"ea5823efe6830132294eddf2f56dbd7db8712244c210bb4968c431b1a91bd066","=
src/zlib/nintendods/README":"e362426c47b39ff6a7d6c75c6660b20abf076cdfa5e1e4=
21716dc629a71aef95","src/zlib/old/Makefile.emx":"d811f032272aae50123a889297=
af3a02fbd60d1e42bbef11466462f627ff7b5b","src/zlib/old/Makefile.riscos":"d1a=
488b160fbfd53272b68a913283a4be08ba9d490796b196dddb2ba535b41e0","src/zlib/ol=
d/README":"551a0f4d91fe0f827a31cbdfbb4a71d1f3dc4d06564d80a3f526b749dd104d11=
","src/zlib/old/descrip.mms":"8ff08c35c056df9c986f23c09cf8936db63ccf12c3c42=
f7d18a48b36f060cff7","src/zlib/old/os2/Makefile.os2":"6ad247c00f00ff42fd2d6=
2555e86251cef06e4079378241b5f320c227507d51d","src/zlib/old/os2/zlib.def":"e=
a9c61876d2e20b67ef2d9495991a32798eb40d13ede95859a2f4f03b65b9b61","src/zlib/=
old/visual-basic.txt":"1727650acbde9a9e6aec9438896377e46a12699cca5d46c5399c=
ef524dedc614","src/zlib/os400/README400":"6f95a1beb0fbf943a3312eaa3dd2c279f=
1cef93062bebbff63dd37ac9e2aa8d6","src/zlib/os400/bndsrc":"cfe00b1528d5c2781=
3cd6b1ad7aa34b493fd63d615623fb21fd1a7bf99d2255e","src/zlib/os400/make.sh":"=
143394d1e3876c61c29078c0e47310e726e1f5bd42739fe92df9ece65711655f","src/zlib=
/os400/zlib.inc":"c501c522185ba1f0506caf90d72f1088b34b2addc169471e949e443ab=
65e8a75","src/zlib/qnx/package.qpg":"90b5c8364d9dc5ef67405b352c19710ebad290=
5f3f20b9e56ded74661f96743b","src/zlib/test/example.c":"520799662a8286725540=
d6d5a356efe6f595618e5fe2e591972491d719bd99aa","src/zlib/test/infcover.c":"f=
654f3fcc74b33bd95cda63d13fe0ce589bcfe965544e0c17ee597d75efbd090","src/zlib/=
test/minigzip.c":"91089b21e692797bb6208b2b45eeb90f5f1f1e4f6b67b99dea5676f51=
b811193","src/zlib/treebuild.xml":"d816c764c8ec2d5b2ebfa7f053f747097926c13f=
ce7fa8628c5d14c991411421","src/zlib/trees.c":"f2a5f949ea70dde7c23a54c793aee=
d630a03df4bb72417cd3aa008000c44699b","src/zlib/trees.h":"bb0a9d3ca88ee00c81=
adb7c636e73b97085f6ef1b52d6d58edbe2b6dc3adeb4d","src/zlib/uncompr.c":"31922=
aa982ee12fd28d1ce5fe6a94a3f07c2a941c821b566a881ca21845cdfaf","src/zlib/watc=
om/watcom_f.mak":"7e039b912f9cffaa40835281430bb284fa9042b0a0d12f6b34700a06b=
ca6576e","src/zlib/watcom/watcom_l.mak":"d11b4064604a034725860e63e3f6d34705=
6372e4b1675b183e20a93533b20cc9","src/zlib/win32/DLL_FAQ.txt":"9e00778319381=
e6275691dd3a89410c99065b8c0c5db96473abe8c859cbdefd8","src/zlib/win32/Makefi=
le.bor":"e878fed2313417db085fea621c110889f6a32233b5b6db46e3c4e824c1d0ed6b",=
"src/zlib/win32/Makefile.gcc":"ea8feddce7b9707253b9bf86623cf7ebe5294d7aea2b=
3b0b1b1c1b8cfd73009d","src/zlib/win32/Makefile.msc":"7c495d63c5afea1d77d162=
a41b73bab89cee952c12e4647e9684a7ac79bfc3f5","src/zlib/win32/README-WIN32.tx=
t":"b71f1f4e4760812c3a11b2bae6f40d1066741a90e6646010a32ce50a0e348cde","src/=
zlib/win32/VisualC.txt":"9ec0babd46eaa012371dee2d3a8a55d9c7130f7895512c3371=
c737e4a7f6a997","src/zlib/win32/zlib.def":"24fa6dd00f3f4c0d14507a03ddbfa427=
07a04e3901bb9ff6f90096037a75185a","src/zlib/win32/zlib1.rc":"8fc5f2b5abee40=
ad66e6d6cfc9f926c2f446e13a7c9ee7df8bf58a266d8cade5","src/zlib/zconf.h":"9c0=
087f31cd45fe4bfa0ca79b51df2c69d67c44f2fbb2223d7cf9ab8d971c360","src/zlib/zc=
onf.h.cmakein":"d740b750e9c98e6a4b4529cc2a857a3fa8001514b1ce91e0e1d9d293652=
bf388","src/zlib/zconf.h.in":"9c0087f31cd45fe4bfa0ca79b51df2c69d67c44f2fbb2=
223d7cf9ab8d971c360","src/zlib/zlib.3":"5abef003e545566e5599e5ab2e7528e978b=
e59d54546b19d763d062f7a69bac7","src/zlib/zlib.3.pdf":"7f0f633641d782e360eff=
9fe831716c5767faf1000e38382a8a8c65b0b67f374","src/zlib/zlib.h":"4ddc82b4af9=
31ab55f44d977bde81bfbc4151b5dcdccc03142831a301b5ec3c8","src/zlib/zlib.map":=
"7eb1070ba6bf12e6895e5da06b84a92af683827587afaa72bdd45e80b9d8e4e9","src/zli=
b/zlib.pc.cmakein":"2f1d0b18ce37c2af415a469857f02aee2c41a58877aff21d29e9c6d=
b32b55cb7","src/zlib/zlib.pc.in":"04c01cc2e1a0ed123518b5855f585c93a24526dd8=
8982c414111ea1fc9f07997","src/zlib/zlib2ansi":"d316e3e79054f5f9fe921d35f4bb=
f4bf0a37b859d29d2b34ae4d7d92afc3e55c","src/zlib/zutil.c":"f7fdc9ef326a2683e=
b33c794face54e83c751ec17f3d1ba581847a62af36ddcd","src/zlib/zutil.h":"9a63f6=
690fac1620aa3cecee5752af618806da438a256b4a047fbcd289cac159"},"package":"970=
2761c3935f8cc2f101793272e202c72b99da8f4224a19ddcf1279a6450bbf"}
> > diff --git a/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb b/meta/reci=
pes-devtools/rust/libstd-rs_1.71.0.bb
> > similarity index 87%
> > rename from meta/recipes-devtools/rust/libstd-rs_1.70.0.bb
> > rename to meta/recipes-devtools/rust/libstd-rs_1.71.0.bb
> > index f23db797333e..8076dce409e4 100644
> > --- a/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb
> > +++ b/meta/recipes-devtools/rust/libstd-rs_1.71.0.bb
> > @@ -6,10 +6,11 @@ LIC_FILES_CHKSUM =3D "file://../../COPYRIGHT;md5=3Dc2=
cccf560306876da3913d79062a54b9"
> >
> >  require rust-source.inc
> >
> > -# Building with library/std omits proc_macro from the sysroot. Using
> > -# library/test causes that to be installed which then allows cargo to
> > -# build (https://github.com/meta-rust/meta-rust/issues/266)
> > -S =3D "${RUSTSRC}/library/test"
> > +# The dummy crate named `sysroot` represent the standard library targe=
t.
> > +#
> > +# See fd4c81f4c19e ("Add a `sysroot` crate to represent the standard l=
ibrary crates")
> > +# https://github.com/rust-lang/rust/pull/108865/
> > +S =3D "${RUSTSRC}/library/sysroot"
> >
> >  RUSTLIB_DEP =3D ""
> >  inherit cargo
> > diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.70.0.bb b=
/meta/recipes-devtools/rust/rust-cross-canadian_1.71.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/rust-cross-canadian_1.70.0.bb
> > rename to meta/recipes-devtools/rust/rust-cross-canadian_1.71.0.bb
> > diff --git a/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb b/meta/reci=
pes-devtools/rust/rust-llvm_1.71.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
> > rename to meta/recipes-devtools/rust/rust-llvm_1.71.0.bb
> > diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipe=
s-devtools/rust/rust-snapshot.inc
> > index e31a699d2e0e..020528918072 100644
> > --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> > +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> > @@ -4,51 +4,51 @@
> >  ## The exact (previous) version that has been used is specified in the=
 source tarball.
> >  ## The version is replicated here.
> >
> > -SNAPSHOT_VERSION =3D "1.69.0"
> > +SNAPSHOT_VERSION =3D "1.70.0"
> >
> > -SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "b0ffb368d4e66a5808f9665=
9cc598030761cb06966ae8d5299596b14fbc09364"
> > -SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "c3c5346b1e95ea9bd806=
b0dd9ff9aa618976fb38f4f3a615af4964bb4dd15633"
> > -SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "d14166fa0b2832dd87b3f35=
c08d0bc829f83aa01a539b45df3d923469ee119be"
> > +SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "8fd2d9806f0601feab1485f=
79e46d1441af2158c68abf56788ff355d5c6b4ab5"
> > +SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "966e85187b6b76dc520b=
23aadc886c5fe54b209a21c68f959ff00ef8542b7f9f"
> > +SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "71698cf444eef74050db821=
dc4df996c0f268615230099cde836e685e5b5465d"
> >
> > -SRC_URI[cargo-snapshot-i686.sha256sum] =3D "4c9b1b2fb692bb0c81e524df63=
68723f061c8bb0d21a1f487eb8e5c2bdf323ab"
> > -SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "bef330af5bfb381a0134918=
6e05402983495a3e2d4d1c35723a8443039d19a2d"
> > -SRC_URI[rustc-snapshot-i686.sha256sum] =3D "788ff61555857680d5ea7cf760=
23f74a7f4820dd1c26abf76536561d4de3cbe6"
> > +SRC_URI[cargo-snapshot-i686.sha256sum] =3D "5d20e9b8e56f641c3ef4aef965=
563806aa220044397485ec56f784657451a329"
> > +SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "0e5543c35196ca5b08f1b7e=
49fa3f3b671444d75648504cdbcfd854e2e7efd2d"
> > +SRC_URI[rustc-snapshot-i686.sha256sum] =3D "f89c90f80864f68e42b70d9c14=
984195629ed9894bb5cfe6c8a0f1140f7816ff"
> >
> > -SRC_URI[cargo-snapshot-mips.sha256sum] =3D "bdaef2f95b0485dc2a5cde74c0=
8bd269174bbbb553226c5b5d2287e52841b061"
> > -SRC_URI[rust-std-snapshot-mips.sha256sum] =3D "89849b93af9d4922554c938=
bc1c7641498d13c3a8b2b464f3bb7a060eae7a580"
> > -SRC_URI[rustc-snapshot-mips.sha256sum] =3D "ef17b364df355f7322c1fdd3b4=
cc4296d2d5d489b58fdd4b12374a1f2975a455"
> > +SRC_URI[cargo-snapshot-mips.sha256sum] =3D "a272a2a34f03a89e1bc89d9bb1=
1ec0dee08428f43b5103785a587091b3911c60"
> > +SRC_URI[rust-std-snapshot-mips.sha256sum] =3D "0cd85a53e328b1c445a8ec1=
3af87f74280c1d344744076b102227f626456caec"
> > +SRC_URI[rustc-snapshot-mips.sha256sum] =3D "c1f51717bcec5a9c799d57d8c8=
0eff7760c11fc5af383700fb22c3508dd9450e"
> >
> > -SRC_URI[cargo-snapshot-mipsel.sha256sum] =3D "df114ac589fb50fcc3027e26=
c6e201fc530aadef1bcc8f6396c761a457ba7bbb"
> > -SRC_URI[rust-std-snapshot-mipsel.sha256sum] =3D "22bb266cf4e6da4d68671=
44873579b0da47e59c8ec9cb1a329ee8a7f418e8ee3"
> > -SRC_URI[rustc-snapshot-mipsel.sha256sum] =3D "9df4110f716a309323a77695=
2fcf0dccaae878e7abf0d148c14a2a03c5170850"
> > +SRC_URI[cargo-snapshot-mipsel.sha256sum] =3D "25d2aaad531403359c60ed30=
35005db782ba041549fdb60d3ef1a5b5a04b2970"
> > +SRC_URI[rust-std-snapshot-mipsel.sha256sum] =3D "58bf8a6407d92cd478699=
1f1cbdec7380001e07c057c3a8946c2e54593bb7f8c"
> > +SRC_URI[rustc-snapshot-mipsel.sha256sum] =3D "0a6cf0eef9f1b67415ca5bbd=
e1832cd3cd79560762251f3fb1b6f317ed5109bd"
> >
> > -SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "26c774db5e21ddf66107b67=
7d5c6612d50611186feaa68ff11c34a61e4d5a57e"
> > -SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "6303fc2be557467af0f1=
ff9cc756fd14ae2b9db7f17f42a1d2238ed934351e56"
> > -SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "716e790b7658206c59dc801=
9c1b603f230c5ce945229463367fade862cea60b9"
> > +SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "314ed27bbf7eed16f6ac009=
2b076a82782630c65927a241db921d1eff8b04759"
> > +SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "101f358b08381b9c37c2=
f061bac1ff3e60c6036be20059c451f322a55f72376b"
> > +SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "4e4fe3a8b2c0ea1f82e99a3=
0c193b848464b7ac1ed802fddc100c11814a7b2ba"
> >
> > -SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "160692a0fc5fe1b48b617=
e063c6ce1d4546e108b32c0049dbde95602a30af133"
> > -SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "6a4b8b5307141c8207=
ed67d4fbaf9345c42fb3662e389b9dd3d9a4086c1b6efe"
> > -SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "313d0944a1fc41c1c5ce0=
a054b3cebccd6f471ce8e8272e5e68f36b8d08e5bb1"
> > +SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "ccb5b4c03f4d359cbeb17=
39ba27b725b0fc9d0d55b22837b0d3904e778a7fdc9"
> > +SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "468672f84e5b140269=
e188b836ec82494d65c18bda8b7cf1f9bf6fce19f222ab"
> > +SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "7891593a85ba231ca9150=
5720a3535e9cff22700ee1f3e122bc33a5f10ddf705"
> >
> > -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "9a3fe155d763b382ea1=
8753133cb0e2186993e2850568134e2f7e468f2d07197"
> > -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "c44bcf91a9d13412=
a59ba75e7f8bd14c7f60d44cdb7b21916e502c90b4b378ce"
> > -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "1781b5be30fa4fadf76=
08cc9cd3a2de93b3671a09adfa98ae4d975f789ba2275"
> > +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "5f1751ab8d44a9c9e08=
3d32a8039980d699a1224654e3f5aa0dfffbc4407f1c0"
> > +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "bbd882f9ec7f01a7=
32ecc60cf50b7d8a10cd52c3de41c205f62938b6dc2b4dbc"
> > +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "7152b111cf91a2cfa1e=
7beb51d3c737561095ebdf75ec7e032ab1118639ea4ca"
> >
> > -SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "9bc29f493c353313b9682=
43fbdf5147c9ca401f7f8205aed63f180b5757161e2"
> > -SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "8c32a848e2688b2900=
c3e073da8814ce5649ce6e0362be30d53517d7a9ef21ff"
> > -SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "03606f1ad3fd196e73e0d=
255ab6342e4e8fef2edaa1afcc577411aa8a68f0133"
> > +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "55c3a5c06b14c954df531=
8073c38a5b4b0ace3f9a32a24f0ef5514941f7c9502"
> > +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "cdecf32e245898306a=
27a0b164451b2ee9a2122176ce3a65f2ec73c200986dc3"
> > +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "7fa4de4b7f8ab8b23a0f2=
ef3dc4886658d3bf90a97f6b215146b75b445a6131b"
> >
> > -SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "812907846a454a182b05eab76=
658b49eabd8d06d2b5e8df56f29d73971f91b03"
> > -SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "5c98653199b89bff6f368b=
ed61fca7860f7179364ce9e9474c90af38e2629baf"
> > -SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "3cef208c0761bc83d156a14a5=
a94821cc9421772f0f376ea54765a6d00842b21"
> > +SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "dc4104e9e4b82dff14ffb2023=
3d412ff57cea27e7bb2064b6a7e660fee6d2c4d"
> > +SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "7084afbe9fb1a0e8a0c3e7=
60f45475ebba400b72030ae8359bdccef67cb48992"
> > +SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "2c8421d95d575d33545b969ed=
5d200bbcbc69a2ae80d0ffeba4c516fc8a91356"
> >
> > -SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "336eeabf231a7665c26c127a=
37b8aefffe28cb087c5c8d4ba0460419f5f8eff2"
> > -SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "4c95739e6f0f1d4defd93=
7f6d60360b566e051dfb2fa71879d0f9751392f3709"
> > -SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "70e97ab5b9600328b977268f=
c92ca4aa53064e4e97468df35215d4396e509279"
> > +SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "650e7a890a52869cd14e2305=
652bff775aec7fc2cf47fc62cf4a89ff07242333"
> > +SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "0c0129717da1e27ccf2c5=
6da950d2fe56973f71beec9e80ae6904b282d2f0ee9"
> > +SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "7d891d3e9bc4f1151545c83c=
be3bc6af9ed234388c45ca2e19641262f48615e2"
> >
> > -SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "a8125d72e06f2d866472a7a=
ca3bd20a247160171d23a75c4207761a05e00ed5b"
> > +SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "f52e3ac35157e90f86e5ca6=
c177a43774425c24a51b15655ed61f6209c7db6f0"
> >
> > -SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "7d50ff8499d8925ea973=
aa659e1a88190547615b3cfecb79e776ef8de953b755"
> > +SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "b06933f6f94cd30e1c24=
15b37db97a94533a727aa5d32a34ee80c6742ee418d2"
> >
> >  SRC_URI +=3D " \
> >      ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-s=
td-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
> > diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-=
devtools/rust/rust-source.inc
> > index a0a788f3601b..1c83cbf7d06d 100644
> > --- a/meta/recipes-devtools/rust/rust-source.inc
> > +++ b/meta/recipes-devtools/rust/rust-source.inc
> > @@ -2,12 +2,11 @@ RUST_VERSION ?=3D "${@d.getVar('PV').split('-')[0]}"
> >
> >  SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-=
src.tar.xz;name=3Drust \
> >              file://hardcodepaths.patch;patchdir=3D${RUSTSRC} \
> > -            file://getrandom-open64.patch;patchdir=3D${RUSTSRC} \
> >              file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patc=
hdir=3D${RUSTSRC} \
> >              file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
> >              file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.pat=
ch;patchdir=3D${RUSTSRC} \
> >  "
> > -SRC_URI[rust.sha256sum] =3D "bb8e9c564566b2d3228d95de9063a9254182446a1=
61353f1d843bfbaf5c34639"
> > +SRC_URI[rust.sha256sum] =3D "5814699031aafdcc2e2f71fc9b389678cd7042350=
d1583da061463d8e88681c7"
> >
> >  RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
> >
> > diff --git a/meta/recipes-devtools/rust/rust_1.70.0.bb b/meta/recipes-d=
evtools/rust/rust_1.71.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/rust_1.70.0.bb
> > rename to meta/recipes-devtools/rust/rust_1.71.0.bb
> > --
> > 2.39.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#184261): https://lists.openembedded.org/g/openembed=
ded-core/message/184261
> > Mute This Topic: https://lists.openembedded.org/mt/100140937/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
Alex Kiernan

