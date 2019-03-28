Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 969797D088;
	Thu, 28 Mar 2019 14:40:31 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k11so15820667wro.5;
	Thu, 28 Mar 2019 07:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=43FJ++U4EQ1oMy/ZK66TASRIs+qEHOdeQ4/Mz89OyCU=;
	b=e/M4QdbBp98W8VRk8F0lOBzEZRyxGFkawPzf+ZP/DcQIPXe/p0G93Stf+ASeuo21Ld
	tUWhCcowT4CKbLteNWlf+ECeRjErmzCteKWieWTa9ZvspcYQ03WBqxG0yO9TcOgEhrpg
	ZDSVnbKvlhTt7WCYkqShUXj3zW1pvShVaxd432Dj/qhK8ZRA3GdSWKTjXf0c+Yr97WtW
	SdwTQDFgBHH9oe+vK9UO4n/u9hKYJMZaenNtq/L8k0AbX0n4FX5GAWis92Y8bdgKyLk3
	wBVg1WbHQ7MgFxyVBqcM91Rl2aQKJ9f1uguVG9q5sQIZOgu5yt6lhsozLpEh2XjytTBX
	2Yiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=43FJ++U4EQ1oMy/ZK66TASRIs+qEHOdeQ4/Mz89OyCU=;
	b=YbSJh92L1cd+NnoqVVWgduU2KlwVupv2hU2V03oxTEvUdBbTB/jutj0S9mVA6XK/7i
	/5cgkZVCybPg08aXnvYFUthNtypfGrJjY31AXN3lA3ymnsfipdDwCZU7SSTnye4VvEcT
	nEynWTSoYRB93qv/KNOfOn5iRBj8ELrukwtcSwz8+DxkYsSF1cGfzdvCl/cGQ9nhqVR8
	8LRSbLOtPTPpHt9cJT2wv6wUOClV8yi9eq/WV+TeCGsk4wGScwSIUvK7bCET/9uAT42o
	DF0zeJh9OAGe7SiLlli5v3xMFwAxNAT8qvJID5KjwdxAe4EjvfcBpOMmo7LMzY5aps/9
	GvLg==
X-Gm-Message-State: APjAAAU2pQQr5mjeehG4NJL6aCV+PllMFIsXBIyy894dvCP48URnllcD
	vcu2/cdwSLKwtTXpO1MBeHE=
X-Google-Smtp-Source: APXvYqyNHwGj787SAfPUZCAGaxSsvryKLYFz+QayyYJGmF3LEcxzF30EoWp7QvRXPuzxu3FPs7yxBA==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr10859241wrn.109.1553784032181; 
	Thu, 28 Mar 2019 07:40:32 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id u17sm212113wmj.1.2019.03.28.07.40.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Mar 2019 07:40:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 Mar 2019 15:40:33 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190328144033.GA1601@jama>
References: <CAMKF1so7w4i4Kw-ymWayPx1Z_mmetRKcNeyb9pADFZwDY=jqmw@mail.gmail.com>
	<20190327161754.GD1598@jama> <20190327163507.GE1598@jama>
	<20190327203907.GF1598@jama> <20190327223257.GG1598@jama>
	<CAMKF1sqyPnVgbDt6yp8w5fAkjj-5S8WudbarJDwpAFXzdtwAog@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqyPnVgbDt6yp8w5fAkjj-5S8WudbarJDwpAFXzdtwAog@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
