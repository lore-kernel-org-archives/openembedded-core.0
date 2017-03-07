Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id C5ECC71CB4;
	Tue,  7 Mar 2017 12:20:53 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id l37so43667wrc.1;
	Tue, 07 Mar 2017 04:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=lQfj+4ghZpdJ+jkik04H5xLWRf2BXfhRjTLmh3WaU7k=;
	b=SPznD6ZRo0hzdnmnGkopJ/cbD+avBHwRdkCfZxQ06ru8XLZBfKu4hpKhNIsBueQqfa
	5xqWUB7rIqZZSd4LRO3TjQuViiO36mQr9ulYXoliGDvE3+W0DSsFyAcLuxpJVNy//kCz
	4cN7oyiKuygPw6qwKXSLZX5o6OfAAgydOO+pEGV7LRy71r3y+Z8VJqSSWrelv2JltMxx
	KYUlCbMRAtgCFaAj0YsHLMXuvjSX/9h0+R7SUKpzjhKgT6urfoCSDA2NovxNWD/slNSw
	vSo0WrxTc0wOR61YxTZBej8/hafWWdtpkorJR9/BmajTQmfcVlDSrX9zbC+LBNgDfjyz
	Fv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=lQfj+4ghZpdJ+jkik04H5xLWRf2BXfhRjTLmh3WaU7k=;
	b=rm7kILzFQqHWiWtZU4wblkDMdM7y+POMPE/L8MRdNju6+sgcEAyrdSbyidfhv3rW7G
	q01AMFPZ3rGb0sNyF+o1i3KX0pMYMD7rBjwnzF/wxkdGEFO5EhE+S8iOnmbN76mTD5Je
	lA+HE9UVOPCuy10hyQaiHwlba7ZoQn4r0gbm68MwRyLO2dF/Pf/3e+mb1LI0NOmAfxui
	eHEqWo4ALAHBRxjdWb3Mv3ReyCmuDT1Z2Uyyv0B74iAmMDnVNGJOWOiLuiPeYC5gg5Xj
	GMJEu9/eMer6RuXnCcgfwJYusBV0g8Ug4maNmgB+Ucyy8LXXRf//9FKsRJRf1Qqd/5p0
	dhiA==
X-Gm-Message-State: AMke39lTd0iVa+8CzhIcUIswxt6oTHUxY/4iUWPli9EWkpfixQ6F7BR/tTKhQqJBM0Yr3Q==
X-Received: by 10.223.128.231 with SMTP id 94mr18045098wrl.165.1488889254009; 
	Tue, 07 Mar 2017 04:20:54 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u11sm19596801wrb.45.2017.03.07.04.20.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Mar 2017 04:20:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 7 Mar 2017 13:20:52 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170307122052.GA3285@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: State of bitbake world, Failed tasks 2017-03-05
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
X-List-Received-Date: Tue, 07 Mar 2017 12:20:54 -0000
X-Groupsio-MsgNum: 94340
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks
!!colspan=3D'6'|Failed depencencies			 !!|Signatures
!!colspan=3D'12'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64
||qemuarm||max||min	||qemux86||max||min	||all
||already-stripped	||libdir	||textrel	||build-deps
||file-rdeps	||version-going-backwards	||host-user-contaminated
||installed-vs-shipped	||unknown-configure-option
||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||=09
|-
||2017-03-05	||0	||0	||0	||N/A	||N/A	||N/A	||N/A
||N/A	||N/A	||0	||0		||0		||2
||0		||1		||67		||0		||0
||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-03-05 =3D=3D

INFO: jenkins-job.sh-1.8.18 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170306_081=
104.log

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (0) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 0	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemuarm.20170=
304_015903.log/
||=20
|-
|| qemux86 	|| 0	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86.20170=
305_024811.log/
||=20
|-
|| qemux86_64 	|| 0	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86-64.20=
170305_235350.log/
||=20
|}

=3D=3D=3D PNBLACKLISTs (351) =3D=3D=3D

