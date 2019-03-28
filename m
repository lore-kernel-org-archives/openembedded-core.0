Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 20F107D162;
	Thu, 28 Mar 2019 05:08:58 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id k2so21723361qtm.1;
	Wed, 27 Mar 2019 22:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=re/rSt3kmqvnoQJPPWQ3yLJOwSzqwyfnaGSPLobpfZA=;
	b=Rj1bKxipHZypbeBKKghsbAG4WeNINOyQQnF8Ba/BSQ4mmvpq0F7OKFlyzQeLw9RcXG
	FIieWiOssFknOMz7cnJ+EBNKFsQE48gdNKrkn7kEOxSAtRgHROrPW84XKnYN6V6Yh6Wy
	rSMvJZPS2VkzmOTerbmHmU/Lr0+VsVIi4QVcZoFwcjZuGHmVh0euUCzzs38SMM9KKZ7c
	2hTyAVVuyEr4kXL9IbdeAVZO0zD2U0iAEmtpVBuvXlchfr90e3fKQIU0GFarqIWfE5Xu
	FIoVn3Ut8i/Xbs6gxaKRIBFGyY22Hu+/2v4+Pt3LW061PaZzwRWZeUi/nqOnGiruM9r0
	N9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=re/rSt3kmqvnoQJPPWQ3yLJOwSzqwyfnaGSPLobpfZA=;
	b=uecppxn8HMJCZEpiM1WlnUrajNVEY+/Bj94g/GjdX1y5of2PL628CAf85TwdKPsIDO
	VmoCfSPP+4G9j1OTwon1brrOR9jX+8L6S/AOwu1M+3Rgm+TTeZlNSaQyZPsn4D/GF2Ei
	HCiS9rph5HZruJQ2XM3lrsATSgEZCG8g/mOZKUxWNfNyXmtMnr8N1Kf/nS5YKMa8Uhkz
	MypfglGy5oD/VX1TmIIfg5TuwrB7UJhOP945x/gAeC4Ypys0bYlAOaVPFchUn3ZHqS3+
	TwV5J4lFzOB+dP3olNNJQJV3EE/V0iIzCpn/ZIJWOaOtzlBY0lRyW8kcjFKb6o3zkwlg
	9+/Q==
X-Gm-Message-State: APjAAAX0cvWF8YABnsRI51iQcPC4/5hVrc1tPyNkURwojiBSREUaulue
	89q7d01Ycsc/gTHl3ltxhtODNKDPAkRHa1b4SqU=
X-Google-Smtp-Source: APXvYqw6E44kKxOPzb2jJzZ6m9f4wIuVTNsgbyE34B7/HYScqdx81qEEaxCZH3grgfiXzYkJ6PyJbfFannq63BX51b0=
X-Received: by 2002:ac8:2f59:: with SMTP id k25mr33374766qta.254.1553749738666;
	Wed, 27 Mar 2019 22:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1so7w4i4Kw-ymWayPx1Z_mmetRKcNeyb9pADFZwDY=jqmw@mail.gmail.com>
	<20190327161754.GD1598@jama> <20190327163507.GE1598@jama>
	<20190327203907.GF1598@jama> <20190327223257.GG1598@jama>
