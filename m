Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1837878335;
	Wed, 14 Jun 2017 12:47:04 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id 36so66513519wry.3;
	Wed, 14 Jun 2017 05:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=BGXF4JTZCGvUjb+q7VwmXwH04pBDapOobHyrxMM1zKE=;
	b=mEMU2F+77PQ4NtwPlsKSFTRptW4ZnoZA3m9m/fzBEzbso70YymilyjHCXtkMga1zcS
	gnzXOb/3CTpttHncpTsDP3RYQxD39emR2uj6rd67zr2NxybCFqKUVQ9l9vJ0Q4Uvmzre
	1OTwaqFvlw6RFbWms6tfky74kpfyamfbpj3BjmTnwn0EZXMKBskFX0i6vsjWV9An/MoD
	Qr/jS7GzDlzDL8xjqQoT+fWvY3so7esNX49P6N3u6S8YaDlV/Q+Vw0AMscXVykue86Fg
	yo0SpGjDAZNFBGh7xoVyZZ8/PbYWsNFF/wH2ilx8bQwW54W+orK2mY6Gr9uR/VPztliT
	RY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BGXF4JTZCGvUjb+q7VwmXwH04pBDapOobHyrxMM1zKE=;
	b=QXdVtn3RPk9xF7ZpF8Crrur2zZV+gzqSc0+5dYrW4x0jsqShEYriTkqHIr+XJJzOpN
	M8BjdrWuCJa7LTH6bUz6yE2eUjmOvA38y43k1TZ6TDTW+Ow6MAYftRNgohaOXuAqRtKA
	ZjV44NATFlAEAXSJhsrYAJERNUgudoOQxEK0Pd69TB+yfpAtmQ67u48kExNWeIuLK/n1
	bI9/EEKAOFP+AoO00SFBCRJu8boco09ekOg1h5nGrCVMYIRI8yWuyorIz9FA3KEw6On9
	mO0nkk6QcYuAKaox3OY3rhVfS9ZQmnSG5V4yN7Xab4dDiWYri4DXQam2HnoKmd2yyeAM
	GVXA==
X-Gm-Message-State: AKS2vOynurMT9qmsMr1VD89Kgcqe/na15X/jvMcuIUkX1qr0tYEKBZQb
	prSdyBbTqkIh9IVN
X-Received: by 10.223.128.80 with SMTP id 74mr417949wrk.9.1497444425263;
	Wed, 14 Jun 2017 05:47:05 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i64sm15506077wmd.33.2017.06.14.05.47.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 14 Jun 2017 05:47:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 14 Jun 2017 14:47:04 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170614124704.GA19131@jama>
References: <20170612051511.GA3086@jama>
MIME-Version: 1.0
In-Reply-To: <20170612051511.GA3086@jama>
User-Agent: Mutt/1.8.3 (2017-05-23)
Subject: State of bitbake world, Failed tasks 2017-06-12
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
X-List-Received-Date: Wed, 14 Jun 2017 12:47:05 -0000
X-Groupsio-MsgNum: 98735
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

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
||2017-06-12	||0	||3	||1	||3	||0		||1		||5		||0		||0		||0		||7		||0		||0		|=
|0		||0		||0		||2		||0		||=09
|}

=3D=3D Failed tasks 2017-06-12 =3D=3D

INFO: jenkins-job.sh-1.8.21 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170614_024342.log

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-test/fwts/fwts_git.bb:do_compile
    * virtual:native:openembedded-core/meta/recipes-support/lzo/lzo_2.10.bb=
:do_unpack

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (4) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemuarm.20170613_000022.log/ ||=20
|-
|| qemux86 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemux86.20170611_211735.log/ || http://errors.yoctoproject.org/Err=
ors/Build/39090/
http://errors.yoctoproject.org/Errors/Build/39417/
|-
|| qemux86_64 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86-64.20170612_232346.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/39533/
|}

=3D=3D=3D PNBLACKLISTs (15) =3D=3D=3D

=3D=3D=3D QA issues (15) =3D=3D=3D
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
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
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
||2	||ldflags
|-
||5	||textrel
|-
||7	||host-user-contaminated
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (3) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170613_224218.log/
    * ERROR: 3 issues were found in these recipes: microcode-ctl

    * ERROR: 1 errors found in signatures.qemux86.do_configure.sigdata.log
    * ERROR: 1 errors found in signatures.qemux86.do_populate_sysroot.sigda=