=3D=3D=3D QA issues (70) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
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
||1	||file-rdeps
|-
||2	||textrel
|-
||67	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signatures.20170304=
_094745.log/

No issues detected

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
3ce6169 bitbake-user-manual: Added "path_spec" parameter to SVN Fetcher
not included in master yet:=20
77448f1 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
20c6e87 testsdk: Fix lockfile patch
not included in master yet:=20
e7d9cba qemux86: Add identical qemux86copy variant for tests
bf6620e sstate-sysroot-cruft.sh: Extend the whitelist
d502dbf recipes: Replace "cp -a" with "cp -R --no-dereference
--preserve=3Dmode,links"
341a518 buildhistory.bbclass: metadata-revs show repo parent
e9b8fd6 metadata-revs: provide more information
b909a9b report-error: Allow to upload reports automatically
4184395 apr: fix rss+perf+gold failure on do_compile_ptest_base
0d44d32 parted: fix rss+perf+gold failure on do_compile_ptest_base

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
131255d nginx: update to version 1.11.10
not included in master yet:=20
ff48349 ell: Initial recipe for Embedded Linux Library
fc80196 devmem2: Change source URL to regain access to it
fcd9851 usb-modeswitch and usb-modeswitch-data: update to 2.5.0 and
20170205 respectively.
a4835a6 syslog-ng: Run autoreconf twice to avoid problems with libtool
f5ad701 syslog-ng: Update to 3.8.1
c27b278 xfsprogs: update to version 4.10.0
25dbf48 efivar: unblacklist package and those that depend on it
9cb9783 python-cmd2: update to version 0.7.0
8eaaf54 python-pyasn1: update to version 2.2.3
8f7e76f python-pytest-runner: update to version 2.11.1
b6f9a5d python-pyalsaaudio: update to version 0.8.4
3ef05c8 python-idna: update to version 2.4
27caea6 python-parse: update to version 1.8.0
0b40da2 python-pymisp: update to version 2.4.67
32e1af7 python-sqlalchemy: update to version 1.1.6
8173c31 python-pysqlite: add initial recipe for version 2.8.3
32b0092 python-simplejson: relocate to meta-python and add a python3
version
dcff433 python-anyjson: add a recipe for version 0.3.3
0d0709c fuse: Remove unneeded RDEPENDS on util-linux-mount
cd5b07e zabbix: 2.4.7 -> 3.0.8
026b32a netcat-openbsd: fix implicit dependency on pkg-config
64a6ee6 inetutils: Move files only when src !=3D dst.
1a3882b ebtables: Move files only when src !=3D dst.
2e65caf netcf_git: Check if src !=3D dst while moving files.
d94f7eb dnsmasq: add info for port setting
aae0462 dnsmasq: disable the service by default
cba9970 fuse-exfat: fix mount detection of mount.exfat
7b5b7c3 libmng: fix duplicate dependency on lcms + misc cleanup
adf452d python-babel: add initial recipe for version 2.3.4
4294438 python-dnspython: add initial recipe with version 1.15.0
dd3cc2e libunique: depends on dbus-glib-native
9bf209e ptpd: add pkgconfig to inherit
f3fa22a meson.bbclass: Add progress support for do_compile()
74b93d1 meta-python: Remove superfluous "PYPI_PACKAGE" assignments
d00c6eb Make use of the new bb.utils.filter() function
51f9e8c gitver: fix try/except syntax for python3 support

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
61c0250 qtbase-native: nativesdk-qtbase: remove patch that breaks mkspec
setting for SDK
not included in master yet:=20
595e9cf qtbase: remove absolute binary paths from mkspec files
9927aac qtbase: PACKAGECONFIG[gtk] change gtk+ -> gtk+3 in dependencies

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
df77c54 linux-hp-tenderloin: don't use get_kernelversion_modules
function and adapt to multiple kernel image types changes
not included in master yet:=20


--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWL6lowAKCRA3VSO3ZXaA
HF7JAKCm+AHdhsMoYS/6ULxHAq/7DxJRKgCfR1D/2dffHkOu7w1DjWcEBiw6yCc=
=5pL9
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