In-Reply-To: <20190327223257.GG1598@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Mar 2019 22:08:32 -0700
Message-ID: <CAMKF1sqyPnVgbDt6yp8w5fAkjj-5S8WudbarJDwpAFXzdtwAog@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: glibc broken when linked with gold Was: [oe] State of OE World, 2019-03-16
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
X-List-Received-Date: Thu, 28 Mar 2019 05:08:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2019 at 3:32 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> On Wed, Mar 27, 2019 at 09:39:07PM +0100, Martin Jansa wrote:
> > On Wed, Mar 27, 2019 at 05:35:07PM +0100, Martin Jansa wrote:
> > > On Wed, Mar 27, 2019 at 05:17:54PM +0100, Martin Jansa wrote:
> > > > On Sun, Mar 17, 2019 at 08:26:37AM -0700, Khem Raj wrote:
> > > > > http://www.openembedded.org/wiki/Bitbake_World_Status
> > > > >
> > > > > =3D=3D Failed tasks 2019-03-16 =3D=3D
> > > > >
> > > > > INFO: jenkins-job.sh-1.8.45 Complete log available at
> > > > > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report=
.20190317_082308.log
> > > > >
> > > > >     * sources/openembedded-core/meta/recipes-gnome/gobject-intros=
pection/gobject-introspection_1.58.3.bb:do_compile
> > > >
> > > > I was hit by this one as well on some arm targets.
> > > >
> > > > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qe=
muarm.20190321_215508.log/bitbake.log
> > > >
> > > > shows that it's actually from qemu-arm segfault inside g-ir-scanner=
-qemuwrapper
> > > >
> > > > | qemu: uncaught target signal 11 (Segmentation fault) - core dumpe=
d
> > > > | /home/jenkins/oe/world/yoe/build/tmpfs/work/armv7vet2hf-neon-yoe-=
linux-gnueabi/gobject-introspection/1.58.3-r0/build/g-ir-scanner-qemuwrappe=
r: line 6:  1959 Segmentation fault      (core dumped) PSEUDO_UNLOAD=3D1 qe=
mu-arm -r 3.2.0 -L /home/jenkins/oe/world/yoe/build/tmpfs/work/armv7vet2hf-=
neon-yoe-linux-gnueabi/gobject-introspection/1.58.3-r0/recipe-sysroot -E LD=
_LIBRARY_PATH=3D$GIR_EXTRA_LIBS_PATH:.libs:/home/jenkins/oe/world/yoe/build=
/tmpfs/work/armv7vet2hf-neon-yoe-linux-gnueabi/gobject-introspection/1.58.3=
-r0/recipe-sysroot//usr/lib:/home/jenkins/oe/world/yoe/build/tmpfs/work/arm=
v7vet2hf-neon-yoe-linux-gnueabi/gobject-introspection/1.58.3-r0/recipe-sysr=
oot//lib "$@"
> > > >
> > > > The interesting part is that this happens only when glibc is built =
with gold enabled.
> > > >
> > > > I've put a bit more details in temporary work-around here:
> > > > https://github.com/shr-distribution/meta-smartphone/commit/8f06eb35=
5ead85464b1a1bbaa82584504df15743
> > > >
> > > > I'm comparing qemuarm glibc build with bfd and gold to see if there=
 is some
> > > > significant difference which might cause this and I plan to flash s=
ome small
> > > > image on my targets to see if libc is broken in runtime as well or =
only when
> > > > running inside qemu-arm.
> > > >
> > > > Is anyone else seeing this as well?
> > >
> > > Checking older world status on the wiki shows that this issue was
> > > introduced somewhere around christmas
> > >
> > > This is last world build before the issue:
> > > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.201=
81219_112425.log
> > > ...
> > > =3D=3D Tested changes (not included in master yet) - openembedded-cor=
e =3D=3D
> > > latest upstream commit:
> > > 14c291e1fb gcc-runtime: Add missing libc dependency
> > > not included in master yet:
> > > 7e2ab991fa python/python3: use cc_basename to replace CC for checking=
 compiler
> > > ced915026d python-native: fix one do_populate_sysroot warning
> > > aee47f3e82 netbase: add entry to /etc/hosts according to /etc/hostnam=
e
> > > a09e2db43a sstate: add support for caching shared workdir tasks
> > > c104a34166 grub2: Fix passing null to printf formats
> > > 6f364ff8c4 gnupg: Upgrade to 2.2.12 release
> > > 0224fec86b glibc: Upgrade towards 2.29 release
> > > 2486349782 gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2=
019
> > > b3ab29bdbb gcc-runtime: Drop building libmpx
> > >
> > > and this is the first which reported qemu-arm segfault:
> > > =3D=3D Tested changes (not included in master yet) - openembedded-cor=
e =3D=3D
> > > latest upstream commit:
> > > 95659bed3f populate_sdk_ext.bbclass: Include site.conf in parsing for=
 contents for local.conf
