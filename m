Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 114A16E680;
	Thu, 17 Mar 2016 14:40:14 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l68so29252907wml.0;
	Thu, 17 Mar 2016 07:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=n/p/5XixP6HWX+VLg0a3m/Smmx9eO9LE1+Lnq4vGAog=;
	b=DJutGNuPju61++u4q0/BUOAN7R1pDuotzpvjQLwE9yTQrGbl454D2jFYHkEqAIh2//
	6FfKuTUQm/QtFPsWk2IEqfIsmii7vFJH2tiHB0AbBh+KnbAavsfMlPyNc7dzXkDp7nwL
	rhVHwqyLHUWs1l4AER0NAQTcoadv/pKEZzspPCDvGozMW6J4YU4LDr9s0QlkojC+XPEk
	asMYZM44MpmwVefxnWTYTp8UyvdKSeIspYfwv1XLK68A4ItjLyXkctl9ZHhAr7HJkXBN
	FYuKAbzqVvv6IWB0j4awlZZbi2vuyLcGJr1VzEsD3T0jFhVwSNgdF/VrADWM0yob5Qgr
	91/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=n/p/5XixP6HWX+VLg0a3m/Smmx9eO9LE1+Lnq4vGAog=;
	b=kXWdlGimhS8XdjfotXp1zsdRM0rquTNXntc1hft/rt95xj7XikhCe5y+qLpQHkzrRp
	SwoSTXS96/VXKXrKc9ykoJLTNp3yHa+5lVxrx5YJvb5YKH9z34DU78wltHRg2upLTcYF
	czHpo1YON2x+DkBAzjRwrvse508haYAMJdBGEo2Qn8fKv7cIb3MfcU6k5IvzW++DgnWk
	eTOV2BOeGlUn1I/RVu6R5mn5oCdtd8BzBPpi8eqRSAjHPdYbPWNXPNWXZxTrm9lFsP++
	kxafs2s7Fb75Gucza9mvVcRZtAxmqh6SaeDCkN9aGe4g4IAZdtYqNYtQSvnEf1jjHWrw
	APmQ==
X-Gm-Message-State: AD7BkJJUdMmn44ecvjyA0p9spm6GHOWw643xRINL+Fm7TvheYxxHrWrAw4pLRPVEdenc4A==
X-Received: by 10.194.142.135 with SMTP id rw7mr9913357wjb.84.1458225614620;
	Thu, 17 Mar 2016 07:40:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hx10sm7980916wjb.25.2016.03.17.07.40.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 07:40:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Mar 2016 15:43:57 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160317144357.GB2553@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2016-03-16
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
X-List-Received-Date: Thu, 17 Mar 2016 14:40:15 -0000
X-Groupsio-MsgNum: 79736
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline

--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
edb1906 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
c278358 metadata-revs: provide more information
e2bf30c buildhistory.bbclass: metadata-revs show repo parent
e716247 base.bbclass: Introduce EXTRA_CONF_PACKAGECONFIG variable
a5b44a0 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
d5af455 sstate-sysroot-cruft.sh: Extend the whitelist
9257dd7 qemux86: Add identical qemux86copy variant for tests
dcc4b35 report-error: Allow to upload reports automatically
83351c7 xcursor-transparent-theme: upgrade to latest git revision

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
1444ccf opencv: Remove blacklist
02488f4 opencv_3: Fix use before set error on meta package
5fc1efd nginx: make the 1.8.x branch the default
86fe47b nginx: add stable version 1.8.1 as alternative to the mainline vers=
ion 1.9.x
a25e353 nginx: split parts out of the recipe into nginx.inc
f62b582 nodejs: update to 4.4.0
504f943 crash: add native package
b755e39 packagegroup-xfce-extended: add xfce4-verve-plugin
dc50248 xfce4-verve-plugin: initial add 1.1.0
3ef49da xfce4-pulseaudio-plugin: update to 0.2.4
81ea5d4 parole: update to 0.8.1
dea199e mpv: Media Player
382b1e2 libass: Update to latest version
543e36d postgresql: Security Advisory-postgresql-CVE-2016-0773
331456c waf-samba.bbclass: move to meta-networking
7f1c554 pptp-linux: update to 1.8.0
cf88eed dnsmasq: steal resolvconf support from Ubuntu
019b75a wireshark: 2.0.2 update including security

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
b2d5376 Change dependency from virtual/mesa to drm in the kms packageconfig.
06bfff5 qtwebengine: enable ARMv7VE support
2a998cc Add .gitignore to ignore .pyc/.pyo files
3eae3fe qmake5_base: use remove-libtool bbclass
bc54e23 recipes: use new EXTRA_CONF_PACKAGECONFIG instead of EXTRA_OECONF

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
a42392f cef3: comment out gtests completely
0b256c7 cef3, chromium: fix build with gcc-5.3

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
50be0d9 frameworkd: python-gst recommendation
15a51ce samsung-rfs-mgr: inherit pkgconfig
64cb1ce samsung-modem-mgr: inherit pkgconfig
9d6c410 pty-forward-native: fix do_deploy task
136b1c0 android-image-utils-native: add missing dependency on zlib-native
c596ff4 linux-gta04: upgrade to 4.4
98b5a2e om-gta04: drop u-boot from EXTRA_IMAGEDEPENDS
eb55ffe defaulttunes.inc: switch to hf, because SGX SDK for SGX530 is avail=
able only for hf
1d10e4e linux-gta04: enable SGX530
158b3e6 linux-gta04: bump SRCREV to get fixes for build with gcc-5
c469e02 u-boot-mkimage: Backport fix from upstream to fix build with gcc-5

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'12'|QA !!Comme=
nt
|-
||		||qemuarm	||qemux86	||qemux86_64	||already-stripped	||libdir	||textrel	=
||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminate=
d	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||=
invalid-pkgconfig	||pkgname	||=09
|-
||2016-03-16	||5	||5	||7	||0		||0		||10		||2		||33		||26		||0		||0		||5		||=
0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-03-16 =3D=3D

INFO: jenkins-job.sh-1.7.4 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20160317_124914.log

=3D=3D=3D common (4) =3D=3D=3D
    * /meta-openembedded/meta-efl/recipes-efl/efl/engrave_svn.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-blu=
etooth_3.18.2.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb, do_=
compile
    * /meta-openembedded/meta-python/recipes-devtools/python/python-cryptog=
raphy_1.1.bb, do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-support/opencv/opencv_3.0.bb, do_c=
ompile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (3) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb=
, do_compile
    * /meta-openembedded/meta-oe/recipes-support/opencv/opencv_3.0.bb, do_c=
onfigure
    * /meta-openembedded/meta-python/recipes-devtools/python/python-matplot=
lib_1.1.0.bb, do_compile

=3D=3D=3D Number of failed tasks (17) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20160314_113635.log// || http://errors.yoctoproject.org:80/Errors/Build=
/14062/
|-
|| qemux86 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20160315_102609.log// || http://errors.yoctoproject.org:80/Errors/Build=
/14108/
|-
|| qemux86_64 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log=
=2Eworld.20160316_113914.log// || http://errors.yoctoproject.org:80/Errors/=
Build/14184/
|}

=3D=3D=3D PNBLACKLISTs (112) =3D=3D=3D

=3D=3D=3D QA issues (76) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
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
||10	||textrel
|-
||2	||build-deps
|-
||26	||version-going-backwards
|-
||33	||file-rdeps
|-
||5	||unknown-configure-option
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken: sw=
itch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and=
 fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. in=
valid state name: 'off'. "default" state must always be first."
meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?=3D "Depends on b=
lacklisted webkit-efl"
meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=3D "OL=
D and depends on broken azy"
meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?=3D "if you w=
ant to use these modules with E18, then you need to update it to git recipe=
 fetching newer sources from http://git.enlightenment.org/apps/emprint.git/"
meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from http://git.enlightenment.org/enlightenment/modules/n=
ews.git/"
meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from  http://git.enlightenment.org/apps/rage.git/"
meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=3D "de=
pends on blacklisted emprint"
meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?=3D "OLD and doesn't =
build with gcc-5"
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "broken=
: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+s=
vnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: '=
defaault'. "default" state must always be first."
meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?=3D "Ol=
d and unmaintaned fork with many security issues"
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=3D=
 "BROKEN: latest version 0.3.4 is 3 years old and now broken with more stri=
ct ejde_cc from efl-1.13"
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] ?=
=3D "BROKEN: images are not displayed anymore"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer"
meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:PN=
BLACKLIST[gtk-theme-torturer] ?=3D "BROKEN: gmacros.h:182:53: error: size o=
f array '_GStaticAssertCompileTimeAssertion_2' is negative"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctoo=
l] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gmane.=
comp.handhelds.openembedded/57920 and nobody complained, it's also replaced=
 by gnome calculator"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gno=
me-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with libg=
weather"
meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:=
PNBLACKLIST[gnome-power-manager] ?=3D "BROKEN: not compatible with current =
libnotify"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]=
 ?=3D "BROKEN: fails to build, maybe missing dependency on gnome-desktop-ut=
ils.h provider"
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLA=
CKLIST[system-tools-backends] ?=3D "does not build with distroless qemuarm =
as reported in 'State of bitbake world' thread, nobody volunteered to fix t=
hem"
meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb:PNBLACKLIST[gnome-th=
emes] ?=3D "BROKEN: x86_64-linux/usr/lib/icon-naming-utils/icon-name-mappin=
g: No such file or directory"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D "=
BROKEN: doesn't build with B!=3DS"
meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?=3D=
 "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoo=
lnix] ?=3D "BROKEN: Failx to build with gcc-5"
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST=
[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-config w=
as removed, error: unknown type name 'SDL_Overlay'"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PN=
BLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS (t=
rying to install rendererconsole.py from ${B} instead of ${S})"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb:PNB=
LACKLIST[gst-ffmpeg] ?=3D "Not compatible with currently used ffmpeg 3"
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gs=
t123] ?=3D "gst123 is still "sometimes" using wrong sysroot"
meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb:PNBLACKLIST[sno=
rt] ?=3D "BROKEN: QA Issue: snort_preproc.pc, snort_output.pc, snort.pc"
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=3D =
"BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were =
installed but not shipped in any package:"
meta-networking/recipes-daemons/squid/squid_3.5.7.bb:PNBLACKLIST[squid] ?=
=3D "BROKEN: sysroots/qemuarm/usr/include/linux/in.h:28:16: error: redeclar=
ation of 'IPPROTO_IP'"
meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb=
:PNBLACKLIST[iscsitarget] ?=3D "BROKEN: kernel/block-io.c:36:19: error: 'BI=
O_UPTODATE' undeclared (first use in this function)"
meta-networking/recipes-irc/znc/znc_git.bb:PNBLACKLIST[znc] ?=3D "BROKEN: Q=
A Issue: znc.pc failed sanity test"
meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb:PNBLACKLIST[curlpp] =
?=3D "BROKEN: QA Issue: curlpp.pc failed sanity test (tmpdir)"
meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb:PNBLACKLIST[dovec=
ot] ?=3D "BROKEN: QA Issue: -dev package contains non-symlink .so"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', =
"BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-networking/recipes-support/nis/yp-tools_3.3.bb:PNBLACKLIST[yp-tools] ?=
=3D "BROKEN: fails to build for qemuarm."
meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]=
 ?=3D "BROKEN: Depends on broken yp-tools"
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
meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb:PNBLACKLIST[obexftp] ?=
=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts wi=
th bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
"BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] ?=3D "BROKEN: not compatible with default db version"
meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] ?=3D=
 "BROKEN: QA Issue: -dev package contains non-symlink .so"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "Not=
 comatible with current nodejs 0.12, but upstream is working on it for v3"
meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb:PNBLACKLIST[mpich] ?=3D "BROK=
EN: QA Issue: libmpi.la failed sanity test (workdir), QA Issue: mpich.pc fa=
iled sanity test (tmpdir)"
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[package=
kit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently dis=
abled and will be removed soon"
meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb:PNBLACKLIST[efibootm=
gr] ?=3D "Depends on blacklisted efivar"
meta-oe/recipes-extended/efivar/efivar_0.21.bb:PNBLACKLIST[efivar] ?=3D "BR=
OKEN: linux.c:27:30: fatal error: linux/nvme_ioctl.h: No such file or direc=
tory"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfac=
e] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=3D=
 "BROKEN: Fails to build with gcc-5"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-b=
ox2d] ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN: =
doesn't build with B!=3DS (flex: can't open lex.lex)"
meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D "does no=
t build with distroless qemuarm as reported in 'State of bitbake world' thr=
ead, nobody volunteered to fix them"
meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb:PNBLACKLIST[tessera=
ct] ?=3D "BROKEN: QA Issue: tesseract.pc failed sanity test (tmpdir)"
meta-oe/recipes-graphics/wayland/wayland-fits_git.bb:PNBLACKLIST[wayland-fi=
ts] ?=3D "BROKEN: fails since wayland upgrade: weston-wfits.cpp:86:39: erro=
r: expected primary-expression before 'struct'"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf8=
6-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without ${S=
} in sed call)"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D "BROKEN, fails to build"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D "Not compatible with 3.19 kernel"
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D "Depends on =
blacklisted kernel-module-ktapvm"
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?=
=3D "Not compatible with currently used ffmpeg 3"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conf=
licts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D "BROK=
EN: fails to build with gcc-5"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail]=
 ?=3D "depends on blacklisted libetpan"
meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBLAC=
KLIST[claws-plugin-gtkhtml2-viewer] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST[c=
laws-plugin-mailmbox] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[claw=
s-plugin-rssyl] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu: =
uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]=
 ?=3D "Depends on broken libnice"
meta-oe/recipes-support/farsight/libnice_0.0.13.bb:PNBLACKLIST[libnice] ?=
=3D "BROKEN: QA Issue: nice.pc failed sanity test (tmpdir)"
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D "do=
es not build with distroless qemuarm as reported in 'State of bitbake world=
' thread, nobody volunteered to fix them"
meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=3D "N=
ot compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi=
-drivers] ?=3D "BROKEN: fails to build with gcc-5"
meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] ?=
=3D "Not compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-sam=
ples] ?=3D "Depends on blacklisted opencv"
meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?=3D "Not =
compatible with currently used ffmpeg 3"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts w=
ith bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] =
?=3D "depends on blacklisted pidgin"
meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb:PNBLACKLIST[pidgin] ?=3D "N=
ot compatible with gnutls version 3.4 currently in oe-core and also depends=
 on broken libnice through farsight2"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src=