X-List-Received-Date: Thu, 28 Mar 2019 14:40:32 -0000
X-Groupsio-MsgNum: 122726
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2019 at 10:08:32PM -0700, Khem Raj wrote:
> On Wed, Mar 27, 2019 at 3:32 PM Martin Jansa <martin.jansa@gmail.com> wro=
te:
> >
> > On Wed, Mar 27, 2019 at 09:39:07PM +0100, Martin Jansa wrote:
> > > On Wed, Mar 27, 2019 at 05:35:07PM +0100, Martin Jansa wrote:
> > > > On Wed, Mar 27, 2019 at 05:17:54PM +0100, Martin Jansa wrote:
> > > > > On Sun, Mar 17, 2019 at 08:26:37AM -0700, Khem Raj wrote:
> > > > > > http://www.openembedded.org/wiki/Bitbake_World_Status
> > > > > >
> > > > > > =3D=3D Failed tasks 2019-03-16 =3D=3D
> > > > > >
> > > > > > INFO: jenkins-job.sh-1.8.45 Complete log available at
> > > > > > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.repo=
rt.20190317_082308.log
> > > > > >
> > > > > >     * sources/openembedded-core/meta/recipes-gnome/gobject-intr=
ospection/gobject-introspection_1.58.3.bb:do_compile
> > > > >
> > > > > I was hit by this one as well on some arm targets.
> > > > >
> > > > > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.=
qemuarm.20190321_215508.log/bitbake.log
> > > > >
> > > > > shows that it's actually from qemu-arm segfault inside g-ir-scann=
er-qemuwrapper
> > > > >
> > > > > | qemu: uncaught target signal 11 (Segmentation fault) - core dum=
ped
> > > > > | /home/jenkins/oe/world/yoe/build/tmpfs/work/armv7vet2hf-neon-yo=
e-linux-gnueabi/gobject-introspection/1.58.3-r0/build/g-ir-scanner-qemuwrap=
per: line 6:  1959 Segmentation fault      (core dumped) PSEUDO_UNLOAD=3D1 =
qemu-arm -r 3.2.0 -L /home/jenkins/oe/world/yoe/build/tmpfs/work/armv7vet2h=
f-neon-yoe-linux-gnueabi/gobject-introspection/1.58.3-r0/recipe-sysroot -E =
LD_LIBRARY_PATH=3D$GIR_EXTRA_LIBS_PATH:.libs:/home/jenkins/oe/world/yoe/bui=
ld/tmpfs/work/armv7vet2hf-neon-yoe-linux-gnueabi/gobject-introspection/1.58=
=2E3-r0/recipe-sysroot//usr/lib:/home/jenkins/oe/world/yoe/build/tmpfs/work=
/armv7vet2hf-neon-yoe-linux-gnueabi/gobject-introspection/1.58.3-r0/recipe-=
sysroot//lib "$@"
> > > > >
> > > > > The interesting part is that this happens only when glibc is buil=
t with gold enabled.
> > > > >
> > > > > I've put a bit more details in temporary work-around here:
> > > > > https://github.com/shr-distribution/meta-smartphone/commit/8f06eb=
355ead85464b1a1bbaa82584504df15743
> > > > >
> > > > > I'm comparing qemuarm glibc build with bfd and gold to see if the=
re is some
> > > > > significant difference which might cause this and I plan to flash=
 some small
