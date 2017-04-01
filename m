Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 19DC371C71;
	Sat,  1 Apr 2017 06:45:06 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id o81so12381740wmb.1;
	Fri, 31 Mar 2017 23:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=r2/S/fSVRhv4KpU8eIA0Wg66cSiDl3K/8kJ+KhC+SkM=;
	b=pLyMvdsKXbJb2d6bq7zvSn5BxI9vLMbY0XOX+ufV17Ae43X/HJXhWgeiNZFgZnYizR
	S8vKBPTfPl0cH1WSbkvD+iCSBn52a8X3mCdMeffWNUe7c8TpgzAuCxLU4ldzmBgdiiZt
	5n9+j8skXYFnm4hT5NBHMCf1j0oFiQkcwJBc5juwdAoi6OrOKG5UP8aeWIBDuw1GJULb
	05I0f+iJpsFtLzaRXjusani+eBSigw8yA4HTeEdGxCHs4OCfxFO2paTjqLCsOg2o37ei
	1SGsGpG3Xw5iwjlD4i0//A35aQIyeTStS265MSxDUCf8z+uBuy1s1E2Fp36HaWk4836N
	5G1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=r2/S/fSVRhv4KpU8eIA0Wg66cSiDl3K/8kJ+KhC+SkM=;
	b=SmradNttdkqmxtrPBmLUiV7MS6K1PbMCKhhlfV9B5sr/PbEqMz80pd+Bf8xpZyDLmW
	YTnSJcotSADN/G2cKzNfwm2utAi5pj/nPfGmCfk1jCTNnjhuqcCEmwCKcz9RvEaH13uw
	kBsesfAIhY9YvGRTgCtBJCQkhdG8CT7AjBTQXvHaYNWS/edO6ldYpkAWFwmRC/U1DF85
	WBu7Mc5zTOMC3YjXS71FgwIqItDJ9slC9g7yqJGFpjCR1eA9+EY+nlccfwcIiRw5OsDo
	Vu/9XdgCgzfk80sdLbY45/iwyySOE8QbEmTqcI4iNOjFA5zUTNUGUxFUYh1uyVn3+h+y
	pLDg==
X-Gm-Message-State: AFeK/H3S3gPe1w1gcX3UFJ3tyfHvLq0kPVlPcY0tWpghI18R3dsN1Cdz
	RcW/Ful6tU8IjNEJ
X-Received: by 10.28.139.134 with SMTP id n128mr1104658wmd.132.1491029107349; 
	Fri, 31 Mar 2017 23:45:07 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	t68sm9410895wrc.55.2017.03.31.23.45.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 31 Mar 2017 23:45:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 1 Apr 2017 08:45:06 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170401064506.GB3897@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: State of bitbake world, Failed tasks 2017-03-30
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
X-List-Received-Date: Sat, 01 Apr 2017 06:45:07 -0000
X-Groupsio-MsgNum: 95654
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline

--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


opencv issue is fixed by removing one of pending master-next changes:
gflags: correct S and update library install directory

and ovmf was fixed in newer oe-core, so next report should be clean, unless
one of 50+ new changes break more stuff.

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
||2017-03-30	||1	||2	||2	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||1		||0		||0		||12		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-03-30 =3D=3D

INFO: jenkins-job.sh-1.8.19 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170331_204116.log

=3D=3D=3D common (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/opencv/opencv_3.2.bb:do_con=
figure

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_compile

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (5) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170330_025101.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/35115/
|-
|| qemux86 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170330_024616.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/35130/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170330_063010.log/ || http://errors.yoctoproject.or=
g/Errors/Build/35208/
|}

=3D=3D=3D PNBLACKLISTs (442) =3D=3D=3D

=3D=3D=3D QA issues (13) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||file-rdeps
|-
||0	||host-user-contaminated
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
||12	||version-going-backwards
|-
||1	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170330_054036.log/

