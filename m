Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4EC2773124;
	Thu, 23 Feb 2017 22:20:03 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id r141so1297879wmg.1;
	Thu, 23 Feb 2017 14:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=PiAzMJkdi+tjS+nFOpoLMK4ew7SOLaCj9JkOaJTw7mY=;
	b=KJe8wOY47DVCqcaMhgMu0sJsE58KPLD8YjeYC1G14K0LZbfmhaKsXV6RQ3XE0iKdsb
	5ZYLRtgrJFUl2td3+48vOJQqgBvkGqwhQANmvoPLWPWpLYqWj13fGZrT36P1FyWHtPfv
	G/B/rfhcxsGlg0OMlxFz7BNjVorwdhmQtblveUjkAaWARVPbr57ebaYjVLCz7rTvL2+z
	42/dPibS3FJgHLpF8jfc1AFN0ksI+LWRueNesTzZ6EMc3XqtrGTgBjXkgG+BzkA3K4jF
	zNlkTOW6aVbIFksTLBvcdLC/dlhej3GHhyb21AOA6Bg62skYSVeIhlONMNrZ/r1byLVT
	XGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=PiAzMJkdi+tjS+nFOpoLMK4ew7SOLaCj9JkOaJTw7mY=;
	b=RGBdIRGsDWzjJOr3aIwWE79rEsiaEfsxURtmTgadg7YSjJ0sURTsLOSLl/Bh/Ju3kV
	aY2rJQT7KLRd9zF8HYrcVRHd6o3iuGGH/hBWKTm0jn2ryHkYNtMqCMDIjW2faC33QWUX
	dzTLx0zXghLyN7tKOFL9NPH+nAjpPwRKUaTBF+2x1J3f7J/aHlsNpnH5nqGkP5GlN3yi
	EKjy8V91moetqRtFhoYEpRYFooPmNUdTDQ1dzFgi/2734RjNMti/cv/55BlDR4Tvxx/Y
	G8R8NVqXoNbDCdcPvP7StnMcpk5HZtJ/rARvVaNkn46ZASiCSUc4hEf5OdAsge0MDnSr
	LLEw==
X-Gm-Message-State: AMke39knExMDcaeR+URkAP6uUc7TbQvYUPz8VO0g6+65Wdv1MuqCx9rFESVj/UYqSg2a3g==
X-Received: by 10.28.125.149 with SMTP id y143mr7045480wmc.16.1487888404614;
	Thu, 23 Feb 2017 14:20:04 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z10sm8104442wmg.31.2017.02.23.14.20.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 Feb 2017 14:20:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 23 Feb 2017 23:20:04 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170223222004.GA23285@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: State of bitbake world, Failed tasks 2017-02-23
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
X-List-Received-Date: Thu, 23 Feb 2017 22:20:05 -0000
X-Groupsio-MsgNum: 93905
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline

--AqsLC8rIMeq19msA
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
||2017-02-23	||2	||2	||2	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||0		||0		||1		||6		||0		||1		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-02-23 =3D=3D

INFO: jenkins-job.sh-1.8.18 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170223_120915.log

=3D=3D=3D common (2) =3D=3D=3D
    * openembedded-core/meta/recipes-extended/parted/parted_3.2.bb:do_compi=
le_ptest_base
    * openembedded-core/meta/recipes-support/apr/apr_1.5.2.bb:do_compile_pt=
est_base

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (6) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170223_084059.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/32887/
|-
|| qemux86 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170223_084103.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/32888/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170223_102158.log/ || http://errors.yoctoproject.or=
g/Errors/Build/32889/
|}

=3D=3D=3D PNBLACKLISTs (370) =3D=3D=3D

=3D=3D=3D QA issues (8) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||host-user-contaminated
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
||1	||file-rdeps
|-
||1	||installed-vs-shipped
|-
||6	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170223_102010.log/

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
b738ce4 fontforge: add gettext to inherit and unblacklist
37f0c82 fontforge: update 20150824 -> 20161012
e964e30 postgresql: use gettext bbclass and unblacklist
33b6944 postgresql: update 9.4.10 -> 9.4.11
5eb1d86 libsdl2-ttf: add pkgconfig to inherit and unblacklist
885e79c libsdl-ttf: fix and unblacklist
a152f69 python-paho-mqtt: update to version 1.2
9e46e25 python-cloudeebus: remove obsolete recipe
68e9a57 python-autobahn: remove obsolete recipe
d3c3a17 python-pyro4: update to version 4.55
c5da99b python-greenlet: update to version 0.4.12
3e23ed7 python-vobject: update to version 0.9.4.1
673aadf python-serpent: update to version 1.18.1
c813c3e python-lxml: update to version 3.7.3
383351f python-pyasn1: update to version 0.2.2
8681632 python-jinja2: update to version 2.9.5
41b1306 python-pymisp: update to version 2.4.65
a08602a python-prompt-toolkit: update to version 1.0.13
0699d8b python-cryptography: update to version 1.7.2
a7e1b2d python-cryptography-vectors: update to version 1.7.2
b273402 python-pylint: update to version 1.6.5
6492b80 python-tornado: update to version 4.4.2
0ee04e7 aufs-utils: Replace install paths with appropriate bitbake environm=
ent
2bb288c inetutils: Move files only when src !=3D dst.
c4d56b6 ebtables: Move files only when src !=3D dst.
5915818 netcf_git: Check if src !=3D dst while moving files.
45f1971 libgphoto: Replace 'lib' with ${nonarch_base_libdir}
a4ed6e4 xf86-input-tslib: Replace 'lib' with ${nonarch_base_libdir} for pla=
cing udev rules.
5fcce0a lvm2: Replace 'lib' with ${nonarch_base_libdir} for placing udev ru=
les.
6a65731 multipath-tools: Replace 'lib' with ${nonarch_base_libdir} for plac=
ing udev rules.
a501dd8 openct: Replace /lib/udev with ${nonarch_base_libdir}/udev.

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
7c4309b packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
525325c meta-android: Drop android-tools(-conf) recipes
not included in master yet:=20
553abd0 pvrsrvkm-sgx540-module: restrict for maguro and simplify
22f24e0 Revert "meta-android: Drop android-tools(-conf) recipes"
4a7b20c android-tools: add libcap dependency and fix build on big endian sy=
stems


--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWK9gEwAKCRA3VSO3ZXaA
HJ7VAJ0YN2dx+U9r7GO7qEFYBWCPCFqLqQCgrhrFsXTxU0Cpj2YbEZkd9Ow4WvM=
=wgXv
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