> > > > > image on my targets to see if libc is broken in runtime as well o=
r only when
> > > > > running inside qemu-arm.
> > > > >
> > > > > Is anyone else seeing this as well?
> > > >
> > > > Checking older world status on the wiki shows that this issue was
> > > > introduced somewhere around christmas
> > > >
> > > > This is last world build before the issue:
> > > > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.2=
0181219_112425.log
> > > > ...
> > > > =3D=3D Tested changes (not included in master yet) - openembedded-c=
ore =3D=3D
> > > > latest upstream commit:
> > > > 14c291e1fb gcc-runtime: Add missing libc dependency
> > > > not included in master yet:
> > > > 7e2ab991fa python/python3: use cc_basename to replace CC for checki=
ng compiler
> > > > ced915026d python-native: fix one do_populate_sysroot warning
> > > > aee47f3e82 netbase: add entry to /etc/hosts according to /etc/hostn=
ame
> > > > a09e2db43a sstate: add support for caching shared workdir tasks
> > > > c104a34166 grub2: Fix passing null to printf formats
> > > > 6f364ff8c4 gnupg: Upgrade to 2.2.12 release
> > > > 0224fec86b glibc: Upgrade towards 2.29 release
> > > > 2486349782 gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid=
-2019
> > > > b3ab29bdbb gcc-runtime: Drop building libmpx
> > > >
> > > > and this is the first which reported qemu-arm segfault:
> > > > =3D=3D Tested changes (not included in master yet) - openembedded-c=
ore =3D=3D
> > > > latest upstream commit:
> > > > 95659bed3f populate_sdk_ext.bbclass: Include site.conf in parsing f=
or contents for local.conf
> > > > not included in master yet:
> > > > 0c9db0ae7d python/python3: use cc_basename to replace CC for checki=
ng compiler
> > > > bb3eb6bc41 python-native: fix one do_populate_sysroot warning
> > > > 08a205f872 netbase: add entry to /etc/hosts according to /etc/hostn=
ame
> > > > b81c8650d0 sstate: add support for caching shared workdir tasks
> > > > 702be42dc9 glibc: Remove site_config and glibc-initial
> > > > fc230822d8 gcc: Drop gcc-cross-initial and use gcc-cross instead
> > > > 8652df3a0d gcc: Drop the -initial versions of the compiler
> > > > 0c2f6dfa2f recipes: Drop virtual/libc-for-gcc
> > > > c64531600d newlib: Move away from gcc-initial dependency
> > > > 0d5fb4428f libssp: Remove dependency on gcc-initial
> > > > 7dd8829d3e musl: Move away from gcc-initial dependency
> > > > 9abdb4d6ca tcmode-default: Drop pinnings for gcc-initial based reci=
pes
> > > > e02724e8f8 base.bbclass, classextend.py: Drop catering to gcc-initi=
al
> > > > 7756cb7d17 oeqa/concurrencytest: fix for locating meta-selftest
> > > > f4c68c39e7 crosssdk/cross-canadian: Set LIBCOVERRIDE correctly
> > > > 6fc9bb5698 glibc: Enable --with-default-link
> > > > d4cb282bc6 gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid=
-2019
> > > > 6efe313b46 glibc: Upgrade towards 2.29 release
> > > > dac5dc5067 grub2: Fix passing null to printf formats
> > > > bb36d9dc8c gnupg: Upgrade to 2.2.12 release
> > > > 81059437a5 gnupg: Do not apply -Woverride-init guard for gcc >=3D 9
> > > > 6fa05e5ace nfs-utils: Disable format-overflow as Werror
> > > > 8fab7b23ef musl: Update to latest master
> > > > a5641cac42 libxcrypt: Upgrade to 4.4.2
> > > > c90ec03d07 gdb: Backport a fix to build with gcc9
> > > > 1adae92573 valgrind: Fix x86_64 build failure with gcc9
> > > > 38e9e09104 ffmpeg: Backport patch to fix build with gcc9
> > > > 4e1fa57743 binutils: Upgrade to latest on 2.31 release branch
> > > > 5cce276d4a binutils: Upgrade to upcoming 2.32 release
> > > >
> > > > and the changes introduced in oe-core between these are:
> > > > docker-shr @ ~/openembedded-core $ git log --oneline 14c291e1fb..95=
659bed3f
> > > > 95659bed3f populate_sdk_ext.bbclass: Include site.conf in parsing f=
or contents for local.conf
> > > > 085530e8ff i2c-tools: upgrade 4.0 -> 4.1
> > > > 673c2dcf10 common-licenses: update Libpng license text
> > > > 099aecfaa3 libpng: upgrade 1.6.35 -> 1.6.36
> > > > 6574bb7523 harfbuzz: upgrade 2.1.3 -> 2.2.0
> > > > 8286e9d79d sqlite3: upgrade 3.25.3 -> 3.26.0
> > > > a33170ff9a libatomic-ops: upgrade 7.6.6 -> 7.6.8
> > > > 6a10ff0bcd gsettings-desktop-schemas: upgrade 3.28.0 -> 3.28.1
> > > > dd2c4d9d85 eudev: upgrade 3.2.5 -> 3.2.7
> > > > 0860216a81 icecc: patchelf is needed by icecc-create-env
> > > > d2fcaeb153 icecc: Don't generate recipe-sysroot symlinks at recipe-=
parsing time
> > > > 4455c46bf7 icecc: Syntax error meant that we weren't waiting for ta=
rball generation
> > > > fa6bae80bc icecc: Trivial simplification
> > > > 6d6788a3ea icecc: readlink -f on the recipe-sysroot gcc/g++
> > > > 1ee90ec89a libxcrypt: Fix nativesdk build with gcc9
> > > > 547174fc83 gcc-runtime: Drop building libmpx
> > > >
> > > > It's possible that it's not caused by one of these oe-core changes,=
 but one of the pending
