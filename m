Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0A271A3E;
	Wed, 29 Mar 2017 07:23:18 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id l43so4477180wre.1;
	Wed, 29 Mar 2017 00:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=e225eGKgQI4Vjr0wLxIXT2vde0I2tlOABjkqlFurPv4=;
	b=W5/b2Hgvhr/vXEtnhMr5QVUnm5LZSq29FfAMws79uV7If3QvWVQABbhClr306LI1FK
	/lerHUe2AImFx3QJB8rgI4C/nAFAz6OinIOPWBNpoLS15xplSD9uNyq8OKLIk7DaEuhL
	suXBlQhD1hbigEooWv9oq0ORFSzfrMDhOp4bMZYNKfdkjMwD+Q7aEsFf0sC0QeHKMCaD
	8iz0xqh7B/9zyd9D5VWq2atXKvNZktB6Azz5iEhzF7s8jizOcy71ApWjqYC+WswRCCe7
	NlAB0iQaq6jKWpGAva0ihnGHO5X+6h0J7/UPjqqVRGjpRhdk0JWtxLobsrkKMl3LiQjf
	aTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=e225eGKgQI4Vjr0wLxIXT2vde0I2tlOABjkqlFurPv4=;
	b=PbPejgHgA6R+ezSLlyJB3csVs3MVQ/Z8IlLoKZ0rojf+ZfA25Cvh/EnZEPiNwTHXgw
	fK2tttzMG5lM3g1Zo373F7J85barGzH50ujUrtZUVSWFbqDSD0LsAGnW/LuMul/I2ii5
	E1nVQE/S7jGwOXYnVBOepPYw+dacmfTMyvah3yPRYBgpbG+ilIKeUeW4dquKZxEqnKit
	l9ZgYd7yaNfuE3MHdCByTxsWR7mFzMM6bAyfqifzVFBKuHnPjyt3NQQQT4MZPkQQauOO
	qcUW+rBqHAJ4v7XpWt0CRHOq//zpSEmD0pQMc5SQE0ICKByFF1f4DnubkzBryMhrVIh4
	K/CQ==
X-Gm-Message-State: AFeK/H0bZwDs2A6grGIh/gIqBARyduhADxqbjwXaWyJ9KCXu5PKfp408CHk3oWq1GYDznw==
X-Received: by 10.223.170.73 with SMTP id q9mr28647846wrd.13.1490772199268;
	Wed, 29 Mar 2017 00:23:19 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	t85sm6699761wmt.23.2017.03.29.00.23.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 Mar 2017 00:23:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 29 Mar 2017 09:23:16 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170329072316.GA3298@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: State of bitbake world, Failed tasks 2017-03-27
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
X-List-Received-Date: Wed, 29 Mar 2017 07:23:20 -0000
X-Groupsio-MsgNum: 95427
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'6'|Failed depe=
ncencies			 !!|Signatures		  !!colspan=3D'12'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||mi=
n	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||=
version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||u=
nknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	=
||=09
|-
||2017-03-27	||15	||17	||18	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||=
0		||3		||0		||0		||0		||1		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-03-27 =3D=3D

INFO: jenkins-job.sh-1.8.19 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170328_014155.log

=3D=3D=3D common (15) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-multimedia/alsa-equal/alsa-=
equal_0.6.bb:do_fetch
    * meta-openembedded/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.7.bb:d=
o_compile
    * meta-openembedded/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.=
1.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb:do_f=
etch
    * meta-openembedded/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1=
=2E500.bb:do_fetch
    * meta-openembedded/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-s=
ans-narrow_1.07.4.bb:do_fetch
    * meta-openembedded/meta-oe/recipes-support/atop/atop_git.bb:do_fetch
    * meta-openembedded/meta-oe/recipes-support/gpm/gpm_git.bb:do_install
    * meta-openembedded/meta-oe/recipes-support/hwdata/hwdata_0.291.bb:do_f=
etch
    * meta-openembedded/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb:d=
o_fetch
    * meta-openembedded/meta-oe/recipes-support/opencv/opencv_3.2.bb:do_con=
figure
    * meta-openembedded/meta-oe/recipes-support/zile/zile_2.4.11.bb:do_inst=
