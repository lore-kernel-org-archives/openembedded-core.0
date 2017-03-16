Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6AF88600EA;
	Thu, 16 Mar 2017 23:34:28 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id u132so3797896wmg.0;
	Thu, 16 Mar 2017 16:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=6c3gAR/DtcrNHeX4Ry1qyH0aXL/75buWYYvXWKHlRxU=;
	b=KuggzDIIpOknfEqX6KDx8jgaulp3iQl2YF2YaAJWXtStd3+EFOq0TZ5ZIiF32yKZUz
	0lAEb/iTrDWGv8bP+5o5H4cMyhTNSqYkzrvOMSg08v2rSBLThaodlL3FJ3oy5fPyxQt4
	szaxSLXuWL+jV2mLU701DTQYHQso/Osg0sCFspTDBcvKmY4bNB4QS9nBSG3gEBvwF09G
	eehx7FSDqs0suRyRITZhop6vKvcx+zxetd5uU/JOI6zgumkfpIeyqTDfQ4bty68LdvMg
	xtgmmoRjGSyn7X6x92LAOzZZZc26sFqLKfqzgA7rCw8ok1YsAK6yxVcL5y5dvLgRevbL
	ZyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=6c3gAR/DtcrNHeX4Ry1qyH0aXL/75buWYYvXWKHlRxU=;
	b=OMZU7Y3LyYaMTYYirmhxzbsdO3M2bvJVs+ty91WCD3R9gv5HC9UtyArriGbnePl05T
	FLGOiC8F9WvSIP2PGMBTPe384j+ZUA0g6RPDWv/wu//bwSfzR3M9+z9Piz/MGp6OQsJ0
	ddgvSvofBk8PCPnkI4/j0D3w0IJPM4A/rcCFugDJh3874XXTOTR7DzUj90eAfFiAswD0
	c+1ifSuwqrnFqYqamsdNngFukx9GU4YvBbOPxna+cbC03uVf5rSRcOxLw579ZYwWRZDv
	Xj/2hJZbzi3kW7Fp8NGQM1Gd5JlxXYakFxQ3zqLuk79ue4mx12/HWAOpdhmoj4wfZgHG
	NMaQ==
X-Gm-Message-State: AFeK/H3CoOcx+bEk4vKpjwXAGjg1wDOeC/9vCXTYbcsfr4sb25Wx55rjHM99foREDl3Fgw==
X-Received: by 10.28.156.195 with SMTP id f186mr217982wme.40.1489707269691;
	Thu, 16 Mar 2017 16:34:29 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 36sm7888957wrk.57.2017.03.16.16.34.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Mar 2017 16:34:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 17 Mar 2017 00:34:29 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170316233429.GA3293@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: State of bitbake world, Failed tasks 2017-03-15
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
X-List-Received-Date: Thu, 16 Mar 2017 23:34:30 -0000
X-Groupsio-MsgNum: 94871
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline

--EeQfGwPcQSOJBaQU
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
||2017-03-15	||4	||4	||4	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||4		||0		||0		||0		||2		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-03-15 =3D=3D

INFO: jenkins-job.sh-1.8.19 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170316_132623.log

=3D=3D=3D common (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/devmem2/devmem2.bb:do_patch
    * meta-openembedded/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.=
65.bb:do_configure
    * virtual:native:meta-openembedded/meta-efl/recipes-efl/efl/efl_1.15.1.=
bb:do_compile

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestd=
rivers_5.1.14.bb:do_install

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (12) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170314_100521.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/33915/
|-
|| qemux86 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170314_115504.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/33916/
|-
|| qemux86_64 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170315_125349.log/ || http://errors.yoctoproject.or=
g/Errors/Build/34634/
|}

=3D=3D=3D PNBLACKLISTs (351) =3D=3D=3D

=3D=3D=3D QA issues (6) =3D=3D=3D
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
||2	||host-user-contaminated
|-
||4	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170315_080310.log/