/.stamp': No such file or directory"
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=3D "$=
{@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with blu=
ez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D "Do=
esn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=3D =
"broken: depends on blacklisted fltk"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doesn't =
build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rdepen=
ds on blacklisted mplayer2"
meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=3D "dep=
ends on blacklisted iksemel"
meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=3D "${@bb=
=2Eutils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez=
4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "Does=
n't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] =
=3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] ?=
=3D "Depends on blacklisted packagekit"
meta-webos-ports:
conf/world_fixes.inc:PNBLACKLIST[android-system] =3D "depends on lxc from m=
eta-virtualiazation which isn't included in my world builds"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't r=
eally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't re=
ally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't re=
ally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't re=
ally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't r=
eally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[build-appliance-image] =3D "tries to inclu=
de whole downloads directory in /home/builder/poky :/"
conf/world_fixes.inc:PNBLACKLIST[linux-yocto-tiny-kexecboot] =3D "does weir=
d sh!t breaking other kernels and modules - broken for years"
conf/world_fixes.inc:PNBLACKLIST[linux-yocto-tiny] =3D "does weird sh!t bre=
aking other kernels and modules - broken for years"
conf/world_mask.inc:PNBLACKLIST[evince] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[epiphany] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[media-ctl] =3D "fails to build"
QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 10	issue: textrel
cef3-280796: ELF binary '/tmp/work/i586-oe-linux/cef3/280796-r0/packages-sp=
lit/cef3-codecs-ffmpeg/usr/lib/cef3/libffmpegsumo.so' has relocations in .t=
ext [textrel]
chromium-40.0.2214.91: ELF binary '/tmp/work/i586-oe-linux/chromium/40.0.22=
14.91-r0/packages-split/chromium-codecs-ffmpeg/usr/lib/chromium/libffmpegsu=
mo.so' has relocations in .text [textrel]
corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
ffmpeg-3.0: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/3.0-r0/packages-spli=
t/libavcodec/usr/lib/libavcodec.so.57.24.102' has relocations in .text [tex=
trel]
ffmpeg-3.0: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/3.0-r0/packages-spli=
t/libavfilter/usr/lib/libavfilter.so.6.31.100' has relocations in .text [te=
xtrel]
ffmpeg-3.0: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/3.0-r0/packages-spli=
t/libpostproc/usr/lib/libpostproc.so.54.0.100' has relocations in .text [te=
xtrel]
ffmpeg-3.0: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/3.0-r0/packages-spli=
t/libswresample/usr/lib/libswresample.so.2.0.101' has relocations in .text =
[textrel]
ffmpeg-3.0: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/3.0-r0/packages-spli=
t/libswscale/usr/lib/libswscale.so.4.0.100' has relocations in .text [textr=
el]
gstreamer1.0-libav-1.6.3: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-=
libav/1.6.3-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libg=
stlibav.so' has relocations in .text [textrel]
libass-0.13.2: ELF binary '/tmp/work/i586-oe-linux/libass/0.13.2-r0/package=
s-split/libass/usr/lib/libass.so.5.3.0' has relocations in .text [textrel]


count: 2	issue: build-deps
mpv-0.15.0: mpv rdepends on libjack, but it isn't a build dependency, missi=
ng jack in DEPENDS or PACKAGECONFIG? [build-deps]
samba-4.1.12: samba rdepends on libpam, but it isn't a build dependency, mi=
ssing libpam in DEPENDS or PACKAGECONFIG? [build-deps]


