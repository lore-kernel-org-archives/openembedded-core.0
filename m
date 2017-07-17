Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 821D262134;
	Mon, 17 Jul 2017 10:38:52 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id v60so28196833wrc.3;
	Mon, 17 Jul 2017 03:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=v2cAq1+a6qj0gRcYJw+Mri/TFKADxAT46o9hpml5rxw=;
	b=m+KZbXU3m9vqZyzrak9re8RdxLw/GmhJtSx7whyMSlAncAUxNDxPz4mbE6QV7DKBfi
	T9FTU1bWh3DEJxMvShCLM04uUBeQGiCKGNcyTqqJ+HUjwW5D1Ou71BXFT7QISvCSL3mx
	vCHNuW36yemXRVkOWZeWqKtfwV8FFuLBy/w/H/TeXSBpY90pc8A3S8uExEkaARNWgPnE
	4w/OTNqY1Tsk/VJxKaAaCsqaqPrja5o4NWCYFyDs8MKqiGBWuJE5ks2QsPLKOF7x7Sgf
	D+JHf6uwE6tPJ5i7tKi1+Q05q4n5vfpIxEAgzPp5vsFAnMNrJw0ZIV7pqf5/PgHUplba
	jWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=v2cAq1+a6qj0gRcYJw+Mri/TFKADxAT46o9hpml5rxw=;
	b=WrvBFv2ojzhbziZYvRcbRD/CZGPi2/S+QGdPkwPBOamIkHDRVelBujkgHK3ZuBbjq/
	CGsAo1B8vCx/DVym9RErYvYxZi2tq35znUSUIO7pNAlgd9FpwVCiVq6a0bXfXQ54mZSm
	XWoV7hNA+8qqo0S2PnO8c40JvRMCz1PlFrLw3UQEEAtcT9Y+XLik8Nx+m4M5i7AD9BBM
	xLPPNMlr3OLJhUfc69gWLDIEwYSrH0Sht27/3wlHfKpn70rISWFV27pbOPpNY60fGO1Q
	gcoyUNyOr2kHNT16cCztDrge8yowW68DnCJhTwJWgXQgK2naLx6u7CLBxMGbrCUaWa55
	+Dbg==
X-Gm-Message-State: AIVw113rAHo2ucXCv2pVGHdplgoDyqtOuzuBHShzYL2hEA2RH0zOLtt1
	sOxf/isqeN2Tl1LE
X-Received: by 10.223.139.218 with SMTP id w26mr10210320wra.206.1500287933342; 
	Mon, 17 Jul 2017 03:38:53 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l14sm9991799wrb.19.2017.07.17.03.38.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Jul 2017 03:38:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 17 Jul 2017 12:39:41 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170717103941.GA3679@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.3 (2017-05-23)
Subject: State of bitbake world, Failed tasks 2017-07-16
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
X-List-Received-Date: Mon, 17 Jul 2017 10:38:54 -0000
X-Groupsio-MsgNum: 100287
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This time with conf/distro/include/security_flags.inc included as
requested by Khem

systemd-bootchart is broken since glibc upgrade, Khem already suggested
the fix, hopefully Chen Qi or someone else will fix it soon.

nmon is broken even without security_flags.inc but v2 from Khem looks
like it should fix it.

There is also v2 for metacity and monkey in master-next now, so hopefully
next build will be a bit better again.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!|Signatures		  !!colspan=
=3D'14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all 	||already-stripped	||libdir	||t=
extrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-cont=
aminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sys=
root	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||=09
|-
||2017-07-16	||8	||6	||7	||0	||0		||1		||4		||0		||0		||0		||0		||0		||0		|=
|0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-07-16 =3D=3D

INFO: jenkins-job.sh-1.8.25 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170717_002720.log

=3D=3D=3D common (6) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.=
bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/ippool/ippool_1.3.b=
b:do_compile
    * meta-openembedded/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb=
:do_compile
    * meta-webos-ports/meta-luneui/recipes-webos/pmloglib/pmloglib.bb:do_co=
mpile
    * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-boo=
tchart_231.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb:do_=
compile
    * meta-openembedded/meta-oe/recipes-support/nmon/nmon_16g.bb:do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (21) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 8	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemuarm.20170714_122654.log/ || http://errors.yoctoproject.org/Err=
ors/Build/41265/
|-
|| qemux86 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemux86.20170714_122654.log/ || http://errors.yoctoproject.org/Err=
ors/Build/41266/
|-
|| qemux86_64 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86-64.20170716_100826.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/41270/
|}

=3D=3D=3D PNBLACKLISTs (14) =3D=3D=3D

