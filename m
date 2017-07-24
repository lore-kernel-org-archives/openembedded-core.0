Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 14D647829F;
	Mon, 24 Jul 2017 17:30:02 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id y43so109041151wrd.3;
	Mon, 24 Jul 2017 10:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=FzQqGCeUr1L0OvHGQf8ZM6yz3qGjgNPrlt/b8T0lDdI=;
	b=oKG0kthjVUcYpVF8V3WncX/He+bqb6Q39sW4eMZBwjGFKzB73NEhFTShXeDHkqmRQq
	CVcgu5wcvoKj+wBz0gpwFDSTr3f0O9FdokQKHLimrHMsmH+kwb0xmFs5SpG6p5M5I/sa
	r3ir9qtaQyU9bydA7G4SA/nZWJMetm3pnqywaGi2HSlfiKuciZa/bNGuHbkF0AlDmXhW
	YERnbh9NqMoDeNzqHM/P+4l9X+7n1xHn9ufvLyq1t3P0kNkrnLkgJ4XIYup5FxU4ROQK
	q1Ptv4LAwhiShamMHhrttRAjb28t+dbbsLPhmR2aOmr2fR3sEDFoyQwLAvqzqz+eSFuy
	T9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=FzQqGCeUr1L0OvHGQf8ZM6yz3qGjgNPrlt/b8T0lDdI=;
	b=ZQ0miTwyX24upxsLBteuiLrCm+p1wIUH9d8vHbfRj6cxxNYu8ME8wBfGlqCEHIjb/0
	ZdDIRYVYPhdppT97lnUkUPcQwaGaxQTCVbgl6RONuEDiX5TmrdxOUWwXRaC3vm9pewRw
	1D43nW3Otskvwh0qIeea01sgVJ6PdQDwMjh1KUwPBvT1JPPK2q1/PxxlPjodKeuw0XAb
	sZzArIe55fjFBfouzEAsUDwgIYPE+v9X3P77lxH9Vj9CpBof/zWxLKU9nlLGVnzp4HBf
	9RIiekN40MMov299gOlFeLzq8VKJl4xjtdxoZ7DgxEUypUFSzJ/Pz8J0mScRV0Ft3IZq
	necQ==
X-Gm-Message-State: AIVw1115AzAIu6mN19OEC3DBCjFUdEj17BzuRWQaj0Tz8LAokQ3AJaXT
	/stXSJONZU3PT/UJ
X-Received: by 10.223.163.85 with SMTP id d21mr16044211wrb.33.1500917403359;
	Mon, 24 Jul 2017 10:30:03 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id u62sm8436361wmd.5.2017.07.24.10.30.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Jul 2017 10:30:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 24 Jul 2017 19:31:02 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170724173102.GA3002@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.3 (2017-05-23)
Subject: State of bitbake world, Failed tasks 2017-07-22
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
X-List-Received-Date: Mon, 24 Jul 2017 17:30:03 -0000
X-Groupsio-MsgNum: 100664
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline

--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

qemux86 shows few more issues, because it was built from slightly
older metadata (I've dropped 4 patches from master-next after this build
- before qemux86-64 and qemuarm were executed).

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
||2017-07-22	||2	||5	||1	||0	||0		||0		||5		||0		||0		||22		||0		||0		||0		=
||0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-07-22 =3D=3D

INFO: jenkins-job.sh-1.8.25 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170723_091050.log

=3D=3D=3D common (1) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb:do_=
compile

=3D=3D=3D qemux86 (4) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-support/usermode/usermode_1.111.=
bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.b=
b:do_compile
    * meta-openembedded/meta-oe/recipes-extended/efivar/efivar_0.31.bb:do_p=
atch
    * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (8) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemuarm.20170722_055737.log/ || http://errors.yoctoproject.org/Err=
ors/Build/41767/
|-
|| qemux86 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemux86.20170721_024317.log/ || http://errors.yoctoproject.org/Err=
ors/Build/41746/
|-
|| qemux86_64 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86-64.20170722_025112.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/41770/
|}

=3D=3D=3D PNBLACKLISTs (14) =3D=3D=3D