count: 33	issue: file-rdeps
chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig requires =
libnewt.so()(64bit), but no providers found in RDEPENDS_chkconfig? [file-rd=
eps]
chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig requires =
libnewt.so, but no providers found in RDEPENDS_chkconfig? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate contained in package dvbdate requires libu=
csi.so()(64bit), but no providers found in RDEPENDS_dvbdate? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate contained in package dvbdate requires libu=
csi.so, but no providers found in RDEPENDS_dvbdate? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet contained in package dvbnet requires libdvb=
api.so()(64bit), but no providers found in RDEPENDS_dvbnet? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet contained in package dvbnet requires libdvb=
api.so, but no providers found in RDEPENDS_dvbnet? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan contained in package dvb-scan requires lib=
dvbapi.so, but no providers found in RDEPENDS_dvb-scan? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan contained in package dvb-scan requires lib=
dvbsec.so()(64bit), but no providers found in RDEPENDS_dvb-scan? [file-rdep=
s]
dvb-apps-1.1.1: /usr/bin/dvbtraffic contained in package dvbtraffic require=
s libdvbapi.so()(64bit), but no providers found in RDEPENDS_dvbtraffic? [fi=
le-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic contained in package dvbtraffic require=
s libdvbapi.so, but no providers found in RDEPENDS_dvbtraffic? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/femon contained in package dvb-femon requires libd=
vbapi.so()(64bit), but no providers found in RDEPENDS_dvb-femon? [file-rdep=
s]
dvb-deps]
dvb-apps-1.1.1: /usr/bin/gotox contained in package dvb-apps requires libdv=
bsec.so()(64bit), but no providers found in RDEPENDS_dvb-apps? [file-rdeps]
gnome-menus-2.30.5: /usr/bin/gmenu-simple-editor contained in package gnome=
-menus requires /tmp/sysroots/x86_64-linux/usr/bin/python-native/python, bu=
t no providers found in RDEPENDS_gnome-menus? [file-rdeps]
libbonobo-2.32.1: /usr/bin/bonobo-slay contained in package libbonobo requi=
res /usr/bin/perl, but no providers found in RDEPENDS_libbonobo? [file-rdep=
s]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl=
=2Ereal, but no providers found in RDEPENDS_libmodule-build-perl? [file-rde=
ps]
libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires l=
ibnewt.so()(64bit), but no providers found in RDEPENDS_whiptail? [file-rdep=
s]
libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires l=
ibnewt.so, but no providers found in RDEPENDS_whiptail? [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/_snack.so containe=
d in package libnewt-python requires libnewt.so()(64bit), but no providers =
found in RDEPENDS_libnewt-python? [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/_snack.so containe=
d in package libnewt-python requires libnewt.so, but no providers found in =
RDEPENDS_libnewt-python? [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package networkm=
anager-nmtui requires libnewt.so()(64bit), but no providers found in RDEPEN=
DS_networkmanager-nmtui? [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package networkm=
anager-nmtui requires libnewt.so, but no providers found in RDEPENDS_networ=
kmanager-nmtui? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl contained in=
 package numptyphysics requires /usr/bin/perl, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh containe=
d in package numptyphysics requires /bin/bash, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
perf-1.0: /usr/libexec/perf-core/scripts/python/call-graph-from-postgresql.=
py contained in package perf requires /usr/bin/python2, but no providers fo=
und in RDEPENDS_perf? [file-rdeps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o contained in package tracker-nautilus-extension requires libnautilus-exte=
nsion.so.1()(64bit), but no providers found in RDEPENDS_tracker-nautilus-ex=
tension? [file-rdeps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o contained in package tracker-nautilus-extension requires libnautilus-exte=
nsion.so.1, but no providers found in RDEPENDS_tracker-nautilus-extension? =
[file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in=
 package ubx-utils requires /bin/bash, but no providers found in RDEPENDS_u=
bx-utils? [file-rdeps]
xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfsprogs-mkfs requires =
libxfs.so.0()(64bit), but no providers found in RDEPENDS_xfsprogs-mkfs? [fi=
le-rdeps]
xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfsprogs-mkfs requires =
libxfs.so.0, but no providers found in RDEPENDS_xfsprogs-mkfs? [file-rdeps]
xfsprogs-3.2.3: /usr/sbin/xfs_db contained in package xfsprogs requires lib=
xfs.so.0()(64bit), but no providers found in RDEPENDS_xfsprogs? [file-rdeps]
xfsprogs-3.2.3: /usr/sbin/xfs_db contained in package xfsprogs requires lib=
xfs.so.0, but no providers found in RDeak package feeds from (0:1.9.12-r0.1=
 to 0:1.8.1-r0.0) [version-going-backwards]
nginx-1.8.1: Package version for package nginx-staticdev went backwards whi=
ch would break package feeds from (0:1.9.12-r0.1 to 0:1.8.1-r0.0) [version-=
going-backwards]
perf-1.0: Package version for package perf went backwards which would break=
 package feeds from (0:None-r9.13 to 0:4.4.3-r9.14) [version-going-backward=
s]
perf-1.0: Package version for package perf went backwards which would break=
 package feeds from (0:None-r9.16 to 0:4.4.3-r9.17) [version-going-backward=
s]
perf-1.0: Package version for package perf-archive went backwards which wou=
ld break package feeds from (0:None-r9.13 to 0:4.4.3-r9.14) [version-going-=
backwards]
perf-1.0: Package version for package perf-archive went backwards which wou=
ld break package feeds from (0:None-r9.16 to 0:4.4.3-r9.17) [version-going-=
backwards]
perf-1.0: Package version for package perf-dbg went backwards which would b=
reak package feeds from (0:None-r9.13 to 0:4.4.3-r9.14) [version-going-back=
wards]
perf-1.0: Package version for package perf-dbg went backwards which would b=
reak package feeds from (0:None-r9.16 to 0:4.4.3-r9.17) [version-going-back=
wards]
perf-1.0: Package version for package perf-dev went backwards which would b=
reak package feeds from (0:None-r9.13 to 0:4.4.3-r9.14) [version-going-back=
wards]
perf-1.0: Package version for package perf-dev went backwards which would b=
reak package feeds from (0:None-r9.16 to 0:4.4.3-r9.17) [version-going-back=
wards]
perf-1.0: Package version for package perf-doc went backwards which would b=
reak package feeds from (0:None-r9.13 to 0:4.4.3-r9.14) [version-going-back=
wards]
perf-1.0: Package version for package perf-doc went backwards which would b=
reak package feeds from (0:None-r9.16 to 0:4.4.3-r9.17) [version-going-back=
wards]
perf-1.0: Package version for package perf-locale went backwards which woul=
d break package feeds from (0:None-r9.13 to 0:4.4.3-r9.14) [version-going-b=
ackwards]
perf-1.0: Package version for package perf-locale went backwards which woul=
d break package feeds from (0:None-r9.16 to 0:4.4.3-r9.17) [version-going-b=
ackwards]
perf-1.0: Package version for package perf-perl went backwards which would =
break package feeds from (0:None-r9.13 to 0:4.4.3-r9.14) [version-going-bac=
kwards]
perf-1.0: Package version for package perf-perl went backwards which would =
break package feeds from (0:None-r9.16 to 0:4.4.3-r9.17) [version-going-bac=
kwards]
perf-1.0: Package version for package perf-python went backwards which woul=
d break package feeds from (0:None-r9.13 to 0:4.4.3-r9.14) [version-going-b=
ackwards]
perf-1.0: Package version for package perf-python went backwards which woul=
d break package feeds from (0:None-r9.16 to 0:4.4.3-r9.17) [version-going-b=
ackwards]
perf-1.0: Package version for package perf-staticdev went backwards which w=
ould break package feeds from (0:None-r9.13 to 0:4.4.3-r9.14) [version-goin=
g-backwards]
perf-1.0: Package version for package perf-staticdev went backwards which w=
ould break package feeds from (0:None-r9.16 to 0:4.4.3-r9.17) [version-goin=
g-backwards]
perf-1.0: Package version for package perf-tests went backwards which would=
 break package feeds from (0:None-r9.13 to 0:4.4.3-r9.14) [version-going-ba=
ckwards]
perf-1.0: Package version for package perf-tests went backwards which would=
 break package feeds from (0:None-r9.16 to 0:4.4.3-r9.17) [version-going-ba=
ckwards]


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 5	issue: unknown-configure-option
gst-plugins-bad-0.10.23: gst-plugins-bad: cwas passed unrecognised options:=
 --disable-introspection [unknown-configure-option]
libass-0.13.2: libass: configure was passed unrecognised options: --enable-=
enca [unknown-configure-option]


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbqwmsACgkQN1Ujt2V2gBx+nwCfbT5YBhxi1Zwhyo6qeTluW/G3
RvsAoKYi8anUp0BYDbm5QpQ4WhcVVqOr
=6LCT
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
