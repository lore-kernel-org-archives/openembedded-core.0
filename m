Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0AEDB77A2C;
	Thu,  4 May 2017 07:50:42 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id u65so10015807wmu.1;
	Thu, 04 May 2017 00:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=ByovzE4HLrWMIUm0hGghFqZUU/O8+Q2NSHky5gbrKM0=;
	b=CVVmk+VKnfWH/NIAHuiQdXF8HMrzMHo+7MRr3nDt0URuF4YINPT6nI9INn+kWkQgcd
	lcxSQe4E+rBalq4kofEgSzjUpB1AbZSrz5DxhP9QZ0Jnn1UtYH2IFEMrnfJRARAbWVzE
	JH5pFdIQ6gWoGoKNuGciTR4gAXtn7GMJchvJhdkmP7HUawQgSEDqUZE1IWyy08KWAH5p
	fSDkIhFKVsnyZqIz5Ibyewa5BzxBwIQiSRiGoHIUb86UKGdfCckawdg3W+maxBhuA8j4
	bD+fyABLvoPUZRaHcyuLs19U6M2CN2wi4T4ELmLSEJVLWYDSK/jzUzG1CAvKq+FAM7W6
	PLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=ByovzE4HLrWMIUm0hGghFqZUU/O8+Q2NSHky5gbrKM0=;
	b=OSzO2r/ix4+vXX4Aqg9s+sSUuFaneauuNADLa5J8BgSydpyDObwEgmxksbbGpcYSs+
	u8tni8n881f0/MKIF4cbXpcBjpAqrmJaEJ8ArLmK/zWNa8NOgo6r9QoQaKAJia68mOSl
	lw3A4AmsjcdgPauNvcUa68a7Xe6iSXmwYZFn6Mqpaxdy9U4BPDeYaFgIwTdzMQkM8Q8l
	rP7v5y7V6Kd0UcSYrMxvMmx+KeOkbp/3t5BEFaykB3lj7EW1rF9YLwOtHxkWdXg99XiQ
	VmpSiAqi0a9PL3NwuY/sG8faEFBCQ/jJUt51RKIxYkSiIA7TaPPRp18XteEi1wqZzQL/
	8nRQ==
X-Gm-Message-State: AN3rC/7e2yvJtaQpf5jNo4PbvZq1Xa2luq4c/wtP6jDrZPtnDFKsQWQa
	/YGrMkPRu3fewmK6
X-Received: by 10.28.210.16 with SMTP id j16mr727523wmg.97.1493884243259;
	Thu, 04 May 2017 00:50:43 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id r29sm518365wra.18.2017.05.04.00.50.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 May 2017 00:50:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 May 2017 09:51:11 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170504075111.GD3037@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.2 (2017-04-18)
Subject: State of bitbake world, Failed tasks 2017-05-03
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
X-List-Received-Date: Thu, 04 May 2017 07:50:43 -0000
X-Groupsio-MsgNum: 96898
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mJm6k4Vb/yFcL9ZU"
Content-Disposition: inline

--mJm6k4Vb/yFcL9ZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This might be the last report from pyro, I'll update meta-oe pyro from mast=
er
once meta-networking changes are merged as well.

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
||2017-05-03	||0	||0	||0	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-05-03 =3D=3D

INFO: jenkins-job.sh-1.8.20 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170503_203529.log

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (0) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170503_071922.log/ ||=20
|-
|| qemux86 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170503_071922.log/ ||=20
|-
|| qemux86_64 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170503_093147.log/ ||=20
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
tures.20170503_092532.log/

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
1239620 build-appliance-image: Update to master head revision
not included in master yet:=20
694ad36 qemux86: Add identical qemux86copy variant for tests
ed35bdb sstate-sysroot-cruft.sh: Extend the whitelist
28afd80 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
5189c80 buildhistory.bbclass: metadata-revs show repo parent
671c350 metadata-revs: provide more information
0ce4192 report-error: Allow to upload reports automatically
ffdb51c Revert "mesa: Contain configure search for llvm"
258fcce sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning=
 and separated with dash
dfd46cc v86d,qemuboot-x86.inc: use KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PRO=
BECONF for uvesafb instead of fbsetup init script

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
3927abc wireguard: blacklist
not included in master yet:=20
d8849da dnsmasq: disable the service by default
c2a8fcb freeradius: add new recipe
955cd56 thrift: refactor recipe
45c0d3a cryptsetup: 1.7.2 -> 1.7.4
924fe37 python-pygobject: remove the empty pkgconfig directory
afa8c56 netcat-openbsd: correct subdir for SRC_URI
0f31982 meta_oe_security_flags.inc: Disable PIE for libdevmapper
8985522 python-prettytable: fix files permissions
1e59dc2 ninja: extend to nativesdk
3bb577e openhpi: Fix build with gcc7
d27a36d wireguard: module install cleanup
74a5315 recipes: remove blacklisted recipes

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
e93ba06 libshr-glib: blacklist because of random failures
not included in master yet:=20
26c0423 meta-shr, meta-fso: remove blacklisted recipes

--mJm6k4Vb/yFcL9ZU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWQrdbgAKCRA3VSO3ZXaA
HA7aAKCzN2Abdrn+3EA2vq+aEEeoIvr4RwCgsjg4IgyHZTLkDAyOwLR0eyGRpIA=
=sHFN
-----END PGP SIGNATURE-----

--mJm6k4Vb/yFcL9ZU--
