Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A473F72F9D;
	Tue, 28 Feb 2017 15:19:00 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id v77so87705400wmv.1;
	Tue, 28 Feb 2017 07:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=eq/EwgzuXGLBSlNvrj0hxCP886OB8WeY/L49epLA2BA=;
	b=DIOAOOce5Axjnf46eWSBd/hjftSv+cWalUjtW92KgkBK5NVodxp2EgZZjgAqbR8IQo
	JpUJfK38GQ4TqjjpyPWm620arS5S4emic4glhwpZlQa8wcrcjsrswW8errhfzWsICO+I
	AWkWMI7acXUgOlEBeRLJu1cChLYcLXp9JsrvMLg9/RfQ3QgcfBAZWdlDR8GbW9C0Wv+t
	YOw5WKZo9jzRkkFCJ3+rSHZ261NOh7WZGroIaE/6X11wryWUJt+ZQ44IBOJFMFy0xx0U
	fu0DJu9wumuz3sUujqZbwIqiJOGs75aHhWzeRSuaplTe0FuG+l525VCkLmjUSuDS1ssu
	PhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=eq/EwgzuXGLBSlNvrj0hxCP886OB8WeY/L49epLA2BA=;
	b=VQ6KS1Cyv4CbHhrEs6jfqcNbAJ7vil7A+rjJZp+9U5tXVkLBXwtzB44JiAuNBdjEkq
	eklOTxAT8wW6GsFEIBEh+tX4GvOehhhOAaaHfKwllJkfXpNgdSwFj8k6KMClC8NlFfOd
	cRzOuwQNtLm9DOLW2/t0zrR4qx2JoidgpLFsJYrfiTU3FG396mtmvNLJqGdJ2sZUH11x
	Yf9uwpl2zOa0Vtwyz8iCsyT2/J5w/kUrbZrgYdTTlSVpLLhn9jCTsA6g7AsWh026FtIu
	3B4Pfdjz59LI0h+Hvptdho52tl6v9N+UVwTXkna9NUibrwRlxutjd/xtb3iWHBv4RY+L
	zBnQ==
X-Gm-Message-State: AMke39kOqT2DsO8vQKWmqqrIi3OyyMZpxB7Kryff+NVLM2vV4++SFORFtOSrSqbDj0Bybw==
X-Received: by 10.28.135.82 with SMTP id j79mr18108345wmd.19.1488295141156;
	Tue, 28 Feb 2017 07:19:01 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p12sm2750090wrb.46.2017.02.28.07.18.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 Feb 2017 07:18:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 28 Feb 2017 16:19:03 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170228151903.GB3275@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: State of bitbake world, Failed tasks 2017-02-28
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
X-List-Received-Date: Tue, 28 Feb 2017 15:19:01 -0000
X-Groupsio-MsgNum: 94072
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline

--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Dropped few changes from master-next which were re-introducing the
failures and we're back in almost clean state:

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
||2017-02-28	||2	||2	||2	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-02-28 =3D=3D

INFO: jenkins-job.sh-1.8.18 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170228_051635.log

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
g.world.qemuarm.20170228_014101.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/32985/
|-
|| qemux86 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170228_014106.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/32986/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170228_030450.log/ || http://errors.yoctoproject.or=
g/Errors/Build/32998/
|}

=3D=3D=3D PNBLACKLISTs (355) =3D=3D=3D

=3D=3D=3D QA issues (0) =3D=3D=3D
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
||0	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170228_030028.log/

No issues detected

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
5b364b0 fetch2/svn: change 'rsh' parameter to 'ssh'
not included in master yet:=20
ee30425 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
65cfc8a libva: Find the correct wayland-scanner
not included in master yet:=20
e391f58 qemux86: Add identical qemux86copy variant for tests
6d33fc3 sstate-sysroot-cruft.sh: Extend the whitelist
0de471f recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
f0f6112 buildhistory.bbclass: metadata-revs show repo parent
ade2954 metadata-revs: provide more information
c5e658a report-error: Allow to upload reports automatically
63e44e5 flex: upgrade to 2.6.3
edfb18a Revert "flex: upgrade to 2.6.3"
3d6b996 Revert "flex: upgrade to 2.6.2"
ce5cb55 qemu: fix build with glibc-2.25
ea1f3b4 e2fsprogs: Fix build with glibc-2.25
7f249b3 parted: fix build with glibc-2.25
830df85 syslinux: fix build with glibc-2.25

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
131255d nginx: update to version 1.11.10
not included in master yet:=20
4ab8e02 netcat-openbsd: fix implicit dependency on pkg-config
a87fc99 inetutils: Move files only when src !=3D dst.
f8b8c16 ebtables: Move files only when src !=3D dst.
ec3b598 netcf_git: Check if src !=3D dst while moving files.
d7dcb9f fuse: Remove unneeded RDEPENDS on util-linux-mount
f66fb86 ell: Initial recipe for Embedded Linux Library
29cb532 dnsmasq: add info for port setting
0f1d882 dnsmasq: disable the service by default
7fa9b8d zabbix: 2.4.7 -> 3.0.8

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
61c0250 qtbase-native: nativesdk-qtbase: remove patch that breaks mkspec se=
tting for SDK
not included in master yet:=20
595e9cf qtbase: remove absolute binary paths from mkspec files

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
021a954 chromium-browser: add missing dependency on gperf-native
not included in master yet:=20
a9dd704 chromium: disable generate_character_data for x86

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
7c4309b packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
df77c54 linux-hp-tenderloin: don't use get_kernelversion_modules function a=
nd adapt to multiple kernel image types changes
not included in master yet:=20


--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWLWU5gAKCRA3VSO3ZXaA
HDhnAJ4uMsXKpCagrMAnl8AqzXT1HkcC+gCgtcA1KzTwImrNwXD/Ym5bq1r+ljE=
=ArWh
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--
