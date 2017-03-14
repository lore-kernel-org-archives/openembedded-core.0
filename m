Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id C39B062135;
	Tue, 14 Mar 2017 13:30:33 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id n11so63912194wma.0;
	Tue, 14 Mar 2017 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=QKdZjm/4N8e7HkEPjevtME6/jUtRN2mwVUsTivCygdU=;
	b=NGGfzwhi1JOfHXcL0rXUzmEP2PNg2WxZqhxIbL70HJWLfpAKlW5wWQrahrUq8/ExY+
	Ow2mAdilMHjdOP4qyG6J2nJqLvhlX8RL1i/sRl72RusarP0h9toomnxgL8Y8l8oWC79g
	ju6SClD2FoiMUPfPzxBi6R9RqlyFyUcUh8H1zKHPbZMTF5cRdYK4phoIoAC8LschmCS/
	0Mrrqq2JKSMdT8SkhoZzTcS1mLg87+DIoaMI8kh3/GngDqSrJsgtxogvgvC1K2e1JlOK
	eSuYychhEGl9cpL2qSWq450+Wyr500bZpeg8VC2rwySkWz30zyHuRNJWpWCPQ1Rf66zN
	d8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=QKdZjm/4N8e7HkEPjevtME6/jUtRN2mwVUsTivCygdU=;
	b=NDJRotD/1ROtqxjZo1GapMRNIZu7HTK5Q/75JvSxLBLoPSAVoH2G8ikGS++jZPzhV/
	O8MkIstpB4eozoeKFwQ5wjiEYvZU/iHV0wMQypZ88oHZSo1srFNNbCpQHGXeIq/ggHuZ
	8X/sDLUm0gFfThtDt2Y7TAZoon4YWzjy+7Kmz+M5GiIEWXQrnHV4OFMaruSnulWpqWip
	+cTwllDnmFNzNCHLZKYsjqVDIJ7Y7twPP3o27vgm7YE/r0LBixn5FUJI4gW0DvA8gCo6
	T+BK418uP6odx/Cc3rGTPKI8P0q0rwqCqXQIC/s8CR8MmPyEvt2mitP5Gm5LTIEtOjbo
	bd5Q==
X-Gm-Message-State: AFeK/H1LSwHIHEcvI+iWjc/FMe4l6etUtUIM1nxupaEMfaS7D98dpxYYrb0DOCx2sqgCmw==
X-Received: by 10.28.111.136 with SMTP id c8mr14202494wmi.128.1489498233716;
	Tue, 14 Mar 2017 06:30:33 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b13sm15559621wmf.6.2017.03.14.06.30.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Mar 2017 06:30:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 14 Mar 2017 14:30:38 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170314133038.GA3917@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: State of bitbake world, Failed tasks 2017-03-13
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
X-List-Received-Date: Tue, 14 Mar 2017 13:30:34 -0000
X-Groupsio-MsgNum: 94701
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2017 at 07:02:53PM +0100, Martin Jansa wrote:
> This time the results are very inconsistent across different MACHINEs
> because they were using significantly different metadata.
>=20
> qemuarm is oldest 3 from 4 failures were causes by pending meta-oe
> changes which I've removed from master-next before qemux86* builds were
> restarted (after they failed badly few times).
>=20
> qemux86-64 is latest and contains HOSTTOOLS changes from
> oe-core/master-next that's why there is so many failures.
>=20
> From the failures I see following tools which we need to either add
> to HOSTTOOLS or provide with added -native dependency:
> cc      - tcsh                - http://errors.yoctoproject.org/Errors/Det=
ails/135201/
> cc      - u-boot-mkimage      - http://errors.yoctoproject.org/Errors/Det=
ails/135203/
> cc      - toybox              - http://errors.yoctoproject.org/Errors/Det=
ails/135210/
> cc      - yasm                - http://errors.yoctoproject.org/Errors/Det=
ails/135214/
> cpp     - mkelfimage          - http://errors.yoctoproject.org/Errors/Det=
ails/135211/
> clear   - lprng               - http://errors.yoctoproject.org/Errors/Det=
ails/135207/
> gcc-ar  - ovmf                - http://errors.yoctoproject.org/Errors/Det=
ails/135202/
> join    - netcf               - http://errors.yoctoproject.org/Errors/Det=
ails/135208/
> join    - fontforge           - http://errors.yoctoproject.org/Errors/Det=
ails/135209/
> mknod   - initramfs-live-boot - http://errors.yoctoproject.org/Errors/Det=
ails/135213/
> nl      - dash                - http://errors.yoctoproject.org/Errors/Det=
ails/135215/
> nl      - klibc               - http://errors.yoctoproject.org/Errors/Det=
ails/135198/
> openssl - openflow            - http://errors.yoctoproject.org/Errors/Det=
ails/135216/
> readelf - firefox             - http://errors.yoctoproject.org/Errors/Det=
ails/135212/
> size    - iptraf              - http://errors.yoctoproject.org/Errors/Det=
ails/135204/
> yes     - libnet-ssleay-perl  - http://errors.yoctoproject.org/Errors/Det=
ails/135197/
> zcat    - scsirastools        - http://errors.yoctoproject.org/Errors/Det=
ails/135205/
>=20
> Some of these were already merged in newer HOSTTOOLS patch currently
> in oe-core/master:
> mknod cpp readelf split gcc-ar gpg sftp
> and u-boot-mkimage should be fixed in master as well
>=20
> I'll merge most meta-oe changes and retrigger new round of testing,
> next time the failures should be a bit more consistent again.

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
||2017-03-13	||15	||15	||16	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||=
0		||1		||0		||11		||0		||1		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-03-13 =3D=3D