> > > not included in master yet:
> > > 0c9db0ae7d python/python3: use cc_basename to replace CC for checking=
 compiler
> > > bb3eb6bc41 python-native: fix one do_populate_sysroot warning
> > > 08a205f872 netbase: add entry to /etc/hosts according to /etc/hostnam=
e
> > > b81c8650d0 sstate: add support for caching shared workdir tasks
> > > 702be42dc9 glibc: Remove site_config and glibc-initial
> > > fc230822d8 gcc: Drop gcc-cross-initial and use gcc-cross instead
> > > 8652df3a0d gcc: Drop the -initial versions of the compiler
> > > 0c2f6dfa2f recipes: Drop virtual/libc-for-gcc
> > > c64531600d newlib: Move away from gcc-initial dependency
> > > 0d5fb4428f libssp: Remove dependency on gcc-initial
> > > 7dd8829d3e musl: Move away from gcc-initial dependency
> > > 9abdb4d6ca tcmode-default: Drop pinnings for gcc-initial based recipe=
s
> > > e02724e8f8 base.bbclass, classextend.py: Drop catering to gcc-initial
> > > 7756cb7d17 oeqa/concurrencytest: fix for locating meta-selftest
> > > f4c68c39e7 crosssdk/cross-canadian: Set LIBCOVERRIDE correctly
> > > 6fc9bb5698 glibc: Enable --with-default-link
> > > d4cb282bc6 gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2=
019
> > > 6efe313b46 glibc: Upgrade towards 2.29 release
> > > dac5dc5067 grub2: Fix passing null to printf formats
> > > bb36d9dc8c gnupg: Upgrade to 2.2.12 release
> > > 81059437a5 gnupg: Do not apply -Woverride-init guard for gcc >=3D 9
> > > 6fa05e5ace nfs-utils: Disable format-overflow as Werror
> > > 8fab7b23ef musl: Update to latest master
> > > a5641cac42 libxcrypt: Upgrade to 4.4.2
> > > c90ec03d07 gdb: Backport a fix to build with gcc9
> > > 1adae92573 valgrind: Fix x86_64 build failure with gcc9
> > > 38e9e09104 ffmpeg: Backport patch to fix build with gcc9
> > > 4e1fa57743 binutils: Upgrade to latest on 2.31 release branch
> > > 5cce276d4a binutils: Upgrade to upcoming 2.32 release
> > >
> > > and the changes introduced in oe-core between these are:
> > > docker-shr @ ~/openembedded-core $ git log --oneline 14c291e1fb..9565=
9bed3f
> > > 95659bed3f populate_sdk_ext.bbclass: Include site.conf in parsing for=
 contents for local.conf