=3D=3D=3D QA issues (5) =3D=3D=3D
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
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|-
||1	||libdir
|-
||4	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170715_102407.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
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
meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130607/ - the recipe will be removed on 2017-09-01 unless the issue is fixe=
d"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D "BROKEN, fails to build - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed"
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
meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:PNBLACKLIST[libsensmon] ?=
=3D "BROKEN: not compatible with newer vala, http://errors.yoctoproject.org=
/Errors/Details/143058/"
meta-shr/recipes-shr/3rdparty/omhacks_git.bb:PNBLACKLIST[omhacks] ?=3D "Not=
 compatible with gcc7 - the recipe will be removed on 2017-09-01 unless the=
 issue is fixed"
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


QA issues by type:
count: 0	issue: already-stripped


count: 1	issue: libdir
qwt-qt5-6.1.3: qwt-qt5-dbg: found library in wrong location: /usr/plugins/d=
esigner/.debug/libqwt_designer_plugin.so [libdir]


count: 4	issue: textrel
chromium-54.0.2810.2: ELF binary '/tmp/work/i586-oe-linux/chromium/54.0.281=
0.2-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations in =
=2Etext [textrel]
chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chromiu=
m-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium=
/chrome' has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264' has re=
locations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


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
4a14b44 knotty: Drop task prefix of PLAIN log messages
not included in master yet:=20
dda3a10 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
b1c4661 libiconv: remove 0001-Fix-link-error-when-compiling-with-gcc-O0.pat=
ch
not included in master yet:=20
ae75724 icecc.bbclass: prevent nativesdk builds depending on target specifi=
c KERNEL_CC
4c28728 report-error: Allow to upload reports automatically
205c547 buildhistory.bbclass: metadata-revs show repo parent
ef06cb2 metadata-revs: provide more information
4cdff2b qemux86: Add identical qemux86copy variant for tests
617ef4f valgrind: fix link failure with gold

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
1cbd1bc unionfs-fuse: 0.26 -> 2.0
not included in master yet:=20
c6d4c7a dnsmasq: disable the service by default
ba5e474 rdate: Fix build with hardening
cb4a014 strongswan: Include stdint.h for uintptr_t
046d96d netkit-rpc: Fix build with hardening flags
caf0d05 netkit-telnet: Fix build with hardening
933f271 ncftp: Upgrade to 3.2.6
31642e1 ippool: Fix build errors found with hardening flags
7728c8f autofs: Add build dependency on libnsl2
e4a0edd openhpi: Fix build on 64bit platforms e.g. aarch64
d6b2593 security_flags.inc: Delete
98a8830 pptp-linux: Upgrade to 1.9.0
39176bd ebtables: replace ebtables-save perl script with bash rewrite
80a8634 librcf: RDEPENDS on protobuf, json-spirit
bbb9286 fuse: Correct runlevels and startup order
1483a97 recipes-utils: Add recipe for udevil
d50395e klibc: Fix build issue when default ISA is not thumb
852412e libteam: Upgrade to 1.27
cebae2c sox: Fix build with musl
4b4a68f webrtc-audio-processing: Link with libexecinfo on musl
4c56033 cdparanoia: Fix build with musl
a8481ce lightmediascanner: Define comparison_fn_t if undefined
ab4314a lmbench: Fix build with musl
daab2b9 xfce4-netload-plugin: Do not include sys/sysctl.h
5a30d20 imsettings: Fix build with musl
0206352 gedit: Define ACCESSPERMS if not defined already
8fd8bc8 onboard: Fix build with musl
43ad720 libgtop: Fix build with musl
ea840c2 netdata: Upgrade to 1.6.0
14d749f can-utils: Update to tip of master
1c46c71 kexec-tools-klibc: Fix build with musl
b75b17c dracut: Upgrade to 045
ae7ac67 yaffs2-utils: Fix build with musl
82650e1 logfsprogs: Rename setkey API to _setkey to not conflict with libc
e060cf2 unionfs-fuse: Fix build with musl
a764ec3 xfsdump: Fix build with musl
1c5c8e8 nmon: Upgrade to 16g
5d80364 metacity: Fix build with musl
9d50570 monkey: Link in libexecinfo on musl
fcee6e9 aufs-util: Upgrade to 4.4 release
ad0c2dc recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
bf7cdd9 qtbase-native: Fix qdbuscpp2xml segfault
not included in master yet:=20
2afd1b7 maliit-framework-qt5: Always have optimize flags
92c634e qt5-creator: Fix build with NO_ACCESSIBILITY
d69be5d qtwebengine: Fix build on musl
e1027a5 qtvirtualkeyboard: Include sys/time.h
045e39b qt5-creator: Link with libexecinfo on musl

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
6c063d6 Merge pull request #53 from kraj/kraj/master
not included in master yet:=20
8ca260e gnome-settings-daemon: remove the bbappend for removed recipe

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
2186458 packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
bbeb2c2 linux-hp-tenderloin: bump  SRCREV
not included in master yet:=20
7fd4215 meta-shr, meta-fso: remove blacklisted recipes

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWWyT7QAKCRA3VSO3ZXaA
HCjNAKCpajsnTBXVuYM7wpcPcmB7Ur02rQCfQpGHJONi96cAncMxiswEl/tDMT0=
=GPok
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