INFO: jenkins-job.sh-1.8.19 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170314_032835.log

=3D=3D=3D common (14) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.b=
b:do_compile
    * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-static-=
utils_2.0.4.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/openflow/openflow=
_git.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/netcf/netcf_git.bb:=
do_configure
    * meta-openembedded/meta-oe/recipes-core/toybox/toybox_0.7.2.bb:do_conf=
igure
    * meta-openembedded/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb:do_=
compile
    * meta-openembedded/meta-oe/recipes-extended/dash/dash_0.5.8.bb:do_comp=
ile
    * meta-openembedded/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb:do_co=
nfigure
    * meta-openembedded/meta-oe/recipes-extended/scsirastools/scsirastools_=
1.6.4.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-graphics/fontforge/fontforge_201610=
12.bb:do_configure
    * meta-openembedded/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.=
65.bb:do_configure
    * virtual:native:meta-openembedded/meta-efl/recipes-efl/efl/efl_1.15.1.=
bb:do_compile
    * virtual:native:meta-openembedded/meta-oe/recipes-graphics/fontforge/f=
ontforge_20161012.bb:do_configure

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestd=
rivers_5.1.14.bb:do_install

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (46) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 15	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.world.qemuarm.20170311_084034.log/ || http://errors.yoctoproject.org/Err=
ors/Build/33704/
|-
|| qemux86 	|| 15	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.world.qemux86.20170312_225130.log/ || http://errors.yoctoproject.org/Err=
ors/Build/33770/
|-
|| qemux86_64 	|| 16	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.world.qemux86-64.20170313_004934.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/33838/
|}

=3D=3D=3D PNBLACKLISTs (351) =3D=3D=3D

=3D=3D=3D QA issues (13) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
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
||11	||file-rdeps
|-
||1	||host-user-contaminated
|-
||1	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170312_065028.log/

No issues detected

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
e455e40 toaster: resolve missing 'native[sdk]:' prefixes
not included in master yet:=20
7b8d726 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
a47e64d libcomps: add a recipe
not included in master yet:=20
4a0c14f qemux86: Add identical qemux86copy variant for tests
18d5bc4 sstate-sysroot-cruft.sh: Extend the whitelist
f1cae36 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
0718d4ee buildhistory.bbclass: metadata-revs show repo parent
7da5b49 metadata-revs: provide more information
dc1795a report-error: Allow to upload reports automatically
b4be26d rm_work: restore old rm_work_all
a486f10 Revert "rm_work: restore old rm_work_all"
11847e4 Revert "rm_work.bbclass: clean up sooner"

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

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWMfwfQAKCRA3VSO3ZXaA
HIhoAKCHHEUmsJyXHfI0Oiy3kWx1qwDboQCfUgKM2Sz/ln/cVZrM8cN/w9e9oCc=
=K8Vv
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
