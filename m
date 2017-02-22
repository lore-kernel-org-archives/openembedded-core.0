Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id E2BC471989;
	Wed, 22 Feb 2017 20:35:52 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id v186so151765351wmd.0;
	Wed, 22 Feb 2017 12:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=0G1foqH9pDfzZV1ujzPOSL1OeorpnOxO7hrN4QoUu1Y=;
	b=ixDODvdygE9x1sf/OhJsqFsxBkQXK85X2GeGjbegNTvsK6xlP1gS50ifE6xUxG6h29
	ILn3wED9sbHDCom4O67LNBVspLBFhqyykh6C4obor0VrdXJWV7KjT6HMVlsHe9pjpH5C
	nqx+d+gLMqSuKoeR2+piOTGTD+DiygWxYmxe5+BgspYe3AcFmS12ob03PcI4Y8qC5gqk
	oTWgx/EZpo1rqMFAxnaDdU56Qy8nLnfhyw6+noQhAQs8p4qz3919oAlvlyRMLBWoSyMn
	DQZfWEtFx6+cxOcu0JmZqFf2taXHHgc86BKznzJASKe1p3IPaFxJYflCGGmniVktw9So
	ld9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=0G1foqH9pDfzZV1ujzPOSL1OeorpnOxO7hrN4QoUu1Y=;
	b=s+orV3F5zeWiy+2PM+f9ZRCm9LpO1+EcV8/AxRl5TeTIYBXB67QNPuR6vQvN/Cfx+q
	YNdCMXOUzAoDOuE8h3f0o7S1OvcR+63dgPxyP6doxVg1F6f7ukeEi6CC+rbo3GU/S3p+
	urt3tSxqbBJ74jCMEpBCsPAzIdjE3iVTGcS+Jb9q365LAmN6+qwhhIP1xBvcyl6R3N42
	7ZnRE1TpKBow4rbE7mAY57pJT017P4TtSqFD1P+aQK73nFFp9uIML6ENwKpJKoWEgMrQ
	02vV3Kym2jvuhV3PSV/tPRfSLEDSbj7L/01ckkak3Fxc58RfAuawMyBpd2sFe2OTI7oi
	ySeQ==
X-Gm-Message-State: AMke39mzoDyNbw0MllTRRjMUdNczJXSRq/YwUHEG4jIE4TE/vhWEy5rom+hmFEq6MxpKJA==
X-Received: by 10.28.157.67 with SMTP id g64mr165923wme.111.1487795752954;
	Wed, 22 Feb 2017 12:35:52 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 32sm3115184wrr.20.2017.02.22.12.35.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Feb 2017 12:35:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Feb 2017 21:35:52 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170222203552.GF3283@jama>
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
X-List-Received-Date: Wed, 22 Feb 2017 20:35:58 -0000
X-Groupsio-MsgNum: 93854
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hcut4fGOf7Kh6EdG"
Content-Disposition: inline

--hcut4fGOf7Kh6EdG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

2nd build today just to confirm fix for chromium-wayland on qemux86,
pidgin and geoclue.

> I've dropped only the last unblacklist for mpd which is still failing,
> will try it now with unblacklist, but without the version upgrade.

This worked, the qemuarm issue reported in previous log happens only
with 0.20.4, so I've now merged the first patch to unblacklist mpd.

android-tools one is strange, first it was complaining about invalid ASM
in thumb mode, now after forcing arm mode it complains about invalid ASM
in arm mode. I'll try to restore the older version which was in
meta-android to see if it builds fine (it should because android-tools
wasn't in the report before RSS).

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
||2017-02-22	||3	||2	||2	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||2		||0		||0		||342		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-02-22 =3D=3D

INFO: jenkins-job.sh-1.8.18 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170222_103016.log

=3D=3D=3D common (2) =3D=3D=3D
    * openembedded-core/meta/recipes-extended/parted/parted_3.2.bb:do_compi=
le_ptest_base
    * openembedded-core/meta/recipes-support/apr/apr_1.5.2.bb:do_compile_pt=
est_base

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (7) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170222_031834.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/32810/
|-
|| qemux86 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170222_050950.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/32817/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170222_090309.log/ || http://errors.yoctoproject.or=
g/Errors/Build/32819/
|}

=3D=3D=3D PNBLACKLISTs (379) =3D=3D=3D
=3D=3D=3D QA issues (344) =3D=3D=3D
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
||2	||textrel
|-
||342	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170222_043626.log/

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
f732612 android-tools: add libcap dependency and fix build on big endian sy=
stems
not included in master yet:=20
3f2584b opensaf: 5.0.0 -> 5.1.0
4224a4b lftp: update to 4.7.5 and change SRC_URI source
eee74bc tcpdump: upgrade to 4.8.1
9705df6 iscsitarget: Fix call trace of ahash API calling
addf302 relayd: derive PV from SRCPV
be62b94 dibbler: fix SRC_URI from ${P} to ${BP}
d5582c2 iscsitarget: fix inconsistent crash while login to iscsi target fro=
m initiator
3d3a7fb iscsitarget: use upstream to build with linux kernel >=3D 4.3
8ff163c iscsitarget: update patch to contain changes required to build with=
 only linux v4.8 and above
3474ec9 wireshark: update package to 2.2.4
fe61eae inetutils: register hostname.1 man page as an alternate
64f05b2 lldpd: Update to version 0.9.6
fb5befc wireshark: fix build issue
7a2e8f0 tcpdump: update to 4.9.0 for security fixes
80cb1e1 openflow: inherit pkgconfig
543f51a openconnect: add gettext-native to DEPENDS
cacf84e inetutils: update files for -dbg packages
9d4f73f libldb: update package split rules
bfa1ce6 netcat-openbsd: fix implicit dependency on pkg-config
f7fc640 mpd: add pkgconfig to inherit, rework DEPENDS and unblacklist
5af2ec3 geoclue: unblacklist, modemmanager was fixed
eb73c85 fbgrab: Update to latest version
62c8c04 pidgin: add missing dependencies and unblacklist

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
b80c2c6 packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
525325c meta-android: Drop android-tools(-conf) recipes
not included in master yet:=20
553abd0 pvrsrvkm-sgx540-module: restrict for maguro and simplify

--hcut4fGOf7Kh6EdG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWK32JwAKCRA3VSO3ZXaA
HP+dAJ9eafUr+wBR6SLoIin+Ri7uG2iPCQCgqDiI2cR5z1JXsnzh2Q4lKGQbbv0=
=cdsR
-----END PGP SIGNATURE-----

--hcut4fGOf7Kh6EdG--
