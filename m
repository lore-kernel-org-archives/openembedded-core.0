Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8128877F58;
	Fri, 19 May 2017 19:12:44 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id z52so21988951wrc.2;
	Fri, 19 May 2017 12:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=R/26civZrJ2o0VwpbaSQT+KSIPkyAJBl9CiE6+ulL84=;
	b=O6O0ri+YDfQtOpf9XC6Ip3zHaWyhl/xb665lcjruWbSXDhsZgS9wFSTkq76TJNnOgs
	s4A3tZM75glQpIvBBvsadi1jwFlbH3M/ldrG+2dWouiXVpJXwsoDmxA172s5kLGgNT7t
	UWHc1D5w64IntyyEfwlQV5IE06I+WlkkxFGGSqZQznGr/zEJznc2MQZbKs0c3XzddoqO
	uyYHO/r52xq8xze8WxifL7aunzz4+ZrOzcK6Rw/LgN20zSXWWKrSaNo8dh6WWKZHOEmI
	VXbSr6lvybwPQ86bYtzm206FI3i0uJ3TzaxaDKPbiwHwdekWF5Ujy0eDYFx9BJdkDYXW
	RM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=R/26civZrJ2o0VwpbaSQT+KSIPkyAJBl9CiE6+ulL84=;
	b=lqnuQFInMNuQQ7JQxt+g47td0GJZoyhWB5sFNjwvIEOLCVktelIMr28m3ydkQeh+XJ
	iCjNfX3EdSA12i43MI27KIi2K029XsQ0e5yBK3UU6KItRBblOqhKnbZLLI5KsvRZ6CLo
	hiKTR0u5yDLGG6AFcttW2+9gFVZiCErVAfsZtUepbciYqKPn/9CdXtCLWfhfkQ+lKwEm
	K7QhoOxJvCcS0slcrZE01Q7p0XR9dQlU3p1u31ivry4KV7PdLfwAyiw5Ey4sFeHZiSnS
	rbnMRBGxVKWOu5kelxcHHKI62gEWU4qOc3jhyplf+6xdFRWgj1nvIS0mhz3xsetQXQ5O
	M1FA==
X-Gm-Message-State: AODbwcA028XdTLel3pBN8ortgabX9EnYAUj+a2Lq6BXnmlzTVbjyeiCv
	IyQ0NHme14GTSX3j
X-Received: by 10.223.170.197 with SMTP id i5mr3704321wrc.143.1495221164895;
	Fri, 19 May 2017 12:12:44 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r29sm3407244wra.18.2017.05.19.12.12.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 19 May 2017 12:12:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 19 May 2017 21:13:39 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170519191339.GA11044@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.2 (2017-04-18)
Subject: State of bitbake world, Failed tasks 2017-05-17
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
X-List-Received-Date: Fri, 19 May 2017 19:12:46 -0000
X-Groupsio-MsgNum: 97535
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
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
||2017-05-17	||7	||5	||6	||0	||0		||1		||4		||0		||0		||98		||0		||1		||0		=
||0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-05-17 =3D=3D

INFO: jenkins-job.sh-1.8.21 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170519_090918.log

=3D=3D=3D common (4) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.6.0esr.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.=
6.bb:do_configure
    * meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.b=
b:do_configure
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:do_co=
mpile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:=
do_compile
    * meta-openembedded/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb:do_c=
ompile
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb:do_com=
pile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geo=
de_2.11.18.bb:do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (18) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemuarm.20170516_235830.log/ || http://errors.yoctoproject.org/Err=
ors/Build/37823/
|-
|| qemux86 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemux86.20170518_065557.log/ || http://errors.yoctoproject.org/Err=
ors/Build/37941/
|-
|| qemux86_64 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86-64.20170517_022931.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/37932/
|}

=3D=3D=3D PNBLACKLISTs (12) =3D=3D=3D