=3D=3D=3D QA issues (27) =3D=3D=3D
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
||22	||version-going-backwards
|-
||5	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170723_052536.log/

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


count: 0	issue: libdir


count: 5	issue: textrel
chromium-54.0.2810.2: ELF binary '/tmp/work/i586-oe-linux/chromium/54.0.281=
0.2-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations in =
=2Etext [textrel]
chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chromiu=
m-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium=
/chrome' has relocations in .text [textrel]
corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264' has re=
locations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 22	issue: version-going-backwards
pidgin-otr-4.0.0: Package version for package pidgin-otr-dbg went backwards=
 which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) [versi=
on-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-dev went backwards=
 which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) [versi=
on-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-doc went backwards=
 which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) [versi=
on-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-ar went bac=
kwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) =
[version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-de went bac=
kwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) =
[version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-el went bac=
kwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) =
[version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-es went bac=
kwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) =
[version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-fa went bac=
kwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) =
[version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-fr went bac=
kwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) =
[version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-hu went bac=
kwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) =
[version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-it went bac=
kwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) =
[version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-my-mm went =
backwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.=
0) [version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-nl went bac=
kwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) =
[version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-nn went bac=
kwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) =
[version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-pl went bac=
kwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) =
[version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-ru went bac=
kwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) =
[version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-sk went bac=
kwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) =
[version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-sv went bac=
kwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) =
[version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-vi went bac=
kwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) =
[version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-locale-zh-cn went =
backwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.=
0) [version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr-staticdev went bac=
kwards which would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) =
[version-going-backwards]
pidgin-otr-4.0.0: Package version for package pidgin-otr went backwards whi=
ch would break package feeds from (0:4.0.0-r0.2 to 0:4.0.0-r0.0) [version-g=
oing-backwards]


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
6fa0775 fetch2/wget.py: improve error handling during sstate check
not included in master yet:=20
27338c3 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
514e9be bluez5: upgrade to 5.46
not included in master yet:=20
0d1fda4 report-error: Allow to upload reports automatically
a0ba29e buildhistory.bbclass: metadata-revs show repo parent
6ff3b59 metadata-revs: provide more information
fe62285 qemux86: Add identical qemux86copy variant for tests

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
0388514 autofs: Add build dependency on libnsl2
91ac8b7 openhpi: Fix build on 64bit platforms e.g. aarch64
4e2ff96 security_flags.inc: Delete
bab9f81 pptp-linux: Upgrade to 1.9.0
82c41b3 ebtables: replace ebtables-save perl script with bash rewrite
157ce32 librcf: RDEPENDS on protobuf, json-spirit
86f9649 fuse: Correct runlevels and startup order
d687f2c recipes-utils: Add recipe for udevil
e502443 klibc: Fix build issue when default ISA is not thumb
d6ea68d libteam: Upgrade to 1.27
5dec350 sox: Fix build with musl
04f66db webrtc-audio-processing: Link with libexecinfo on musl
b421475 cdparanoia: Fix build with musl
cd075a5 lightmediascanner: Define comparison_fn_t if undefined
f35bbef lmbench: Fix build with musl
49ccdec xfce4-netload-plugin: Do not include sys/sysctl.h
c6e5aa1 imsettings: Fix build with musl
46eddb4 gedit: Define ACCESSPERMS if not defined already
df54a90 onboard: Fix build with musl
99877d3 libgtop: Fix build with musl
4c7c04c netdata: Upgrade to 1.6.0
f8428d5 can-utils: Update to tip of master
f33bcba kexec-tools-klibc: Fix build with musl
704a8e6 dracut: Upgrade to 045
30aa7d8 yaffs2-utils: Fix build with musl
8c600a5 logfsprogs: Rename setkey API to _setkey to not conflict with libc
d26539d unionfs-fuse: Fix build with musl
068cf71 xfsdump: Fix build with musl
6d04761 nmon: Upgrade to 16g
5fdec50 metacity: Fix build with musl by defining _GNU_SOURCE
304791e monkey: Link in libexecinfo on musl
aba1895 aufs-util: Upgrade to 4.4 release
21f69db uftrace: add recipe
28d5c2e iperf3: Fix missing stdint.h and do not link with -pg
e3261a5 v4l-utils: Fix build with musl
fec482c pimd: Upgrade to 2.3.2
a65b93f open-vm-tools: remove custom procps logic
9dcf556 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
1135955 rdate: Define logwtmp if libc !=3D glibc
e9f8295 multipath-tools: Include limits.h for PATH_MAX
5b9cbfe a2jmidid: Link with libexecinfo on musl
dfd5938 netkit-ftp: Include sys/types.h for u_long definition
95603b0 postfix: Disable nis support on musl
ef74904 zlog: Fix build on 64bit targets and musl
9d5d5e8 grubby: Link with libexecinfo on musl
63c27fe numactl: Update to latest from github
ecf75bb linuxptp: Upgrade to 1.8
efd7516 sessreg: Fix build on musl
e66c242 phonet-utils: Fix build with musl
a57b3f7 nicstat: Fix build on musl/x86_64
631a6e6 open-vm-tools: Fix build with musl
07dddc0 lm_sensors: Fix build on musl
783fb77 glade: add recipe 3.20.0
772ab78 python3-coverage: add recipe 4.4.1
7b76a5a python3-langtable: add recipe 0.0.37
722cf36 python3-ntplib: add recipe 0.3.3
67fbc50 python3-ordered-set: add recipe 2.0.2
69137b8 python3-requests-file: add recipe 1.4.2
cb1c53b python3-requests-ftp: add recipe 0.3.1
3f29689 python3-pid: add recipe 2.1.1
9db3cd1 python3-prctl: add recipe 1.6.1
7869e13 xf86-video-nouveau: bump version to 1.0.15
dabf8f5 python-unidiff: adds Python3 support
ca09e45 sdparm: add mirror
4c3e2d5 sg3-utils: add mirror
d66655e python-chardet.inc: update build dependency
8d131c0 python-sqlalchemy, python3-sqlalchemy: update to 1.1.11
7ed4f99 python-paho-mqtt, python3-paho-mqtt: update to 1.3.0
8207e9b python-requests, python3-requests: update to 2.28.1
c6001eb flashrom: Upgrade to 0.9.9
53dde0f postgresql: Do not link with libnsl on musl
03751ae zeroconf: Fix build with musl
2d3efdf libgnomekbd: 2.32 -> 3.22
f2775ce python3-pykickstart: add recipe 2.35
98dd47b python3-meh: add recipe 0.45
5791ae6 isomd5sum: add recipe 1.2.1
ffda799 libtar: add recipe 1.2.20
29e24a6 python-pytun: addition of recipe for python and python3 using pipy
4300ed8 netperf: change SRC_URI to git repository
e569f80 ippool: Fix build errors found with hardening flags
dd25bba gimp: remove libart-lgpl build dependency
dd3578a fribidi_0.19.7.bb: set CVE_PRODUCT to gnu_fribidi
d15c30d krb5_1.15.1.bb: set CVE_PRODUCT to kerberos
7e878b1 udisks2_2.1.8.bb: set CVE_PRODUCT to udisks
5e26bc7 keybinder: add recipe 3.0
8325255 volume-key: add recipe 0.3.9
790b086 satyr: add recipe 0.23
e2e1a76 pidgin-otr: unblacklist
cade640 recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
045e39b qt5-creator: Link with libexecinfo on musl
not included in master yet:=20
3c4f2cb python-pyqt5: include QtWidgets module
c2907d2 qt5-git.inc: set CVE_PRODUCT to qt
0c5a31a qtbase: add ptest
6610b80 qwt-qt5.inc: fix QA warning

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
6c063d6 Merge pull request #53 from kraj/kraj/master
not included in master yet:=20
8ca260e gnome-settings-daemon: remove the bbappend for removed recipe

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
e58c854 alsa-utils
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
1fe2b3b android-system-image-tenderloin: update Android image
not included in master yet:=20
2bc4aaf meta-shr, meta-fso: remove blacklisted recipes

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWXYpVgAKCRA3VSO3ZXaA
HOtZAJ0e/sHlcmTleqfN65Cwh9f/NQsBuwCgrchMyHNmXDPEsZGi5ra0dFw6Iqo=
=p/J3
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