ta.log
    * ERROR: 1 errors found in signatures.qemux86.do_package_write_ipk.sigd=
ata.log

    * ERROR: microcode-ctl different signature for task do_configure.sigdat=
a between qemux86copy and qemux86
    * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/ss=
tate-diff/1497429738/signatures.qemux86.do_configure.sigdata.log
    * ERROR: microcode-ctl different signature for task do_populate_sysroot=
=2Esigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/ss=
tate-diff/1497429738/signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: microcode-ctl different signature for task do_package_write_ip=
k.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/ss=
tate-diff/1497429738/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 3 issues were found in these recipes: microcode-ctl


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?=3D "BROKEN: fai=
ls to build with gcc-6"
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
meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb:PNBLACKLIST[libdbus-c++] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130644/ - the recipe will be removed on 2017-09-01 unless the issue is fixe=
d"
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


count: 1	issue: libdir
qwt-qt5-dbg: found library in wrong location: /usr/plugins/designer/.debug/=
libqwt_designer_plugin.so [libdir]


count: 5	issue: textrel
chromium-54.0.2810.2: ELF binary '/tmp/work/i586-oe-linux/chromium/54.0.281=
0.2-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations in =
=2Etext [textrel]
chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chromiu=
m-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium=
/chrome' has relocations in .text [textrel]
corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
mpeg2dec-0.5.1: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/mpeg2dec/0.5=
=2E1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0' has relocations =
in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 7	issue: host-user-contaminated
glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-es-uy.iso-8859-1/=
usr/lib/locale/es_UY.ISO-8859-1/LC_MEASUREMENT is owned by uid 3004, which =
is the same as the user running bitbake. This may be due to host contaminat=
ion [host-user-contaminated]
glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-pap-aw/usr/lib/lo=
cale/pap_AW/LC_NAME is owned by uid 3004, which is the same as the user run=
ning bitbake. This may be due to host contamination [host-user-contaminated]
qtbase-5.9.0+gitAUTOINC+f6b36eaafe: qtbase: /qtbase-examples/usr/share/qt5/=
examples/xml/xmlstreamlint/xmlstreamlint.pro is owned by uid 3004, which is=
 the same as the user running bitbake. This may be due to host contaminatio=
n [host-user-contaminated]
qtdeclarative-5.9.0+gitAUTOINC+96f6ba5f56: qtdeclarative: /qtdeclarative-ex=
amples/usr/share/qt5/examples/quick/imageprovider/ImageProviderCore/qmldir =
is owned by uid 3004, which is the same as the user running bitbake. This m=
ay be due to host contamination [host-user-contaminated]
qtquick1-5.9.0+gitAUTOINC+695460401d: qtquick1: /qtquick1-examples/usr/shar=
e/qt5/examples/declarative/cppextensions/networkaccessmanagerfactory/networ=
kaccessmanagerfactory is owned by uid 3004, which is the same as the user r=
unning bitbake. This may be due to host contamination [host-user-contaminat=
ed]
qtquick1-5.9.0+gitAUTOINC+695460401d: qtquick1: /qtquick1-examples/usr/shar=
e/qt5/examples/declarative/ui-components/scrollbar/main.cpp is owned by uid=
 3004, which is the same as the user running bitbake. This may be due to ho=