=3D=3D=3D QA issues (104) =3D=3D=3D
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
||1	||installed-vs-shipped
|-
||1	||libdir
|-
||4	||textrel
|-
||98	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170518_002621.log/


    * ERROR: Nothing PROVIDES 'lksctp-tools' (but /home/jenkins/oe/world/sh=
r-core/meta-openembedded/meta-networking/recipes-protocols/freediameter/fre=
ediameter_1.2.1.bb DEPENDS on or otherwise requires it)
    * ERROR: lksctp-tools was skipped: Recipe is blacklisted: BROKEN: fails=
 to link against sctp_connectx symbol
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /ho=
me/jenkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing PROVIDES 'lksctp-tools' (but /home/jenkins/oe/world/sh=
r-core/meta-openembedded/meta-networking/recipes-protocols/freediameter/fre=
ediameter_1.2.1.bb DEPENDS on or otherwise requires it)
    * ERROR: lksctp-tools was skipped: Recipe is blacklisted: BROKEN: fails=
 to link against sctp_connectx symbol
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/j=
enkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing PROVIDES 'lksctp-tools' (but /home/jenkins/oe/world/sh=
r-core/meta-openembedded/meta-networking/recipes-protocols/freediameter/fre=
ediameter_1.2.1.bb DEPENDS on or otherwise requires it)
    * ERROR: lksctp-tools was skipped: Recipe is blacklisted: BROKEN: fails=
 to link against sctp_connectx symbol
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemuarm in /home/j=
enkins/oe/world/shr-core/tmp-glibc/stamps

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
meta-oe/recipes-graphics/fbida/fbida_2.10.bb:PNBLACKLIST[fbida] ?=3D "Fails=
 to build with RSS http://errors.yoctoproject.org/Errors/Details/130677/ - =
the recipe will be removed on 2017-09-01 unless the issue is fixed"
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


count: 1	issue: libdir
qwt-qt5-dbg: found library in wrong location: /usr/plugins/designer/.debug/=
libqwt_designer_plugin.so [libdir]


count: 4	issue: textrel
chromium-54.0.2810.2: ELF binary '/tmp/work/i586-oe-linux/chromium/54.0.281=
0.2-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations in =
=2Etext [textrel]
chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chromiu=
m-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium=
/chrome' has relocations in .text [textrel]
corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps

count: 98	issue: version-going-backwards
dbus-daemon-proxy-0.0.0+gitrAUTOINC+1226a0a137: Package version for package=
 dbus-daemon-proxy-dbg went backwards which would break package feeds from =
(0:0.0.0+gitr0+1226a0a137-r1.49 to 0:0.0.0+gitr0+1226a0a137-r1.0) [version-=
going-backwards]
dbus-daemon-proxy-0.0.0+gitrAUTOINC+1226a0a137: Package version for package=
 dbus-daemon-proxy-dev went backwards which would break package feeds from =
(0:0.0.0+gitr0+1226a0a137-r1.49 to 0:0.0.0+gitr0+1226a0a137-r1.0) [version-=
going-backwards]
dbus-daemon-proxy-0.0.0+gitrAUTOINC+1226a0a137: Package version for package=
 dbus-daemon-proxy-doc went backwards which would break package feeds from =
(0:0.0.0+gitr0+1226a0a137-r1.49 to 0:0.0.0+gitr0+1226a0a137-r1.0) [version-=
going-backwards]
dbus-daemon-proxy-0.0.0+gitrAUTOINC+1226a0a137: Package version for package=
 dbus-daemon-proxy-locale went backwards which would break package feeds fr=
