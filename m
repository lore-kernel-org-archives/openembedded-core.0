Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0532D77BE8;
	Mon,  5 Jun 2017 11:17:44 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id d73so21304049wma.0;
	Mon, 05 Jun 2017 04:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=0Bn2hE9DMtTzhROoN2ozPXNz/YwGPQs1EjgZy9vwYwY=;
	b=Fy4cJ06vx/vjPtks593rtjsLd/B+8lDoC8e1qvXJ2yhJsE1h0JX/Xa3L9FLmDFhiE7
	dwThwHyCaY3iR71w2qcPT9iLnUbvOuv3JP8FXQYkjLjYYoINQ9LOe4WiPWDoI3W53G63
	XtYIh5oGPZjbIOADtGN92pYpi0tdtCWTz41ViRXSvkv9u6SXkVPeyoze1yVfDYQt7fte
	tNgvFjKPKXHMoVLYfM5FI44fyEOeqKywC3181xLyBipYgRwdZTxmx6VAir6vIVST9qnM
	Zxw0AVlg7LUDwj/G69NpXp8ZoBrNmqpHUv3DulwpMuuLRe4syQcCB37ppwivbE/0dXzA
	OX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=0Bn2hE9DMtTzhROoN2ozPXNz/YwGPQs1EjgZy9vwYwY=;
	b=X8WBRfOYr/WVzmTFXzV1odrbc2EJn5QR8OrIXx9lR8qmIHMq0ErPmxaOosMg8D5fl3
	lSNzcBS87PKJh4aJRx5/LtIqa70rpLl7j1+7GQdqrV8KFWTl6628JiHRzDetvI4XIMHr
	BGKh4IMfzVxvN1OofsiaaGsX5uqhu7xkfDYkxNQiBP91PGfT24htLgZ2Z3xYXzBZb56J
	2Jkpg15J6PCy4GSqzddfYrZCWXHHyrf+6ihF+dalk0xXzJY8NeKVA8VuZZ0IO+N04q2O
	zbUlCD76ZVs5QM57WTMlf07Jd6sZHYC7arnFg4lmyxpQKyWylD3jLribDpb41FjbQK1o
	QWKg==
X-Gm-Message-State: AODbwcBYPqhm6X9UK7uG3YS03VmkKD5ivokQ/Bm3/e+42zqjPqea8s1l
	bvSdvnpMiNaBtq/3
X-Received: by 10.28.153.209 with SMTP id b200mr6853344wme.7.1496661464675;
	Mon, 05 Jun 2017 04:17:44 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id h73sm537070wme.18.2017.06.05.04.17.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Jun 2017 04:17:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Jun 2017 11:17:45 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170605091745.GD3089@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.2 (2017-04-18)
Subject: State of bitbake world, Failed tasks 2017-05-30
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
X-List-Received-Date: Mon, 05 Jun 2017 11:17:46 -0000
X-Groupsio-MsgNum: 98152
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AH+kv8CCoFf6qPuz"
Content-Disposition: inline

--AH+kv8CCoFf6qPuz
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
||2017-05-30	||2	||4	||3	||0	||0		||1		||5		||0		||0		||122		||3		||0		||0	=
	||0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-05-30 =3D=3D

INFO: jenkins-job.sh-1.8.21 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170603_205037.log

=3D=3D=3D common (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:=
do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.=
6.bb:do_configure

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/espeak/espeak_1.48.04.bb:do=
_compile

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-test/fwts/fwts_git.bb:do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (9) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemuarm.20170530_073924.log/ || http://errors.yoctoproject.org/Err=
ors/Build/38232/
|-
|| qemux86 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemux86.20170531_054848.log/ || http://errors.yoctoproject.org/Err=
ors/Build/38312/
|-
|| qemux86_64 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86-64.20170530_024127.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/38230/
|}

=3D=3D=3D PNBLACKLISTs (14) =3D=3D=3D

