Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9366C73070;
	Thu, 23 Feb 2017 18:35:00 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id u47so420787wrb.0;
	Thu, 23 Feb 2017 10:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=iK9CBf80LzxVLJEiBIr6gMU6B3T4YyIx03M0TOV7h/k=;
	b=rO1KPCM/ylibGITukrG7wZ/mSmliVlM5Ro+g2Ikd+TT5pbxrjsA71HS1HkSgiZSppz
	W5FNWOX9BdMWvseBNe+RW0rCRzOUE4vEfepVafDX8ATg/SA1opQKzyBFqsN95wOSHVGH
	DDfuRM2LAp5xp/xiZ6NsXcbX1okTGQnwslGEg/JYE4MN4JL8miqDXIXx8+Sr0dArbgKH
	CCNhfWIdhS64Ma4S6DCcdAPMl16Sw/PyESnWghxxJrXyB/09NapdOTvJsSYC3//O9f26
	IuqhPl0Yfbvk9JzJYpEsiNXChM8RwAJLNPMto4zBQWEaNA2IawVj+UWKaRHO7N9HV3Au
	2PrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=iK9CBf80LzxVLJEiBIr6gMU6B3T4YyIx03M0TOV7h/k=;
	b=RiBJ3SNc9o5awzzJhSfGET7zeQr/b7G7kmbEWi3a/nQ7Fj1FB4ahUP21Skp8SM4aBo
	17jnM9T/DFFfX4I6qi4zN4/SBiifcQ4ylgLmpz7L67fUF1V5stNSR7XR6Uab26AJ3tLy
	Oj+wbRzIq5FEQaBzJ7NoV0sbJvqGHfkUGQWT5gaJaYv8DODYQ0BBSkoezZKXUrNqko3R
	ynqBULUoycSfSTgSWooxQHf55zRBh8VrWMqJ+sH2/nRUYlxWEp5DjFmchxwJj7GmQUGj
	ZAwb1STfYqF8znAcG/62jRaxFqo8IBGelfv5YZt6LhGEdu8jiKkt3VTN4L12c4PTlieO
	GCFA==
X-Gm-Message-State: AMke39m2VT3On5RKlb7H+rNkNmz7/pB22uyc6nvID54zaVvAaIH4anGZSgXp0OiouhrirQ==
X-Received: by 10.223.147.164 with SMTP id 33mr1780254wrp.108.1487874900806;
	Thu, 23 Feb 2017 10:35:00 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	j80sm7426618wmd.14.2017.02.23.10.34.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 Feb 2017 10:34:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 23 Feb 2017 19:35:00 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170223183500.GA3038@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: State of bitbake world, Failed tasks 2017-02-22
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
X-List-Received-Date: Thu, 23 Feb 2017 18:35:02 -0000
X-Groupsio-MsgNum: 93902
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline

--RnlQjJ0d97Da+TV1
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
||2017-02-22	||4	||4	||4	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||0		||0		||0		||354		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-02-22 =3D=3D

INFO: jenkins-job.sh-1.8.18 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170223_005128.log

=3D=3D=3D common (4) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb:d=
o_configure
    * meta-smartphone/meta-android/recipes-android/android-tools/android-to=
ols_4.2.2.bb:do_patch
    * openembedded-core/meta/recipes-extended/parted/parted_3.2.bb:do_compi=
le_ptest_base
    * openembedded-core/meta/recipes-support/apr/apr_1.5.2.bb:do_compile_pt=
est_base

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (12) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170222_155436.log/ ||=20
|-
|| qemux86 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170222_155444.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/32829/
|-
|| qemux86_64 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170222_174852.log/ || http://errors.yoctoproject.or=
g/Errors/Build/32830/
|}

=3D=3D=3D PNBLACKLISTs (369) =3D=3D=3D

=3D=3D=3D QA issues (354) =3D=3D=3D
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
||0	||textrel
|-
||0	||unknown-configure-option
|-
||354	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170222_173415.log/

No issues detected

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
5ef2cb5 runqueue: Fix collapsed setscene dependency tree
not included in master yet:=20
04ef978 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
def3800 layer.conf: bump version for change in eSDK selftest behaviour
not included in master yet:=20
32dccb6 qemux86: Add identical qemux86copy variant for tests
313a260 sstate-sysroot-cruft.sh: Extend the whitelist
c57759d recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
4c99c85 buildhistory.bbclass: metadata-revs show repo parent
ca6f284 metadata-revs: provide more information
48f5dad report-error: Allow to upload reports automatically
5a94912 flex: upgrade to 2.6.3
2c57675 Revert "flex: upgrade to 2.6.3"
e505914 Revert "flex: upgrade to 2.6.2"
3b4b417 core-image-tiny-initramfs: drop wic from IMAGE_FSTYPES

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
ec8d5fc pidgin: add missing dependencies and unblacklist
not included in master yet:=20
eb79791 netcat-openbsd: fix implicit dependency on pkg-config
933b3e3 libsdl-mixer: add pkgconfig to inherit and unblacklist
1acd54a libsdl2-mixer: add pkgconfig to inherit and unblacklist
374debc gtk-engines: add glib-2.0-native to DEPENDS an unblacklist
378b290 gtkmathview: libxslt -> libxslt-native in DEPENDS and unblacklist
f27fc74 abiword: unblacklist - gtkmathview is back
2c473f0 fontforge: add gettext to inherit and unblacklist
4dfa2e0 fontforge: update 20150824 -> 20161012
0f204dc postgresql: use gettext bbclass and aublacklist
06c9fb2 postgresql: update 9.4.10 -> 9.4.11
78deb80 libsdl2-ttf: add pkgconfig to inherit and unblacklist
250c84b libsdl-ttf: fix and unblacklist
193e93d python-paho-mqtt: update to version 1.2
0d27137 python-cloudeebus: remove obsolete recipe

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
ee301d8 populate_sdk_qt5: use _append operator
not included in master yet:=20
170f2b7 qtbase-native: nativesdk-qtbase: remove patch that breaks mkspec se=
tting for SDK

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
021a954 chromium-browser: add missing dependency on gperf-native
not included in master yet:=20
c02278e chromium: disable generate_character_data for qemux86

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
be4b312 packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
525325c meta-android: Drop android-tools(-conf) recipes
not included in master yet:=20
553abd0 pvrsrvkm-sgx540-module: restrict for maguro and simplify
22f24e0 Revert "meta-android: Drop android-tools(-conf) recipes"
8763b08 android-tools: add libcap dependency and fix build on big endian sy=
stems


--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWK8rUwAKCRA3VSO3ZXaA
HLM8AKCh9kSn55wbIJlWZSE45tS491zcnQCdF1N1FE/4Q6NcDrRDnnBeGb1XO3A=
=eR1i
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