om (0:0.0.0+gitr0+1226a0a137-r1.49 to 0:0.0.0+gitr0+1226a0a137-r1.0) [versi=
on-going-backwards]
dbus-daemon-proxy-0.0.0+gitrAUTOINC+1226a0a137: Package version for package=
 dbus-daemon-proxy-staticdev went backwards which would break package feeds=
 from (0:0.0.0+gitr0+1226a0a137-r1.49 to 0:0.0.0+gitr0+1226a0a137-r1.0) [ve=
rsion-going-backwards]
dbus-daemon-proxy-0.0.0+gitrAUTOINC+1226a0a137: Package version for package=
 dbus-daemon-proxy went backwards which would break package feeds from (0:0=
=2E0.0+gitr0+1226a0a137-r1.49 to 0:0.0.0+gitr0+1226a0a137-r1.0) [version-go=
ing-backwards]
rygel-0.28.2: Package version for package rygel-dbg went backwards which wo=
uld break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [version-goi=
ng-backwards]
rygel-0.28.2: Package version for package rygel-dev went backwards which wo=
uld break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [version-goi=
ng-backwards]
rygel-0.28.2: Package version for package rygel-doc went backwards which wo=
uld break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [version-goi=
ng-backwards]
rygel-0.28.2: Package version for package rygel-locale-af went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-ar went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-as went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-bg went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-bn-in went backwards=
 which would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [ve=
rsion-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-bs went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-ca+valencia went bac=
kwards which would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.2=
6) [version-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-ca went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-cs went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-da went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-de went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-el went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-en-gb went backwards=
 which would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [ve=
rsion-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-eo went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-es went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-et went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-eu went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-fa went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-fi went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-fr went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-gl went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-gu went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-he went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-hi went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-hu went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-id went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-it went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-ja went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-kn went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-ko went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-lt went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-lv went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-ml went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-nb went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-ne went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-nl went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-oc went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-pa went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-pl went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-pt-br went backwards=
 which would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [ve=
rsion-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-pt went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-ro went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-ru went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-sk went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-sl went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-sr+latin went backwa=
rds which would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) =
[version-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-sr went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-sv went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-ta went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-te went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-tg went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-th went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-tr went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-ug went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-uk went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-vi went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-zh-cn went backwards=
 which would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [ve=
rsion-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-zh-hk went backwards=
 which would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [ve=
rsion-going-backwards]
rygel-0.28.2: Package version for package rygel-locale-zh-tw went backwards=
 which would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [ve=
rsion-going-backwards]
rygel-0.28.2: Package version for package rygel-meta went backwards which w=
ould break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [version-go=
ing-backwards]
rygel-0.28.2: Package version for package rygel-plugin-external went backwa=
rds which would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) =
[version-going-backwards]
rygel-0.28.2: Package version for package rygel-plugin-gst-launch went back=
wards which would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26=
) [version-going-backwards]
rygel-0.28.2: Package version for package rygel-plugin-media-export went ba=
ckwards which would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.=
26) [version-going-backwards]
rygel-0.28.2: Package version for package rygel-plugin-mpris went backwards=
 which would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [ve=
rsion-going-backwards]
rygel-0.28.2: Package version for package rygel-plugin-playbin went backwar=
ds which would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [=
version-going-backwards]
rygel-0.28.2: Package version for package rygel-plugin-ruih went backwards =
which would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [ver=
sion-going-backwards]
rygel-0.28.2: Package version for package rygel-staticdev went backwards wh=
ich would break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [versi=
on-going-backwards]
rygel-0.28.2: Package version for package rygel went backwards which would =
break package feeds from (0:0.34.0-r0.0 to 0:0.28.2-r0.26) [version-going-b=
ackwards]
wvdial-1.61: Package version for package wvdial-dbg went backwards which wo=
uld break package feeds from (0:1.61-r0.18 to 0:1.61-r0.0) [version-going-b=
ackwards]
wvdial-1.61: Package version for package wvdial-dev went backwards which wo=
uld break package feeds from (0:1.61-r0.18 to 0:1.61-r0.0) [version-going-b=
ackwards]
wvdial-1.61: Package version for package wvdial-doc went backwards which wo=
uld break package feeds from (0:1.61-r0.18 to 0:1.61-r0.0) [version-going-b=
ackwards]
wvdial-1.61: Package version for package wvdial-locale went backwards which=
 would break package feeds from (0:1.61-r0.18 to 0:1.61-r0.0) [version-goin=
g-backwards]
wvdial-1.61: Package version for package wvdial-staticdev went backwards wh=
ich would break package feeds from (0:1.61-r0.18 to 0:1.61-r0.0) [version-g=
oing-backwards]
wvdial-1.61: Package version for package wvdial went backwards which would =
break package feeds from (0:1.61-r0.18 to 0:1.61-r0.0) [version-going-backw=
ards]
wvstreams-4.6.1: Package version for package libuniconf-dbg went backwards =
which would break package feeds from (0:4.6.1-r0.14 to 0:4.6.1-r0.0) [versi=
on-going-backwards]
wvstreams-4.6.1: Package version for package libuniconf went backwards whic=
h would break package feeds from (0:4.6.1-r0.14 to 0:4.6.1-r0.0) [version-g=
oing-backwards]
wvstreams-4.6.1: Package version for package libwvstreams-base-dbg went bac=
kwards which would break package feeds from (0:4.6.1-r0.14 to 0:4.6.1-r0.0)=
 [version-going-backwards]
wvstreams-4.6.1: Package version for package libwvstreams-base went backwar=
ds which would break package feeds from (0:4.6.1-r0.14 to 0:4.6.1-r0.0) [ve=
rsion-going-backwards]
wvstreams-4.6.1: Package version for package libwvstreams-extras-dbg went b=
ackwards which would break package feeds from (0:4.6.1-r0.14 to 0:4.6.1-r0.=
0) [version-going-backwards]
wvstreams-4.6.1: Package version for package libwvstreams-extras went backw=
ards which would break package feeds from (0:4.6.1-r0.14 to 0:4.6.1-r0.0) [=
version-going-backwards]
wvstreams-4.6.1: Package version for package uniconfd-dbg went backwards wh=
ich would break package feeds from (0:4.6.1-r0.14 to 0:4.6.1-r0.0) [version=
-going-backwards]
wvstreams-4.6.1: Package version for package uniconfd went backwards which =
would break package feeds from (0:4.6.1-r0.14 to 0:4.6.1-r0.0) [version-goi=
ng-backwards]
wvstreams-4.6.1: Package version for package wvstreams-dbg went backwards w=
hich would break package feeds from (0:4.6.1-r0.14 to 0:4.6.1-r0.0) [versio=
n-going-backwards]
wvstreams-4.6.1: Package version for package wvstreams-dev went backwards w=
hich would break package feeds from (0:4.6.1-r0.14 to 0:4.6.1-r0.0) [versio=
n-going-backwards]
wvstreams-4.6.1: Package version for package wvstreams-doc went backwards w=
hich would break package feeds from (0:4.6.1-r0.14 to 0:4.6.1-r0.0) [versio=
n-going-backwards]
wvstreams-4.6.1: Package version for package wvstreams-locale went backward=
s which would break package feeds from (0:4.6.1-r0.14 to 0:4.6.1-r0.0) [ver=
sion-going-backwards]
wvstreams-4.6.1: Package version for package wvstreams-staticdev went backw=
ards which would break package feeds from (0:4.6.1-r0.14 to 0:4.6.1-r0.0) [=
version-going-backwards]
wvstreams-4.6.1: Package version for package wvstreams-valgrind went backwa=
rds which would break package feeds from (0:4.6.1-r0.14 to 0:4.6.1-r0.0) [v=
ersion-going-backwards]
wvstreams-4.6.1: Package version for package wvstreams went backwards which=
 would break package feeds from (0:4.6.1-r0.14 to 0:4.6.1-r0.0) [version-go=
ing-backwards]

count: 0	issue: host-user-contaminated


count: 1	issue: installed-vs-shipped
rygel: 3 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
c46f183 lib/bb/fetch2: fix typo in conflicting revision message
not included in master yet:=20
6c5d257 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
138f3e3 byacc: remove the recipe
not included in master yet:=20
7553861 v86d,qemuboot-x86.inc: use KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PRO=
BECONF for uvesafb instead of fbsetup init script
475cd15 Revert "mesa: Contain configure search for llvm"
b3193df report-error: Allow to upload reports automatically
dd2fd3a buildhistory.bbclass: metadata-revs show repo parent
e974598 metadata-revs: provide more information
bfc30ec sstate-sysroot-cruft.sh: Extend the whitelist
137662e qemux86: Add identical qemux86copy variant for tests
5c1109c recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
d32ae6c sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning=
 and separated with dash

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
fc03b3d drbd-utils: fix dependency for perl under small-fs
not included in master yet:=20
62807c8 dnsmasq: disable the service by default
83e01e4 libdevmapper: enable native support.
bfdbef7 python-pyudev: correct LICENSE from GPLv2 to LGPLv2.1+
b765018 python-networkmanager: Recipe for python-networkmanager
aae8a72 wxstreams: fix build with gcc-6 (patch from Debian). Remove blackli=
sts for wvstreams and wvdial
2e008e2 crash: fix build failure with mips
2fd67c0 xfsdump: 3.1.4 -> 3.1.6
830608a xfsdump: fix do_configure failure and remove from blacklist
bb151fb juce: Updated JUCE to 5.0.1
ff94c30 openocd: Add recipe for openocd
6b83a52 libmicrohttpd: Fix a segmentation fault on upgrade error
3d62c27 lzip: remove recipe
2c5a1e2 glcompbench: remove the recipe
eb09eb4 portmap.bbappend: remove the file
a2d7b57 glmark2: depend on modern libpng
3cd7155 python-six: re-add the recipe for Python 2.x
293508b mailx: add the recipe
8e5a5ba gupnp-av: Update to 0.12.10
8bf9617 rygel: Update to 0.34.0
b7657ed gnome-bluetooth: Look for x11 in distro features
6341579 glmark2: Update to latest and fix build on pi
23603b9 phoronix-test-suite: remove it from blacklist
4ebe667 php: fix install error for libphp*.so
5c17f31 dleyna-server: Update to 0.6.0 release
2b2399b gupnp-dlna: Upgrade to 0.10.5
0afbdce gupnp-tools: Update to 0.8.13
1911fab gssdp: Upgrade to 1.0.2
5241f91 gupnp: Update to 1.0.2
fa6791f gupnp-igd: Upgrade to 0.2.4
c8d0ea5 media-service-upnp, renderer-service-upnp: Delete
80a4d7b libsdl2-ttf: Check for x11 and opengl in distro features
2826248 kodi: Fix build when x11 is disabled
722a693 luajit: 2.0.4 -> 2.0.5
f38cbdc freeradius: add new recipe
c9c84bc nginx: use consistent pid file location accross recipe and init scr=
ipts
45882c3 miniupnpd: improve recipe
59d2415 protobuf: update to 3.3.0
6789bbd libssh2: 1.7.0 -> 1.8.0
4d250bf libndp: switch to github uri. libndp.org is unstable
7a6d7f9 libndp: Update patch with upstream version.
b3d73a3 sip: update recipe to 4.19.2.
8126c9f lua: 5.3.3 -> 5.3.4
5fe0089 keepalived: add new recipe
fb68997 freediameter: add new recipe
9e07bb1 vblade: update to version 22
995f86f libdbus-c++: remove PNBLACKLIST
6c0800c dbus-daemon-proxy: inherit pkgconfig and unblacklist
4ad6ded lvm2: 2.02.166 -> 2.02.171
cbb6755 imsettings: 1.7.1 -> 1.7.2
a94a528 imagemagick: upgrade from 7.0.2 to 7.0.5
2e1c00c geoipupdate: 2.2.2 -> 2.3.1
e5a0dae fbida: inherit pkgconfig and unblacklist
a0d0fb6 xf86-video-geode: Update to 2.11.18
8a8c7a3 recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
5f837b4 qttools: add ptest
not included in master yet:=20
960aaf3 qwt: Add recipe.
6605c48 python-pyqt5: Add recipe.

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
4ed7feb Merge pull request #35 from schnitzeltony/chrome-progress
not included in master yet:=20
08c4293 gnome-settings-daemon: remove the bbappend for removed recipe

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
2e879ec luna-service2: Bump SRCREV
not included in master yet:=20
d70fec7 pulseaudio-distro-conf: update webos-system.pa from latest pulseaud=
io
95d7301 README: update to depend on morty branches
c5f518a glib-2.0: rename .bbappend to match new version from oe-core
cb20de1 connman: rename .bbappend to match new version from oe-core
d8bfed3 openssl,pmcertificatemgr: use openssl files from /etc
2805ef9 libsdl2: upgrade to 2.0.4 included in oe-core
37f2e23 alsa-lib,alsa-utils: rename bbappend to match new version from oe-c=
ore
5620d18 librolegen: Fix build with newer toolchain
95bd64c activitymanager: Fix build with newer toolchain
ed6791e presage: Fix build with newer toolchain
e7a7a84 mmsd, packagegroup-webos-test: drop python-pygobject
ad76177 connman: rename bbappend to match new version from oe-core
9998d43 opkg: rename bbappend to match new version from oe-core
74540d0 pulseaudio: rename bbappend to match new version from oe-core
2d67724 pulseaudio: install also 2 new headers mem.h and srbchannel.h to fi=
x pulseaudio-modules-droid build
74d0740 pulseaudio: refresh patches to apply cleanly for 9.0
5cd5c03 freeimage: bump SRCREV to fix build with gcc6
db1ed98 alsa-{lib,utils}: rename bbappend to match new version from oe-core
057ed16 glib-2.0: rename bbappend to match new version from oe-core
6425f59 pidgin: rename bbappend to match new version from oe-core
57c7424 geoclue: use 2.4.4 version from meta-oe
269408d mesa: add LIC_FILES_CHKSUM for 10.3.8
24487e0 libsdl2: use gles2 instead of opengl
8e297f0 Mojomail: Switch to own fork for testing
d74eb39 FreeImage: Use test branch for gcc6
02feb1d luneos(-package): update for new kernel names
ef9b1a2 README: update to depend on pyro branches
9da665c glib-2.0: rename bbappend to match new version from oe-core
4e45366 opkg: rename bbappend to match new version from oe-core
a000a4f alsa-utils: rename bbappend to match new version from oe-core
0979b80 alsa-lib: Rename bbappend to match new version
110d229 android-tools: Rename bbappend to match new version
92943fc nodejs-enyo-dev: rename to have native suffix and use SYSROOT_DIRS =
variable
f95da76 lxc: fix build with new glibc
27e858b mtp-server: inherit gettext
87b1c9d qtscenegraph-adaptation: add dependency on qtdeclarative
0e0a514 luneos-package: inhibit default deps and limit do_deploy deps
d42148b pulseaudio: Rename bbappend to match new version
62a0c0a pulseaudio: refresh patches to apply cleanly for 10.0
364d2bd luna-next: add missing dependency on wayland-native qtwayland-native
fdee375 luneos-emulator-appliance: inhibit default deps and limit do_deploy=
 deps
b837d14 nyx-modules-hybris: Use MACHINE_ARCH because of android-headers dep=
endency
8b448fb luneos.inc: Convert SANITY_TESTED_DISTROS to lowercase
027af02 dosfstools: rename bbappend
01bf3bf luneos.inc: drop PATH prepend
bcca7cb dosfstools: add fsck.vfat symlink only in target version
a7a9be2 lsb: drop fix-lsb_release-to-work-with-busybox-head-and-find.patch
100eb35 mesa: add dependency on udev and drop vulkan PACKAGECONFIG
b81d106 nodejs-module-webos-pmlog: add vim-native dependency to provide xxd
2ff7acf pidgin-sipe: add dependency on glib-2.0-native to provide glib-gett=
extize
0091155 mesa: remove --with-llvm-prefix option
767f702 sdl2-opengles-test: inherit pkg-config
806e62e webos-keyboard: add temporary patch from Tofe to fix compatibility =
with newer hunspell
2948a2a opkg: remove libsolv PACKAGECONFIG
107cc45 qemux86: Simplify loading of uvesafb and blacklist vboxvideo
a1bac95 luneos-emulator: switch ethernet card from PCNet32 to E1000
b0eed96 pulseaudio-modules-droid: migrate to PulseAudio 10.0
5dcc2e0 systemd: Disable ProtectHome and ProtectSystem for old kernels
d42f025 Use Mer's oFono 1.19 and include fix
973e7bd README: update to depend on master branches
7c218ab qtbase: enable fontconfig
465c92d qtwayland, qtwebengine: use webOS-ports/master-next branch compatib=
le with 5.7
874a73d luna-next: Make compatible with Qt 5.7
6167a6e qtwayland, qtwebengine: temporary drop bbappend
bcb86ac luna-sysservice: Fix build with qt 5.7
73ceaf4 luna-next, luna-webappmanager: temporary drop from image
a63d5d7 packagegroup-luneos-development: drop qt5-opengles2-test
d3d3395 libconnman-qt: replace with libconnman-qt5 from meta-qt5
b0f39d1 libqofono: use the recipe from meta-qt5
f0e014a qtlocation: drop invalid and unused OE_LUNEOS_ENABLED option
41fb366 phonesim: fix build with Qt 5.8
63878fb qtbase: enable xkbcommon-evdev for qtwayland
701598a qt5-qpa-hwcomposer-plugi: Fix build with Qt 5.8
641f517 packagegroup-luneos-extended: drop qtscenegraph-adaptation

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
e93ba06 libshr-glib: blacklist because of random failures
not included in master yet:=20
26c0423 meta-shr, meta-fso: remove blacklisted recipes

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWR9D4gAKCRA3VSO3ZXaA
HHeOAJ4gzJgiFBH4QNb7OcV0k33v/7UD5QCfWb0NHn6AU6menHufpZ5nxNEyf/8=
=hl8N
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