=3D=3D=3D QA issues (131) =3D=3D=3D
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
||0	||ldflags
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||122	||version-going-backwards
|-
||1	||libdir
|-
||3	||host-user-contaminated
|-
||5	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170531_073201.log/

No issues detected


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


count: 122	issue: version-going-backwards
fbida-2.10: Package version for package fbida-dbg went backwards which woul=
d break package feeds from (0:2.10-r0.52 to 0:2.10-r0.0) [version-going-bac=
kwards]
fbida-2.10: Package version for package fbida-dev went backwards which woul=
d break package feeds from (0:2.10-r0.52 to 0:2.10-r0.0) [version-going-bac=
kwards]
fbida-2.10: Package version for package fbida-doc went backwards which woul=
d break package feeds from (0:2.10-r0.52 to 0:2.10-r0.0) [version-going-bac=
kwards]
fbida-2.10: Package version for package fbida-locale went backwards which w=
ould break package feeds from (0:2.10-r0.52 to 0:2.10-r0.0) [version-going-=
backwards]
fbida-2.10: Package version for package fbida-staticdev went backwards whic=
h would break package feeds from (0:2.10-r0.52 to 0:2.10-r0.0) [version-goi=
ng-backwards]
fbida-2.10: Package version for package fbida went backwards which would br=
eak package feeds from (0:2.10-r0.52 to 0:2.10-r0.0) [version-going-backwar=
ds]
gnome-themes-2.32.1: Package version for package gnome-theme-crux went back=
wards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.1-r3.0=
) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-theme-highcontrastin=
verse went backwards which would break package feeds from (0:2.32.1-r3.47 t=
o 0:2.32.1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-theme-highcontrastla=
rgeprintinverse went backwards which would break package feeds from (0:2.32=
=2E1-r3.47 to 0:2.32.1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-theme-highcontrastla=
rgeprint went backwards which would break package feeds from (0:2.32.1-r3.4=
7 to 0:2.32.1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-theme-highcontrast w=
ent backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.3=
2.1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-theme-largeprint wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-theme-mist went back=
wards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.1-r3.0=
) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-dbg went back=
wards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.1-r3.0=
) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-dev went back=
wards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.1-r3.0=
) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-doc went back=
wards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.1-r3.0=
) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-af wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-am wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-ar wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-ast we=
nt backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32=
=2E1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-as wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-az wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-be+lat=
in went backwards which would break package feeds from (0:2.32.1-r3.47 to 0=
:2.32.1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-be wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-bg wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-bn-in =
went backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.=
32.1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-bn wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-br wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-bs wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-ca+val=
encia went backwards which would break package feeds from (0:2.32.1-r3.47 t=
o 0:2.32.1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-ca wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-crh we=
nt backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32=
=2E1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-cs wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-cy wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-da wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-de wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-dz wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-el wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-en-ca =
went backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.=
32.1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-en-gb =
went backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.=
32.1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-en+sha=
w went backwards which would break package feeds from (0:2.32.1-r3.47 to 0:=
2.32.1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-es wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-et wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-eu wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-fa wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-fi wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-fr wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-fur we=
nt backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32=
=2E1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-ga wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-gl wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-gu wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-he wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-hi wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-hr wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-hu wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-id wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-is wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-it wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-ja wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-ka wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-kn wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-ko wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-ku wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-ky wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-li wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-lt wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-lv wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-mai we=
nt backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32=
=2E1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-mg wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-mk wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-ml wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-mn wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-mr wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-ms wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-nb wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-nds we=
nt backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32=
=2E1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-ne wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-nl wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-nn wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-oc wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-or wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-pa wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-pl wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-pt-br =
went backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.=
32.1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-pt wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-ro wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-ru wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-rw wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-si wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-sk wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-sl wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-sq wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwardsng-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-te wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-th wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-tr wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-ug wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-uk wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-vi wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-wa wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-xh wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-zh-cn =
went backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.=
32.1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-zh-hk =
went backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.=
32.1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-locale-zh-tw =
went backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.=
32.1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes-staticdev wen=
t backwards which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.=
1-r3.0) [version-going-backwards]
gnome-themes-2.32.1: Package version for package gnome-themes went backward=
s which would break package feeds from (0:2.32.1-r3.47 to 0:2.32.1-r3.0) [v=
ersion-going-backwards]
hwloc-1.11.5: Package version for package hwloc-dbg went backwards which wo=
uld break package feeds from (0:1.11.5-r0.1 to 0:1.11.5-r0.0) [version-goin=
g-backwards]
hwloc-1.11.5: Package version for package hwloc-dev went backwards which wo=
uld break package feeds from (0:1.11.5-r0.1 to 0:1.11.5-r0.0) [version-goin=
g-backwards]
hwloc-1.11.5: Package version for package hwloc-doc went backwards which wo=
uld break package feeds from (0:1.11.5-r0.1 to 0:1.11.5-r0.0) [version-goin=
g-backwards]
hwloc-1.11.5: Package version for package hwloc-locale went backwards which=
 would break package feeds from (0:1.11.5-r0.1 to 0:1.11.5-r0.0) [version-g=
oing-backwards]
hwloc-1.11.5: Package version for package hwloc-staticdev went backwards wh=
ich would break package feeds from (0:1.11.5-r0.1 to 0:1.11.5-r0.0) [versio=
n-going-backwards]
hwloc-1.11.5: Package version for package hwloc went backwards which would =
break package feeds from (0:1.11.5-r0.1 to 0:1.11.5-r0.0) [version-going-ba=
ckwards]
hwloc-1.11.5: Package version for package libhwloc went backwards which wou=
ld break package feeds from (0:1.11.5-r0.1 to 0:1.11.5-r0.0) [version-going=
-backwards]
xstdcmap-1.0.3: Package version fo:1.0.3-r0.46 to 0:1.0.3-r0.0) [version-go=
ing-backwards]
xstdcmap-1.0.3: Package version for package xstdcmap went backwards which w=
ould break package feeds from (0:1.0.3-r0.46 to 0:1.0.3-r0.0) [version-goin=
g-backwards]


count: 3	issue: host-user-contaminated
glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-ar-jo/usr/lib/loc=
ale/ar_JO/LC_PAPER is owned by uid 3004, which is the same as the user runn=
ing bitbake. This may be due to host contamination [host-user-contaminated]
glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-de-at/usr/lib/loc=
ale/de_AT/LC_MEASUREMENT is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-contami=
nated]
glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-es-sv.iso-8859-1/=
usr/lib/locale/es_SV.ISO-8859-1/LC_MESSAGES/SYS_LC_MESSAGES is owned by uid=
 3004, which is the same as the user running bitbake. This may be due to ho=
st contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
362f604 bitbake-user-manual: Updated INHERIT descriptions
not included in master yet:=20
de83197 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
4aa6cdf tune-mips32*.inc: use consistent comments across all three .inc fil=
es
not included in master yet:=20
3732beb v86d,qemuboot-x86.inc: use KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PRO=
BECONF for uvesafb instead of fbsetup init script
ec01097 Revert "mesa: Contain configure search for llvm"
e35ed4e report-error: Allow to upload reports automatically
708ef62 buildhistory.bbclass: metadata-revs show repo parent
3171184 metadata-revs: provide more information
8640e24 sstate-sysroot-cruft.sh: Extend the whitelist
59b1b71 python-3.5: add runtime dependency from python3-compression on pyth=
on3-misc
bf35dee package_manager: flush installed_pkgs file before oe-pkgdata-util u=
ses it
8e79c8d sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning=
 and separated with dash
bd368e1 qemux86: Add identical qemux86copy variant for tests
12d6656 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
b063789 libgpiod: add new recipe
not included in master yet:=20
7ba2eea libgpiod: Add new recipe
f85506e dnsmasq: disable the service by default
d435b35 freeradius: add new recipe
d7de79f keepalived: add new recipe
029fc4c vblade: update to version 22
c3f5193 geoipupdate: 2.2.2 -> 2.3.1
ea0b5ec ifenslave: 2.7 -> 2.9
b476cb1 drbd-utils: remove /var/lock to avoid conflict
4118c8b rrdtool: add gettext-native dependency
8566bb1 libsexy: Added glib-2.0-native dependency and removed PNBLACKLIST
5b51d54 xstdcmap: Change libxmu from RDEPENDS -> DEPENDS and unblacklist xs=
tdcmap
f148756 wireguard: bump version to latest snapshot 0.0.20170517
811e13c fwts: Bump SRCREV to latest past 17.03.00 release
22bbbfa espeak, espeak-data: Update to 1.48.04 release
1387784 rygel: Update to 0.34.0
8379d89 opencv: Make opencv-ts create share library intead of static
0fcb2d3 hwloc: Add
2c7fbaa nginx: update development version to 1.13.0
5f40c46 nginx: update stable version to 1.12.0
ba58375 python-pbr: update to version 3.0.0
30c983d pythoto use /usr/bin/env python
147dd0b python-sdnotify/python3-sdnotify: Add new recipe
079c492 xfce4-vala: update vala api to 0.36
7982ae8 dbus-daemon-proxy: inherit pkgconfig, unblacklist and set package v=
ersion
d8ff049 opensaf: Add -latomic to LDFLAGS
539f352 gd : CVE-2016-6906
75eaaec xf86-video-mga: add new recipe
35a8751 ssiapi: add new recipe
bc6592f meson: Suport for c++ cross-compilation
6b6c38e meson: Use pkgconfig-native for the native tools
cd964a3 open-isns: fix QA issue
c297c8a dante: fix unknown-configure-option QA issue
6a28353 libextutils-helpers-perl: update to version 0.026
f200826 libdevel-globaldestruction-perl: update to version 0.14
db8b0a5 libdbd-sqlite-perl: update to version 1.54
a3755bc libcapture-tiny-perl: update to version 0.46
fc6f2b0 libxml-libxml-perl: update to version 2.0129
2d32f3c snort: enable static daq
938a4a5 net-snmp: supported cross compile for the perl embedded and perl mo=
dules
02b54a2 opencv: fix building with PACKAGECONFIG "dnn" enabled.
8696270 libteam: Initial support
e3bd15f python-babel: update to version 2.4.0
b6d3171 python-progress: update to version 1.3 and add RDEPENDS
edd25be python-pysocks: update to version 1.6.7
b56d571 python-typing: update to version 3.6.1
28f5bce nodejs: update to 4.8.3
32aa718 traceroute: Move manual pages from mandir to man8 under it
fe3a9a0 recipes-support: Move libgpiod to meta-oe directory
ed89e23 gnome-themes: remove PNBLACKLIST
f4f25fc python3-pyparted: add a python3 recipe
20ddb8e python3-pyudev: add a python3 recipe
b4024b8 lvm2/libdevmapper: fix invoking lvcreate failed
c8c3101 meta-perl: Make glibc-gconv deps apply for glibc based systems alone
2dcbcdb nopoll: Disable doc generation
7074d07 cifs-utils 6.6 -> 6.7
3e9ecaf recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
6605c48 python-pyqt5: Add recipe.
not included in master yet:=20

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

--AH+kv8CCoFf6qPuz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWTUhrwAKCRA3VSO3ZXaA
HNSqAJ4knzw0MQLJ3UyCw6IUEcUVNt9mUwCcCZ7S5Gw89zmFutFoqO42cwZ69lw=
=/6JU
-----END PGP SIGNATURE-----

--AH+kv8CCoFf6qPuz--