No issues detected

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
e455e40 toaster: resolve missing 'native[sdk]:' prefixes
not included in master yet:=20
7b8d726 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
477805b wic: selftest: account for occasional newline in debugfs file names
not included in master yet:=20
ea4cfd5 qemux86: Add identical qemux86copy variant for tests
2b668d7 sstate-sysroot-cruft.sh: Extend the whitelist
20180be recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
9e09509 buildhistory.bbclass: metadata-revs show repo parent
997fdda metadata-revs: provide more information
b8a5ee2 report-error: Allow to upload reports automatically
9eee58b rm_work: restore old rm_work_all
830f53e Revert "rm_work: restore old rm_work_all"
4126661 Revert "rm_work.bbclass: clean up sooner"
b96ea1d bitbake.conf: Add few more binaries to HOSTTOOLS_NONFATAL
6f9a0ae bitbake.conf: Temporary add few more binaries to HOSTTOOLS_NONFATAL

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
1dff235 vim: add native BBCLASSEXTEND
not included in master yet:=20
0fa3a88 netcat-openbsd: fix implicit dependency on pkg-config
d27cf15 inetutils: Move files only when src !=3D dst.
2889a9e ebtables: Move files only when src !=3D dst.
ec34e51 netcf_git: Check if src !=3D dst while moving files.
0e1b685 dnsmasq: add info for port setting
b80d8ce dnsmasq: disable the service by default
8712656 ptpd: add pkgconfig to inherit
7faad88 samba: update tevent_internal.h
f25452b wireshark: update to 2.2.5
5f24fb9 postfix: remove references to buildmachine paths in target makedefs=
=2Eout
8ed26e0 chrony: fix build failure for arma9
1a6700c libcec: update to version 4.0.1 and provide package for python3 wra=
pper
47f7f79 meson: Update to 0.37.1
14e8457 meson.bbclass: Add support for more standard installation directori=
es
ae60e0d meson.bbclass: Make changes to meson.build files trigger reconfigur=
ation
b2b8e3e meson.bbclass: Support building for native
ea83fbc meson.bbclass: Use the correct C++ compiler when cross compiling
8055f63 lvm2: fix bash depends QA issue
b4173fc python-pyserial: update to version 3.3
135418c fuse: update HOMEPAGE and SRC_URI
2829912 curlpp: update HOMEPAGE and SRC_URI
4902e90 libdnet: update SRC_URI
41a056d cherokee: update SRC_URI
deacf40 lmsensors: update SRC_URI and S
da983d9 recipes: delete obsolete patches
4cae8ae meta: do not prepend/append to BBCLASSEXTEND
a08f230 toybox: Fix configure failure
8cdc920 toybox: Upgrade to 0.7.3
cdf1f00 luajit: test SITEINFO_BITS instead of maintaining a list of 32bit t=
argets
dfca01b acpica: moved to OE-core
493978b devmem2: use different filename to avoid checksum conflicts
735a7b5 vim: Update to 8.0.0427
fe056aa efl: append -fPIC only for target builds
2edb15b scsirastools: add dependency on groff-native
871b5b9 openflow: add dependency on openssl-native
b89e68a lprng: disable clear support

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
9927aac qtbase: PACKAGECONFIG[gtk] change gtk+ -> gtk+3 in dependencies
not included in master yet:=20
4f44a57 packagegroup-qt5-toolchain-target: Add QtSerialBus to meta-toolchai=
n-qt5.
abc89e9 qtbase-native; do not build qdbuscpp2xml and qdbusxml2cpp bootstrap=
ped
bd2258f packagegroup-qt5-toolchain-target: add qtquickcontrols2 package
18603cd qtwebengine: show progress for do_compile

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

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWMshBAAKCRA3VSO3ZXaA
HN8uAJ9qyOLRgwNUIqo286PiI4eBBMOzNwCeOBHlIVZad0UUQFKKvcWnhm01kgk=
=gblk
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
