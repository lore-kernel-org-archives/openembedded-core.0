Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0067271B45;
	Fri, 28 Apr 2017 12:28:03 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id r190so11123023wme.1;
	Fri, 28 Apr 2017 05:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=4DqIgqgS/018oZHHLeDSuGHNXtaE8uzbpIu9I85Zttk=;
	b=Oqgxa9cT1CUUBLjcGjo/peRk3MCjMHC5Ie9nCtjB5m3/OqR4KOH7vyEHMjd7UaNv9A
	kCoKfYdsd0FSCur2/PN94GUHKiWO14dhgW+QT6oI7e51k56+Uh+40wZuj8WR7NYuv1sG
	6H47f9A1iC5h1vLAJMmsrTyMiOm6p8z3DrjF5h/oZFC4ca9vgH3Rj+O7RTbojlntNV+3
	cFj9HjnOfcZIcU/GVZckSP7/FKJfHL/eyhDFouBHuoFVtqjPqG/3WqfLuFF4gyNnLpO4
	aBD7V5FwNKnZGAnYptx0+6gaDlipxno7xz4XrYJAXW2qk4Sd8eNLE6s6DJ5K6GUwqICM
	ltAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=4DqIgqgS/018oZHHLeDSuGHNXtaE8uzbpIu9I85Zttk=;
	b=ufww9SOJOFh7ZnBGKPKtPmP8n8V4gzPv91PVH3YwX/xpG05HX3oQXlDhyO+2CvaBZw
	66CpDfiPflUXAEsWZonAN6qnd4FErSQfaW3u41OsisCvVG+EiJB9lsptTCqNW9qNVtFe
	MSpDNBz1IC5Y4LWUG+mphMSJe99Y/pYe32nqT8M9aCizrmJjplwwwQ+A3PS8+d5OM/YK
	yN84HUv4dj/ZKf9B7180dUI7tAsGN7aZcFkq0k13wQzj6HsFA+inCIcKWeQdH6QVnvhR
	Dvbto9P1dWK02a91odg0TnK6bhYjQMpHxPpZvXaOjYljcHg7CVdDlZejtqU6I4ZG1IvY
	lltA==
X-Gm-Message-State: AN3rC/5/lK12+myKntjb1xdWm/vLcVTAzAefT5FIpVmTe3xNorurJoj5
	lnddlps+j1pUH6iL
X-Received: by 10.28.58.21 with SMTP id h21mr5527230wma.9.1493382484165;
	Fri, 28 Apr 2017 05:28:04 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l81sm3101647wmi.22.2017.04.28.05.28.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Apr 2017 05:28:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 28 Apr 2017 14:28:23 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170428122823.GA3265@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.2 (2017-04-18)
Subject: State of bitbake world, Failed tasks 2017-04-29
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
X-List-Received-Date: Fri, 28 Apr 2017 12:28:04 -0000
X-Groupsio-MsgNum: 96777
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
ncencies			 !!|Signatures		  !!colspan=3D'14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||mi=
n	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||=
version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||u=
nknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	=
||ldflags	||compile-host-path	||=09
|-
||2017-04-28	||1	||1	||1	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-04-28 =3D=3D

INFO: jenkins-job.sh-1.8.20 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170428_022633.log

=3D=3D=3D common (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-kernel/wireguard/wireguard-=
module_0.0.20170421.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (3) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170427_221315.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/36810/
|-
|| qemux86 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170427_221320.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/36811/
|-
|| qemux86_64 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170428_001059.log/ || http://errors.yoctoproject.or=
g/Errors/Build/36812/
|}

=3D=3D=3D PNBLACKLISTs (12) =3D=3D=3D

=3D=3D=3D QA issues (0) =3D=3D=3D
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
||0	||textrel
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170427_235158.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?=3D "BROKEN: fai=
ls to build with gcc-6"
meta-openembedded:
meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb:PNBLACKLIST[xfsdump=
] ?=3D "Depends on broken xfsprogs - the recipe will be removed on 2017-09-=
01 unless the issue is fixed"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-h=
cidump] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 con=
flicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=3D=
 "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with =
bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIS=
T[gst-plugin-bluetooth] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'blue=
z5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURE=
S', '', d)}"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conf=
licts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts w=
ith bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-qt5:
meta-smartphone:
meta-webos-ports:
meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACK=
LIST[luna-webappmanager] ?=3D "BROKEN: needs to be adapted to new qt-5.7"
meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next] ?=
=3D "BROKEN: needs to be adapted to new qtwayland-5.7"
PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazation w=
hich isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be test=
ed so much"
PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be test=
ed so much"
PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads di=
rectory in /home/builder/poky :/"
PNBLACKLIST[linux-yocto-tiny-kexecboot] =3D "does weird sh!t breaking other=
 kernels and modules - broken for years"
PNBLACKLIST[linux-yocto-tiny] =3D "does weird sh!t breaking other kernels a=
nd modules - broken for years"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 0	issue: textrel


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
21d9631 toaster: move release lookup from morty to pyro
not included in master yet:=20
c4b1613 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
e584be7 build-appliance-image: Update to master head revision
not included in master yet:=20
67114ad qemux86: Add identical qemux86copy variant for tests
63e9e9d sstate-sysroot-cruft.sh: Extend the whitelist
fe744e8 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
1b4ca51 buildhistory.bbclass: metadata-revs show repo parent
0b100a7 metadata-revs: provide more information
ef84c55 report-error: Allow to upload reports automatically
a43df23 Revert "mesa: Contain configure search for llvm"
d559619 sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning=
 and separated with dash
fe46c11 kernel-yocto/kern-tools: fix do_validate_branches clean stage
99a602b v86d,qemuboot-x86.inc: use KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PRO=
BECONF for uvesafb instead of fbsetup init script
28c0239 runqemu-gen-tapdevs: fix runqemu-ifup script call

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
e7ad92d evince: fix do_install problem
not included in master yet:=20
a4d905f dnsmasq: disable the service by default
fa1f548 freeradius: add new recipe
8b8125b recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
5f837b4 qttools: add ptest
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
4ed7feb Merge pull request #35 from schnitzeltony/chrome-progress
not included in master yet:=20
08c4293 gnome-settings-daemon: remove the bbappend for removed recipe

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
c325204 packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
d150b0a meta-openmoko: remove fbreader bbappend to drop meta-gpe dependency
not included in master yet:=20
582db78 libshr-glib: blacklist because of random failures
a08ea69 meta-shr, meta-fso: remove blacklisted recipes

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWQM1ZgAKCRA3VSO3ZXaA
HOpEAJwM5c9gWescK34LWSB4YTMBciRn/wCgq0uMXWsVsGMRFHFgMc0uyJRv3R0=
=/+Mq
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