> > > > yoe changes (like those 2 binutils upgrades) which were merged to o=
e-core in some form a bit
> > > > later.
> > > >
> > > > I'll verify if the issue is reproducible with oe-core 95659bed3f an=
d continue the bisect from there.
> > >
> > > git bisect narrowed it down to these oe-core commits:
> > >
> > > da527d73f5 oeqa/utils/qemurunner: Print output when failed to login
> > > 7bbc453ac2 (refs/bisect/bad) glibc: Enable --with-default-link
> > > 5d0307fbef (HEAD) base.bbclass, classextend.py: Drop catering to gcc-=
initial
> > > 5b2fd1c724 tcmode-default: Drop pinnings for gcc-initial based recipes
> > > fa47e2e654 musl: Move away from gcc-initial dependency
> > > 9dc6fcd492 libssp: Remove dependency on gcc-initial
> > > 44539118ce newlib: Move away from gcc-initial dependency
> > > 122217b421 recipes: Drop virtual/libc-for-gcc
> > > d84971928b gcc: Drop the -initial versions of the compiler
> > > 62b7308b8c gcc: Drop gcc-cross-initial and use gcc-cross instead
> > > c5df105e75 glibc: Remove site_config and glibc-initial
> > > 94bece16c2 crosssdk/cross-canadian: Set LIBCOVERRIDE correctly
> > > 56d2493a9a oeqa/concurrencytest: fix for locating meta-selftest
> > > 95659bed3f (glibc-95659bed3f, refs/bisect/good-95659bed3f6f3216b346f7=
0cfc9ffae9788c0fc1) populate_sdk_ext.bbclass: Include site.conf in parsing =
for contents for local.conf
> > > 085530e8ff i2c-tools: upgrade 4.0 -> 4.1
> > >
> > > my guess was the very last commit "glibc: Enable --with-default-link",
> > > but unfortunately without this fix I cannot build glibc with gold ena=
bled.
> > >
> > > Will compare the glibc build to see is there is something obviously w=
rong
> > > in the output.
> >
> > I've confirmed that forcing bfd linker in glibc do_compile resolves the
> > issue with gobject-introspection (image build still running will try to
> > flash it tomorrow).
> >
> > The simples work-around in oe-core:
> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa=
/master&id=3D054c72716f0648ff2f0770c1010857596442223e
> > or as bbappend:
> > https://github.com/webOS-ports/meta-webos-ports/commit/020d31892780b69f=
a64a3a6a146283e831ccd2e9

If you need to use this, then add "export" as well which is needed
because of the "unset" in the main recipe (wasn't needed when I had both
these changes included in the build at first).
https://github.com/webOS-ports/meta-webos-ports/commit/0e737ad167a14591e73c=
a3fa47d31108038ec3e2

> > this is what I'm testing with now, notice that setting just LDFLAGS
> > isn't enough, because LDFLAGS are unset in glibc.do_compile
> >
> > I don't know if it's worth spending more time trying to get the glibc
> > working with gold, it looks like:
>=20
> i agree, your change to force bfd linker is acceptable approach
> please propose it to OE-Core directly.

Send for oe-core:
https://patchwork.openembedded.org/patch/159874/
but more information might be needed before it gets applied to oe-core
as discussed with RP. I'll try to get serial cable working on my Nexus 5
to test it there in runtime, but maybe someone could beat me to it with
some more easily hackable 32bit arm board.

>=20
> > http://git.openembedded.org/openembedded-core/commit/?id=3D7bbc453ac2b8=
d63680855789948a145fc448017f
> > resolved the linker script issue (I was seeing the same error with
> > oe-core 5d0307fbef just this fix) reported here:
> > https://sourceware.org/bugzilla/show_bug.cgi?id=3D24148
> >
> > but there are other bugs like:
> > https://sourceware.org/bugzilla/show_bug.cgi?id=3D10937
> > https://sourceware.org/bugzilla/show_bug.cgi?id=3D18103
> > e.g. gentoo is also explicitly disabling gold for glibc builds:
> > https://github.com/gentoo/gentoo/blob/16e1c37bdc84b2ac5df10511f63e478d8=
e49435e/sys-libs/glibc/glibc-2.29-r1.ebuild#L767
> >
> > Can someone confirm that glibc built with gold works for him on arm
> > (I haven't seen this on x86, aarch64)? Or should we just force bfd in
> > oe-core recipe?
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXJzc4AAKCRA3VSO3ZXaA
HHznAKCCSIszhnXP/BZQ/fzYQmR+EPRlXgCgokeCie55UjJmkBsd1RFMKBO7eFU=
=1oTn
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