all
    * meta-openembedded/meta-python/recipes-devtools/python/python-slip-dbu=
s_0.6.1.bb:do_fetch
    * virtual:native:meta-openembedded/meta-efl/recipes-efl/efl/efl_1.15.1.=
bb:do_compile

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestd=
rivers_5.1.14.bb:do_install
    * openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_compile

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:do_co=
mpile

=3D=3D=3D Number of failed tasks (50) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 15	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.world.qemuarm.20170325_211949.log/ || http://errors.yoctoproject.org/Err=
ors/Build/34932/
|-
|| qemux86 	|| 17	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.world.qemux86.20170325_211955.log/ || http://errors.yoctoproject.org/Err=
ors/Build/34933/
|-
|| qemux86_64 	|| 18	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.world.qemux86-64.20170327_003511.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/34986/
|}

=3D=3D=3D PNBLACKLISTs (350) =3D=3D=3D

=3D=3D=3D QA issues (4) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||file-rdeps
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|-
||1	||host-user-contaminated
|-
||3	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170326_203903.log/

No issues detected

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
751b06c bitbake-diffsigs: Add debug support
not included in master yet:=20
b2f45ac world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
552bd78 wic: use kernel_dir to find systemd-efi bootloader
not included in master yet:=20
268177c qemux86: Add identical qemux86copy variant for tests
b77bb05 sstate-sysroot-cruft.sh: Extend the whitelist
d4c27b7 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
a90bb2a buildhistory.bbclass: metadata-revs show repo parent
37e4ad6 metadata-revs: provide more information
82c2609 report-error: Allow to upload reports automatically
886304b Revert "openssl: Fix build with clang"
7524fc7 Revert "mesa: Contain configure search for llvm"

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
f2dfae5 curlpp: 0.7.3 -> 0.8.1
not included in master yet:=20
cd99d41 dnsmasq: disable the service by default
433ed04 gperftools: fix do_compile failure for qemuppc
99d4ea4 nginx: make user in nginx.conf consistent with the default value
3a59904 gpm: Update to use git src uri
a58b5d0 rapidjson: Update to 1.1.0 + git
7358057 libtorrent, rtorrent: Update to latest
97fc925 sgio: Fix missing GNU_HASH errors
50c4c2c libmatroska: Fix missing GNU_HASH errors
effb692 smstools3: Fix GNU_HASH errors
4f1fb1e procmail: Fix GNU_HASH errors, pass LDFLAGS
ba292da gradm: Fix GNU_HASH QA errors
0a41bbd zile: Fix build with musl
b23530b picocom: Upgrade to 2.2
b700371 samsung-soc-utils: Remove -static
e8307ed digitemp: Update past 3.7.1 release
605fb8d memstat: Fix build with musl
db8fd09 libexecinfo: Add recipe
bda7efb lvm2: Avoid an unnecessary dependency on bash
cb96e68 lvm2: libdevicemapper package needs udev rules and dmsetup
74a720c lvm2: fix lvm2-native RRECOMMENDS problem
cf4a857 atop: Fix build with musl
98548d1 gflags: correct S and update library install directory
af20aaa libssh: Force to use gcc toolchain
4b27cca libnice: Upgrade to 0.1.13
dd3f48b lio-utils: Fix GNU_HASH QA errors
4053e7a nginx: set sane defaults for temp directories
499ade1 nginx: make sure the user is correctly set for the volatile directo=
ries
8ae141e aufs-utils-native: define CC
5e944ba fwts: upgrade to 17.03.00 release
e009f03 efl: append -fPIC only for target builds

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
ff073f0 nativesdk-qtbase: pass -no-icu for deterministic builds
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
021a954 chromium-browser: add missing dependency on gperf-native
not included in master yet:=20
a9dd704 chromium: disable generate_character_data for x86

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
4d4ffcb packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
e39c265 android-system-image: fix builds that don't have overlay-libs
not included in master yet:=20

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWNtg4wAKCRA3VSO3ZXaA
HPqqAJ44sogGNrC2Bnfzuza5QWQsM5N3XQCfVVHFZ2snlP2MVN/Lt2a7+uwdaz0=
=NecR
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
