Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4081F77E3A;
	Fri,  7 Apr 2017 17:40:24 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id w64so3989606wma.0;
	Fri, 07 Apr 2017 10:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=o0hH6kOrGpu/ryaNlcMTONCBGjkD1fmG7oxQix25Ogs=;
	b=eFtB86Jd3DtFiY0tozjSyh1V7UA1bUH99T5XeS577cvmffY0HYjWEcEihe6Y0+iypx
	JurfSIJNiQZylL7QcfcZ0gjc62pQsTf9cto66qfDxDxOTH4j90ypoKc+kuHWGa/sbvCR
	5/TocA39crTSDt/tSoW01WfsjKOCweRq1SIm/mvlbZpdLPQ+JX+HLYKvpNpHPO0Trnct
	VUkOrhfeI0QemjfjBK1w/J2rTmMCV+96xkWcDWojER0nSctOXNV5bKBGjugSdh1deqUF
	ZkWM+Fv7DCgBIidjsLuhUs1QB/og5Ndw2+7oXfnCMzeSjb0afyzR3zbj1pwr+Dmwhrym
	fHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=o0hH6kOrGpu/ryaNlcMTONCBGjkD1fmG7oxQix25Ogs=;
	b=cSM6x5GQm7ypeVRBseJ2WzWNJrit9tJSvBSbHnEaFWMUXftKB6rGwlss4VNBLoi/ax
	iq9jAI5WYXj/RThRIpAfXI6tGr0r3vJL8HtaQL2p5ozCzv8osrK3BffnNEGRKSPe9wZM
	KMn/+xPqjwxJVPlKUfTqgg9I8+RqmClHAIXsZoddkbpHnBYctsm0VYFUs99Ai/ldlwut
	VeBf/gA2MeEpiQujtSVSkq7R4jmHfXdVtCnqPyn0oYtGU/C2KWs80EedxUHSzWxkTRjG
	aXQLKII64wgXMWnDRny2tweikoXSen/go/V55f6VjV1DMLlIdgan3LjxdFnXl8+ut44f
	2TNg==
X-Gm-Message-State: AN3rC/5tqIcGJrra254uUDe+PmC7yCoO2T9ZNeBp6feDI3YR+kSSo9umoOhikoOWZJdzrA==
X-Received: by 10.28.62.212 with SMTP id l203mr484096wma.110.1491586825441;
	Fri, 07 Apr 2017 10:40:25 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k63sm30918943wmf.9.2017.04.07.10.40.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 07 Apr 2017 10:40:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 7 Apr 2017 19:40:25 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170407174025.GB3022@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: State of bitbake world, Failed tasks 2017-04-05
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
X-List-Received-Date: Fri, 07 Apr 2017 17:40:25 -0000
X-Groupsio-MsgNum: 96000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline

--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'6'|Failed depe=
ncencies			 !!|Signatures		  !!colspan=3D'14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||mi=
n	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||=
version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||u=
nknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	=
||ldflags	||compile-host-path	||=09
|-
||2017-04-05	||2	||2	||2	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||3	||0		||0		=
||3		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-04-05 =3D=3D

INFO: jenkins-job.sh-1.8.20 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170405_212536.log

=3D=3D=3D common (2) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-support/tinyproxy/tinyproxy=
_1.8.4.bb:do_configure
    * meta-openembedded/meta-networking/recipes-support/uftp/uftp_4.9.3.bb:=
do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (6) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170405_095003.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/35467/
|-
|| qemux86 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170405_095003.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/35472/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170405_143317.log/ || http://errors.yoctoproject.or=
g/Errors/Build/35477/
|}

=3D=3D=3D PNBLACKLISTs (442) =3D=3D=3D

=3D=3D=3D QA issues (3) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
|-
||0	||file-rdeps
|-
||0	||host-user-contaminated
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||ldflags
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
||3	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (3) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170405_114645.log/
    * ERROR: 3 issues were found in these recipes: wireguard-tools

    * ERROR: 1 errors found in signatures.qemux86.do_configure.sigdata.log
    * ERROR: 1 errors found in signatures.qemux86.do_populate_sysroot.sigda=
ta.log
    * ERROR: 1 errors found in signatures.qemux86.do_package_write_ipk.sigd=
ata.log

    * ERROR: wireguard-tools different signature for task do_configure.sigd=
ata between qemux86copy and qemux86
    * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/ss=
tate-diff/1491428805/signatures.qemux86.do_configure.sigdata.log
    * ERROR: wireguard-tools different signature for task do_populate_sysro=
ot.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/ss=
tate-diff/1491428805/signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: wireguard-tools different signature for task do_package_write_=
ipk.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/ss=
tate-diff/1491428805/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 3 issues were found in these recipes: wireguard-tools

QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 3	issue: textrel
chromium-54.0.2810.2: ELF binary '/tmp/work/i586-oe-linux/chromium/54.0.281=
0.2-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations in =
=2Etext [textrel]
chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chromiu=
m-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium=
/chrome' has relocations in .text [textrel]
corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
58a0353 fetch2: Do not fail to create symbolic links if they already exist
not included in master yet:=20
223b8cb world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
3b7111b automake: Adjust shebang lines to remove interpreter path hardcode
not included in master yet:=20
96827a3 qemux86: Add identical qemux86copy variant for tests
029268a sstate-sysroot-cruft.sh: Extend the whitelist
f375076 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
50aaf6c buildhistory.bbclass: metadata-revs show repo parent
bf5c6c0 metadata-revs: provide more information
12412b6 report-error: Allow to upload reports automatically
34bd10c Revert "mesa: Contain configure search for llvm"
c6b7628 sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning=
 and separated with dash
c76772d x86-base.inc, qemuarm.conf: prefer 4.10 version of linux-yocto
8922c34 eudev: set LGPL-2.1+ for libudev package

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
cdb428e recipes: add removal date to PNBLACKLIST messages
not included in master yet:=20
15328d7 dnsmasq: disable the service by default
bcf9a08 ctdb: Fix build with musl
05ecc19 libdnet: update SRC_URI
a5a44db wireless-regdb: fix crda failing from missing pubkey
6e2d318 ntp: update to 4.2.8.p10
1a01884 netcat-openbsd: Fix build and whitelist
2f5738e squid: Update to 3.5.23
762a074 libnfnetlink: Backport patches to fix musl build
2ee4969 ebtables: Fix build with musl
768c920 lowpan-tools: Fix build with musl
2eab707 openl2tp: Fix build with musl
d572db6 rp-pppoe: Fix build with musl
4affd6a vsftpd: Fix build with musl
ddcdd8c dibbler: Upgrade to 1.0.2RC1
c8547c1 vpnc: Update to build from github SRC_URI
27a6397 daq: Fix build with musl
2eef0f3 arptables: Upgrade to 0.0.4
9debde5 libnetfilter-log: Switch to git URI
5e4d8e3 libnetfilter-queue: Update to git for SRC_URI
7406a3f snort: Fix build with musl
eb2b5ae autofs: Patch to build on musl
faa1217 gpm: Update to use git src uri
b23f2d7 lvm2: Fix patch errors found with musl
cb5f9fb ttf-inconsolata: Move copying of .otf to .ttf into do_compile
0eb71c6 minicoredumper: Update to 2.0.0
8ce27d0 libqb: Upgrade to 1.0.1 release
faf2bea xarchiver: Fix build with security flags turned on
2857e68 vorbis-tools: Fix build with security flags
0960a20 ntimed: Use adjtimex on musl
60d17fd libnih: Drop SIGCLD
a4edae0 libuio: Fix build with musl
a0cc3bf uml-utilities: Fix problem founds during musl build
9f203d0 synergy: Add unzip-native depenedency to right task
94750cc corosync: Update to 2.4.2
4280221 logfsprogs: Pass LDFLAGS to link steps
69ab28d wireguard: add WireGuard kernel module and tools
fb19a03 uftp: Add recipe
8a66761 v4l-utils: update to 1.12.3.
8284e02 plymouth: Fix virtual RPROVIDES
2063d6b opencv: do not depend on swig.
3f2bc0c tinyproxy: Add recipe
8ed4438 Revert "ttf-inconsolata: Move copying of .otf to .ttf into do_compi=
le"

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
ff073f0 nativesdk-qtbase: pass -no-icu for deterministic builds
not included in master yet:=20
b35dc32 qtbase-native: create empty oe-device-extra.pri
aa45f48 qtwayland: update build without xkbcommon-evdev
a126a5a Revert "qtbase-native: create empty oe-device-extra.pri"
d3ea645 qtbase-native: create empty oe-device-extra.pri
dad7fae qtchooser: respect LDFLAGS

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
7c08bb1 Merge pull request #28 from twoerner/contrib/twoerner/chromium_54_p=
ush
not included in master yet:=20

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
e779eff pycd: respect LDFLAGS
30f1d87 suspend-blocker: respect LDFLAGS
683371b recipes: add removal date to PNBLACKLIST messages
76e0d38 meta-openmoko: remove fbreader bbappend to drop meta-gpe dependency

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWOfPBwAKCRA3VSO3ZXaA
HP+pAKCBSs3ZbKuRQRxMQi3OlvAbitwhjgCgjg18OSk69XcASyJunxSGpd+XbpA=
=0nTo
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--