> > > 085530e8ff i2c-tools: upgrade 4.0 -> 4.1
> > > 673c2dcf10 common-licenses: update Libpng license text
> > > 099aecfaa3 libpng: upgrade 1.6.35 -> 1.6.36
> > > 6574bb7523 harfbuzz: upgrade 2.1.3 -> 2.2.0
> > > 8286e9d79d sqlite3: upgrade 3.25.3 -> 3.26.0
> > > a33170ff9a libatomic-ops: upgrade 7.6.6 -> 7.6.8
> > > 6a10ff0bcd gsettings-desktop-schemas: upgrade 3.28.0 -> 3.28.1
> > > dd2c4d9d85 eudev: upgrade 3.2.5 -> 3.2.7
> > > 0860216a81 icecc: patchelf is needed by icecc-create-env
> > > d2fcaeb153 icecc: Don't generate recipe-sysroot symlinks at recipe-pa=
rsing time
> > > 4455c46bf7 icecc: Syntax error meant that we weren't waiting for tarb=
all generation
> > > fa6bae80bc icecc: Trivial simplification
> > > 6d6788a3ea icecc: readlink -f on the recipe-sysroot gcc/g++
> > > 1ee90ec89a libxcrypt: Fix nativesdk build with gcc9
> > > 547174fc83 gcc-runtime: Drop building libmpx
> > >
> > > It's possible that it's not caused by one of these oe-core changes, b=
ut one of the pending
> > > yoe changes (like those 2 binutils upgrades) which were merged to oe-=
core in some form a bit
> > > later.
> > >
> > > I'll verify if the issue is reproducible with oe-core 95659bed3f and =
continue the bisect from there.
> >
> > git bisect narrowed it down to these oe-core commits:
> >
> > da527d73f5 oeqa/utils/qemurunner: Print output when failed to login
> > 7bbc453ac2 (refs/bisect/bad) glibc: Enable --with-default-link
> > 5d0307fbef (HEAD) base.bbclass, classextend.py: Drop catering to gcc-in=
itial
> > 5b2fd1c724 tcmode-default: Drop pinnings for gcc-initial based recipes
> > fa47e2e654 musl: Move away from gcc-initial dependency
> > 9dc6fcd492 libssp: Remove dependency on gcc-initial
> > 44539118ce newlib: Move away from gcc-initial dependency
> > 122217b421 recipes: Drop virtual/libc-for-gcc
> > d84971928b gcc: Drop the -initial versions of the compiler
> > 62b7308b8c gcc: Drop gcc-cross-initial and use gcc-cross instead
> > c5df105e75 glibc: Remove site_config and glibc-initial
> > 94bece16c2 crosssdk/cross-canadian: Set LIBCOVERRIDE correctly
> > 56d2493a9a oeqa/concurrencytest: fix for locating meta-selftest
> > 95659bed3f (glibc-95659bed3f, refs/bisect/good-95659bed3f6f3216b346f70c=
fc9ffae9788c0fc1) populate_sdk_ext.bbclass: Include site.conf in parsing fo=
r contents for local.conf
> > 085530e8ff i2c-tools: upgrade 4.0 -> 4.1
> >
> > my guess was the very last commit "glibc: Enable --with-default-link",
> > but unfortunately without this fix I cannot build glibc with gold enabl=
ed.
> >
> > Will compare the glibc build to see is there is something obviously wro=
ng
> > in the output.
>
> I've confirmed that forcing bfd linker in glibc do_compile resolves the
> issue with gobject-introspection (image build still running will try to
> flash it tomorrow).
>
> The simples work-around in oe-core:
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/m=
aster&id=3D054c72716f0648ff2f0770c1010857596442223e
> or as bbappend:
> https://github.com/webOS-ports/meta-webos-ports/commit/020d31892780b69fa6=
4a3a6a146283e831ccd2e9
> this is what I'm testing with now, notice that setting just LDFLAGS
> isn't enough, because LDFLAGS are unset in glibc.do_compile
>
> I don't know if it's worth spending more time trying to get the glibc
> working with gold, it looks like:

i agree, your change to force bfd linker is acceptable approach
please propose it to OE-Core directly.


> http://git.openembedded.org/openembedded-core/commit/?id=3D7bbc453ac2b8d6=
3680855789948a145fc448017f
> resolved the linker script issue (I was seeing the same error with
> oe-core 5d0307fbef just this fix) reported here:
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D24148
>
> but there are other bugs like:
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D10937
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D18103
> e.g. gentoo is also explicitly disabling gold for glibc builds:
> https://github.com/gentoo/gentoo/blob/16e1c37bdc84b2ac5df10511f63e478d8e4=
9435e/sys-libs/glibc/glibc-2.29-r1.ebuild#L767
>
> Can someone confirm that glibc built with gold works for him on arm
> (I haven't seen this on x86, aarch64)? Or should we just force bfd in
> oe-core recipe?
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