No issues detected

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
9215920 main: Improve -v and -D option documentation
not included in master yet:=20
c7be363 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
d68a86d dnf: remove systemd units in nativesdk builds
not included in master yet:=20
4dfe9c0 qemux86: Add identical qemux86copy variant for tests
3922e66 sstate-sysroot-cruft.sh: Extend the whitelist
0a0a528 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
11a6716 buildhistory.bbclass: metadata-revs show repo parent
aed4adf8 metadata-revs: provide more information
efc1cfd report-error: Allow to upload reports automatically
6b52f4f Revert "openssl: Fix build with clang"
64c0a37 Revert "mesa: Contain configure search for llvm"

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
f2dfae5 curlpp: 0.7.3 -> 0.8.1
not included in master yet:=20
cd99d41 dnsmasq: disable the service by default
433ed04 gperftools: fix do_compile failure for qemuppc
99d4ea4 nginx: make user in nginx.conf consistent with the default value
9530df7 rapidjson: Update to 1.1.0 + git
c9efffc libtorrent, rtorrent: Update to latest
18095f4 sgio: Fix missing GNU_HASH errors
7246f84 libmatroska: Fix missing GNU_HASH errors
7bc10f5 smstools3: Fix GNU_HASH errors
3cd99b3 procmail: Fix GNU_HASH errors, pass LDFLAGS
2f26ed1 gradm: Fix GNU_HASH QA errors
1ce4dfb zile: Fix build with musl
9be90ec samsung-soc-utils: Remove -static
dc02354 digitemp: Update past 3.7.1 release
cf6f125 memstat: Fix build with musl
472a76d lvm2: Avoid an unnecessary dependency on bash
31520bf lvm2: libdevicemapper package needs udev rules and dmsetup
380ddf2 lvm2: fix lvm2-native RRECOMMENDS problem
ac7f99b gflags: correct S and update library install directory
c9070de libssh: Force to use gcc toolchain
9274e39 libnice: Upgrade to 0.1.13
83b9800 lio-utils: Fix GNU_HASH QA errors
ae26da7 nginx: set sane defaults for temp directories
f16faf7 nginx: make sure the user is correctly set for the volatile directo=
ries
827359b aufs-utils-native: define CC
40da0d5 fwts: upgrade to 17.03.00 release
d0e8e5c abiword: Mark gconv dependencies only for glibc
6426142 xfce4-mount-plugin: Fix build with musl
4bf0ad2 log4cpp: Upgrade to 1.1.2 rc5
7cfb249 ctdb: Fix build with musl
9fbd923 libndp: Include sys/select.h in ndptool.c
bf2cf44 libedit: Update to 20160618-3.1 release
56a223a python-slip-dbus: Update SRC_URI to github
4996156 alsa-equal: Update SRC_URI to something valid
4f8fb8c libdnet: update SRC_URI
6378e78 glm: Fix rootfs error for glm-dev install
2c52a62 wireless-regdb: fix crda failing from missing pubkey
b3ceca8 ntp: update to 4.2.8.p10
4ab7000 polkit-group-rule.inc: Fix comment typo "polkid" -> "polkitd"
8b8b786 php: fix install failure
f573685 atop: Fix build with musl
816a4d7 hwdata: use github instead of fedorahosted.org
b680012 mailcap: use pagure.org instead of retired fedorahosted.org
fdf73fe libqb: use github.com instead of retired fedorahosted.org
a521f94 libqb: inherit autotools-brokensep
4593be6 ttf-abyssinica: fix SRC_URI
4181594 ttf-liberation-sans-narrow: use pagure.org instead of retired fedor=
ahosted.org
17aebdf vboxguestdrivers: make sure that do_compile fails when some module =
failed to build
9d0363c vboxguestdrivers: upgrade to 5.1.18 to fix compatibility with 4.10 =
kernel
d9b1a54 tcsh, dt: blacklist because tcsh doesn't respect CC variable
007eca4 zile: fix do_install
8f02287 meta-efl: blacklist efl-native and dependent recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
ff073f0 nativesdk-qtbase: pass -no-icu for deterministic builds
not included in master yet:=20
b35dc32 qtbase-native: create empty oe-device-extra.pri
aa45f48 qtwayland: update build without xkbcommon-evdev
a126a5a Revert "qtbase-native: create empty oe-device-extra.pri"

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
4fa2b8b meta-shr, meta-fso: blacklist recipes depending on blacklisted efl-=
native

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWN9MbgAKCRA3VSO3ZXaA
HIRBAJ0RCHqxCaIYWJ90EWRHRa1SASYGigCfTNAvflp1AG4SrOS3jzOjZIyfpxY=
=cMY4
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