st contamination [host-user-contaminated]
qtscxml-5.9.0+gitAUTOINC+eff82ac957: qtscxml: /qtscxml-examples/usr/share/q=
t5/examples/scxml/invoke-dynamic/invoke-dynamic.qml is owned by uid 3004, w=
hich is the same as the user running bitbake. This may be due to host conta=
mination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 2	issue: ldflags
No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux/dos2unix/7.3.4-=
r0/packages-split/dos2unix/usr/bin/dos2unix' [ldflags]
No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/dos2unix/7.3.4-r0/p=
ackages-split/dos2unix/usr/bin/unix2dos' [ldflags]


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
362f604 bitbake-user-manual: Updated INHERIT descriptions
not included in master yet:=20
de83197 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
592ef89 Revert "package.bbclass: Restore functionality to detect RPM depend=
encies"
not included in master yet:=20
9dd2b33 v86d,qemuboot-x86.inc: use KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PRO=
BECONF for uvesafb instead of fbsetup init script
26a7af5 Revert "mesa: Contain configure search for llvm"
bd3823d sstate-sysroot-cruft.sh: Extend the whitelist
e8864f2 python-3.5: add runtime dependency from python3-compression on pyth=
on3-misc
4f8e4c1 package_manager: flush installed_pkgs file before oe-pkgdata-util u=
ses it
f60d107 report-error: Allow to upload reports automatically
7b5f89c buildhistory.bbclass: metadata-revs show repo parent
9e8c6b6 metadata-revs: provide more information
fec3b73 qemux86: Add identical qemux86copy variant for tests

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
0abf5af opencv: fix runtime dependencies.
not included in master yet:=20
4feac91 dnsmasq: disable the service by default
b32d605 freeradius: add new recipe
2cffcf7 keepalived: add new recipe
7e0f800 vblade: update to version 22
316fe79 geoipupdate: 2.2.2 -> 2.3.1
775e06a ifenslave: 2.7 -> 2.9
5042bc7 drbd-utils: remove /var/lock to avoid conflict
e113d53 wireguard: bump version to latest snapshot 0.0.20170517
a27f3c2 opensaf: Add -latomic to LDFLAGS
3d1c3dd open-isns: fix QA issue
a7a8079 dante: fix unknown-configure-option QA issue
f8d5eaf snort: enable static daq
928ab9a net-snmp: supported cross compile for the perl embedded and perl mo=
dules
9889d29 traceroute: Move manual pages from mandir to man8 under it
1dd70bf nopoll: Disable doc generation
4f9ad1c cifs-utils 6.6 -> 6.7
d4a0112 openvpn: Upgrade 2.3.9 -> 2.4.2
e1ed662 proftpd: Update to 1.3.6 release
04615a6 samba: Fix build with musl
44e5cde meson: update Meson devtool to 0.40.1
07e347b meson: fix build/host confusion for bbclass
93b7f52 wireshark: Upgrade to 2.2.7
e646e16 ippool: add new recipe
03be97c fuse: let overriding base_sbindir have the proper effect.
bc585c1 meson: add LDFLAGS to bbclass C/C++ link arguments
839d76d fwts: Bump SRCREV to latest past 17.03.00 release
cca2a24 espeak: Fix FTBFS due to narrowing warnings on 32bit x86
5b28104 openldap: Fix CVE-2017-9287
e06d092 python3-django-south: add new recipe
22344f9 python3-django: add python3 recipe and update to 1.11.2
f506ce5 agent-proxy: add new recipe
189c89d enscript: add new recipe
835dae6 logwarn: add new recipe
0cfa891 microcode-ctl: add new recipe
9b3e845 esound: Upgrade to 0.2.41
95ed9af gflags: change download name.
9dd8765 po4a: add recipe
0afa5c1 dos2unix: add recipe
1b57234 dos2unix.bbclass: add recipe
d962783 librcf: convert CRLF to LF
75e94d2 librcf: fix a clang compiling issue
6b1d11b libfile-fnmatch-perl: New recipe
e502323 debsums: New recipe
b96d1b6 hiredis: Add recipe
497beca libdc1394: Add X11 and opengl deps if distro has them in policy
0f04ddd gitver: extend class to use EXTERNALSRC if set
8d909be gitver: fix broken ${GITSHA} and recursion in S when PV=3D"${GITVER=
}"
f4c4c13 recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
6605c48 python-pyqt5: Add recipe.
not included in master yet:=20
1c80edb Upgrade to Qt 5.9.0
8be83b0 qtbase: respect "ld-is-gold" DISTRO_FEATURES

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
880a7bd Revert "firefox: Use system-wide cairo instead of built-in one"
not included in master yet:=20
05e7482 gnome-settings-daemon: remove the bbappend for removed recipe
a7b0b40 firefox-l10n.inc: mangle download filename instead of DL_DIR

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
9d0376d packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
e93ba06 libshr-glib: blacklist because of random failures
not included in master yet:=20
26c0423 meta-shr, meta-fso: remove blacklisted recipes
544fa7a libsensmon: blacklist due to newer vala incompatibility

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWUEwRwAKCRA3VSO3ZXaA
HClMAKCKa5czqQPyJI0/gn1XtyJnO1ZFmgCeJCoCdIHbZMu01KQUu+gz/TKy55o=
=z/PR
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
